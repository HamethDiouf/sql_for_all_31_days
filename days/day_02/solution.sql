-- ==========================================
-- Day 02 - SELECT et sélection des données
-- ==========================================

-- Afficher toutes les colonnes
SELECT * 
FROM clients;

-- Afficher une seule colonne (nom)
SELECT nom 
FROM clients;
 
-- Afficher plusieurs colonnes (nom, ville)
SELECT nom, ville 
FROM clients;

-- Afficher nom et email (cas newsletter)
SELECT nom, email 
FROM clients;

-- Utiliser des alias de colonnes (AS)
SELECT nom AS nom_client, 
       age AS age_client 
FROM clients;

-- Utiliser un alias de table
SELECT c.nom, c.email 
FROM clients AS c;

-- Afficher les villes uniques sans doublon
SELECT DISTINCT ville 
FROM clients;

