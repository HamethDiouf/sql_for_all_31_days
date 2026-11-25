-- ==========================================
-- Jour 29 : Qualité et fiabilité des données (Analyse client)
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- Règle : Diagnostic en lecture seule (SELECT) — aucune modification/suppression.
-- Note : Montant brut = quantite * prix_unitaire (remise non intégrée).
-- ==========================================

-- Inspection du schéma et nullabilité des tables clés
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('clients', 'ventes', 'lignes_vente')
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- Doublons exacts sur identité/e-mail (hors e-mails absents ou vides)
SELECT
    prenom,
    nom,
    email,
    COUNT(*) AS nombre_fiches
FROM clients
WHERE email IS NOT NULL
  AND TRIM(email) <> ''
GROUP BY prenom, nom, email
HAVING COUNT(*) > 1
ORDER BY nombre_fiches DESC, nom;

-- Doublons potentiels par e-mail normalisé & fiche canonique proposée
WITH Clients_Normalises AS (
    SELECT
        id_client,
        prenom,
        nom,
        email,
        ville,
        LOWER(TRIM(email)) AS email_normalise
    FROM clients
),
Fiches_Marquees AS (
    SELECT
        id_client,
        prenom,
        nom,
        email,
        ville,
        email_normalise,
        COUNT(*) OVER (PARTITION BY email_normalise) AS fiches_meme_email,
        MIN(id_client) OVER (PARTITION BY email_normalise) AS id_canonique_propose,
        ROW_NUMBER() OVER (
            PARTITION BY email_normalise
            ORDER BY id_client
        ) AS numero_dans_groupe
    FROM Clients_Normalises
    WHERE email_normalise IS NOT NULL
      AND email_normalise <> ''
)
SELECT
    id_client,
    id_canonique_propose,
    numero_dans_groupe,
    fiches_meme_email,
    prenom,
    nom,
    email,
    ville
FROM Fiches_Marquees
WHERE fiches_meme_email > 1
ORDER BY email_normalise, numero_dans_groupe;

-- Doublons suspects dans lignes_vente (même vente, produit, quantité, prix)
SELECT
    id_vente,
    id_produit,
    quantite,
    prix_unitaire,
    COUNT(*) AS nombre_lignes
FROM lignes_vente
GROUP BY id_vente, id_produit, quantite, prix_unitaire
HAVING COUNT(*) > 1
ORDER BY nombre_lignes DESC, id_vente, id_produit;

-- Valeurs NULL et chaînes vides sur clients + contrôle colonne remise
SELECT
    COUNT(*) AS nombre_clients,
    COUNT(*) - COUNT(email) AS email_null,
    SUM(CASE WHEN email IS NOT NULL AND TRIM(email) = '' THEN 1 ELSE 0 END) AS email_vide,
    COUNT(*) - COUNT(ville) AS ville_null
FROM clients;

SELECT
    id_client,
    prenom,
    nom,
    email,
    ville
FROM clients
WHERE email IS NULL
   OR TRIM(email) = ''
   OR ville IS NULL
ORDER BY id_client;

SELECT
    COUNT(*) AS nb_lignes,
    COUNT(*) - COUNT(remise) AS remise_manquante,
    MIN(remise) AS remise_min,
    MAX(remise) AS remise_max,
    SUM(CASE WHEN remise < 0 THEN 1 ELSE 0 END) AS remise_negative
FROM lignes_vente;

-- Détection des valeurs inhabituelles/aberrantes et mesure d'impact
WITH Lignes_Controlees AS (
    SELECT
        id_ligne,
        id_vente,
        id_produit,
        quantite,
        prix_unitaire,
        (quantite * prix_unitaire) AS montant_brut,
        CASE
            WHEN quantite IS NULL THEN 'Quantite manquante'
            WHEN quantite <= 0 THEN 'Quantite nulle ou negative'
            WHEN quantite > 50 THEN 'Quantite tres elevee (seuil a valider)'
            WHEN prix_unitaire IS NULL THEN 'Prix manquant'
            WHEN prix_unitaire <= 0 THEN 'Prix nul ou negatif'
            WHEN prix_unitaire > 500 THEN 'Prix tres eleve (seuil a valider)'
        END AS anomalie,
        CASE
            WHEN quantite IS NULL OR quantite <= 0 OR quantite > 50
              OR prix_unitaire IS NULL OR prix_unitaire <= 0 OR prix_unitaire > 500
            THEN 1
            ELSE 0
        END AS ligne_a_verifier
    FROM lignes_vente
)
SELECT
    COUNT(*) AS nombre_lignes,
    SUM(ligne_a_verifier) AS lignes_a_verifier,
    SUM(montant_brut) AS montant_brut_total,
    SUM(CASE WHEN ligne_a_verifier = 1 THEN montant_brut ELSE 0 END) AS montant_lignes_a_verifier,
    SUM(CASE WHEN ligne_a_verifier = 0 THEN montant_brut ELSE 0 END) AS montant_hors_anomalies
