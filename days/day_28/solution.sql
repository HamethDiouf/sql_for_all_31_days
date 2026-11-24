-- ==========================================
-- Jour 28 : Consolidation et Grand Challenge Analytique
-- Schéma : SQL_FOR_ALL_RetailPlus (PostgreSQL)
-- ==========================================

-- Inspection du schéma avant toute jointure ou utilisation de colonnes descriptives/temporelles
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'clients',
    'magasins',
    'categories',
    'produits',
    'emplacements',
    'ventes',
    'lignes_vente'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- Contrôle de cardinalité sur emplacements (prévention des jointures N-N / multiplicatrices)
SELECT
    id_produit,
    COUNT(*) AS nombre_emplacements
FROM emplacements
GROUP BY id_produit
HAVING COUNT(*) > 1
ORDER BY id_produit;

-- Quantités totales par produit et classement global (DENSE_RANK)
WITH QuantitesParProduit AS (
    SELECT
        id_produit,
        SUM(quantite) AS quantite_totale
    FROM lignes_vente
    GROUP BY id_produit
),
ClassementGlobal AS (
    SELECT
        id_produit,
        quantite_totale,
        RANK() OVER (ORDER BY quantite_totale DESC) AS rang_global,
        DENSE_RANK() OVER (ORDER BY quantite_totale DESC) AS dense_rang_global
    FROM QuantitesParProduit
)
SELECT
    id_produit,
    quantite_totale,
    rang_global,
    dense_rang_global
FROM ClassementGlobal
ORDER BY dense_rang_global, id_produit;

-- Grand Challenge : Classement global et classement dans chaque catégorie
WITH QuantitesParProduit AS (
    SELECT
        lv.id_produit,
        SUM(lv.quantite) AS quantite_totale,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut_indicatif
    FROM lignes_vente AS lv
    GROUP BY lv.id_produit
),
ProduitsEnrichis AS (
    SELECT
        q.id_produit,
        p.nom_produit,
        COALESCE(c.nom_categorie, 'Sans catégorie') AS nom_categorie,
        q.quantite_totale,
        q.montant_brut_indicatif
    FROM QuantitesParProduit AS q
    INNER JOIN produits AS p
        ON p.id_produit = q.id_produit
    LEFT JOIN categories AS c
        ON c.id_categorie = p.id_categorie
)
SELECT
    id_produit,
    nom_produit,
    nom_categorie,
    quantite_totale,
    DENSE_RANK() OVER (ORDER BY quantite_totale DESC) AS rang_global_dense,
    DENSE_RANK() OVER (
        PARTITION BY nom_categorie
        ORDER BY quantite_totale DESC
    ) AS rang_dans_categorie,
    montant_brut_indicatif
FROM ProduitsEnrichis
ORDER BY rang_global_dense, nom_categorie, rang_dans_categorie, id_produit;

-- Variante temporelle (si date_vente et id_vente sont confirmés) : évolution mensuelle avec LAG()
WITH VentesParMois AS (
    SELECT
        DATE_TRUNC('month', v.date_vente)::DATE AS mois,
        SUM(lv.quantite) AS quantite_totale,
        SUM(lv.quantite * lv.prix_unitaire) AS montant_brut_indicatif
    FROM ventes AS v
    INNER JOIN lignes_vente AS lv
        ON lv.id_vente = v.id_vente
    WHERE v.date_vente IS NOT NULL
    GROUP BY DATE_TRUNC('month', v.date_vente)::DATE
),
ComparaisonTemporelle AS (
    SELECT
        mois,
        quantite_totale,
        montant_brut_indicatif,
        LAG(quantite_totale) OVER (ORDER BY mois) AS quantite_mois_precedent,
        LAG(montant_brut_indicatif) OVER (ORDER BY mois) AS montant_mois_precedent
    FROM VentesParMois
)
SELECT
    mois,
    quantite_totale,
    quantite_mois_precedent,
    quantite_totale - quantite_mois_precedent AS ecart_quantite,
    montant_brut_indicatif,
    montant_mois_precedent,
    montant_brut_indicatif - montant_mois_precedent AS ecart_montant_brut
FROM ComparaisonTemporelle
ORDER BY mois;