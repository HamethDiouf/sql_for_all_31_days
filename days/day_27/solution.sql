-- ==========================================
-- Jour 27 : Problèmes analytiques réels (Bout en bout)
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- Note : Montant brut calculé via quantite * prix_unitaire (remise non intégrée).
-- ==========================================

-- Vérification préalable du schéma et de la colonne remise
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'ventes', 
    'lignes_vente', 
    'produits', 
    'magasins', 
    'categories', 
    'clients', 
    'emplacements'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- Compte des lignes de vente, nombre de remises renseignées, remise min et max
SELECT
    COUNT(*) AS nb_lignes,
    COUNT(remise) AS nb_remises_renseignees,
    MIN(remise) AS remise_min,
    MAX(remise) AS remise_max
FROM lignes_vente;

-- Produits les plus vendus en quantité & comparaison des classements
WITH Quantites_Par_Produit AS (
    SELECT
        id_produit,
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT
    id_produit,
    quantite_totale,
    ROW_NUMBER() OVER (ORDER BY quantite_totale DESC, id_produit ASC) AS numero_ligne,
    RANK() OVER (ORDER BY quantite_totale DESC) AS rang_produit,
    DENSE_RANK() OVER (ORDER BY quantite_totale DESC) AS rang_dense
FROM Quantites_Par_Produit
ORDER BY numero_ligne;

-- Contribution au montant brut, part (%) et rang par produit
WITH Montants_Par_Produit AS (
    SELECT
        id_produit,
        SUM(quantite) AS quantite_totale,
        SUM(quantite * prix_unitaire) AS montant_brut
    FROM lignes_vente
    GROUP BY id_produit
)
SELECT
    id_produit,
    quantite_totale,
    montant_brut,
    RANK() OVER (ORDER BY montant_brut DESC) AS rang_montant,
    CAST(
        montant_brut * 100.0
        / NULLIF(SUM(montant_brut) OVER (), 0)
        AS DECIMAL(5, 2)
    ) AS part_montant_pct
FROM Montants_Par_Produit
ORDER BY rang_montant, id_produit;

-- Produits dont la quantité totale dépasse la moyenne des totaux par produit
WITH Quantites_Par_Produit AS (
    SELECT
        id_produit,
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
),
Moyenne_Des_Totaux AS (
    SELECT
        AVG(quantite_totale::NUMERIC) AS moyenne_par_produit
    FROM Quantites_Par_Produit
)
SELECT
    q.id_produit,
    q.quantite_totale,
    ROUND(m.moyenne_par_produit, 2) AS moyenne_par_produit
FROM Quantites_Par_Produit AS q
CROSS JOIN Moyenne_Des_Totaux AS m
WHERE q.quantite_totale > m.moyenne_par_produit
ORDER BY q.quantite_totale DESC;

-- Évolution mensuelle des ventes (LAG, variation, taux, cumul, moyenne mobile)
WITH Ventes_Mensuelles AS (
    SELECT
        EXTRACT(YEAR FROM v.date_vente)::INT AS annee,
        EXTRACT(MONTH FROM v.date_vente)::INT AS mois,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut
    FROM ventes AS v
    INNER JOIN lignes_vente AS lv
        ON lv.id_vente = v.id_vente
    WHERE v.date_vente IS NOT NULL
    GROUP BY
        EXTRACT(YEAR FROM v.date_vente),
        EXTRACT(MONTH FROM v.date_vente)
),
Calculs_Temporels AS (
    SELECT
        annee,
        mois,
        montant_brut,
        LAG(montant_brut) OVER (ORDER BY annee, mois) AS montant_precedent,
        SUM(montant_brut) OVER (
            ORDER BY annee, mois
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumul_montant_brut,
        AVG(montant_brut::NUMERIC) OVER (
            ORDER BY annee, mois
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moyenne_mobile_3_periodes
    FROM Ventes_Mensuelles
)
SELECT
    annee,
    mois,
    montant_brut,
    montant_precedent,
    montant_brut - montant_precedent AS variation_absolue,
    CAST(
        (montant_brut - montant_precedent) * 100.0
        / NULLIF(montant_precedent, 0)
        AS DECIMAL(10, 2)
    ) AS taux_evolution_pct,
    cumul_montant_brut,
    ROUND(moyenne_mobile_3_periodes, 2) AS moyenne_mobile_3_periodes
FROM Calculs_Temporels
ORDER BY annee, mois;

-- Activité par client (lignes, tickets distincts, produits distincts, montant brut)
WITH Par_Client AS (
    SELECT
        v.id_client,
        COUNT(*) AS nombre_lignes,
        COUNT(DISTINCT v.id_vente) AS nombre_ventes,
        COUNT(DISTINCT lv.id_produit) AS nombre_produits_distincts,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut
    FROM lignes_vente AS lv
    INNER JOIN ventes AS v
        ON v.id_vente = lv.id_vente
    GROUP BY v.id_client
)
SELECT
    id_client,
    nombre_lignes,
    nombre_ventes,
    nombre_produits_distincts,
    montant_brut,
    RANK() OVER (ORDER BY montant_brut DESC) AS rang_montant,
    ROUND(AVG(montant_brut::NUMERIC) OVER (), 2) AS montant_moyen_par_client
FROM Par_Client
ORDER BY rang_montant, id_client;

-- Performance par magasin, classement, écart à la moyenne et contrôle de jointure
SELECT COUNT(*) AS nb_lignes_avant_jointure FROM lignes_vente;

SELECT COUNT(*) AS nb_lignes_apres_jointure
FROM lignes_vente AS lv
INNER JOIN ventes AS v
    ON v.id_vente = lv.id_vente
INNER JOIN magasins AS m
    ON m.id_magasin = v.id_magasin;

WITH Par_Magasin AS (
    SELECT
        m.id_magasin,
        m.nom_magasin,
        COUNT(DISTINCT v.id_vente) AS nombre_ventes,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut
    FROM lignes_vente AS lv
    INNER JOIN ventes AS v
        ON v.id_vente = lv.id_vente
    INNER JOIN magasins AS m
        ON m.id_magasin = v.id_magasin
    GROUP BY m.id_magasin, m.nom_magasin
)
SELECT
    nom_magasin,
    nombre_ventes,
    montant_brut,
    RANK() OVER (ORDER BY montant_brut DESC) AS rang,
    ROUND(AVG(montant_brut::NUMERIC) OVER (), 2) AS moyenne_magasins,
    ROUND(
        montant_brut::NUMERIC - AVG(montant_brut::NUMERIC) OVER (),
        2
    ) AS ecart_a_la_moyenne
FROM Par_Magasin
ORDER BY rang, nom_magasin;

-- Diagnostic de cardinalité & multiplication par jointure avec emplacements
SELECT
    COUNT(*) AS nb_lignes_multipliees,
    SUM(lv.quantite) AS quantite_gonflee,
    SUM(lv.quantite * lv.prix_unitaire) AS montant_gonfle
FROM lignes_vente AS lv
INNER JOIN emplacements AS e
    ON e.id_produit = lv.id_produit;

SELECT
    id_produit,
    COUNT(*) AS nb_emplacements
FROM emplacements
GROUP BY id_produit
HAVING COUNT(*) > 1
ORDER BY id_produit;

SELECT
    p.id_produit,
    p.nom_produit
FROM produits AS p
LEFT JOIN lignes_vente AS lv
    ON lv.id_produit = p.id_produit
WHERE lv.id_ligne IS NULL
ORDER BY p.id_produit;