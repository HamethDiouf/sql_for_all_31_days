# 🎯 Challenge - Jour 24 : `ROW_NUMBER()`, `RANK()` et DENSE_RANK()

## Objectifs
- Maîtriser les trois fonctions de classement en fenêtrage : `ROW_NUMBER()`, `RANK()` et `DENSE_RANK()`.
- Comprendre précisément le traitement des ex æquo et l'impact sur les sauts de rang.
- Appliquer un classement par groupe à l'aide de la clause `PARTITION BY`.
- Filtrer un classement (ex: Top 3) en combinant les fonctions de fenêtrage avec une CTE.
- Éviter les pièges classiques (absence de départage déterministe, filtrage direct dans le `WHERE`).

## Exercices Pratiques (RetailPlus)
1. **Exercice 1 :** Attribuer un numéro séquentiel unique à chaque produit selon sa quantité totale vendue en utilisant `ROW_NUMBER()` avec un critère de départage déterministe (`id_produit ASC`).
2. **Exercice 2 :** Refaire le classement en utilisant `RANK()` pour observer la gestion des ex æquo et les rangs sautés.
3. **Exercice 3 :** Comparer les trois fonctions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`) côte à côte dans une même requête sur les ventes globales de produits.
4. **Exercice 4 :** Filtrer le Top 3 des produits les plus vendus en encapsulant le classement dans une CTE.
5. **Exercice 5 :** Classer et extraire les 3 premiers produits de chaque catégorie en utilisant `PARTITION BY` et une CTE.