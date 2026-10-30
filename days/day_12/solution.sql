-- ==========================================
-- Day 12 - RIGHT JOIN & FULL OUTER JOIN (PostgreSQL)
-- Fichier de correction des exercices et du challenge final
-- ==========================================

-- Réécriture d'un RIGHT JOIN en LEFT JOIN (Ventes et Produits)
-- Utilisation de la table lignes_vente pour relier produits et ventes
SELECT 
    p.id_produit,
    p.nom_produit,
    lv.id_vente,
    lv.quantite
FROM produits AS p
LEFT JOIN lignes_vente AS lv
    ON p.id_produit = lv.id_produit
ORDER BY lv.id_vente;

-- Repérer les magasins sans emplacement (Magasins sans correspondance à droite)
SELECT 
    m.id_magasin,
    m.nom_magasin
FROM magasins AS m
LEFT JOIN emplacements AS e
    ON m.id_magasin = e.id_magasin
WHERE e.id_emplacement IS NULL;


-- Repérer les emplacements sans magasin correspondant (Emplacements orphelins)
SELECT 
    e.id_emplacement,
    e.id_magasin
FROM emplacements AS e
LEFT JOIN magasins AS m
    ON e.id_magasin = m.id_magasin
WHERE m.id_magasin IS NULL;


-- 4. Challenge Métier Final : Audit complet entre magasins et inventaire_import (FULL OUTER JOIN)
-- (La table inventaire_import sert de table d'export de travail pour l'audit)
/*
CREATE TABLE inventaire_import (
    id_magasin INT,
    site TEXT
);
*/

SELECT 
    m.id_magasin,
    m.nom_magasin,
    i.id_magasin AS id_export,
    i.site,
    CASE 
        WHEN m.id_magasin IS NULL THEN 'Uniquement export'
        WHEN i.id_magasin IS NULL THEN 'Uniquement référentiel'
        ELSE 'Correspondance'
    END AS statut
FROM magasins AS m
FULL OUTER JOIN inventaire_import AS i
    ON m.id_magasin = i.id_magasin
ORDER BY COALESCE(m.id_magasin, i.id_magasin);