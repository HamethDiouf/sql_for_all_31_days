# Day 07 - Consolidation & Challenge pratique (Semaine 1)

## Objectif

Journée de bilan et de consolidation (Jours 1 à 6). Pas de nouvelles notions, ni de jointures : uniquement les filtres, tris, alias, calculs, `CAST`, `COALESCE` et `LIMIT`.

---

## Les 10 Demandes du Challenge Métier (Partie 3)

1. **Les 10 produits les plus chers** du catalogue (nom et prix, du plus cher au moins cher).
2. **Les produits dont le prix est compris entre 2 € et 5 €** (classés du moins cher au plus cher).
3. **Les produits des catégories n°3 ou n°4 dont la marque est connue** (classés par ordre alphabétique).
4. **Les clients qui habitent à Paris** (prénom, nom, âge, du plus âgé au plus jeune).
5. **Les clients n'ayant pas renseigné leur email** (prénom, nom, ville).
6. **Les produits contenant le mot "chocolat"** dans leur nom (nom et prix, du plus cher au moins cher).
7. **Les 5 lignes de vente ayant la quantité la plus élevée** (`id_ligne`, `id_produit`, `quantite`, triées de la plus grande à la plus petite).
8. **Le montant total de chaque ligne de vente** (`id_ligne`, `quantite`, `prix_unitaire`, calcul du montant, et affichage de la remise sécurisée par `COALESCE`).
9. **Les lignes de vente des produits n°6 et n°7** (`id_ligne`, `id_vente`, `id_produit`, `quantite`, `prix_unitaire`).
10. **Le top 3 des lignes de vente dont le montant arrondi à 2 décimales est le plus élevé** (`id_ligne`, `id_produit`, `montant_total` avec `CAST` et `DECIMAL(10,2)`).