DROP TABLE IF EXISTS clients;

-- Création de la table clients
CREATE TABLE clients (
    id INT PRIMARY KEY,
    nom TEXT,
    ville TEXT,
    age INT,
    email VARCHAR(100)
);

-- Insertion de données dans la table clients
INSERT INTO clients VALUES
(1, 'Paul', 'Paris', 25, 'paul@email.com'),
(2, 'Sarah', 'Lyon', 31, 'sarah@email.com'),
(3, 'Marc', 'Lille', 28, 'marc@email.com'),
(4, 'Léa', 'Paris', 24, 'lea@email.com'),
(5, 'Karim', 'Lyon', 35, 'karim@email.com'),
(6, 'Inès', 'Lille', 29, 'ines@email.com');


-- Sélection de toutes les données de la table clients
SELECT * FROM clients;

-- Affichage des colonnes ville et nom de la table clients
SELECT nom, ville FROM clients;

-- changement de l'ordre des colonnes dans la sélection
SELECT ville, nom FROM clients;

-- Ajouter de nouvelles données dans la table clients
INSERT INTO clients VALUES
(7, 'Hugo', 'Paris', 41, 'hugo@email.com'),
(8, 'Nina', 'Marseille', 33, 'nina@email.com');

-- Sélection de toutes les données de la table clients
SELECT * FROM clients;

-- Faire une erreur volontaire
SELECT nom, ville FORM clients; -- erreur de syntaxe sur ou près de « clients »
