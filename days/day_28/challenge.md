# 🎯 Challenge - Jour 28 : Consolidation et Grand Challenge Analytique

## Objectifs
- Combiner CTE (`WITH`), jointures (`INNER JOIN` / `LEFT JOIN`) et fonctions de fenêtrage (`DENSE_RANK()`, `RANK()`, `PARTITION BY`, `LAG()`) dans une analyse structurée.
- Inspecter le schéma et les relations de `RetailPlus` avant d'utiliser les colonnes descriptives (`produits`, `categories`) ou temporelles (`ventes.date_vente`).
- Contrôler la granularité et la cardinalité des jointures (prévention des multiplications liées à `emplacements` ou aux relations 1-N).
- Formuler une conclusion métier nuancée en distinguant volume vendu, valeur brute et limites des données.

## Exercices & Grand Challenge
1. **Exercice 1 (Quantités par produit) :** Calculer `SUM(quantite)` par `id_produit` dans `lignes_vente`.
2. **Exercice 2 (Classement global) :** Classer les produits par quantité décroissante avec `DENSE_RANK()`.
3. **Exercice 3 (Classement par catégorie) :** Joindre `produits` et `categories` après vérification des clés, puis calculer `DENSE_RANK() OVER (PARTITION BY ... ORDER BY quantite_totale DESC)`.
4. **Grand Challenge & Mini-cas :** Produire le classement global et intra-catégorie, vérifier l'absence de multiplication des quantités, ajouter une comparaison temporelle avec `LAG()` si la date est confirmée, et rédiger trois observations métier avec leurs limites.