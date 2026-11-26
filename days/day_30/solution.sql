-- ==========================================
-- Jour 30 : Performance SQL — Index, plans d'exécution et optimisation
-- Environnement : PostgreSQL (adapté depuis le cours SQL Server Jour 30)
-- Règle : Utiliser une table de test isolée (perf_lignes_vente) et supprimer en fin de test.
-- ==========================================

-- Exemple de réécriture sargable (éviter une fonction sur la colonne filtrée)
-- À adapter selon la colonne date réelle de ventes si nécessaire
-- Éviter : WHERE EXTRACT(YEAR FROM date_vente) = 2025
-- Préférer :
-- WHERE date_vente >= DATE '2025-01-01' AND date_vente < DATE '2026-01-01';

-- Création d'une table de test isolée de 1 000 000 de lignes (jamais sur les tables de production)
DROP TABLE IF EXISTS perf_lignes_vente;

CREATE TABLE perf_lignes_vente (
    id_ligne INT PRIMARY KEY,
    id_vente INT NOT NULL,
    id_produit INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire NUMERIC(10, 2) NOT NULL
);

INSERT INTO perf_lignes_vente (id_ligne, id_vente, id_produit, quantite, prix_unitaire)
SELECT
    n::INT AS id_ligne,
    ((n - 1) / 4) + 1 AS id_vente,
    (((n::BIGINT * 7919) % 500) + 1)::INT AS id_produit,
    ((n % 9) + 1)::INT AS quantite,
    ROUND((((n::BIGINT * 31) % 5000) / 100.0 + 1)::NUMERIC, 2) AS prix_unitaire
FROM generate_series(1, 1000000) AS n;

ANALYZE perf_lignes_vente;

-- Vérifications de volume et sélectivité (2 000 lignes sur 1 000 000 pour id_produit = 123)
SELECT COUNT(*) AS total_lignes FROM perf_lignes_vente;
SELECT COUNT(*) AS lignes_produit_123 FROM perf_lignes_vente WHERE id_produit = 123;

-- Requête cible : quantité totale et montant brut pour un produit donné
-- À lancer avec EXPLAIN (ANALYZE, BUFFERS) pour observer lectures (buffers) et temps
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS montant_brut
FROM perf_lignes_vente
WHERE id_produit = 123
GROUP BY id_produit;

-- Test avec un index simple sur id_produit
CREATE INDEX ix_perf_lignes_vente_id_produit
    ON perf_lignes_vente (id_produit);

ANALYZE perf_lignes_vente;

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS montant_brut
FROM perf_lignes_vente
WHERE id_produit = 123
GROUP BY id_produit;

-- Test avec un index couvrant (INCLUDE) pour éviter le retour vers la table de base
DROP INDEX IF EXISTS ix_perf_lignes_vente_id_produit;

CREATE INDEX ix_perf_lignes_vente_id_produit_cov
    ON perf_lignes_vente (id_produit)
    INCLUDE (quantite, prix_unitaire);

ANALYZE perf_lignes_vente;

EXPLAIN (ANALYZE, BUFFERS)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS montant_brut
FROM perf_lignes_vente
WHERE id_produit = 123
GROUP BY id_produit;

-- Cas d'un filtre peu sélectif (~90 % des lignes) : l'optimiseur peut préférer un scan
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale
FROM perf_lignes_vente
WHERE id_produit BETWEEN 1 AND 450
GROUP BY id_produit;

-- Vérification que deux requêtes équivalentes renvoient exactement le même ensemble
SELECT id_produit, SUM(quantite) AS total
FROM perf_lignes_vente
WHERE id_produit = 123
GROUP BY id_produit
EXCEPT
SELECT id_produit, SUM(quantite) AS total
FROM perf_lignes_vente
WHERE id_produit::TEXT = '123'
GROUP BY id_produit;

-- Nettoyage de la table de test (supprime aussi ses index)
DROP TABLE IF EXISTS perf_lignes_vente;