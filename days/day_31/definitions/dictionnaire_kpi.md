# Dictionnaire des KPI — Analyse Client RetailPlus

| KPI | Grain | Regle de calcul (base brute) | Tables / colonnes a verifier | Limites & points d'attention |
| :--- | :--- | :--- | :--- | :--- |
| **Clients enregistres** | Global | `COUNT(*) AS nb_clients_enregistres` | `clients` (`id_client`) | Sensible aux doublons exacts ou potentiels (ex. meme e-mail a la casse pres) |
| **Clients actifs** | Global | `COUNT(DISTINCT id_client)` avec au moins 1 vente | `clients`, `ventes` | Depend de la fiabilite de la cle `id_client` dans `ventes` |
| **Part sans achat (%)** | Global | `(Clients enregistres - Clients actifs) / Clients enregistres` | `clients`, `ventes` | Ne pas confondre client sans vente et orphelin de jointure |
| **Chiffre d'affaires brut** | Par vente / Par client / Global | `SUM(quantite * prix_unitaire)` | `lignes_vente` (`quantite`, `prix_unitaire`) + `ventes` | Montant brut (hors hypothese sur `remise`) ; attention aux doublons de lignes |
| **Nombre de ventes** | Par client / Global | `COUNT(DISTINCT id_vente)` | `ventes` (`id_vente`, `id_client`) | Ne pas compter les lignes de `lignes_vente` comme des ventes |
| **Panier moyen par vente** | Par client / Global | `CA brut / NULLIF(COUNT(DISTINCT id_vente), 0)` | `ventes`, `lignes_vente` | A distinguer du montant moyen par ligne de produit |
| **Part / Contribution CA (%)** | Par client | `CA client / SUM(CA client) OVER ()` | Resultat agrege par client | Utile pour mesurer la concentration (Top 10 / Pareto) |

## KPI non calculables sans validation ou donnees complementaires
- **CA net fiable :** tant que le format et la regle metier de `remise` ne sont pas confirmes.
- **Recence / RFM fiable :** uniquement si les colonnes de date existent et sont completes/coherentes dans `ventes`.