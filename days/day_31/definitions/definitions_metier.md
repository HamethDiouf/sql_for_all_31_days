# Definitions metier — RetailPlus (Jour 31)

- **Client enregistre :** Toute entite presente dans `clients` apres verification de l'unicite de sa cle et controle des doublons potentiels.
- **Client actif :** Client ayant au moins **1 vente** associee dans `ventes`.
- **Client sans achat :** Client enregistre dans `clients` n'ayant aucune vente correspondante dans `ventes`.
- **Client fidele (hypothese de travail a valider) :** Client ayant realise **au moins 3 ventes** (a ajuster selon la distribution reelle observee en Phase 5).
- **Client important :** Notion a expliciter avec le metier selon l'objectif : poids sur le montant brut cumule, regularite des achats ou activite recente.
- **Montant brut vs remise :** En l'absence de confirmation formelle sur la colonne `remise`, l'analyse principale s'appuie sur le **montant brut** (`quantite * prix_unitaire`). Toute hypothese sur `remise` doit etre isolee et documentee.