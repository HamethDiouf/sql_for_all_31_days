# Day 06 - Calculs, expressions, CAST et COALESCE

## Objectif

Apprendre à transformer les données à la volée à l'aide du modèle complet RetailPlus (7 tables) : créer des colonnes calculées, utiliser les alias (`AS`), formater et convertir des types (`CAST`), et gérer les valeurs manquantes (`COALESCE`).

---

## Étape 1 : Créer des colonnes calculées et utiliser les alias (`AS`)

À partir de la table `lignes_vente` et `produits` :
- Affiche `id_produit`, `quantite`, `prix_unitaire` et calcule le montant total de chaque ligne (`quantite * prix_unitaire`), en nommant cette nouvelle colonne `montant_total` grâce à l'alias `AS`.
- Affiche le nom des produits et leur prix majoré de 20 % (multiplication par `1.20`), sous l'alias `prix_avec_taxe`.

---

## Étape 2 : Éviter la division entière

- Teste une division entre entiers avec `SELECT 10 / 4;` et compare avec une division décimale `SELECT 10 / 4.0;`.

Question :
- Quelle est la différence de résultat et pourquoi ?

---

## Étape 3 : Convertir les types de données avec `CAST`

- Convertis le prix d'un produit en nombre entier avec `CAST(prix AS INT)`.
- Convertis un calcul de montant en forçant un format décimal précis avec `CAST(... AS DECIMAL(10,2))` pour arrondir proprement à 2 chiffres après la virgule.

---

## Étape 4 : Gérer les valeurs absentes avec `COALESCE`

La table `produits` contient des marques manquantes (`NULL`).
- Affiche le nom du produit et sa marque, mais en remplaçant les `NULL` par le texte `'Marque inconnue'` grâce à `COALESCE(marque, 'Marque inconnue')`.
- À partir de la table `lignes_vente`, utilise `COALESCE(remise, 0)` pour éviter que les calculs de remise ne renvoient `NULL` lorsque la remise n'est pas renseignée.

---

## Étape 5 : Traiter les données textuelles et les emplacements

La table `emplacements` indique l'étagère de stockage de certains produits, mais comporte des valeurs `NULL`.
- Affiche l'emplacement, le rayon et l'étagère, en convertissant l'étagère en texte et en remplaçant les `NULL` par le texte `'Non définie'` à l'aide de `COALESCE(CAST(etagere AS VARCHAR(10)), 'Non définie')`.

---

## Étape 6 : Combiner calculs, filtres, tris et LIMIT

- Pour les lignes de vente dont la quantité est supérieure à 1, calcule le montant total (arrondi à 2 décimales), puis trie le résultat du plus grand au plus petit (`ORDER BY ... DESC`).
- Affiche les 3 lignes de vente ayant généré le plus gros montant final après application de la remise (sécurisée par `COALESCE`).

---

## À retenir

- Une colonne calculée s'écrit directement dans le `SELECT` en utilisant les opérateurs `+`, `-`, `*`, `/`.
- `AS alias` donne un nom lisible aux colonnes calculées (rappel : l'alias ne peut pas être utilisé dans le `WHERE`, mais il est accepté dans le `ORDER BY`).
- `CAST(valeur AS type)` permet de changer le type d'une donnée (ex: `INT`, `DECIMAL(10,2)`, `VARCHAR(10)`).
- `COALESCE(a, b)` renvoie la première valeur non nulle (très utile pour neutraliser les `NULL`).
- `LIMIT n` (sous PostgreSQL) se place en fin de requête pour isoler un Top $N$.

## Validation

Avant de passer au Jour 7, assure-toi de pouvoir :
- [ ] Créer une colonne calculée avec des opérateurs arithmétiques.
- [ ] Nommer proprement une colonne avec `AS`.
- [ ] Convertir un type de données avec `CAST`.
- [ ] Gérer proprement les `NULL` dans un calcul ou un affichage avec `COALESCE`.
- [ ] Combiner `WHERE`, `ORDER BY`, colonnes calculées et `LIMIT` sous PostgreSQL.