# Comparatif SQL Server vs PostgreSQL — Performance SQL (Jour 30)

Ce guide permet à tout collaborateur ou lecteur de suivre le **Jour 30** (`Performance SQL`) sur **PostgreSQL** (`SQL_FOR_ALL_RetailPlus`) tout en conservant la logique et les principes du support original rédigé pour **SQL Server**.

> **Règle de sécurité :** Tous les objets de test portent le préfixe `perf_` et sont exécutés sur un environnement/table de test isolé. Aucune modification directe n'est appliquée aux tables de production.

---

## 1. Tableau d'équivalence SQL Server vs PostgreSQL

| Objectif | Approche SQL Server (support) | Équivalent PostgreSQL (base RetailPlus) |
| :--- | :--- | :--- |
| **Plan d'exécution** | Plan estimé / plan réel (`Ctrl+L` / `Ctrl+M`) | `EXPLAIN` (estimé) / `EXPLAIN (ANALYZE, BUFFERS)` (réel + lectures) |
| **Lectures & temps** | `SET STATISTICS IO ON` / `TIME ON` | `EXPLAIN (ANALYZE, BUFFERS)` (`shared hit` / `shared read` + `Execution Time`) |
| **Index couvrant** | `CREATE NONCLUSTERED INDEX ... INCLUDE (...)` | `CREATE INDEX ... ON perf_lignes_vente (id_produit) INCLUDE (quantite, prix_unitaire)` |
| **Vérifier l'égalité** | `EXCEPT` dans les deux sens + `COUNT(*)` / totaux | `EXCEPT` / `EXCEPT ALL` dans les deux sens + `COUNT(*)` / totaux |

---

## 2. Fondamentaux : index, plans d'exécution et mesure

### Écriture « sargable » vs fonction sur colonne
- **Principe :** Une condition est *sargable* (*Search ARGument ABLE*) lorsqu'elle permet à l'optimiseur d'utiliser un index directement sur la colonne filtrée.
- **Exemple :** Écrire `WHERE date_vente >= '2025-01-01' AND date_vente < '2026-01-01'` (ou un filtre direct sur la colonne sans `YEAR(...)`, `CAST(...)` ou `LOWER(...)` autour d'elle) évite d'évaluer une fonction ligne par ligne et favorise l'usage d'un index.

### Clustered vs Nonclustered & `INCLUDE`
- **Index clustered :** Détermine l'ordre physique des lignes de la table (un seul par table ; souvent lié à la clé primaire).
- **Index nonclustered :** Structure triée séparée contenant les colonnes clés et un pointeur vers la ligne de table.
- **Colonne incluse (`INCLUDE`) :** Ajouter `INCLUDE (quantite, prix_unitaire)` stocke ces colonnes dans les feuilles de l'index sans les trier, rendant l'index **couvrant** pour la requête et évitant des allers-retours (*Key Lookup* / accès supplémentaire à la table de base).

### Seek vs Scan
- **Index Seek :** Cible directement les clés recherchées lorsque le filtre est sélectif.
- **Index Scan / Table Scan :** Parcourt l'ensemble ou une large part de l'index ou de la table. Un scan est normal et souvent optimal sur une petite table ou un filtre peu sélectif (par exemple lorsqu'une grande proportion des lignes, comme ~90 %, est concernée).

---

## 3. Schéma visuel des opérateurs

Le diagramme `./plan-execution-operateurs.png` illustre les principaux opérateurs rencontrés dans un plan d'exécution (**Index Seek**, **Index Scan**, **Nested Loops**, **Sort**, **Hash Match**, **SELECT**). Il sert de repère visuel pour comprendre le rôle de chaque étape, à compléter systématiquement par la lecture du plan réel et des mesures de volume/temps.

---

*Auteur : **Hameth Diouf** — Software & Junior Data Engineer | Challenge SQL FOR ALL (Jour 30/31)*