-- ==========================================
-- Day 10 - LEFT JOIN & Gestion des Absences (PostgreSQL)
-- Fichier de correction des exercices et du mini challenge
-- ==========================================

-- Affiche tous les clients, avec leur numéro de vente lorsqu'il existe
SELECT 
    c.id_client,
    c.prenom,
    c.nom,
    v.id_vente,
    v.date_vente
FROM clients AS c
LEFT JOIN ventes AS v
    ON c.id_client = v.id_client;


-- Affiche tous les produits du catalogue et les lignes de vente correspondantes
SELECT 
    p.id_produit,
    p.nom_produit,
    lv.id_ligne,
    lv.quantite
FROM produits AS p
LEFT JOIN lignes_vente AS lv
    ON p.id_produit = lv.id_produit;


-- Affiche tous les magasins et leurs ventes éventuelles
SELECT 
    m.id_magasin,
    m.nom_magasin,
    v.id_vente
FROM magasins AS m
LEFT JOIN ventes AS v
    ON m.id_magasin = v.id_magasin;


-- Mini Challenge 1 : Afficher uniquement les clients qui n'ont aucune vente
SELECT 
    c.id_client,
    c.prenom,
    c.nom
FROM clients AS c
LEFT JOIN ventes AS v
    ON c.id_client = v.id_client
WHERE v.id_vente IS NULL;


-- Mini Challenge 2 : Afficher les produits qui n'ont jamais été vendus
SELECT 
    p.id_produit,
    p.nom_produit
FROM produits AS p
LEFT JOIN lignes_vente AS lv
    ON p.id_produit = lv.id_produit
WHERE lv.id_ligne IS NULL;


-- Mini Challenge 3 : Afficher les magasins sans vente
SELECT 
    m.id_magasin,
    m.nom_magasin
FROM magasins AS m
LEFT JOIN ventes AS v
    ON m.id_magasin = v.id_magasin
WHERE v.id_vente IS NULL;


-- Tous les clients conservés, mais n'associant que les ventes payées par carte (filtre dans ON)
SELECT 
    c.id_client,
    c.prenom,
    v.id_vente,
    v.mode_paiement
FROM clients AS c
LEFT JOIN ventes AS v
    ON c.id_client = v.id_client
   AND v.mode_paiement = 'Carte';