# Day 10 - LEFT JOIN & Gestion des Absences (Semaine 2)

## Objectif

Comprendre comment conserver **intégralement** la table de gauche lors d'une jointure, même lorsqu'aucune correspondance n'existe dans la table de droite, et utiliser les `NULL` générés pour repérer les absences (clients sans vente, produits jamais vendus, magasins sans activité).

---

## Les Notions Clés du Jour

- **`LEFT JOIN`** : Conserve toutes les lignes de la table de gauche (placée après `FROM`). Si aucune correspondance n'existe à droite, les colonnes de droite affichent `NULL`.
- **Repérage des absences** : Combiner un `LEFT JOIN` avec un filtre `WHERE clé_primaire_droite IS NULL` pour isoler les lignes orphelines.
- **Piège du `WHERE` vs `ON`** : Mettre un filtre métier dans le `WHERE` après un `LEFT JOIN` annule son effet et transforme la jointure en `INNER JOIN`. Préférer placer les conditions restrictives dans le `ON` si l'on souhaite conserver la table de gauche intacte.
- **Granularité** : Un `LEFT JOIN` peut multiplier les lignes si la table de droite possède une relation `1 → N` (ex: un client ayant plusieurs ventes apparaît plusieurs fois).

---

## Exercices et Mini Challenge (Parties 10 et 11)

À partir des tables RetailPlus, écrivez les requêtes SQL correspondantes :

1. **Affiche tous les clients avec leur numéro de vente lorsqu'il existe** (`clients` LEFT JOIN `ventes`).
2. **Affiche tous les produits du catalogue et les lignes de vente correspondantes** (`produits` LEFT JOIN `lignes_vente`).
3. **Affiche tous les magasins et leurs ventes éventuelles** (`magasins` LEFT JOIN `ventes`).
4. **Repérer les clients inactifs** : Affiche uniquement les clients qui n'ont effectué aucune vente (utilisez `v.id_vente IS NULL`).
5. **Repérer les produits non vendus** : Affiche les produits qui n'apparaissent dans aucune ligne de vente (utilisez `lv.id_ligne IS NULL`).
6. **Repérer les magasins inactifs** : Affiche les magasins sans vente enregistrée.
7. **Filtrage avancé (Cas 12)** : Propose une requête qui conserve tous les clients mais n'associe que les ventes payées par carte (filtre placé dans le `ON`).