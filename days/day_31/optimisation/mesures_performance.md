# Mesures de performance — Jour 31 (PostgreSQL)

> **Regle :** Noter uniquement les valeurs reelles relevees dans VS Code via `EXPLAIN (ANALYZE, BUFFERS)`. Ne jamais inventer de gain.

## Requete selectionnee
- **Requete :** Calcul du chiffre d'affaires brut par client (`SUM(quantite * prix_unitaire)`).
- **Justification :** C'est la brique centrale de l'analyse valeur et du classement client.

## Comparatif avant / apres (a completer apres execution)
| Version | `Planning Time` | `Execution Time` | `shared hit` | `shared read` | Operateurs cles observes |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Avant optimisation** | *a remplir* | *a remplir* | *a remplir* | *a remplir* | *a remplir* |
| **Apres optimisation** | *a remplir* | *a remplir* | *a remplir* | *a remplir* | *a remplir* |

## Decision d'index & limites de mesure
- **Index :** Evaluer l'existant (`pg_indexes`), le volume de lignes et la frequence d'ecriture avant toute creation d'index. Sur un faible volume, le gain peut etre invisible ou negligeable.
- **Cache / volume :** Les premieres executions peuvent lire sur disque (`shared read`), tandis que les suivantes beneficient du cache (`shared hit`).