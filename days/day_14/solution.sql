-- ==========================================
-- Day 14 - Consolidation et Challenge Final (PostgreSQL)
-- Fichier de correction de la vue globale et des contrôles de validation
-- ==========================================

-- Requête principale : La vue complète des ventes (Granularité = 1 ligne par ligne de vente)
SELECT 
    v.id_vente,
    v.date_vente,
    c.prenom,
    c.nom,
    m.nom_magasin,
    l.id_ligne,
    p.nom_produit,
    cat.nom_categorie,
    l.quantite,
    l.prix_unitaire
FROM lignes_vente AS l
INNER JOIN ventes AS v 
    ON v.id_vente = l.id_vente
LEFT JOIN clients AS c 
    ON c.id_client = v.id_client
LEFT JOIN magasins AS m 
    ON m.id_magasin = v.id_magasin
INNER JOIN produits AS p 
    ON p.id_produit = l.id_produit
LEFT JOIN categories AS cat 
    ON cat.id_categorie = p.id_categorie
ORDER BY 
    v.id_vente, 
    l.id_ligne;


-- Contrôle de volume global (Vérification que le nombre de lignes final égale les lignes de vente de départ)
SELECT COUNT(*) AS total_lignes_vue
FROM lignes_vente AS l
INNER JOIN ventes AS v ON v.id_vente = l.id_vente
LEFT JOIN clients AS c ON c.id_client = v.id_client
LEFT JOIN magasins AS m ON m.id_magasin = v.id_magasin
INNER JOIN produits AS p ON p.id_produit = l.id_produit
LEFT JOIN categories AS cat ON cat.id_categorie = p.id_categorie;


-- Contrôle d'unicité (Vérification qu'aucune ligne de détail id_ligne ne se répète anormalement)
SELECT 
    l.id_ligne, 
    COUNT(*) AS nb_occurrences
FROM lignes_vente AS l
INNER JOIN ventes AS v ON v.id_vente = l.id_vente
LEFT JOIN clients AS c ON c.id_client = v.id_client
LEFT JOIN magasins AS m ON m.id_magasin = v.id_magasin
INNER JOIN produits AS p ON p.id_produit = l.id_produit
LEFT JOIN categories AS cat ON cat.id_categorie = p.id_categorie
GROUP BY l.id_ligne
HAVING COUNT(*) > 1;
-- Résultat attendu : 0 ligne (preuve qu'il n'y a pas de multiplication de lignes).


-- Vue exhaustive garantissant de ne perdre aucune vente (Partie de ventes + LEFT JOIN)
SELECT 
    v.id_vente,
    v.date_vente,
    c.prenom,
    c.nom,
    m.nom_magasin,
    l.id_ligne,
    p.nom_produit,
    cat.nom_categorie,
    l.quantite
FROM ventes AS v
LEFT JOIN clients AS c ON c.id_client = v.id_client
LEFT JOIN magasins AS m ON m.id_magasin = v.id_magasin
LEFT JOIN lignes_vente AS l ON l.id_vente = v.id_vente
LEFT JOIN produits AS p ON p.id_produit = l.id_produit
LEFT JOIN categories AS cat ON cat.id_categorie = p.id_categorie
ORDER BY 
    v.id_vente, 
    l.id_ligne;