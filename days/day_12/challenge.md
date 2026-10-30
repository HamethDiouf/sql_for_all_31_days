# Day 12 - RIGHT JOIN & FULL OUTER JOIN (Semaine 2)

## Objectif

Maîtriser les jointures externes complémentaires (`RIGHT JOIN` et `FULL OUTER JOIN`) pour conserver les lignes de la table de droite ou des deux tables simultanément, et exploiter les `NULL` générés pour repérer les écarts, les orphelins et les absences.

---

## Les Notions Clés du Jour

- **`RIGHT JOIN`** : Conserve toutes les lignes de la table de droite (placée après `RIGHT JOIN`). Les colonnes de la table de gauche affichent `NULL` s'il n'y a pas de correspondance.
- **Équivalence `RIGHT` / `LEFT`** : Tout `RIGHT JOIN` peut se réécrire facilement en `LEFT JOIN` en inversant simplement l'ordre des tables dans la requête (placer la table à conserver après `FROM`).
- **`FULL OUTER JOIN`** : Conserve toutes les lignes des deux tables, qu'elles trouvent une correspondance ou non des deux côtés.
- **Audit des écarts (Cas pratiques)** : Utiliser `FULL OUTER JOIN` combiné avec `COALESCE` ou un `CASE WHEN` pour classifier les lignes (Correspondance, Uniquement référentiel, Uniquement export).
- **Piège `ON` vs `WHERE`** : Dans une jointure externe, placer un filtre sur la table de droite dans le `WHERE` peut supprimer l'effet de la jointure externe et transformer le résultat. Préférer le placer dans le `ON` ou utiliser `IS NULL` pour l'audit des absences.

---

## Exercices et Challenge Métier Final (Parties 9 et 11)

À partir des notions du jour, écrivez les requêtes SQL correspondantes :

1. **Réécriture** : Réécrivez en `LEFT JOIN` la requête qui conserve toutes les ventes, même lorsqu'un produit correspondant est absent du catalogue.
2. **Magasins sans emplacement** : Écrivez une requête affichant les magasins qui n'ont aucun emplacement enregistré (`magasins` + `emplacements` avec `LEFT JOIN` et test de `IS NULL`).
3. **Emplacements orphelins** : Repérez les emplacements dont l'identifiant magasin ne correspond à aucun magasin existant dans la table `magasins`.
4. **Challenge Métier Final (Audit RetailPlus)** : Comparez le référentiel `magasins` avec une table de travail `inventaire_import` (contenant `id_magasin` et `site`) en utilisant un `FULL OUTER JOIN` et un `CASE WHEN` pour classifier chaque ligne en trois catégories : *Correspondance*, *Uniquement référentiel*, ou *Uniquement export*.