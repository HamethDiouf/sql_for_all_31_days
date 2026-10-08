# Day 01 - SELECT
 
## Objectif
 
Découvrir comment récupérer des données dans une table avec la commande SELECT.
 
---
 
## Étape 1 : Créer la table
 
Créer la table `clients` avec les colonnes suivantes :
 
- id_client
- nom
- ville
- age
 
Vérifier que la table a bien été créée.
 
---
 
## Étape 2 : Ajouter les données
 
Insérer les informations suivantes :
 
| id_client | nom | ville | age |
|------------|--------|--------|-----|
| 1 | Paul | Paris | 25 |
| 2 | Sarah | Lyon | 31 |
| 3 | Marc | Lille | 28 |
 
Vérifier que les données sont présentes dans la table.
 
---
 
## Étape 3 : Explorer la table
 
Afficher toutes les données de la table.
 
Questions :
 
- Combien de lignes sont affichées ?
- Combien de colonnes sont affichées ?
- Que représente une ligne ?
- Que représente une colonne ?
 
---
 
## Étape 4 : Sélectionner certaines colonnes
 
Afficher uniquement :
 
- nom
- ville
 
Observer le résultat.
 
Questions :
 
- Que remarques-tu ?
- Pourquoi certaines colonnes n'apparaissent plus ?
 
---
 
## Étape 5 : Modifier l'ordre des colonnes
 
Afficher :
 
- ville
- nom
 
Comparer le résultat avec l'exercice précédent.
 
Question :
 
- Est-ce que les données ont changé ou seulement leur affichage ?
 
---
 
## Étape 6 : Ajouter de nouvelles données
 
Ajouter au moins deux nouveaux clients.
 
Relancer les requêtes précédentes.
 
Observer :
 
- Le nombre de lignes affichées.
- Les nouveaux résultats obtenus.
 
---
 
## Étape 7 : Faire une erreur volontaire
 
Écrire volontairement une requête incorrecte en remplaçant :
 
FROM
 
par
 
FORM
 
Lire attentivement le message d'erreur affiché.
 
Questions :
 
- Quelle erreur est indiquée ?
- Quel mot SQL est incorrect ?
- Comment corriger la requête ?
 
---
 
## Étape 8 : Expérimenter
 
Tester librement plusieurs requêtes :
 
- afficher une seule colonne ;
- changer l'ordre des colonnes ;
- ajouter de nouvelles lignes ;
- relancer les mêmes requêtes.
 
L'objectif est d'observer comment SQL répond à chaque modification.
 
---
 
## À retenir
 
- Chaque colonne sélectionnée devient une colonne du résultat.
- Chaque ligne de la table devient une ligne du résultat.
- L'ordre des colonnes dans SELECT détermine l'ordre de l'affichage.
- Les messages d'erreur font partie de l'apprentissage.
- Modifier, tester et observer est la meilleure manière de progresser.
 
## Validation
 
Avant de passer au Jour 2, assure-toi de pouvoir :
 
- [ ] Créer une table.
- [ ] Insérer des données.
- [ ] Afficher toutes les colonnes.
- [ ] Afficher uniquement certaines colonnes.
- [ ] Changer l'ordre des colonnes.
- [ ] Comprendre un message d'erreur simple.