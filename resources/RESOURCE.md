# 📂 Documentation des Ressources - RetailPlus

Ce dossier contient les jeux de données bruts au format CSV utilisés pour alimenter la base de données PostgreSQL tout au long du challenge **SQL for All (31 Jours)**.

---

## 🏛️ Modèle de Données & Tables

L'univers **RetailPlus** repose sur un schéma relationnel e-commerce et retail composé de **7 tables interconnectées** :

| Nom du Fichier CSV | Table associée | Description | Nombre d'enregistrements (Seed) |
| :--- | :--- | :--- | :--- |
| `categories.csv` | `categories` | Taxonomie et classification des produits | 6 catégories |
| `clients.csv` | `clients` | Informations sur la clientèle (profils, villes, âges, contacts) | 13 clients |
| `magasins.csv` | `magasins` | Points de vente physiques (surfaces, villes) | 6 magasins |
| `produits.csv` | `produits` | Catalogue des articles, prix et rattachement aux catégories | 17 produits |
| `emplacements.csv` | `emplacements` | Logistique et positionnement des produits dans les magasins | 8 emplacements |
| `ventes.csv` | `ventes` | Entêtes des tickets de caisse / commandes | 10 ventes |
| `lignes_vente.csv` | `lignes_vente` | Détails des articles par ticket (quantités, prix unitaires, remises) | 22 lignes |

---

## 🔗 Relations et Dépendances (Clés Étrangères)

Pour garantir l'intégrité référentielle lors d'éventuels imports manuels ou automatisés via des scripts, l'ordre logique d'insertion des données à respecter est le suivant :

1. **`categories.csv`** (Table mère indépendante)
2. **`clients.csv`** (Table mère indépendante)
3. **`magasins.csv`** (Table mère indépendante)
4. **`produits.csv`** (Dépend de `categories`)
5. **`ventes.csv`** (Dépend de `clients` et `magasins`)
6. **`emplacements.csv`** (Dépend de `magasins` et `produits`)
7. **`lignes_vente.csv`** (Dépend de `ventes` et `produits`)

---

## ⚙️ Utilisation

Ces fichiers sont exploités par les scripts de réinitialisation et de seed situés dans le dossier global `database/` de ce dépôt.