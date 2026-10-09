# Day 02 - SELECT et sélection des données

## Objectif
Maîtriser la sélection de colonnes spécifiques, l'utilisation des alias, et la suppression des doublons avec `DISTINCT`.

--- 

## Exercices pratiques
 
1. **Sélection globale** : Afficher toutes les colonnes de la table `clients` à l'aide de l'étoile `*`.
2. **Colonne unique** : Afficher uniquement le nom des clients.
3. **Multi-colonnes** : Afficher le nom et la ville des clients.
4. **Données ciblées** : Afficher le nom et l'email pour préparer une newsletter.
5. **Alias de colonnes** : Afficher le nom et l'âge en renommant les en-têtes de colonnes en `nom_client` et `age_client` grâce au mot-clé `AS`.
6. **Alias de table** : Utiliser un alias pour la table `clients` (par exemple `c`) pour sélectionner le nom et l'email.
7. **Valeurs uniques** : Afficher la liste de toutes les villes des clients sans doublon en utilisant `DISTINCT`.

---

## À retenir
- L'étoile `*` permet d'afficher toutes les colonnes, mais une sélection explicite est préférable pour la lisibilité et la performance.
- Le mot-clé `AS` permet de renommer l'affichage des colonnes (alias) sans modifier la structure de la table.
- `DISTINCT` permet de filtrer les lignes en double pour ne garder que les valeurs uniques d'une colonne.