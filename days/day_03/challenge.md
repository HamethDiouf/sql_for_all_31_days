# Day 03 - WHERE et le filtrage des données

## Objectif

Découvrir comment filtrer les lignes d'une table en fonction de conditions précises avec la commande `WHERE`.

---

## Étape 1 : Filtrer avec une condition simple (`=`)

À partir de la table `clients` de RetailPlus, afficher uniquement les clients qui habitent à Paris.

Questions :
- Combien de lignes sont affichées ?
- Pourquoi les clients de Lyon ou de Lille n'apparaissent-ils pas ?

---

## Étape 2 : Combiner sélection de colonnes et filtrage

Afficher seulement le `nom` et la `ville` des clients qui habitent à Marseille.

Observer la différence entre le choix des colonnes (`SELECT`) et le choix des lignes (`WHERE`).

---

## Étape 3 : Utiliser les opérateurs de comparaison

Tester les différents opérateurs pour comparer des nombres et du texte :
- Afficher les clients qui ont **plus de 35 ans** (`>`).
- Afficher les clients qui ont **30 ans ou plus** (`>=`). Observer la différence avec l'âge de 30 ans exact.
- Afficher les produits de la catégorie `Boissons` dont le prix est **inférieur ou égal à 1.20** (`<=`).

---

## Étape 4 : Combiner plusieurs conditions avec `AND`

Le responsable de RetailPlus souhaite identifier des profils précis :
- Afficher les clients qui habitent à Lyon **ET** qui ont plus de 30 ans.

Questions :
- Quel est l'effet de l'opérateur `AND` sur le nombre de lignes obtenues ?

---

## Étape 5 : Élargir la recherche avec `OR`

- Afficher les clients qui habitent à Paris **OU** à Marseille.

Question :
- Pourquoi utilise-t-on `OR` ici et non `AND` ?

---

## Étape 6 : Exclure des données avec `NOT` ou `<>`

- Afficher les clients qui **n'habitent pas** à Paris.
- Tester les deux écritures équivalentes : avec `NOT` (`WHERE NOT ville = 'Paris'`) et avec l'opérateur de différence (`WHERE ville <> 'Paris'`).

---

## Étape 7 : Mélanger `AND` et `OR` avec les parenthèses

Le responsable demande : *« Les clients de Paris qui ont moins de 30 ans ou plus de 40 ans. »*

Écrire la requête en utilisant rigoureusement des parenthèses pour grouper les conditions :
```sql
SELECT *
FROM clients
WHERE ville = 'Paris'
  AND (age < 30 OR age > 40);