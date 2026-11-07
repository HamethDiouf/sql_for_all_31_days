# Day 17 - HAVING : Filtrer les groupes et distinguer WHERE de HAVING (Semaine 3)

## Objectif

Savoir choisir le bon niveau de filtrage dans une requête SQL : utiliser `WHERE` pour filtrer les **lignes individuelles** *avant* le regroupement, et utiliser `HAVING` pour filtrer les **groupes** *après* le calcul des fonctions d'agrégation (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).

---

## Les Notions Clés du Jour

- **`WHERE` vs `HAVING`** :
  - `WHERE` s'applique **avant** `GROUP BY`. Il filtre directement les lignes sources. Il ne peut pas contenir de fonctions d'agrégation.
  - `HAVING` s'applique **après** `GROUP BY`. Il filtre les groupes formés à partir des résultats des fonctions d'agrégation.
- **L'ordre d'exécution logique de SQL** : 
  `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `ORDER BY`
- **Utilisation des fonctions d'agrégation dans `HAVING`** : Permet de ne conserver que les groupes qui respectent un seuil (ex: `HAVING COUNT(*) > 2`, `HAVING SUM(quantite) > 5`).
- **Attention aux alias** : Les alias définis dans le `SELECT` (ex: `AS nombre_lignes`) ne peuvent pas être utilisés directement dans le `HAVING` car le `SELECT` est exécuté après. Il faut répéter l'expression d'agrégation complète.

---

## Exercices Pratiques

À partir de la table `lignes_vente` de votre base RetailPlus :
1. **Comptage par produit** : Regroupez par produit et comptez le nombre de lignes (`nombre_lignes`).
2. **Filtrage des groupes** : Reprenez la requête précédente et n'affichez que les produits dont le nombre de lignes dépasse 2 (`HAVING COUNT(*) > 2`).
3. **Filtre amont (`WHERE`)** : Calculez le nombre de lignes par produit en ne conservant au préalable que les lignes dont la quantité est supérieure ou égale à 2 (`WHERE quantite >= 2`).
4. **Combinaison `WHERE` et `HAVING`** : Parmi les lignes dont la quantité est $\ge 2$, affichez uniquement les produits qui possèdent au moins 2 lignes restantes (`WHERE quantite >= 2` + `GROUP BY` + `HAVING COUNT(*) >= 2`).
5. **Filtrage sur une somme** : Affichez les produits dont la quantité totale vendue dépasse 5 unités (`HAVING SUM(quantite) > 5`).