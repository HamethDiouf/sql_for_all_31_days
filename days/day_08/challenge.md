# Day 08 - Clés, relations & granularité (Semaine 2)

## Objectif

Comprendre le modèle relationnel et la structure des données avant d'introduire la syntaxe des `JOIN`. 
Aujourd'hui, pas de code complexe : l'objectif est de maîtriser les concepts fondamentaux (Clé primaire, Clé étrangère, cardinalités, granularité et anticipation de la multiplication des lignes).

---

## Les 5 Questions Clés avant un JOIN

Avant d'écrire une requête croisant plusieurs tables, posez-vous toujours ces questions :
1. Quelle table contient l'information dont j'ai besoin ?
2. Que représente une ligne dans chaque table (la **granularité**) ?
3. Quelle colonne permet de relier les tables (lien **PK** $\leftrightarrow$ **FK**) ?
4. Combien de lignes d'une table peuvent correspondre à une ligne de l'autre (**cardinalité** : `1 → 1`, `1 → N`, `N → N`) ?
5. Le nombre de lignes va-t-il se multiplier après la liaison ?

---

## Exercices de Raisonnement (Partie 9 du cours)

Répondez par écrit (dans votre carnet ou dans un fichier de notes) aux 10 questions d'analyse du cours :
1. Quelle est la clé primaire de `clients` ? Quelle colonne de `ventes` permet de retrouver le client ?
2. Que représente une ligne de `ventes` ? Que représente une ligne de `lignes_vente` ?
3. Quelle relation existe entre `ventes` et `lignes_vente` (`1 → 1`, `1 → N` ou `N → N`) ? Justifiez.
4. Quel champ relie `lignes_vente` et `produits` ?
5. Pourquoi une vente peut-elle apparaître plusieurs fois après une liaison avec `lignes_vente` ?
6. *RetailPlus* veut afficher chaque vente avec le nom du magasin. Quelles tables faut-il relier et quelle clé utilisez-vous ?
7. *RetailPlus* veut afficher chaque produit vendu avec sa quantité. Quelles tables sont nécessaires ?
8. *RetailPlus* veut connaître les produits placés dans chaque magasin. Quelle table intermédiaire devez-vous utiliser ?
9. Si vous reliez `ventes` et `lignes_vente` puis comptez les lignes, que comptez-vous réellement ?
10. Pourquoi faut-il connaître la granularité avant de choisir d'agréger ou de joindre des tables ?

---

## Challenge Métier : Préparer une liaison (Partie 10)

Pour les 3 demandes du responsable commercial, réalisez un schéma logique (ou textuel) listant la table de départ, la table cible, la PK, la FK, la cardinalité et la granularité attendue :
1. « Affiche chaque vente avec le nom du magasin où elle a été réalisée. »
2. « Affiche chaque produit vendu avec le numéro de vente et la quantité. »
3. « Affiche les ventes et leurs produits, puis explique pourquoi une même vente apparaît plusieurs fois. »