-- ==========================================
-- Day 08 - Clés, relations & granularité (PostgreSQL)
-- Fichier de validation et de repérage des PK / FK
-- ==========================================

-- Ce fichier résume les requêtes de vérification des clés et des liaisons 
-- dans le modèle RetailPlus (7 tables) avant d'aborder les JOIN au Jour 9.

-- 1. Vérification de la clé primaire (PK) de la table clients
SELECT id_client, prenom, nom 
FROM clients;

-- 2. Vérification de la clé étrangère (FK) liant ventes à clients et magasins
SELECT id_vente, id_client, id_magasin, date_vente 
FROM ventes;

-- 3. Vérification de la relation 1 -> N entre ventes et lignes_vente
-- Observation : Une même vente (id_vente = 1) possède plusieurs lignes de vente.
SELECT id_vente, id_produit, quantite 
FROM lignes_vente 
WHERE id_vente = 1;

-- 4. Vérification de la liaison entre produits et catégories (FK : id_categorie)
SELECT id_produit, nom_produit, id_categorie, prix 
FROM produits;

-- 5. Vérification de la table intermédiaire emplacements (relation N -> N entre magasins et produits)
SELECT id_emplacement, id_magasin, id_produit, rayon, etagere 
FROM emplacements;