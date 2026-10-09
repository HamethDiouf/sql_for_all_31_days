-- ==========================================
-- Day 03 - WHERE et le filtrage des données
-- ==========================================

-- Pour ce jour 3, nous utilisons les tables enrichies de RetailPlus : 
-- clients, produits, magasins et ventes.

-- Étape 1 : Filtrer avec une condition simple (=)
-- Afficher les clients qui habitent à Paris
SELECT * 
FROM clients 
WHERE ville = 'Paris';

-- Étape 2 : Combiner sélection de colonnes et filtrage
-- Afficher le nom et la ville des clients qui habitent à Marseille
SELECT nom, ville 
FROM clients 
WHERE ville = 'Marseille';

-- Étape 3 : Utiliser les opérateurs de comparaison (> , >= , <=)
-- Clients ayant plus de 35 ans
SELECT * 
FROM clients 
WHERE age > 35;

-- Clients ayant 30 ans ou plus
SELECT * 
FROM clients 
WHERE age >= 30;

-- Produits de la catégorie Boissons dont le prix est inférieur ou égal à 1.20
SELECT nom_produit, prix 
FROM produits 
WHERE categorie = 'Boissons' 
  AND prix <= 1.20;

-- Étape 4 : Combiner plusieurs conditions avec AND
-- Clients de Lyon âgés de plus de 30 ans
SELECT * 
FROM clients 
WHERE ville = 'Lyon' 
  AND age > 30;

-- Étape 5 : Élargir la recherche avec OR
-- Clients qui habitent à Paris ou à Marseille
SELECT * 
FROM clients 
WHERE ville = 'Paris' 
   OR ville = 'Marseille';

-- Étape 6 : Exclure des données avec NOT ou <>
-- Clients qui n'habitent pas à Paris (version avec NOT)
SELECT * 
FROM clients 
WHERE NOT ville = 'Paris';

-- Clients qui n'habitent pas à Paris (version avec l'opérateur <>)
SELECT * 
FROM clients 
WHERE ville <> 'Paris';

-- Étape 7 : Mélanger AND et OR avec les parenthèses
-- Clients de Paris qui ont moins de 30 ans ou plus de 40 ans
SELECT * 
FROM clients 
WHERE ville = 'Paris' 
  AND (age < 30 OR age > 40);

-- Étape 8 : Expérimenter sur les ventes
-- Ventes réalisées dans le magasin n°2
SELECT * 
FROM ventes 
WHERE id_magasin = 2;

-- Ventes réalisées après le 1er mars 2025
SELECT * 
FROM ventes 
WHERE date_vente > '2025-03-01';