FROM Lignes_Controlees;

-- Cohérence des totaux avant/après jointure avec ventes et détection d'orphelines
SELECT
    COUNT(*) AS nb_lignes_ref,
    SUM(quantite) AS quantite_totale_ref,
    SUM(quantite * prix_unitaire) AS montant_brut_ref
FROM lignes_vente;

SELECT
    COUNT(*) AS nb_lignes_jointes,
    SUM(lv.quantite) AS quantite_totale_jointe,
    SUM(lv.quantite * lv.prix_unitaire) AS montant_brut_jointe
FROM lignes_vente AS lv
INNER JOIN ventes AS v
    ON v.id_vente = lv.id_vente;

-- Lignes de vente orphelines (vente absente dans ventes)
SELECT
    lv.id_ligne,
    lv.id_vente,
    lv.id_produit,
    (lv.quantite * lv.prix_unitaire) AS montant_brut
FROM lignes_vente AS lv
LEFT JOIN ventes AS v
    ON v.id_vente = lv.id_vente
WHERE v.id_vente IS NULL
ORDER BY lv.id_ligne;

-- Ventes sans aucune ligne de vente
SELECT
    v.id_vente
FROM ventes AS v
LEFT JOIN lignes_vente AS lv
    ON lv.id_vente = v.id_vente
WHERE lv.id_ligne IS NULL
ORDER BY v.id_vente;

-- Cas fil rouge : Analyse client fiable avec identifiant canonique et suivi des anomalies
WITH Clients_Canoniques AS (
    SELECT
        id_client,
        CASE
            WHEN email IS NULL OR TRIM(email) = '' THEN id_client
            ELSE MIN(id_client) OVER (PARTITION BY LOWER(TRIM(email)))
        END AS id_client_canonique
    FROM clients
),
Lignes_Controlees AS (
    SELECT
        id_ligne,
        id_vente,
        (quantite * prix_unitaire) AS montant_brut,
        CASE
            WHEN quantite IS NULL OR quantite <= 0 OR quantite > 50
              OR prix_unitaire IS NULL OR prix_unitaire <= 0 OR prix_unitaire > 500
            THEN 1
            ELSE 0
        END AS ligne_a_verifier
    FROM lignes_vente
),
Par_Client AS (
    SELECT
        cc.id_client_canonique,
        COUNT(DISTINCT v.id_vente) AS nombre_ventes,
        COUNT(*) AS nombre_lignes,
        SUM(lc.montant_brut) AS montant_brut_total,
        SUM(lc.ligne_a_verifier) AS lignes_a_verifier,
        SUM(CASE WHEN lc.ligne_a_verifier = 0 THEN lc.montant_brut ELSE 0 END) AS montant_brut_hors_anomalies
    FROM Lignes_Controlees AS lc
    INNER JOIN ventes AS v
        ON v.id_vente = lc.id_vente
    INNER JOIN Clients_Canoniques AS cc
        ON cc.id_client = v.id_client
    GROUP BY cc.id_client_canonique
)
SELECT
    id_client_canonique,
    nombre_ventes,
    nombre_lignes,
    montant_brut_total,
    lignes_a_verifier,
    montant_brut_hors_anomalies,
    ROUND(
        montant_brut_total::NUMERIC / NULLIF(nombre_ventes, 0),
        2
    ) AS panier_moyen_brut,
    RANK() OVER (ORDER BY montant_brut_total DESC) AS rang_total,
    RANK() OVER (ORDER BY montant_brut_hors_anomalies DESC) AS rang_hors_anomalies
FROM Par_Client
ORDER BY rang_total, id_client_canonique;