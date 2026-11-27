-- ============================================================================
-- JOUR 31 - CONTROLES QUALITE & RECONCILIATION DES TOTAUX (POSTGRESQL)
-- ============================================================================

-- 1. Total brut direct sur lignes_vente (reference sans jointure client)
SELECT
    COUNT(*) AS nb_lignes_vente,
    COUNT(DISTINCT id_vente) AS nb_ventes_distinctes,
    SUM(quantite) AS quantite_totale,
    SUM(quantite * prix_unitaire) AS ca_brut_total
FROM lignes_vente;

-- 2. Total brut apres jointure ventes -> lignes_vente (verification d'ecart)
SELECT
    COUNT(*) AS nb_lignes_jointes,
    COUNT(DISTINCT v.id_vente) AS nb_ventes_jointes,
    SUM(lv.quantite * lv.prix_unitaire) AS ca_brut_apres_jointure_ventes
FROM ventes AS v
JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente;

-- 3. Clients sans aucune vente (LEFT JOIN depuis clients)
SELECT
    c.id_client,
    c.email
FROM clients AS c
LEFT JOIN ventes AS v
    ON c.id_client = v.id_client
WHERE v.id_client IS NULL;