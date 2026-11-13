# 🎯 Challenge - Jour 22 : Introduction aux Sous-requêtes

## Objectifs
- Apprendre à imbriquer des requêtes pour résoudre des besoins métier en plusieurs étapes (calculer d'abord une métrique, puis l'utiliser pour filtrer).
- Maîtriser l'utilisation des sous-requêtes scalaires dans la clause `WHERE`.
- Utiliser les opérateurs d'appartenance et d'existence (`IN`, `NOT IN`, `EXISTS`, `NOT EXISTS`).
- Construire et exploiter des tables dérivées dans la clause `FROM`.

## Exercices Pratiques (RetailPlus)
1. **Exercice 1 :** Identifier les lignes de vente dont la quantité dépasse la quantité moyenne par ligne.
2. **Exercice 2 :** Lister les produits qui ont été vendus au moins une fois en comparant les versions `IN` et `EXISTS`.
3. **Exercice 3 :** Trouver les lignes de vente dont le montant brut dépasse le montant brut moyen par ligne.
4. **Exercice 4 :** Extraire les 3 produits les plus vendus en quantité totale parmi ceux dont le total dépasse 5 unités, en utilisant une table dérivée dans `FROM`.
5. **Exercice 5 :** Identifier les produits jamais vendus en utilisant `NOT EXISTS` pour éviter les pièges liés aux valeurs `NULL`.