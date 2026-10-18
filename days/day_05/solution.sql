-- ==========================================
-- Day 05 - ORDER BY et LIMIT : trier et classer
-- ==========================================

-- Produits triés par prix croissant (du moins cher au plus cher)
SELECT nom_produit, prix 
FROM produits 
ORDER BY prix ASC;

-- Produits triés par prix décroissant (du plus cher au moins cher)
SELECT nom_produit, prix 
FROM produits 
ORDER BY prix DESC;


-- Clients triés par ordre alphabétique sur le nom
SELECT nom, ville 
FROM clients 
ORDER BY nom ASC;

-- Ventes de la plus récente à la plus ancienne
SELECT id_vente, date_vente 
FROM ventes 
ORDER BY date_vente DESC;


-- Clients triés par ville (A -> Z), puis par âge décroissant dans chaque ville
SELECT nom, ville, age 
FROM clients 
ORDER BY ville ASC, age DESC;


-- Produits de la catégorie Boissons, du plus cher au moins cher
SELECT nom_produit, prix 
FROM produits 
WHERE categorie = 'Boissons' 
ORDER BY prix DESC;


-- Les 5 produits les plus chers du catalogue
SELECT nom_produit, prix 
FROM produits 
ORDER BY prix DESC
LIMIT 5;

-- Les 3 magasins ayant la plus grande surface
SELECT nom, surface 
FROM magasins 
ORDER BY surface DESC
LIMIT 3;



-- Les 3 produits les plus chers parmi ceux dont la marque est renseignée
SELECT nom_produit, prix, marque 
FROM produits 
WHERE marque IS NOT NULL 
ORDER BY prix DESC
LIMIT 3;