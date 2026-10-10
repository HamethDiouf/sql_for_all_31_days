-- Sélection de toutes les données de la table clients
SELECT * FROM clients;

-- Affichage des colonnes ville et nom de la table clients
SELECT nom, ville FROM clients; 

-- changement de l'ordre des colonnes dans la sélection
SELECT ville, nom FROM clients;


-- Sélection de toutes les données de la table clients
SELECT * FROM clients;

-- Faire une erreur volontaire
SELECT nom, ville FORM clients; -- erreur de syntaxe sur ou près de « clients »
