-- Cleaning up existing data
DROP TABLE IF EXISTS clients CASCADE;

-- Re-creating the schema
CREATE TABLE clients (
    id INT PRIMARY KEY,
    nom TEXT NOT NULL,
    ville TEXT,
    age INT,
    email TEXT
);

-- Re-insertion of initial data
INSERT INTO clients (id, nom, ville, age, email) VALUES
(1, 'Paul', 'Paris', 25, 'paul@email.com'),
(2, 'Sarah', 'Lyon', 31, 'sarah@email.com'),
(3, 'Marc', 'Lille', 28, 'marc@email.com'),
(4, 'Alice', 'Marseille', 22, 'alice@email.com'),
(5, 'David', 'Bordeaux', 35, 'david@email.com'),
(6, 'Claire', 'Paris', 29, 'claire@email.com'),
(7, 'Thomas', 'Lyon', 40, 'thomas@email.com'),
(8, 'Emma', 'Lille', 24, 'emma@email.com');