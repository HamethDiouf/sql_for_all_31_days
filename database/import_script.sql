-- ==========================================
-- import_script.sql - Importation des fichiers CSV
-- Univers RetailPlus (PostgreSQL)
-- ==========================================

-- 1. Tables mères indépendantes (sans clés étrangères)
\copy categories(id_categorie, nom_categorie) FROM '../resources/categories.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy clients(id_client, prenom, nom, ville, age, email) FROM '../resources/clients.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy magasins(id_magasin, nom_magasin, ville, surface) FROM '../resources/magasins.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- 2. Tables dépendantes de premier niveau
\copy produits(id_produit, nom_produit, id_categorie, prix, marque) FROM '../resources/produits.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy ventes(id_vente, id_client, id_magasin, date_vente, mode_paiement) FROM '../resources/ventes.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- 3. Tables de relation et de détail (dépendantes des précédentes)
\copy emplacements(id_emplacement, id_magasin, id_produit, rayon, etagere) FROM '../resources/emplacements.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy lignes_vente(id_ligne, id_vente, id_produit, quantite, prix_unitaire, remise) FROM '../resources/lignes_vente.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');