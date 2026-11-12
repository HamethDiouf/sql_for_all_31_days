# 🎯 Challenge - Jour 21 : Consolidation de la Semaine 3 & Mini-Tableau de Bord

## Objectifs
- Combiner l'ensemble des notions de la Semaine 3 : agrégations (`COUNT`, `SUM`, `AVG`), regroupements (`GROUP BY`), filtrage de groupes (`HAVING`), analyse temporelle et segmentation conditionnelle (`CASE WHEN`).
- Maîtriser la granularité des données et prévenir les erreurs de multiplication de lignes lors des jointures (ex: table `emplacements`).
- Produire un ensemble de requêtes cohérentes et prêtes à l'emploi pour alimenter un dashboard de pilotage (Power BI).

## Exercices Pratiques & Challenge (RetailPlus)
1. **KPI globaux :** Calculer le nombre de lignes, le nombre de ventes distinctes, la quantité totale et le montant brut global.
2. **Analyse par produit :** Extraire les performances par article (quantité, chiffre d'affaires brut, nombre de lignes élevées $\ge 500$).
3. **Le podium :** Identifier les 3 meilleurs produits en termes de chiffre d'affaires brut (`LIMIT 3`).
4. **Analyse par magasin :** Croiser les lignes de vente avec les ventes et les magasins pour comparer l'activité des points de vente.
5. **Audit de jointure :** Démanteler l'impact d'une jointure non maîtrisée (multiplication des lignes avec `emplacements`).