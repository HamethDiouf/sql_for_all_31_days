-- ============================================================================
-- JOUR 31 - PHASES 5 & 6 : ANALYSE CLIENT PROGRESSIVE & VALIDATION
-- ============================================================================

-- Etape A & B : Agregation par vente puis par client (grain : 1 client par ligne)
WITH montants_par_vente AS (
    SELECT
        lv.id_vente,
        SUM(lv.quantite) AS quantite_vente,
        SUM(lv.quantite * lv.prix_unitaire) AS ca_brut_vente
    FROM lignes_vente AS lv
    GROUP BY lv.id_vente
),
synthese_par_client AS (
    SELECT
        c.id_client,
        c.email,
        COUNT(DISTINCT v.id_vente) AS nb_ventes,
        COALESCE(SUM(mv.quantite_vente), 0) AS quantite_totale,
        COALESCE(SUM(mv.ca_brut_vente), 0) AS ca_brut_client
    FROM clients AS c
    LEFT JOIN ventes AS v
        ON c.id_client = v.id_client
    LEFT JOIN montants_par_vente AS mv
        ON v.id_vente = mv.id_vente
    GROUP BY c.id_client, c.email
),
classement_et_segments AS (
    SELECT
        id_client,
        email,
        nb_ventes,
        quantite_totale,
        ca_brut_client,
        CASE
            WHEN SUM(ca_brut_client) OVER () > 0
                THEN ROUND((ca_brut_client / SUM(ca_brut_client) OVER ()) * 100, 2)
            ELSE 0
        END AS part_ca_pct,
        DENSE_RANK() OVER (ORDER BY ca_brut_client DESC) AS rang_ca,
        CASE
            WHEN nb_ventes = 0 THEN 'Sans achat / Inactif'
            WHEN nb_ventes >= 3 AND ca_brut_client >= AVG(NULLIF(ca_brut_client, 0)) FILTER (WHERE nb_ventes > 0) OVER ()
                THEN 'Client fidele a forte valeur'
            WHEN nb_ventes >= 3 THEN 'Client fidele'
            ELSE 'Client occasionnel'
        END AS segment_client
    FROM synthese_par_client
)
-- Etape C & D : Restitution client triee par CA decroissant
SELECT
    rang_ca,
    id_client,
    email,
    nb_ventes,
    quantite_totale,
    ca_brut_client,
    part_ca_pct,
    segment_client
FROM classement_et_segments
ORDER BY ca_brut_client DESC, id_client ASC;

-- Phase 6 : Verification de reconciliation (somme des CA clients vs total global)
WITH ca_clients AS (
    SELECT
        c.id_client,
        COALESCE(SUM(lv.quantite * lv.prix_unitaire), 0) AS ca_brut
    FROM clients AS c
    LEFT JOIN ventes AS v ON c.id_client = v.id_client
    LEFT JOIN lignes_vente AS lv ON v.id_vente = lv.id_vente
    GROUP BY c.id_client
)
SELECT
    (SELECT SUM(ca_brut) FROM ca_clients) AS somme_ca_par_client,
    (SELECT SUM(quantite * prix_unitaire) FROM lignes_vente) AS ca_brut_lignes_vente;