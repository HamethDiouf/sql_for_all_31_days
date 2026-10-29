# Day 09 - INNER JOIN (Semaine 2)

## Objectif

Découvrir et maîtriser la première vraie jointure (`INNER JOIN`) pour associer deux tables (ou plus) grâce à une clé commune (Primary Key / Foreign Key) et récupérer uniquement les lignes qui possèdent une correspondance dans les deux tables.

---

## Les Notions Clés du Jour

- **`INNER JOIN`** : Permet de combiner des lignes de deux tables en se basant sur une condition de correspondance commune.
- **`ON`** : Spécifie la condition de liaison (généralement `table_enfant.colonne_fk = table_parent.colonne_pk`).
- **Alias de table** (`FROM ventes AS v`) : Rend la requête plus courte et lisible.
- **Qualification des colonnes** (`v.id_vente`, `c.prenom`) : Évite les ambiguïtés lorsque des colonnes ont le même nom.
- **Granularité** : Anticiper si le `INNER JOIN` va modifier le nombre de lignes (ex: `ventes` + `lignes_vente` passe de 10 à 22 lignes).

---

## Exercices de Synthèse et Mini Challenge (Parties 14 et 15)

À partir des tables RetailPlus (avec `id_categorie` dans `produits` et `nom_magasin`), écrivez les requêtes SQL correspondantes :

1. **Affiche chaque vente avec le prénom du client** (table `ventes` et `clients`).
2. **Affiche chaque vente avec le nom du magasin** (table `ventes` et `magasins`).
3. **Affiche chaque ligne de vente avec le nom du produit** (table `lignes_vente` et `produits`).
4. **Le responsable veut connaître les produits vendus dans chaque vente** (`lignes_vente` jointe avec `produits`, triée par `id_vente`).
5. **Le responsable veut afficher le client, le magasin et la date de chaque vente** (enchaînement de deux `INNER JOIN` : `ventes` + `clients` + `magasins`).
6. **Le mini challenge (Demande 5)** : Afficher les ventes avec le produit correspondant en passant par la table intermédiaire (`ventes` -> `lignes_vente` -> `produits`).