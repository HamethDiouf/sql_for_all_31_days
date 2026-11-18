# 🎯 Challenge - Jour 25 : `PARTITION BY` (Calculer par groupe sans perdre le détail)

## Objectifs
- Maîtriser la clause `OVER (PARTITION BY ...)` avec les fonctions d'agrégation (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`).
- Distinguer l'agrégation classique (`GROUP BY`) de l'enrichissement analytique (`PARTITION BY`).
- Calculer la contribution (part en %) d'une ligne de vente par rapport au total de son produit.
- Construire une somme cumulée ligne par ligne avec une fenêtre explicite (`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`).
- Combiner agrégations fenêtrées et classement (`ROW_NUMBER`) au sein d'une même partition.

## Exercices Pratiques (RetailPlus)
1. **Exercice 1 :** Afficher chaque ligne de vente avec la quantité totale vendue pour son produit (`SUM` + `PARTITION BY`).
2. **Exercice 2 :** Ajouter à chaque ligne la quantité moyenne, le nombre de lignes, le minimum et le maximum de son produit sans réduire le nombre de lignes.
3. **Exercice 3 :** Numéroter les lignes de vente à l'intérieur de chaque produit par ordre chronologique (`id_ligne`).
4. **Exercice 4 :** Calculer la somme cumulée des quantités par produit, ligne après ligne, avec une fenêtre explicite `ROWS BETWEEN`.
5. **Exercice 5 (Synthèse métier) :** Dans une seule requête, afficher pour chaque ligne de vente sa quantité, le total de son produit, sa part en pourcentage dans ce total (protégée par `NULLIF`), et son rang décroissant au sein du produit.