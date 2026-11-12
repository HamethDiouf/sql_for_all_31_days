-- ==========================================
-- Jour 20 : CASE WHEN et Segmentation
-- Schéma : RetailPlus (PostgreSQL)
-- ==========================================

-- Segmenter chaque ligne de vente (avec gestion des NULL)
SELECT 
    id_ligne,
    quantite,
    prix_unitaire,
    quantite * prix_unitaire AS montant_brut,
    CASE 
        WHEN quantite IS NULL OR prix_unitaire IS NULL THEN 'Non classe'
        WHEN quantite * prix_unitaire < 100 THEN 'Faible'
        WHEN quantite * prix_unitaire < 500 THEN 'Moyen'
        ELSE 'Eleve'
    END AS segment_vente
FROM lignes_vente;

-- Compter et sommer par segment (via sous-requête et tri métier)
SELECT 
    segment_vente,
    COUNT(*) AS nombre_lignes,
    SUM(montant_brut) AS montant_brut_total
FROM (
    SELECT 
        quantite * prix_unitaire AS montant_brut,
        CASE 
            WHEN quantite IS NULL OR prix_unitaire IS NULL THEN 'Non classe'
            WHEN quantite * prix_unitaire < 100 THEN 'Faible'
            WHEN quantite * prix_unitaire < 500 THEN 'Moyen'
            ELSE 'Eleve'
        END AS segment_vente
    FROM lignes_vente
) AS ventes_segmentees
GROUP BY segment_vente
ORDER BY 
    CASE segment_vente
        WHEN 'Faible' THEN 1
        WHEN 'Moyen' THEN 2
        WHEN 'Eleve' THEN 3
        ELSE 4
    END;

-- Indicateurs conditionnels multiples (lignes et montants)
SELECT 
    SUM(CASE WHEN quantite * prix_unitaire < 100 THEN 1 ELSE 0 END) AS nb_faibles,
    SUM(CASE WHEN quantite * prix_unitaire >= 100 AND quantite * prix_unitaire < 500 THEN 1 ELSE 0 END) AS nb_moyennes,
    SUM(CASE WHEN quantite * prix_unitaire >= 500 THEN 1 ELSE 0 END) AS nb_elevees,
    SUM(CASE WHEN quantite * prix_unitaire >= 500 THEN quantite * prix_unitaire ELSE 0 END) AS montant_elevees
FROM lignes_vente;

-- Segmenter les commandes globales (agrégation par id_vente)
SELECT 
    id_vente,
    SUM(quantite * prix_unitaire) AS montant_commande,
    CASE 
        WHEN SUM(quantite * prix_unitaire) < 100 THEN 'Faible'
        WHEN SUM(quantite * prix_unitaire) < 500 THEN 'Moyenne'
        ELSE 'Elevee'
    END AS segment_commande
FROM lignes_vente
GROUP BY id_vente;