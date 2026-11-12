-- ==========================================
-- Jour 21 : Consolidation Semaine 3 & Dashboard
-- Schéma : RetailPlus (PostgreSQL)
-- ==========================================

-- KPI globaux du mini-tableau de bord
SELECT 
    COUNT(*) AS nombre_lignes,
    COUNT(DISTINCT id_vente) AS nombre_ventes,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS montant_brut_total,
    SUM(CASE WHEN quantite * prix_unitaire >= 10 THEN 1 ELSE 0 END) AS nb_lignes_elevees
FROM lignes_vente;

-- Analyse détaillée par produit (volumes, CA brut, lignes élevées)
SELECT 
    id_produit,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS montant_brut_total,
    SUM(CASE WHEN quantite * prix_unitaire >= 10 THEN 1 ELSE 0 END) AS nombre_lignes_elevees
FROM lignes_vente
GROUP BY id_produit
ORDER BY montant_brut_total DESC;

-- Le podium des 3 meilleurs produits par chiffre d'affaires brut
SELECT 
    id_produit,
    SUM(quantite * prix_unitaire) AS montant_brut_total
FROM lignes_vente
GROUP BY id_produit
ORDER BY montant_brut_total DESC
LIMIT 3;

-- Analyse par magasin (après vérification des relations et clés)
SELECT 
    m.id_magasin,
    m.nom_magasin,
    COUNT(DISTINCT v.id_vente) AS nombre_ventes,
    SUM(lv.quantite) AS quantite_totale,
    SUM(lv.quantite * lv.prix_unitaire) AS montant_brut_total
FROM lignes_vente AS lv
INNER JOIN ventes AS v ON v.id_vente = lv.id_vente
INNER JOIN magasins AS m ON m.id_magasin = v.id_magasin
GROUP BY m.id_magasin, m.nom_magasin
ORDER BY montant_brut_total DESC;

-- Audit de granularité : Détection d'une multiplication de lignes (emplacements)
-- Comptage avant jointure :
SELECT COUNT(*) AS lignes_initiales FROM lignes_vente;

-- Comptage après jointure (risque de duplication si un produit a plusieurs emplacements) :
SELECT COUNT(*) AS lignes_multipliees 
FROM lignes_vente AS lv
INNER JOIN emplacements AS e ON e.id_produit = lv.id_produit;