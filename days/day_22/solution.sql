-- ==========================================
-- Jour 22 : Introduction aux Sous-requêtes
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Lignes de vente dont la quantité dépasse la quantité moyenne par ligne
SELECT 
    id_ligne,
    quantite
FROM lignes_vente
WHERE quantite > (
    SELECT AVG(CAST(quantite AS DECIMAL(10,2)))
    FROM lignes_vente
);

-- Produits vendus au moins une fois (comparaison IN vs EXISTS)
-- Version IN :
SELECT p.id_produit
FROM produits AS p
WHERE p.id_produit IN (
    SELECT lv.id_produit
    FROM lignes_vente AS lv
);

-- Version EXISTS (recommandée) :
SELECT p.id_produit
FROM produits AS p
WHERE EXISTS (
    SELECT 1
    FROM lignes_vente AS lv
    WHERE lv.id_produit = p.id_produit
);

-- Lignes de vente dont le montant brut dépasse le montant brut moyen par ligne
SELECT 
    id_ligne,
    quantite * prix_unitaire AS montant_brut
FROM lignes_vente
WHERE quantite * prix_unitaire > (
    SELECT AVG(CAST(quantite * prix_unitaire AS DECIMAL(18,2)))
    FROM lignes_vente
)
ORDER BY id_ligne;

-- Top 3 des produits les plus vendus (quantité totale > 5) via une table dérivée dans FROM
SELECT 
    totaux.id_produit,
    totaux.quantite_totale
FROM (
    SELECT 
        id_produit,
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
) AS totaux
WHERE totaux.quantite_totale > 5
ORDER BY totaux.quantite_totale DESC
LIMIT 3;

-- Produits n'ayant aucune ligne de vente (sécurisé avec NOT EXISTS)
SELECT p.id_produit
FROM produits AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM lignes_vente AS lv
    WHERE lv.id_produit = p.id_produit
);