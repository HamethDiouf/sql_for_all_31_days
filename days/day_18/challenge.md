# Day 18 - KPI et Indicateurs Business (Semaine 3)

## Objectif

Transformer les données brutes de la table `lignes_vente` en indicateurs de pilotage fiables : le chiffre d'affaires brut et net, le panier moyen (via une sous-requête groupée par commande) et le taux de remise global pondéré, tout en évitant les pièges méthodologiques.

---

## Les Notions Clés du Jour

- **Métrique vs KPI** : Une métrique est un simple calcul brut (ex: somme des lignes), tandis qu'un KPI est un indicateur de performance suivi pour piloter et comparer face à un objectif.
- **Granularité et Agrandissement** : Ne jamais confondre le niveau de détail d'une ligne de vente (un produit dans un ticket) et le niveau d'une commande (le ticket global).
- **Le Panier Moyen** : S'obtient en calculant d'abord le montant par commande (`GROUP BY id_vente`), puis en faisant la moyenne de ces montants via une sous-requête (`AVG(montant_commande)`). Ne jamais faire un `AVG()` direct sur les lignes de détail.
- **Taux de Remise Global Pondéré** : Rapport entre la remise totale estimée et le montant brut total (`Σ(remise) / Σ(montant_brut) * 100`), évitant ainsi la distorsion d'une moyenne simple des taux.

---

## Exercices Pratiques

À partir de la table `lignes_vente` de votre base RetailPlus :
1. **Inspection** : Affichez 10 lignes avec les colonnes clés (`id_ligne`, `id_vente`, `quantite`, `prix_unitaire`, `remise`) et analysez la distribution de la remise (`MIN`, `MAX`, valeurs `NULL`).
2. **Montant brut par ligne** : Calculez le montant brut de chaque ligne (`quantite * prix_unitaire`).
3. **Chiffre d'affaires brut total** : Calculez la somme globale de tous les montants bruts.
4. **Montant brut par commande** : Regroupez par `id_vente` pour obtenir le montant total de chaque ticket.
5. **Panier moyen brut** : Calculez le panier moyen en combinant une sous-requête par commande et la fonction `AVG()`.
6. **Taux de remise global pondéré** : Calculez la part du montant brut abandonnée en remise.