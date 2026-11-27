# Regles de qualite des donnees — RetailPlus

| ID | Controle | Condition / critere | Nature | Action / decision proposee |
| :--- | :--- | :--- | :--- | :--- |
| RQ-01 | Unicite cle client | `id_client` duplique ou `NULL` | Erreur critique | Bloquer l'analyse client tant que la cle n'est pas clarifiee |
| RQ-02 | Doublon potentiel client | Meme `LOWER(TRIM(email))` sur plusieurs lignes | A verifier | Signaler au metier ; ne pas fusionner/supprimer sans validation |
| RQ-03 | Integrite `ventes -> clients` | `id_client` absent de `clients` ou `NULL` | A verifier / Erreur | Isoler les ventes orphelines et verifier si des achats anonymes existent |
| RQ-04 | Quantites & prix | `quantite <= 0` ou `prix_unitaire < 0` | A verifier | Verifier s'il s'agit de retours/avoirs ou d'erreurs de saisie |
| RQ-05 | Remise | Valeur hors norme ou format ambigu | A verifier | Documenter l'ambiguite et calculer le montant brut en priorite |
| RQ-06 | Double comptage jointures | Hausse inattendue de `COUNT(*)` ou du CA apres `JOIN` | Erreur de requete | Verifier la granularite avant jointure et reconcilier les totaux |