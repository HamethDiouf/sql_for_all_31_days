-- ==========================================
-- Day 04 - Filtres avancés : IN, BETWEEN, LIKE, NULL
-- ==========================================

-- Étape 1 : Rechercher plusieurs valeurs avec IN
-- Clients qui habitent à Marseille ou à Lille
SELECT * 
FROM clients 
WHERE ville IN ('Marseille', 'Lille');

-- Produits des catégories Laitier ou Fruits
SELECT nom_produit, categorie 
FROM produits 
WHERE categorie IN ('Laitier', 'Fruits');

-- Ventes réalisées dans les magasins 2 et 4
SELECT * 
FROM ventes 
WHERE id_magasin IN (2, 4);


-- Étape 2 : Filtrer une plage avec BETWEEN
-- Clients dont l'âge est entre 30 et 40 ans (bornes incluses)
SELECT * 
FROM clients 
WHERE age BETWEEN 30 AND 40;

-- Produits dont le prix est compris entre 2 et 3 €
SELECT * 
FROM produits 
WHERE prix BETWEEN 2 AND 3;

-- Ventes de février 2026
SELECT * 
FROM ventes 
WHERE date_vente BETWEEN '2026-02-01' AND '2026-02-28';


-- Étape 3 : Rechercher selon un motif avec LIKE
-- Clients dont le nom commence par 'A'
SELECT * 
FROM clients 
WHERE nom LIKE 'A%';

-- Produits dont le nom contient "chocolat"
SELECT * 
FROM produits 
WHERE nom_produit LIKE '%chocolat%';

-- Produits dont le nom se termine par "500g"
SELECT * 
FROM produits 
WHERE nom_produit LIKE '%500g';

-- Clients dont la 2e lettre du nom est 'a'
SELECT * 
FROM clients 
WHERE nom LIKE '_a%';


-- Étape 4 : Gérer les valeurs absentes avec IS NULL / IS NOT NULL
-- Clients dont l'email est manquant (NULL)
SELECT * 
FROM clients 
WHERE email IS NULL;

-- Produits dont la marque est renseignée
SELECT * 
FROM produits 
WHERE marque IS NOT NULL;


-- Étape 5 : Combiner les filtres
-- Produits Boissons ou Épicerie dont le prix est entre 1 et 2 €
SELECT * 
FROM produits 
WHERE categorie IN ('Boissons', 'Épicerie') 
  AND prix BETWEEN 1 AND 2;

-- Campagne email : clients de Paris, Lyon, Lille (25-40 ans) avec email renseigné
SELECT * 
FROM clients 
WHERE ville IN ('Paris', 'Lyon', 'Lille')
  AND age BETWEEN 25 AND 40
  AND email IS NOT NULL;