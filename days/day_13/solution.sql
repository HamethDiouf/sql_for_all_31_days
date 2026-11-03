-- ==========================================
-- Day 13 - Doublons, cardinalité et erreurs de JOIN (PostgreSQL)
-- Fichier de correction des exercices et du mini-défi
-- ==========================================

-- Affichage de la granularité (vente / ligne de vente / produit)
SELECT 
    v.id_vente, 
    lv.id_ligne, 
    lv.id_produit 
FROM ventes AS v 
INNER JOIN lignes_vente AS lv 
    ON v.id_vente = lv.id_vente;
-- Interprétation : Chaque ligne représente un article spécifique (ligne de vente) rattaché à un ticket.


-- Recherche de doublons sur la clé primaire de ventes (doit retourner 0 ligne)
SELECT 
    id_vente, 
    COUNT(*) AS nb 
FROM ventes 
GROUP BY id_vente 
HAVING COUNT(*) > 1;


-- Détection des références de produits orphelines dans les lignes de vente
SELECT 
    lv.id_ligne, 
    lv.id_produit
FROM lignes_vente AS lv
LEFT JOIN produits AS p
    ON lv.id_produit = p.id_produit
WHERE p.id_produit IS NULL;


-- Mini-défi : Contrôle de cardinalité sur les emplacements (couples magasin-produit dupliqués)
SELECT 
    id_magasin, 
    id_produit, 
    COUNT(*) AS nb_emplacements
FROM emplacements
GROUP BY id_magasin, id_produit
HAVING COUNT(*) > 1;


-- Mini-défi : Requête corrigée pour calculer le chiffre d'affaires par magasin (sans jointure inutile)
SELECT 
    m.id_magasin,
    m.nom_magasin,
    SUM(lv.quantite * lv.prix_unitaire) AS chiffre_affaires
FROM ventes AS v
INNER JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
INNER JOIN magasins AS m
    ON v.id_magasin = m.id_magasin
GROUP BY 
    m.id_magasin, 
    m.nom_magasin;