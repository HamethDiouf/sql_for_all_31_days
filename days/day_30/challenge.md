# 🎯 Challenge - Jour 30 : Performance SQL — Index, plans d'exécution et optimisation

## Objectifs
- Comprendre pourquoi deux requêtes équivalentes peuvent avoir des coûts et temps d'exécution très différents (sargabilité, types/conversions, volume, sélection des colonnes).
- Distinguer `Index Seek`, `Index Scan` / `Table Scan`, index *clustered* vs *nonclustered*, index couvrant (`INCLUDE`) et coût de maintenance des index en écriture.
- Lire un plan d'exécution, surveiller les opérations coûteuses et comparer les versions avec des mesures objectives et une preuve d'égalité des résultats (`EXCEPT` + totaux/comptages).
- Appliquer les règles de prudence : travailler sur une table/base de test (`perf_...`) et ne jamais modifier les index de production sans test, mesure et validation.

## Étapes & Exercices Pratiques
1. **Écriture sargable & propreté :** Réécrire les filtres et jointures pour éviter fonctions sur colonne filtrée, conversions implicites, `SELECT *` inutile et `DISTINCT` cache-misère.
2. **Banc d'essai volumétrique (`perf_lignes_vente`) :** Créer une table de test isolée de 1 000 000 de lignes, exécuter une requête par `id_produit`, observer le plan et les lectures/temps.
3. **Comparaison avant / après index :** Tester sans index, avec index simple sur `id_produit`, puis avec index couvrant (`INCLUDE (quantite, prix_unitaire)`), ainsi qu'un filtre peu sélectif (`BETWEEN 1 AND 450`), vérifier l'identité des résultats et nettoyer `perf_lignes_vente`.