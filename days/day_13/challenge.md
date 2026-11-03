# Day 13 - Doublons, cardinalité et erreurs de JOIN (Semaine 3)

## Objectif

Diagnostiquer les jointures qui multiplient ou perdent des lignes, comprendre l'impact des cardinalités (relations 1-N, N-M) sur les agrégats (`SUM`, `COUNT`), et appliquer une méthodologie rigoureuse de contrôle avant de valider une requête SQL (sans utiliser `DISTINCT` par réflexe).

---

## Les Notions Clés du Jour

- **Répétition vs Doublon** : Une ligne qui se répète n'est pas forcément une erreur. Si l'on joint `ventes` et `lignes_vente`, voir le même `id_vente` plusieurs fois est tout à fait normal (granularité de la ligne de détail).
- **Piège de la multiplication des lignes** : Joindre une table comportant des relations plusieurs-à-plusieurs (comme `emplacements` sur un couple `id_magasin` / `id_produit`) peut dupliquer des lignes de vente et fausser totalement les calculs d'agrégation comme `SUM()`.
- **Boîte à outils de diagnostic** : 
  - `COUNT(*)` & `COUNT(DISTINCT ...)` pour comparer les volumes.
  - `GROUP BY` + `HAVING COUNT(*) > 1` pour repérer les clés qui se répètent ou les doublons potentiels.
  - `CASE WHEN` pour quantifier des cas particuliers.
  - `WITH` (CTE) pour structurer des étapes de diagnostic complexes.

---

## Exercices et Mini-Défi (Parties 8 et 10)

À partir des tables RetailPlus, écrivez ou analysez les requêtes SQL correspondantes :

1. **Granularité** : Écrivez une requête affichant `v.id_vente`, `lv.id_ligne` et `lv.id_produit`. Expliquez ce que représente une ligne du résultat.
2. **Clé unique** : Recherchez les `id_vente` répétés dans la table `ventes` en utilisant `GROUP BY` et `HAVING`. Pourquoi le résultat attendu est-il vide ?
3. **Références orphelines** : Utilisez un `LEFT JOIN` entre `lignes_vente` et `produits` pour détecter les `id_produit` dans les lignes de vente qui n'ont aucune correspondance dans le catalogue produits (`p.id_produit IS NULL`).
4. **Mini-défi (Diagnostic du CA suspect)** : Analysez pourquoi l'ajout de la table `emplacements` dans le calcul du chiffre d'affaires par magasin fait exploser les montants (`SUM`), écrivez le contrôle de cardinalité sur les emplacements, puis proposez la requête corrigée.