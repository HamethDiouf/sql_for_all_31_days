-- ==========================================
-- Day 15 - Fonctions d'agrégation (PostgreSQL)
-- Fichier de correction des exercices du Jour 15
-- ==========================================

-- Compter les lignes de vente
SELECT 
    COUNT(*) AS nombre_lignes
FROM lignes_vente;


-- Compter les produits différents (distincts) vendus
SELECT 
    COUNT(DISTINCT id_produit) AS produits_distincts
FROM lignes_vente;


-- Calculer la quantité totale d'unités vendues
SELECT 
    SUM(quantite) AS quantite_totale
FROM lignes_vente;


-- Calculer la quantité moyenne par ligne de vente (avec conversion décimale)
SELECT 
    ROUND(AVG(CAST(quantite AS DECIMAL(10,2))), 2) AS quantite_moyenne
FROM lignes_vente;


-- Trouver les extrêmes (quantité minimale et maximale)
SELECT 
    MIN(quantite) AS quantite_minimale,
    MAX(quantite) AS quantite_maximale
FROM lignes_vente;


-- Mini tableau de bord global des ventes
SELECT 
    COUNT(*) AS nombre_lignes,
    COUNT(quantite) AS quantites_renseignees,
    SUM(quantite) AS quantite_totale,
    ROUND(AVG(CAST(quantite AS DECIMAL(10,2))), 2) AS quantite_moyenne,
    MIN(quantite) AS quantite_minimale,
    MAX(quantite) AS quantite_maximale
FROM lignes_vente;