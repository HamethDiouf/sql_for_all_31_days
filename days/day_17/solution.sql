-- ==========================================
-- Day 17 - HAVING et distinction WHERE / HAVING (PostgreSQL)
-- Fichier de correction des exercices du Jour 17
-- ==========================================

-- Compter les lignes de vente par produit
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
GROUP BY id_produit
ORDER BY id_produit;


-- Filtrer les groupes avec HAVING (Produits présents dans plus de 2 lignes)
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
GROUP BY id_produit
HAVING COUNT(*) > 2
ORDER BY id_produit;


-- Filtrer les lignes avant regroupement avec WHERE (Quantité >= 2)
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
WHERE quantite >= 2
GROUP BY id_produit
ORDER BY id_produit;


-- Combiner WHERE et HAVING (Lignes avec quantité >= 2 ET au moins 2 lignes par produit)
SELECT 
    id_produit,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
WHERE quantite >= 2
GROUP BY id_produit
HAVING COUNT(*) >= 2
ORDER BY id_produit;


-- Filtrer sur un résultat agrégé avec SUM (Quantité totale supérieure à 5)
SELECT 
    id_produit,
    SUM(quantite) AS quantite_totale
FROM lignes_vente
GROUP BY id_produit
HAVING SUM(quantite) > 5
ORDER BY id_produit;



