# 🚀 SQL for All - Challenge 31 Jours

Bienvenue sur mon dépôt de suivi du challenge **SQL for All (31 jours)** ! Ce projet a pour objectif de consolider, structurer et approfondir mes compétences en SQL, en modélisation relationnelle et en architecture de données à travers une approche rigoureuse et axée sur le besoin métier.

---

## 🛠️ Stack Technique & Environnement

* **SGBD :** PostgreSQL
* **Outils :** VS Code, SQLTools (gestionnaire de connexions et exécution de scripts)
* **Versionnement :** Git & GitHub
* **Méthodologie :** Analyse de la granularité, des cardinalités et de la logique métier avant chaque écriture de code SQL.

---

## 🏛️ L'Univers RetailPlus (Modèle Relationnel)

Le challenge repose sur un schéma e-commerce et retail complet composé de **7 tables interconnectées** :

1. **`clients`** : Informations sur la clientèle (`id_client`, `prenom`, `nom`, `email`, `ville`, `age`, `date_inscription`).
2. **`magasins`** : Implantation, surfaces et détails des points de vente (`id_magasin`, `nom_magasin`, `ville`, `region`, `surface_m2`).
3. **`categories`** : Taxonomie des produits (`id_categorie`, `nom_categorie`, `rayon`).
4. **`produits`** : Catalogue articles et rattachement par catégorie (`id_produit`, `nom_produit`, `id_categorie`, `prix`).
5. **`emplacements`** : Logistique et positionnement des produits dans les magasins (`id_emplacement`, `id_magasin`, `id_produit`, `zone`).
6. **`ventes`** : Entêtes des tickets de caisse / commandes (`id_vente`, `id_client`, `id_magasin`, `date_vente`, `mode_paiement`).
7. **`lignes_vente`** : Détails des articles achetés par ticket (`id_ligne`, `id_vente`, `id_produit`, `quantite`, `prix_unitaire`, `remise`).

---

## 🗺️ Feuille de Route & Avancement (Roadmap)

### 🔹 Semaine 1 : Fondations & Filtrage (Jours 1 à 7) — *Terminée*
* **Jours 1 à 6** : Structuration de tables, projections (`SELECT`), filtres (`WHERE`), alias, tri (`ORDER BY`), élimination des doublons (`DISTINCT`) et calculs arithmétiques.
* **Jour 7** : Consolidation et validation autonome des fondations.

### 🔹 Semaine 2 : Joindre les Données (Jours 8 à 14) — *Terminée*
* **Jour 8** : Clés primaires, clés étrangères, cardinalités et analyse de la granularité.
* **Jours 9 à 11** : Maîtrise des `INNER JOIN` et des `LEFT JOIN` complexes multi-tables.
* **Jours 12 à 13** : Audit d'écarts avec `RIGHT/FULL OUTER JOIN`, gestion des doublons et cardinalités (1-N, N-M).
* **Jour 14** : Consolidation et restitution de la Vue Complète des Ventes RetailPlus.

### 🔹 Semaine 3 : Agréger les Données & Pilotage (Jours 15 à 21) — *En cours (Jour 19)*
* **Jour 15** : Fonctions d'agrégation (`COUNT(*)`, `COUNT(colonne)`, `COUNT(DISTINCT)`, `SUM`, `AVG`, `MIN`, `MAX`).
* **Jour 16** : Regroupements par dimension avec `GROUP BY` (règle des colonnes non agrégées).
* **Jour 17** : Filtrage des groupes avec `HAVING` vs filtrage des lignes avec `WHERE`.
* **Jour 18** : Calcul des KPI business (Chiffre d'affaires brut/net, panier moyen via sous-requête, taux de remise global pondéré).
* **Jour 19** : Dates et analyse temporelle (extraction d'année, mois, jour avec `EXTRACT`/`DATE_TRUNC`, bornes exclusives).
- **Jour 20** : `CASE WHEN`, création de segments et indicateurs conditionnels.
- **Jour 21** : Consolidation de la Semaine 3 et production d'un mini-tableau de bord SQL.

---

## 📂 Structure du Dépôt

```text
sql_for_all_31_days/
│
├── .vscode/             # Configuration de l'éditeur & SQLTools
├── database/            # Scripts globaux (création de schéma, seed, reset)
├── day_01/              # Jour 1 : Introduction au SELECT et création de table
├── day_02/              # Jour 2 : Alias, projections et DISTINCT
├── day_03/              # Jour 3 : Filtrage conditionnel avec WHERE
├── day_04/              # Jour 4 : Opérateurs logiques (AND, OR, NOT)
├── day_05/              # Jour 5 : Tri des résultats (ORDER BY)
├── day_06/              # Jour 6 : Calculs arithmétiques et fonctions scalaires
├── day_07/              # Jour 7 : Consolidation de la Semaine 1
├── day_08/              # Jour 8 : Clés primaires, étrangères et granularité
├── day_09/              # Jour 9 : Pratique des INNER JOIN
├── day_10/              # Jour 10 : Pratique du LEFT JOIN
├── day_11/              # Jour 11 : Requêtes multi-tables (MULTI-JOIN)
├── day_12/              # Jour 12 : RIGHT JOIN, FULL OUTER JOIN et audit d'écarts
├── day_13/              # Jour 13 : Doublons, cardinalité et diagnostic de jointure
├── day_14/              # Jour 14 : Consolidation de la Semaine 2
├── day_15/              # Jour 15 : Fonctions d'agrégation (COUNT, SUM, AVG, MIN, MAX)
├── day_16/              # Jour 16 : Regroupements de données avec GROUP BY
├── day_17/              # Jour 17 : Filtrage des groupes avec HAVING et WHERE
├── day_18/              # Jour 18 : KPI et indicateurs business
├── day_19/              # Jour 19 : Dates et analyse temporelle
├── day_20/              # Jour 20 : CASE WHEN et segmentation
├── day_21/              # Jour 21 : Consolidation Semaine 3 et mini-tableau de bord
├── resources/           # Ressources et datasets du challenge
├── PROGRESS.md          # Suivi détaillé de l'avancement
└── README.md            # Documentation du projet

> 💡 **Note de structure :** Chaque dossier `day_XX/` suit une structure standardisée et contient systématiquement un fichier de consignes (**`challenge.md`**) et un fichier de requêtes validées (**`solution.sql`**).