-- ==========================================
-- Day 18 - KPI et Indicateurs Business (PostgreSQL)
-- Fichier de correction des exercices du Jour 18
-- ==========================================

-- Inspection des lignes de vente et des remises
SELECT 
    id_ligne,
    id_vente,
    quantite,
    prix_unitaire,
    remise
FROM lignes_vente
LIMIT 10;

-- Résumé statistique de la remise
SELECT 
    COUNT(*) AS nb_lignes,
    COUNT(remise) AS nb_remises_renseignees,
    MIN(remise) AS remise_min,
    MAX(remise) AS remise_max
FROM lignes_vente;


-- Montant brut de chaque ligne de vente
SELECT 
    id_ligne,
    id_vente,
    quantite,
    prix_unitaire,
    (quantite * prix_unitaire) AS montant_brut
FROM lignes_vente;


-- Montant brut total (Chiffre d'affaires brut estimé)
SELECT 
    SUM(quantite * prix_unitaire) AS chiffre_affaires_brut
FROM lignes_vente;


-- Montant brut par commande (id_vente)
SELECT 
    id_vente,
    SUM(quantite * prix_unitaire) AS montant_commande
FROM lignes_vente
GROUP BY id_vente
ORDER BY id_vente;


-- Panier moyen brut (via une sous-requête pour respecter la granularité commande)
SELECT 
    ROUND(AVG(montant_commande), 2) AS panier_moyen_brut
FROM (
    SELECT 
        id_vente,
        SUM(quantite * prix_unitaire) AS montant_commande
    FROM lignes_vente
    GROUP BY id_vente
) AS commandes;


-- Taux de remise global pondéré (en supposant que `remise` est un taux entre 0 et 1)
SELECT 
    ROUND(
        SUM(quantite * prix_unitaire * remise) 
        / NULLIF(
            SUM(quantite * prix_unitaire), 
            0) * 100.0, 2) AS taux_remise_global_pct
FROM lignes_vente;

-- Taux de remise global pondéré (en supposant que `remise` est un pourcentage entre 0 et 100)
SELECT 
    ROUND(
        SUM(quantite * prix_unitaire * remise / 100.0) 
        / NULLIF(
            SUM(quantite * prix_unitaire), 
            0) * 100.0, 2) AS taux_remise_global_pct
FROM lignes_vente;