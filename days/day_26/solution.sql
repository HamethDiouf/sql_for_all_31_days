-- ==========================================
-- Jour 26 : LAG(), LEAD(), sommes cumulées et moyennes mobiles
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Inspection préalable du schéma (vérifier la colonne date dans ventes)
SELECT
    TABLE_NAME, 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('ventes', 'lignes_vente')
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- Exemple de base : LAG(), LEAD(), cumul et moyenne mobile sur une série mensuelle agrégée
-- (Adapter v.date_vente selon le nom réel de la colonne date dans la table ventes)
WITH Ventes_Mensuelles AS (
    SELECT
        EXTRACT(YEAR FROM v.date_vente)::INT AS annee,
        EXTRACT(MONTH FROM v.date_vente)::INT AS mois,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut
    FROM ventes AS v
    INNER JOIN lignes_vente AS lv
        ON lv.id_vente = v.id_vente
    GROUP BY
        EXTRACT(YEAR FROM v.date_vente),
        EXTRACT(MONTH FROM v.date_vente)
),
Calculs_Temporels AS (
    SELECT
        annee,
        mois,
        montant_brut,
        LAG(montant_brut) OVER (
            ORDER BY annee, mois
        ) AS montant_precedent,
        LEAD(montant_brut) OVER (
            ORDER BY annee, mois
        ) AS montant_suivant,
        SUM(montant_brut) OVER (
            PARTITION BY annee
            ORDER BY annee, mois
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumul_annuel,
        ROUND(AVG(CAST(montant_brut AS DECIMAL(18, 2))) OVER (
            ORDER BY annee, mois
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2) AS moyenne_mobile_3_periodes
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
    montant_suivant,
    cumul_annuel,
    moyenne_mobile_3_periodes
FROM Calculs_Temporels
ORDER BY annee, mois;

-- Moyenne mobile uniquement sur les fenêtres complètes de 3 observations
WITH Ventes_Mensuelles AS (
    SELECT
        EXTRACT(YEAR FROM v.date_vente)::INT AS annee,
        EXTRACT(MONTH FROM v.date_vente)::INT AS mois,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut
    FROM ventes AS v
    INNER JOIN lignes_vente AS lv
        ON lv.id_vente = v.id_vente
    GROUP BY
        EXTRACT(YEAR FROM v.date_vente),
        EXTRACT(MONTH FROM v.date_vente)
),
Avec_Fenetre AS (
    SELECT
        annee,
        mois,
        montant_brut,
        ROUND(AVG(CAST(montant_brut AS DECIMAL(18, 2))) OVER (
            ORDER BY annee, mois
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2) AS moyenne_mobile_3,
        COUNT(*) OVER (
            ORDER BY annee, mois
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS nb_observations
    FROM Ventes_Mensuelles
)
SELECT
    annee,
    mois,
    montant_brut,
    moyenne_mobile_3
FROM Avec_Fenetre
WHERE nb_observations = 3
ORDER BY annee, mois;