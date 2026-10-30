# Day 11 - Enchaîner plusieurs JOIN (Semaine 2)

## Objectif

Apprendre à relier trois tables ou plus dans une seule et même requête SQL pour répondre à des besoins métier complexes, en maîtrisant le chemin des clés (`PK` ↔ `FK`), le choix du type de jointure (`INNER` vs `LEFT`), et l'anticipation de la granularité.

---

## Les Notions Clés du Jour

- **Enchaînement de jointures** : Chaque `JOIN` ajoute une table supplémentaire en s'appuyant sur une relation logique (ex: `ventes` -> `lignes_vente` -> `produits` -> `categories`).
- **Granularité & Répétitions** : Une jointure avec une table de type `1 → N` (comme `ventes` vers `lignes_vente`) multiplie logiquement les lignes. Ce n'est pas un bug, c'est le niveau de détail attendu (une ligne par article acheté).
- **Ordre des JOIN** : L'ordre d'écriture compte pour la lisibilité et le chemin logique, même si le SGBD optimise l'exécution en interne.
- **Attention au `WHERE` après `LEFT JOIN`** : Un filtre restrictif dans le `WHERE` sur une table de droite peut annuler l'effet du `LEFT JOIN` et transformer la requête en `INNER JOIN`. Préférer les filtres dans le `ON` si l'on souhaite préserver la table de gauche.

---

## Exercices et Challenge Métier Final (Parties 10 et 11)

À partir des tables RetailPlus, écrivez les requêtes SQL correspondantes :

1. **Vente, date, magasin et produit** : Affiche `id_vente`, `date_vente`, `nom_magasin` et `nom_produit` (`ventes` + `lignes_vente` + `produits` + `magasins`).
2. **Quantité vendue par produit et catégorie** : Affiche le nom de la catégorie, le nom du produit et la quantité totale vendue (`lignes_vente` + `produits` + `categories`, avec `SUM` et `GROUP BY`).
3. **Produits achetés par client avec sa ville** : Affiche `id_client`, prénom, nom, ville, nom du produit et quantité (`clients` + `ventes` + `lignes_vente` + `produits`).
4. **Conserver tous les clients** : Modifie la requête précédente ou de base pour conserver tous les clients, même ceux sans vente (`LEFT JOIN`).
5. **Challenge Métier Final RetailPlus** : La direction veut analyser les achats par magasin. Affiche la date de vente (`date_vente`), le nom du magasin (`nom_magasin`), le nom du produit (`nom_produit`), la catégorie (`nom_categorie`) et la quantité (`quantite`).