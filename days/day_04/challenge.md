# Day 04 - Filtres avancés : IN, BETWEEN, LIKE et NULL

## Objectif

Découvrir et maîtriser les filtres avancés en SQL pour affiner les sélections : rechercher dans une liste (`IN`), dans une plage de valeurs ou de dates (`BETWEEN`), selon un motif de texte (`LIKE`), et gérer les valeurs manquantes (`IS NULL`).

---

## Étape 1 : Rechercher plusieurs valeurs avec `IN`

À partir de la table `clients` ou `produits` de RetailPlus :
- Afficher les clients qui habitent à Marseille ou à Lille en utilisant l'opérateur `IN`.
- Afficher les produits des catégories `Laitier` ou `Fruits`.

Questions :
- Pourquoi `IN` est-il plus lisible qu'une suite de `OR` ?

---

## Étape 2 : Filtrer une plage de valeurs avec `BETWEEN`

- Afficher les clients dont l'âge est entre 30 et 40 ans (bornes incluses).
- Afficher les produits dont le prix est compris entre 2 et 3 €.
- Afficher les ventes réalisées pendant le mois de février 2026.

Questions :
- Les bornes (début et fin) sont-elles incluses dans le résultat ?

---

## Étape 3 : Rechercher selon un motif de texte avec `LIKE`

Utiliser les jokers `%` (plusieurs caractères) et `_` (un seul caractère) :
- Afficher les clients dont le nom commence par la lettre 'A' (`LIKE 'A%'`).
- Afficher les produits dont le nom contient le mot « chocolat » (`LIKE '%chocolat%'`).
- Afficher les produits dont le nom se termine par `500g` (`LIKE '%500g'`).
- Afficher les clients dont la deuxième lettre du nom est un 'a' (`LIKE '_a%'`).

---

## Étape 4 : Gérer les valeurs manquantes avec `IS NULL`

- Afficher les clients dont l'email est manquant.
- Afficher les produits dont la marque **est** renseignée (`IS NOT NULL`).

Questions :
- Pourquoi ne peut-on pas écrire `WHERE email = NULL` ?

---

## Étape 5 : Combiner les filtres avancés

- Afficher les produits des catégories `Boissons` ou `Épicerie` dont le prix est compris entre 1 et 2 €.
- Afficher les clients de Paris, Lyon ou Lille, âgés de 25 à 40 ans, et dont l'email est renseigné.

---

## À retenir

- `IN (valeur1, valeur2)` : remplace un `OR` multiple pour tester l'appartenance à une liste.
- `BETWEEN a AND b` : filtre une plage (nombres ou dates), bornes incluses.
- `LIKE` : recherche un motif textuel grâce aux jokers `%` (zéro ou plusieurs caractères) et `_` (un caractère exact).
- `IS NULL` / `IS NOT NULL` : indispensable pour tester les valeurs absentes (« inconnues »), car `=` ne fonctionne pas sur `NULL`.

## Validation

Avant de passer au Jour 5, assure-toi de pouvoir :
- [ ] Utiliser `IN` pour filtrer sur plusieurs valeurs.
- [ ] Filtrer une plage numérique ou temporelle avec `BETWEEN`.
- [ ] Rechercher du texte partiel avec `LIKE` et ses jokers.
- [ ] Identifier correctement les données absentes avec `IS NULL`.
- [ ] Combiner ces opérateurs avec `AND`, `OR` et `NOT`.