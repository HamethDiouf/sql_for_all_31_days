-- ============================================================================
-- JOUR 31 - PHASES 2 & 4 : EXPLORATION DU SCHEMA POSTGRESQL & AUDIT QUALITE
-- Base : SQL_FOR_ALL_RetailPlus (Lecture seule / diagnostic)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- PHASE 2.1 : Colonnes, types et nullabilite des tables cles
-- ----------------------------------------------------------------------------
SELECT
    table_schema,
    table_name,
    ordinal_position,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('clients', 'ventes', 'lignes_vente', 'magasins', 'produits', 'categories')
ORDER BY table_name, ordinal_position;

-- ----------------------------------------------------------------------------
-- PHASE 2.2 : Cles primaires et cles etrangeres declarees
-- ----------------------------------------------------------------------------
SELECT
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name,
    kcu.column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.table_schema = kcu.table_schema
WHERE tc.table_schema = 'public'
  AND tc.table_name IN ('clients', 'ventes', 'lignes_vente', 'magasins', 'produits', 'categories')
  AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY')
ORDER BY tc.table_name, tc.constraint_type, kcu.ordinal_position;

-- ----------------------------------------------------------------------------
-- PHASE 2.3 : Volumes et granularite (a adapter selon les cles confirmees)
-- ----------------------------------------------------------------------------
SELECT 'clients' AS table_nom, COUNT(*) AS nb_lignes FROM clients
UNION ALL
SELECT 'ventes', COUNT(*) FROM ventes
UNION ALL
SELECT 'lignes_vente', COUNT(*) FROM lignes_vente
UNION ALL
SELECT 'magasins', COUNT(*) FROM magasins;

-- Nombre de lignes par vente (granularite ventes -> lignes_vente)
SELECT
    nb_lignes_par_vente,
    COUNT(*) AS nb_ventes
FROM (
    SELECT id_vente, COUNT(*) AS nb_lignes_par_vente
    FROM lignes_vente
    GROUP BY id_vente
) AS sous_req
GROUP BY nb_lignes_par_vente
ORDER BY nb_lignes_par_vente;

-- ----------------------------------------------------------------------------
-- PHASE 4 : Controles qualite (doublons, NULL, orphelins, aberrations)
-- ----------------------------------------------------------------------------
-- Doublons potentiels sur l'e-mail (insensible a la casse)
SELECT
    LOWER(TRIM(email)) AS email_normalise,
    COUNT(*) AS occurrences
FROM clients
WHERE email IS NOT NULL AND TRIM(email) <> ''
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;

-- Ventes referenceant un id_client absent de clients (ou NULL)
SELECT
    COUNT(*) AS ventes_sans_client_valide
FROM ventes AS v
LEFT JOIN clients AS c
    ON v.id_client = c.id_client
WHERE v.id_client IS NULL OR c.id_client IS NULL;

-- Aberrations potentielles sur quantite, prix_unitaire et remise
SELECT
    COUNT(*) FILTER (WHERE quantite IS NULL OR quantite <= 0) AS qte_nulle_ou_non_positive,
    COUNT(*) FILTER (WHERE prix_unitaire IS NULL OR prix_unitaire < 0) AS prix_nul_ou_negatif,
    COUNT(*) FILTER (WHERE remise IS NOT NULL AND remise < 0) AS remise_negative
FROM lignes_vente;