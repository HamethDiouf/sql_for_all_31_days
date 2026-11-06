-- ==========================================
-- Day 16 - GROUP BY et Regroupements (PostgreSQL)
-- Fichier de correction des exercices du Jour 16
-- ==========================================

-- Quantité totale vendue pour chaque produit
SELECT 
    id_produit,
    SUM(quantite) AS quantite_totale
FROM lignes_vente
GROUP BY id_produit
ORDER BY id_produit;


-- Nombre de lignes de vente pour chaque produit
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
GROUP BY id_produit
ORDER BY id_produit;


-- Indicateurs multiples par produit (Lignes, Total, Moyenne)
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes,
    SUM(quantite) AS quantite_totale,
    ROUND(AVG(CAST(quantite AS DECIMAL(10,2))), 2) AS quantite_moyenne
FROM lignes_vente
GROUP BY id_produit
ORDER BY id_produit;


-- Quantités minimale et maximale par produit
SELECT 
    id_produit,
    MIN(quantite) AS quantite_minimale,
    MAX(quantite) AS quantite_maximale
FROM lignes_vente
GROUP BY id_produit
ORDER BY id_produit;


-- Regroupement selon deux dimensions (Vente et Produit)
SELECT 
    id_vente,
    id_produit,
    SUM(quantite) AS quantite_totale
FROM lignes_vente
GROUP BY 
    id_vente, 
    id_produit
ORDER BY 
    id_vente, 
    id_produit;