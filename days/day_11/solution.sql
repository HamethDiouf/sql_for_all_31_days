-- ==========================================
-- Day 11 - Enchaîner plusieurs JOIN (PostgreSQL)
-- Fichier de correction des exercices et du challenge final
-- ==========================================

-- Afficher id_vente, date_vente, nom_magasin et nom_produit
SELECT 
    v.id_vente,
    v.date_vente,
    m.nom_magasin,
    p.nom_produit
FROM ventes AS v
INNER JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin;


-- Nom du produit, sa catégorie et la quantité totale vendue
SELECT 
    cat.nom_categorie,
    p.nom_produit,
    SUM(lv.quantite) AS quantite_vendue
FROM lignes_vente AS lv
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit
INNER JOIN categories AS cat
    ON p.id_categorie = cat.id_categorie
GROUP BY 
    cat.nom_categorie, 
    p.nom_produit
ORDER BY quantite_vendue DESC;


-- Produits achetés par client avec sa ville
SELECT 
    c.id_client,
    c.prenom,
    c.nom,
    c.ville,
    p.nom_produit,
    lv.quantite
FROM clients AS c
INNER JOIN ventes AS v
    ON c.id_client = v.id_client
INNER JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit;


-- Conserver tous les clients, même ceux sans vente
SELECT 
    c.id_client,
    c.prenom,
    c.nom,
    v.id_vente
FROM clients AS c
LEFT JOIN ventes AS v
    ON c.id_client = v.id_client;


-- Challenge Métier Final : Analyse des achats par magasin (Date, magasin, produit, catégorie, quantité)
SELECT 
    v.date_vente,
    m.nom_magasin,
    p.nom_produit,
    cat.nom_categorie,
    lv.quantite
FROM ventes AS v
INNER JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
INNER JOIN produits AS p
    ON lv.id_produit = p.id_produit
INNER JOIN categories AS cat
    ON p.id_categorie = cat.id_categorie
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
ORDER BY v.date_vente, m.nom_magasin;