-- ==========================================
-- Day 19 - Dates et Analyse Temporelle (PostgreSQL)
-- Fichier de correction des exercices du Jour 19
-- ==========================================

-- Identifier la colonne de date et son type dans la table ventes
SELECT 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ventes'
ORDER BY ORDINAL_POSITION;


-- Extraire l'année, le mois et le jour de chaque vente
SELECT 
    id_vente,
    date_vente,
    EXTRACT(YEAR FROM date_vente) AS annee,
    EXTRACT(MONTH FROM date_vente) AS mois,
    EXTRACT(DAY FROM date_vente) AS jour
FROM ventes;


-- Montant brut des ventes par jour (trié chronologiquement)
SELECT 
    CAST(v.date_vente AS DATE) AS jour,
    SUM(lv.quantite * lv.prix_unitaire) AS chiffre_affaires_brut
FROM ventes AS v
INNER JOIN lignes_vente AS lv 
    ON v.id_vente = lv.id_vente
GROUP BY CAST(v.date_vente AS DATE)
ORDER BY jour;


-- Montant brut des ventes par année et par mois
SELECT 
    EXTRACT(YEAR FROM v.date_vente) AS annee,
    EXTRACT(MONTH FROM v.date_vente) AS mois,
    SUM(lv.quantite * lv.prix_unitaire) AS chiffre_affaires_brut
FROM ventes AS v
INNER JOIN lignes_vente AS lv 
    ON v.id_vente = lv.id_vente
GROUP BY 
    EXTRACT(YEAR FROM v.date_vente),
    EXTRACT(MONTH FROM v.date_vente)
ORDER BY 
    annee, 
    mois;


-- Montant brut par année avec contrôle de la couverture (première et dernière date)
SELECT 
    EXTRACT(YEAR FROM v.date_vente) AS annee,
    SUM(lv.quantite * lv.prix_unitaire) AS chiffre_affaires_brut,
    MIN(v.date_vente) AS premiere_vente,
    MAX(v.date_vente) AS derniere_vente
FROM ventes AS v
INNER JOIN lignes_vente AS lv 
    ON v.id_vente = lv.id_vente
GROUP BY EXTRACT(YEAR FROM v.date_vente)
ORDER BY annee;


-- Filtrer les ventes d'une année spécifique (ex: 2025) avec bornes inclusive et exclusive
SELECT 
    id_vente,
    date_vente
FROM ventes
WHERE date_vente >= '2025-01-01'
  AND date_vente < '2026-12-31'
ORDER BY date_vente;

SELECT * FROM ventes;