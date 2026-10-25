-- ==========================================
-- Day 07 Challenge (PostgreSQL)
-- Respect strict du périmètre Jours 1 à 6 (SANS jointures)
-- ==========================================

-- Les 10 produits les plus chers du catalogue
-- Raisonnement : Tri décroissant sur le prix, puis limite à 10 lignes avec LIMIT.
SELECT 
    nom_produit, 
    prix
FROM produits
ORDER BY prix DESC
LIMIT 10;


-- Les produits dont le prix est compris entre 2 € et 5 €
-- Raisonnement : Utilisation de BETWEEN (bornes incluses), tri croissant par défaut.
SELECT 
    nom_produit, 
    prix
FROM produits
WHERE prix BETWEEN 2 AND 5
ORDER BY prix ASC;


-- Produits appartenant à certaines catégories (id_categorie 3 pour Boissons, 4 pour Épicerie) dont la marque est connue
-- Raisonnement : Filtre multiple sur l'ID de catégorie avec IN et IS NOT NULL sur la marque, sans jointure.
SELECT 
    nom_produit, 
    id_categorie, 
    marque
FROM produits
WHERE id_categorie IN (3, 4)
  AND marque IS NOT NULL
ORDER BY nom_produit ASC;


-- Clients qui habitent à Paris, du plus âgé au plus jeune
-- Raisonnement : Filtrer sur la ville et trier par âge décroissant.
SELECT 
    prenom, 
    nom, 
    age
FROM clients
WHERE ville = 'Paris'
ORDER BY age DESC;


-- Clients n'ayant pas renseigné leur email
-- Raisonnement : Utilisation stricte de IS NULL pour repérer les valeurs absentes.
SELECT 
    prenom, 
    nom, 
    ville
FROM clients
WHERE email IS NULL;


-- Produits contenant "chocolat" dans leur nom
-- Raisonnement : Utilisation de l'opérateur ILIKE (insensible à la casse sous PostgreSQL) avec % de part et d'autre.
SELECT 
    nom_produit, 
    prix
FROM produits
WHERE nom_produit ILIKE '%chocolat%'
ORDER BY prix DESC;


-- Les 5 lignes de vente ayant la quantité la plus élevée
-- Raisonnement : Trier par quantité décroissante dans lignes_vente et limiter à 5 avec LIMIT.
SELECT 
    id_ligne, 
    id_produit, 
    quantite
FROM lignes_vente
ORDER BY quantite DESC
LIMIT 5;


-- Montant total de chaque ligne + remise sécurisée
-- Raisonnement : Colonne calculée (quantite * prix_unitaire) et COALESCE pour transformer les NULL de remise en 0.
SELECT 
    id_ligne, 
    quantite, 
    prix_unitaire, 
    COALESCE(remise, 0) AS remise_appliquee,
    quantite * prix_unitaire AS montant_total
FROM lignes_vente;


-- Les lignes de vente concernant le produit n°7 (Eau minérale) ou d'autres produits spécifiques
-- Raisonnement : Filtrer directement sur l'id_produit dans la table lignes_vente, sans croiser les tables.
SELECT 
    id_ligne,
    id_vente,
    id_produit,
    quantite,
    prix_unitaire
FROM lignes_vente
WHERE id_produit IN (6, 7); -- Produits de type boisson (Jus orange et Eau minérale)


-- Le top 3 des lignes de vente dont le montant (2 décimales) est le plus élevé
-- Raisonnement : Calcul du montant, conversion propre avec CAST(... AS DECIMAL(10,2)), tri décroissant et LIMIT 3.
SELECT 
    id_ligne, 
    id_produit, 
    CAST(quantite * prix_unitaire AS DECIMAL(10,2)) AS montant_total
FROM lignes_vente
ORDER BY montant_total DESC
LIMIT 3;