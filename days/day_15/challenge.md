# Day 15 - Fonctions d'agrégation : COUNT, SUM, AVG, MIN, MAX (Semaine 3)

## Objectif

Savoir répondre à un besoin métier par un chiffre de synthèse en choisissant la bonne fonction d'agrégation (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), maîtriser leur gestion des valeurs `NULL`, et comprendre l'impact d'une mauvaise jointure (qui multiplie les lignes) sur les calculs d'agrats.

---

## Les Notions Clés du Jour

- **`COUNT(*)` vs `COUNT(colonne)` vs `COUNT(DISTINCT colonne)`** : 
  - `COUNT(*)` compte toutes les lignes sans exception (même avec des `NULL`).
  - `COUNT(colonne)` ne compte que les lignes où la colonne est renseignée (ignore les `NULL`).
  - `COUNT(DISTINCT colonne)` compte uniquement les valeurs uniques non nulles.
- **`SUM(colonne)`** : Calcule la somme totale d'une colonne numérique (ignore les `NULL`).
- **`AVG(colonne)`** : Calcule la moyenne (nécessite souvent un `CAST(... AS DECIMAL(10,2))` sous SQL Server / PostgreSQL pour conserver les décimales).
- **`MIN` et `MAX`** : Permettent de trouver les bornes extrêmes (numériques, textuelles ou temporelles).
- **Le piège de la multiplication des lignes** : Une jointure mal maîtrisée (comme l'ajout inutile de la table `emplacements`) duplique les lignes et fausse totalement les résultats de `SUM()` et `AVG()`. Toujours comparer les `COUNT(*)` avant et après jointure.

---

## Exercices Pratiques

À partir de la table `lignes_vente` de votre base RetailPlus :
1. **Compter les lignes** : Affichez le nombre total de lignes de vente (`nombre_lignes`).
2. **Produits distincts** : Comptez le nombre de produits différents vendus (`produits_distincts`).
3. **Quantité totale** : Calculez le volume total d'unités vendues (`quantite_totale`).
4. **Moyenne** : Calculez la quantité moyenne par ligne en forçant un format décimal (`quantite_moyenne`).
5. **Extrêmes** : Affichez dans une seule requête la plus petite (`quantite_minimale`) et la plus grande (`quantite_maximale`) quantité vendue.
6. **Tableau de bord** : Rassemblez en une seule requête le nombre de lignes, les quantités renseignées, la somme totale et la quantité moyenne.