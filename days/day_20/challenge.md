# 🎯 Challenge - Jour 20 : CASE WHEN et Segmentation

## Objectifs
- Créer des segments de ventes dynamiques (`Faible`, `Moyen`, `Eleve`) à l'aide de l'expression conditionnelle `CASE WHEN`.
- Construire des indicateurs conditionnels performants avec `SUM(CASE WHEN ...)`.
- Maîtriser l'ordre d'évaluation des conditions et le traitement sécurisé des valeurs `NULL`.
- Distinguer l'approche de classification (`CASE WHEN`) de l'approche de filtrage (`WHERE`).

## Exercices Pratiques (RetailPlus)
1. **Segmentation des lignes :** Affichez chaque ligne de vente avec son montant brut (`quantite * prix_unitaire`) et son segment, en traitant explicitement les éventuelles valeurs manquantes (`NULL`).
2. **Agrégation par segment :** Utilisez une sous-requête pour segmenter chaque ligne, puis regroupez (`GROUP BY`) pour obtenir le nombre de lignes et le chiffre d'affaires par segment, triés dans l'ordre logique métier.
3. **Indicateurs conditionnels multiples :** En une seule requête, calculez le nombre de lignes et le montant cumulé pour les ventes élevées ($\ge 500$).
4. **Segmentation au niveau commande :** Calculez le montant total par `id_vente` (panier global) et attribuez un segment à chaque commande.