# Day 16 - GROUP BY : Regrouper les données selon une ou plusieurs dimensions (Semaine 3)

## Objectif

Passer d'une question métier globale à une synthèse par dimension en utilisant la clause `GROUP BY`. Savoir choisir ce que l'on regroupe (dimension), ce que l'on calcule (mesure avec `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), et respecter la règle fondamentale de SQL Server / PostgreSQL sur les colonnes non agrégées.

---

## Les Notions Clés du Jour

- **Dimension vs Mesure** : 
  - La **dimension** indique *par quoi* on classe (ex: `id_produit`, `id_vente`).
  - La **mesure** indique *ce que* l'on calcule (ex: `SUM(quantite)`, `COUNT(*)`).
- **La clause `GROUP BY`** : Rassemble les lignes qui partagent la même valeur pour la dimension spécifiée et applique les fonctions d'agrégation groupe par groupe.
- **La règle d'or du `GROUP BY`** : Dans un `SELECT` avec un regroupement, **chaque colonne affichée doit obligatoirement figurer soit dans le `GROUP BY`, soit dans une fonction d'agrégation**.
- **Multi-dimensions** : Il est possible de regrouper par plusieurs colonnes (ex: `GROUP BY id_vente, id_produit`) pour former des combinaisons uniques.
- **Vigilance face aux jointures** : Comme vu au Jour 15, ne jamais agréger/regrouper après une jointure qui multiplie les lignes sans avoir validé les volumes au préalable (`COUNT(*)` avant/après).

---

## Exercices Pratiques

À partir de la table `lignes_vente` de votre base RetailPlus :
1. **Synthèse par produit** : Affichez la quantité totale vendue pour chaque produit (`id_produit`, `quantite_totale`).
2. **Fréquence par produit** : Comptez le nombre de lignes de vente associées à chaque produit (`id_produit`, `nombre_lignes`).
3. **Tableau complet produit** : Pour chaque produit, affichez le nombre de lignes, la quantité totale et la quantité moyenne (`quantite_moyenne` avec conversion décimale).
4. **Extrêmes par produit** : Affichez par produit la plus petite et la plus grande quantité enregistrée sur une ligne (`quantite_minimale`, `quantite_maximale`).
5. **Combinaison de dimensions** : Calculez le total des quantités pour chaque combinaison de vente et de produit (`id_vente`, `id_produit`, `quantite_totale`).