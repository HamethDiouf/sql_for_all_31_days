-- ==========================================
-- Jour 25 : Fenêtrage avec PARTITION BY
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Quantité totale par produit tout en conservant le détail des lignes
SELECT
    id_ligne,
    id_produit,
    quantite,
    SUM(quantite) OVER (
        PARTITION BY id_produit
    ) AS quantite_totale_produit
FROM lignes_vente
ORDER BY id_ligne;

-- Profil statistique complet par produit (SUM, AVG, COUNT, MIN, MAX) sans perte de détail
SELECT
    id_ligne,
    id_produit,
    quantite,
    SUM(quantite) OVER (PARTITION BY id_produit) AS total_produit,
    ROUND(AVG(CAST(quantite AS DECIMAL(10,2))) OVER (PARTITION BY id_produit), 2) AS moyenne_ligne_produit,
    COUNT(*) OVER (PARTITION BY id_produit) AS nombre_lignes_produit,
    MIN(quantite) OVER (PARTITION BY id_produit) AS quantite_min,
    MAX(quantite) OVER (PARTITION BY id_produit) AS quantite_max
FROM lignes_vente
ORDER BY id_ligne;

-- Numéroter les lignes à l'intérieur de chaque produit (ordre déterministe)
SELECT
    id_ligne,
    id_produit,
    quantite,
    ROW_NUMBER() OVER (
        PARTITION BY id_produit
        ORDER BY id_ligne ASC
    ) AS numero_dans_produit
FROM lignes_vente
ORDER BY id_produit, numero_dans_produit;

-- Somme cumulée par produit avec fenêtre physique explicite (ROWS BETWEEN)
SELECT
    id_ligne,
    id_produit,
    quantite,
    SUM(quantite) OVER (
        PARTITION BY id_produit
    ) AS total_produit,
    SUM(quantite) OVER (
        PARTITION BY id_produit
        ORDER BY id_ligne ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS somme_cumulee
FROM lignes_vente
ORDER BY id_produit, id_ligne;

-- Analyse métier complète : poids de chaque ligne dans le total de son produit et rang interne
SELECT
    id_ligne,
    id_produit,
    quantite,
    SUM(quantite) OVER (PARTITION BY id_produit) AS total_produit,
    CAST(
        quantite * 100.0 / NULLIF(SUM(quantite) OVER (PARTITION BY id_produit), 0)
        AS DECIMAL(5,2)
    ) AS part_du_produit_pct,
    ROW_NUMBER() OVER (
        PARTITION BY id_produit
        ORDER BY quantite DESC, id_ligne ASC
    ) AS rang_dans_produit
FROM lignes_vente
ORDER BY id_produit, rang_dans_produit;