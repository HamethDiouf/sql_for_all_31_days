# 📈 Suivi d'Avancement - SQL for All (31 Jours)

Ce fichier retrace l'état d'avancement quotidien du challenge **SQL for All**, de la modélisation des bases de données jusqu'aux analyses avancées et aux indicateurs business.

---

## 📊 Tableau de Bord Global

| Semaine | Thématique principale | Statut | Jours validés |
| :--- | :--- | :--- | :--- |
| **Semaine 1** | Fondations, Filtrage & Tris | **Terminée** | 7 / 7 |
| **Semaine 2** | Joindre les Données & Cardinalités | **Terminée** | 7 / 7 |
| **Semaine 3** | Agréger, KPI & Analyse Temporelle | **Terminée** | 7 / 7 | 
| **Semaine 4** | Analyses Avancées & Automatisation | **Terminée** | 10 / 10 |

---

## 🗓️ Suivi Détaillé par Jour

### 🔹 Semaine 1 : Fondations & Filtrage
- [x] **Jour 1** : Introduction au `SELECT` et création de table
- [x] **Jour 2** : Alias, projections et `DISTINCT`
- [x] **Jour 3** : Filtrage conditionnel avec `WHERE`
- [x] **Jour 4** : Opérateurs logiques (`AND`, `OR`, `NOT`)
- [x] **Jour 5** : Tri des résultats (`ORDER BY`)
- [x] **Jour 6** : Calculs arithmétiques et fonctions scalaires de base
- [x] **Jour 7** : Consolidation et validation autonome de la Semaine 1

### 🔹 Semaine 2 : Joindre les Données
- [x] **Jour 8** : Clés primaires, clés étrangères et analyse de la granularité
- [x] **Jour 9** : Pratique des `INNER JOIN` sur PostgreSQL
- [x] **Jour 10** : Découverte et pratique du `LEFT JOIN`
- [x] **Jour 11** : Pratique des requêtes multi-tables (`MULTI-JOIN`)
- [x] **Jour 12** : `RIGHT JOIN`, `FULL OUTER JOIN` et audit d'écarts
- [x] **Jour 13** : Gestion des doublons, cardinalités et diagnostic de jointure
- [x] **Jour 14** : Consolidation et challenge final de la Semaine 2 (Vue complète des ventes)

### 🔹 Semaine 3 : Agréger les Données & Pilotage
- [x] **Jour 15** : Fonctions d'agrégation (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- [x] **Jour 16** : Regroupements de données avec `GROUP BY`
- [x] **Jour 17** : Filtrage des groupes avec `HAVING` et distinction avec `WHERE`
- [x] **Jour 18** : KPI et indicateurs business (Chiffre d'affaires, panier moyen, taux de remise)
- [x] **Jour 19** : Dates et analyse temporelle (Ventes par jour, mois et année)
- [x] **Jour 20** : `CASE WHEN`, création de segments et indicateurs conditionnels
- [x] **Jour 21** : Consolidation de la Semaine 3 et mini-tableau de bord

### 🔹 Semaine 4 : Analyses Avancées & Automatisation
- [x] **Jour 22** : Introduction aux sous-requêtes (Scalaires, `IN`, `EXISTS`, `NOT IN`, `NOT EXISTS`, Tables dérivées)
- [x] **Jour 23** : Structurer les requêtes longues avec des CTE (`WITH`)
- [x] **Jour 24** : `ROW_NUMBER()`, `RANK()` et `DENSE_RANK()` (Classer les lignes et gérer les ex æquo)
- [x] **Jour 25** : `PARTITION BY` (Calculer par groupe sans perdre le détail des lignes)
- [x] **Jour 26** : `LAG()`, `LEAD()`, cumuls & moyennes mobiles | ✅ Validé | Jeu enrichi 2024–2026, protection `NULLIF`, cadre `ROWS`, mois absent (`2026-03`)
- [x] **Jour 27** : Problèmes analytiques réels | ✅ Validé | Démarche en 6 étapes, arbitrages d'outils SQL, contrôles de jointure et limites d'interprétation 
- [x] **Jour 28** : Consolidation & Grand Challenge Analytique | ✅ Validé | CTE multi-étapes, `PARTITION BY categorie`, `LAG()`, contrôle cardinalité et limites volume/valeur
- [x] **Jour 29** : Qualité & fiabilité des données | ✅ Validé | Détection doublons, `NULL` vs vide, anomalies, réconciliation totaux & analyse client canonique 
- [x] **Jour 30** : Performance SQL | ✅ Validé | Sargabilité, index couvrants (`INCLUDE`), plans d'exécution, mesures avant/après & preuve d'identité
- [x] **Jour 31** : Grand Challenge Final — Analyse client de bout en bout en 9 phases *(Structure initialisee, execution des phases en cours)*
