# Day 05 - ORDER BY et LIMIT : trier et classer les résultats

## Objectif

Apprendre à trier les résultats d'une requête SQL par ordre croissant ou décroissant avec `ORDER BY`, multi-trier sur plusieurs colonnes, et isoler les meilleurs résultats avec `LIMIT` (l'équivalent de `TOP` dans PostgreSQL).

---

## Étape 1 : Trier les résultats avec `ORDER BY`

À partir de la table `produits` de RetailPlus :
- Afficher tous les produits avec leur prix, triés du moins cher au plus cher (`ASC` par défaut).
- Afficher les mêmes produits triés du plus cher au moins cher en utilisant `DESC`.

Questions :
- Que se passe-t-il si l'on omet `ORDER BY` ? L'ordre des lignes est-il garanti par SQL ?

---

## Étape 2 : Trier du texte et des dates

- Afficher les clients triés par nom dans l'ordre alphabétique (`ASC`).
- Afficher les ventes de la table `ventes` de la plus récente à la plus ancienne (`ORDER BY date_vente DESC`).

---

## Étape 3 : Trier sur plusieurs colonnes

- Afficher les clients triés d'abord par `ville` (de A à Z), puis pour une même ville, du plus âgé au plus jeune (`age DESC`).

Question :
- Quel est le rôle de la deuxième colonne dans un tri multiple ?

---

## Étape 4 : Combiner `WHERE` et `ORDER BY`

Le responsable souhaite analyser une catégorie spécifique :
- Afficher les produits de la catégorie `Boissons`, classés du plus cher au moins cher.

Rappel de l'ordre d'écriture : `SELECT` -> `FROM` -> `WHERE` -> `ORDER BY`.

---

## Étape 5 : Isoler un Top N avec `LIMIT` (Spécifique PostgreSQL)

Dans PostgreSQL, la clause `LIMIT` placée **tout à la fin** de la requête permet de limiter l'affichage aux $n$ premières lignes :
- Afficher les **5 produits les plus chers** du catalogue (`... ORDER BY prix DESC LIMIT 5`).
- Afficher les **3 magasins ayant la plus grande surface** (`surface DESC LIMIT 3`).

Questions :
- Pourquoi l'utilisation de `LIMIT` sans `ORDER BY` est-elle une erreur de logique métier ?

---

## Étape 6 : Combiner `WHERE`, `ORDER BY` et `LIMIT`

- Parmi les produits dont la marque est renseignée, afficher les **3 plus chers**.

---

## À retenir

- `ORDER BY` permet de trier les lignes. Par défaut, le tri est croissant (`ASC`). On utilise `DESC` pour un tri décroissant.
- `ORDER BY a, b` trie d'abord par `a`, puis utilise `b` pour départager les égalités.
- `LIMIT n` se place **toujours en dernier** dans PostgreSQL pour restreindre le nombre de lignes retournées.
- L'ordre d'exécution logique (et d'écriture) est : `FROM` -> `WHERE` -> `ORDER BY` -> `LIMIT`.

## Validation

Avant de passer au Jour 6, assure-toi de pouvoir :
- [ ] Trier une requête par ordre croissant ou décroissant (`ASC` / `DESC`).
- [ ] Appliquer un tri sur plusieurs colonnes.
- [ ] Filtrer puis trier des données (`WHERE` + `ORDER BY`).
- [ ] Isoler les meilleurs résultats avec `LIMIT` sous PostgreSQL.
- [ ] Comprendre l'enchaînement : Filtrer -> Trier -> Limiter.