# 🎯 Challenge - Jour 26 : `LAG()`, `LEAD()`, sommes cumulées et moyennes mobiles

## Objectifs
- Récupérer la valeur d'une période précédente (`LAG()`) ou suivante (`LEAD()`) dans une série ordonnée.
- Calculer la variation absolue et le taux d'évolution en pourcentage de façon sécurisée (`NULLIF`, calcul décimal).
- Construire une somme cumulée avec un cadre de fenêtre explicite (`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`).
- Calculer une moyenne mobile glissante (`ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`) et comprendre l'impact des premières périodes et des périodes absentes.
- Combiner ces indicateurs dans un tableau d'analyse temporelle complet, puis adapter la démarche aux tables de `RetailPlus` après inspection du schéma.

## Exercices Pratiques (RetailPlus & Séries Temporelles)
1. **Exercice 1 (Valeur précédente) :** Afficher pour chaque période la valeur de la période précédente avec `LAG()` sur un ordre chronologique fiable.
2. **Exercice 2 (Valeur suivante) :** Afficher la valeur de la période suivante avec `LEAD()` et expliquer pourquoi la dernière période vaut `NULL`.
3. **Exercice 3 (Variation absolue & taux d'évolution) :** Calculer l'écart (`actuel - précédent`) et le taux d'évolution (`%`) via une CTE, en protégeant la division par zéro avec `NULLIF`.
4. **Exercice 4 (Somme cumulée & partitionnement) :** Calculer le cumul progressif avec un cadre `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`, y compris avec redémarrage par année (`PARTITION BY annee`).
5. **Exercice 5 (Moyenne mobile & tableau de synthèse) :** Calculer la moyenne mobile sur 3 périodes (`2 PRECEDING AND CURRENT ROW`) et combiner `LAG`, variation, taux, cumul et moyenne mobile dans une seule requête (puis adapter sur `ventes` et `lignes_vente` de `RetailPlus` après vérification des colonnes de date).