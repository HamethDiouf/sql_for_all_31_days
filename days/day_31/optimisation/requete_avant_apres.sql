-- ============================================================================
-- JOUR 31 - PHASE 7 : OPTIMISATION & PREUVE D'EQUIVALENCE (POSTGRESQL)
-- ============================================================================

-- 1. Mesure AVANT optimisation (a executer dans VS Code)
EXPLAIN (ANALYZE, BUFFERS)
SELECT DISTINCT
    c.id_client,
    SUM(lv.quantite * lv.prix_unitaire) AS ca_brut
FROM clients AS c
JOIN ventes AS v ON c.id_client = v.id_client
JOIN lignes_vente AS lv ON v.id_vente = lv.id_vente
GROUP BY c.id_client;

-- 2. Version APRES optimisation (suppression du DISTINCT redondant et projection utile)
EXPLAIN (ANALYZE, BUFFERS)
SELECT
    v.id_client,
    SUM(lv.quantite * lv.prix_unitaire) AS ca_brut
FROM ventes AS v
JOIN lignes_vente AS lv
    ON v.id_vente = lv.id_vente
WHERE v.id_client IS NOT NULL
GROUP BY v.id_client;

-- 3. Preuve d'equivalence des resultats (dans les deux sens)
-- (A executer sur des requetes normalisees a memes colonnes et memes types)