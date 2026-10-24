-- ==========================================
-- 01_create_schema.sql - RetailPlus (PostgreSQL)
-- ==========================================

-- Suppression des tables si elles existent (dans l'ordre inverse des dépendances)
DROP TABLE IF EXISTS emplacements CASCADE;
DROP TABLE IF EXISTS lignes_vente CASCADE;
DROP TABLE IF EXISTS ventes CASCADE;
DROP TABLE IF EXISTS produits CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS magasins CASCADE;
DROP TABLE IF EXISTS clients CASCADE;

-- 1. Table clients
CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    prenom TEXT NOT NULL,
    nom TEXT NOT NULL,
    ville TEXT,
    age INT,
    email TEXT
);

-- 2. Table magasins
CREATE TABLE magasins (
    id_magasin INT PRIMARY KEY,
    nom TEXT NOT NULL,
    ville TEXT,
    surface INT
);

-- 3. Table categories
CREATE TABLE categories (
    id_categorie INT PRIMARY KEY,
    nom_categorie TEXT NOT NULL
);

-- 4. Table produits (avec lien vers categories)
CREATE TABLE produits (
    id_produit INT PRIMARY KEY,
    nom_produit TEXT NOT NULL,
    id_categorie INT REFERENCES categories(id_categorie),
    prix DECIMAL(10,2),
    marque TEXT
);

-- 5. Table ventes (en-tête du ticket)
CREATE TABLE ventes (
    id_vente INT PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    id_magasin INT REFERENCES magasins(id_magasin),
    date_vente DATE
);

-- 6. Table lignes_vente (détail des produits vendus par ticket)
CREATE TABLE lignes_vente (
    id_ligne INT PRIMARY KEY,
    id_vente INT REFERENCES ventes(id_vente),
    id_produit INT REFERENCES produits(id_produit),
    quantite INT,
    prix_unitaire DECIMAL(10,2),
    remise INT
);

-- 7. Table emplacements (localisation des produits dans les magasins)
CREATE TABLE emplacements (
    id_emplacement INT PRIMARY KEY, 
    id_magasin INT REFERENCES magasins(id_magasin), 
    id_produit INT REFERENCES produits(id_produit), 
    rayon TEXT, 
    etagere INT
);