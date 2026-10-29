-- ==========================================
-- Day 09 - INNER JOIN (PostgreSQL)
-- Fichier de correction des exercices et du mini challenge
-- ==========================================

-- Affiche chaque vente avec le prénom du client
SELECT 
    v.id_vente,
    c.prenom
FROM ventes AS v
INNER JOIN clients AS c
    ON v.id_client = c.id_client;


-- Affiche chaque vente avec le nom du magasin
SELECT 
    v.id_vente,
    m.nom_magasin
FROM ventes AS v
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin;


-- Affiche chaque ligne de vente avec le nom du produit
SELECT 
    lv.id_ligne,
    p.nom_produit,
    lv.quantite
FROM lignes_vente AS lv
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit;


-- Les produits vendus dans chaque vente (triés par vente)
SELECT 
    lv.id_vente,
    p.nom_produit,
    lv.quantite
FROM lignes_vente AS lv
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit
ORDER BY lv.id_vente;


-- Afficher le client, le magasin et la date de chaque vente (Double INNER JOIN)
SELECT 
    v.id_vente,
    c.prenom,
    c.nom,
    m.nom_magasin,
    v.date_vente
FROM ventes AS v
INNER JOIN clients AS c
    ON v.id_client = c.id_client
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin;


-- Mini Challenge - Afficher les ventes avec le produit correspondant (via la table intermédiaire lignes_vente)
SELECT 
    v.id_vente,
    v.date_vente,
    p.nom_produit,
    lv.quantite
FROM ventes AS v
INNER JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit;