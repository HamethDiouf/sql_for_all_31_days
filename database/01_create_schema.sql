-- Suppression des tables si elles existent (dans l'ordre inverse des dépendances à cause des clés étrangères)
DROP TABLE IF EXISTS ventes CASCADE;
DROP TABLE IF EXISTS produits CASCADE;
DROP TABLE IF EXISTS magasins CASCADE;
DROP TABLE IF EXISTS clients CASCADE;

-- 1. Table clients
CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    nom TEXT NOT NULL,
    ville TEXT,
    age INT,
    email TEXT
);

-- 2. Table magasins
CREATE TABLE magasins (
    id_magasin INT PRIMARY KEY,
    nom TEXT NOT NULL,
    ville TEXT
);

-- 3. Table produits
CREATE TABLE produits (
    id_produit INT PRIMARY KEY,
    nom_produit TEXT NOT NULL,
    categorie TEXT,
    prix DECIMAL(5,2),
    marque TEXT
);

-- 4. Table ventes (avec clés étrangères vers clients, produits et magasins)
CREATE TABLE ventes (
    id_vente INT PRIMARY KEY,
    id_client INT REFERENCES clients(id_client),
    id_produit INT REFERENCES produits(id_produit),
    id_magasin INT REFERENCES magasins(id_magasin),
    date_vente DATE,
    quantite INT
);

