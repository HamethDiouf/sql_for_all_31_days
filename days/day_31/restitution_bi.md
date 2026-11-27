# Phase 8 — Restitution Power BI (Modele en etoile)

## 1. Modele de donnees
- **Table de faits principale :** `Fact_Lignes_Vente` (granularite : **une ligne d'article vendu dans une vente**).
- **Dimensions associees (relations 1:* vers la table de faits, filtrage de la dimension vers les faits) :**
  - `Dim_Client` (cle : `id_client`)
  - `Dim_Vente` / `Dim_Date` (cle : `id_vente` / date si disponible)
  - `Dim_Produit` (cle : `id_produit`)
  - `Dim_Magasin` (cle : `id_magasin` / `nom_magasin`)

## 2. Repartition SQL vs DAX
- **En SQL (preparation / couche analytique) :** nettoyage des cles, calculs bruts fiables (`quantite * prix_unitaire`), controles d'integrite et attributs stables.
- **En DAX (mesures dynamiques) :** `CA Brut`, `Nombre de Clients Actifs`, `Nombre de Ventes`, `Panier Moyen` (`DIVIDE([CA Brut], [Nombre de Ventes])`) et `% Contribution CA`, afin qu'ils reagissent automatiquement aux filtres et segments de l'utilisateur.

## 3. Page de tableau de bord proposee
- **Cartes KPI (haut de page) :** Clients enregistres, Clients actifs, CA brut, Nombre de ventes, Panier moyen.
- **Visuels d'analyse :** Classement Top 10 clients (CA brut et % de contribution), repartition par segment client, et filtres/segments interactifs (segment, magasin, periode si disponible).