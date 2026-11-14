-- ==========================================
-- Jour 23 : Structurer les requêtes avec les CTE (WITH)
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Quantité totale vendue par produit
WITH Quantites_Par_Produit AS (
    SELECT 
        id_produit, 
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT 
    id_produit, 
    quantite_totale
FROM Quantites_Par_Produit
ORDER BY quantite_totale DESC;

-- Produits dont le total dépasse 5 unités
WITH Quantites_Par_Produit AS (
    SELECT 
        id_produit, 
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT 
    id_produit, 
    quantite_totale
FROM Quantites_Par_Produit
WHERE quantite_totale > 5
ORDER BY quantite_totale DESC;

-- Montant brut total par produit (avant remise)
WITH Montants_Bruts_Par_Produit AS (
    SELECT 
        id_produit,
        SUM(quantite * prix_unitaire) AS montant_brut_total
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT 
    id_produit, 
    montant_brut_total
FROM Montants_Bruts_Par_Produit
ORDER BY montant_brut_total DESC;

-- Produits dont le total dépasse la moyenne des totaux (CTE multiples)
WITH Quantites_Par_Produit AS (
    SELECT 
        id_produit, 
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
),
Moyenne_Des_Totaux AS (
    SELECT ROUND(AVG(CAST(quantite_totale AS DECIMAL(18,2))), 2) AS moyenne_quantite
    FROM Quantites_Par_Produit
)
SELECT 
    q.id_produit, 
    q.quantite_totale, 
    m.moyenne_quantite
FROM Quantites_Par_Produit AS q
CROSS JOIN Moyenne_Des_Totaux AS m
WHERE q.quantite_totale > m.moyenne_quantite
ORDER BY q.quantite_totale DESC;

-- Synthèse : Plusieurs CTE enchaînées (quantité + montant brut + filtre > 5)
WITH Quantites_Par_Produit AS (
    SELECT 
        id_produit, 
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
),
Montants_Par_Produit AS (
    SELECT 
        id_produit, 
        SUM(quantite * prix_unitaire) AS montant_brut_total
    FROM lignes_vente
    GROUP BY id_produit
),
Indicateurs_Produit AS (
    SELECT 
        q.id_produit, 
        q.quantite_totale, 
        m.montant_brut_total
    FROM Quantites_Par_Produit AS q
    INNER JOIN Montants_Par_Produit AS m ON m.id_produit = q.id_produit
)
SELECT 
    id_produit, 
    quantite_totale, 
    montant_brut_total
FROM Indicateurs_Produit
WHERE quantite_totale > 5
ORDER BY montant_brut_total DESC;