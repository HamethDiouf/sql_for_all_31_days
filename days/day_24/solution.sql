-- ==========================================
-- Jour 24 : Fonctions de classement (ROW_NUMBER, RANK, DENSE_RANK)
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Numéroter les produits du plus vendu au moins vendu avec ROW_NUMBER()
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    ROW_NUMBER() OVER (
        ORDER BY SUM(quantite) DESC, id_produit ASC
    ) AS numero_ligne
FROM lignes_vente
GROUP BY id_produit
ORDER BY numero_ligne;

-- Classer les produits avec RANK() (gestion des ex æquo avec rangs sautés)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    RANK() OVER (
        ORDER BY SUM(quantite) DESC
    ) AS rang_produit
FROM lignes_vente
GROUP BY id_produit
ORDER BY rang_produit, id_produit;

-- Comparer les trois fonctions côte à côte (ROW_NUMBER, RANK, DENSE_RANK)
SELECT
    id_produit,
    SUM(quantite) AS quantite_totale,
    ROW_NUMBER() OVER (ORDER BY SUM(quantite) DESC, id_produit ASC) AS numero_ligne,
    RANK() OVER (ORDER BY SUM(quantite) DESC) AS rang_produit,
    DENSE_RANK() OVER (ORDER BY SUM(quantite) DESC) AS rang_dense
FROM lignes_vente
GROUP BY id_produit
ORDER BY numero_ligne;

-- Filtrer le Top 3 global des produits les plus vendus à l'aide d'une CTE
WITH Classement_Produits AS (
    SELECT
        id_produit,
        SUM(quantite) AS quantite_totale,
        ROW_NUMBER() OVER (
            ORDER BY SUM(quantite) DESC, id_produit ASC
        ) AS numero_ligne
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT 
    id_produit, 
    quantite_totale, 
    numero_ligne
FROM Classement_Produits
WHERE numero_ligne <= 3
ORDER BY numero_ligne;

-- Top 3 des produits par catégorie avec PARTITION BY (Modèle à adapter selon les tables réelles)
WITH Quantites_Par_Produit AS (
    SELECT
        c.id_categorie,
        c.nom_categorie,
        lv.id_produit,
        SUM(lv.quantite) AS quantite_totale
    FROM lignes_vente AS lv
    INNER JOIN produits AS p ON p.id_produit = lv.id_produit
    INNER JOIN categories AS c ON c.id_categorie = p.id_categorie
    GROUP BY c.id_categorie, c.nom_categorie, lv.id_produit
),
Classement_Categorie AS (
    SELECT
        id_categorie,
        nom_categorie,
        id_produit,
        quantite_totale,
        ROW_NUMBER() OVER (
            PARTITION BY id_categorie 
            ORDER BY quantite_totale DESC, id_produit ASC
        ) AS numero_ligne
    FROM Quantites_Par_Produit
)
SELECT 
    nom_categorie, 
    id_produit, 
    quantite_totale, 
    numero_ligne
FROM Classement_Categorie
WHERE numero_ligne <= 3
ORDER BY id_categorie, numero_ligne;