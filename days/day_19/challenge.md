# Day 19 - Dates et Analyse Temporelle : Ventes par jour, mois et année (Semaine 3)

## Objectif

Situer les ventes dans le temps pour analyser leur évolution (par jour, par mois, par année), utiliser les fonctions d'extraction temporelle (`EXTRACT` ou `TO_CHAR` en PostgreSQL, équivalents à `YEAR()`, `MONTH()`, `DAY()`), et filtrer proprement une période avec des bornes exclusives.

---

## Les Notions Clés du Jour

- **Types de dates** : Utiliser des types temporels stricts (`DATE`, `TIMESTAMP`) plutôt que du texte pour garantir des tris et des comparaisons chronologiques fiables.
- **Extraction et Regroupement (`GROUP BY`)** :
  - Par jour : `CAST(date_vente AS DATE)` ou `DATE_TRUNC('day', date_vente)`.
  - Par mois : Nécessite de regrouper à la fois par **année** et par **mois** pour éviter de fusionner les mêmes mois d'années différentes.
  - Par année : Regroupement par l'extraction de l'année.
- **Filtrage de période rigoureux** : Utiliser une borne de début inclusive (`>=`) et une borne de fin exclusive (`<`) pour couvrir l'intégralité d'une période sans perdre les transactions de fin de journée.

---

## Exercices Pratiques

À partir de vos tables de la base RetailPlus :
1. **Inspection des métadonnées** : Listez les colonnes de la table `ventes` pour identifier la colonne de date et son type.
2. **Extraction** : Affichez pour chaque vente son année, son mois et son jour.
3. **CA brut par jour** : Calculez le montant brut des ventes regroupé par jour, trié par ordre chronologique (`INNER JOIN` entre `ventes` et `lignes_vente`).
4. **CA brut par mois** : Regroupez le chiffre d'affaires par année et par mois.
5. **CA brut par année et couverture** : Calculez le total annuel ainsi que les dates de première et dernière vente de chaque année (`MIN` et `MAX`).
6. **Filtrage d'une période** : Listez les ventes d'une année précise en utilisant des bornes de début (`>=`) et de fin (`<`).