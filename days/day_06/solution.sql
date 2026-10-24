-- ==========================================
-- Day 06 - Calculs, expressions, CAST et COALESCE (PostgreSQL)
-- ==========================================

-- Étape 1 : Colonnes calculées et alias (AS)
-- Montant total pour chaque ligne de vente
SELECT 
    id_produit, 
    quantite, 
    prix_unitaire, 
    quantite * prix_unitaire AS montant_total
FROM lignes_vente;

-- Prix des produits majoré de 20 % (+20%)
SELECT 
    nom_produit, 
    prix, 
    prix * 1.20 AS prix_avec_taxe
FROM produits;


-- Étape 2 : Attention à la division entière
-- Division entière (donne un entier : 2)
SELECT 10 / 4 AS division_entiere;

-- Division décimale (donne un résultat précis : 2.500000)
SELECT 10 / 4.0 AS division_decimale;


-- Étape 3 : Conversion de types avec CAST
-- Convertir le prix en entier (tronque les décimales)
SELECT 
    nom_produit, 
    prix, 
    CAST(prix AS INT) AS prix_entier
FROM produits;

-- Calculer un montant et le formater proprement avec 2 décimales
SELECT 
    quantite, 
    prix_unitaire, 
    CAST(quantite * prix_unitaire AS DECIMAL(10,2)) AS montant_total
FROM lignes_vente;


-- Étape 4 : Gérer les valeurs manquantes avec COALESCE
-- Remplacer les marques NULL par "Marque inconnue"
SELECT 
    nom_produit, 
    COALESCE(marque, 'Marque inconnue') AS marque_affichee
FROM produits;

-- Sécuriser la remise pour éviter un résultat NULL lors du calcul
SELECT 
    id_ligne, 
    remise, 
    COALESCE(remise, 0) AS remise_securisee
FROM lignes_vente;


-- Étape 5 : Traiter les emplacements (CAST + COALESCE)
-- Remplacer les étagères NULL par "Non définie" en gérant les types
SELECT 
    id_emplacement, 
    rayon, 
    COALESCE(CAST(etagere AS VARCHAR(10)), 'Non définie') AS etagere_affichee
FROM emplacements;


-- Étape 6 : Combiner calculs, filtres, tris et LIMIT
-- Montants totaux des lignes dont la quantité est > 1, triés du plus grand au plus petit
SELECT 
    id_produit, 
    quantite, 
    prix_unitaire, 
    CAST(quantite * prix_unitaire AS DECIMAL(10,2)) AS montant_total
FROM lignes_vente
WHERE quantite > 1
ORDER BY montant_total DESC;

-- Le podium des 3 lignes ayant généré le plus gros montant après remise
SELECT 
    id_ligne, 
    id_produit,
    COALESCE(remise, 0) AS remise_appliquee,
    CAST(quantite * prix_unitaire * (1 - COALESCE(remise, 0) / 100.0) AS DECIMAL(10,2)) AS montant_final
FROM lignes_vente
ORDER BY montant_final DESC
LIMIT 3;