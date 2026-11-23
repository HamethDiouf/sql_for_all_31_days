# 🎯 Challenge - Jour 27 : Problèmes analytiques réels (Bout en bout)

## Objectifs
- Appliquer la démarche en 6 étapes (*Demande → Indicateur → Données → Requête → Contrôle → Conclusion*) sur des cas métier inspirés de `RetailPlus`.
- Sélectionner le bon outil SQL (`WHERE`, `GROUP BY`, `HAVING`, `JOIN`, CTE/sous-requête, fenêtrage) selon la question posée.
- Détecter et corriger les pièges classiques : confusion volume vs valeur, comparaison à la mauvaise moyenne, double comptage par jointure N–N (`emplacements`) ou `COUNT(*)` au lieu de `COUNT(DISTINCT id_vente)`.
- Contrôler systématiquement les résultats (`COUNT(*)` avant/après, sommes de contrôle, limites d'interprétation).

## Cas & Exercices Pratiques
1. **Produits en volume & classement (Cas 1) :** Classer les produits par quantité vendue et comparer `ROW_NUMBER()`, `RANK()` et `DENSE_RANK()` face aux ex æquo.
2. **Contribution au montant brut (Cas 2 & 4) :** Calculer le montant brut (`quantite * prix_unitaire`), la part en `%` (`SUM() OVER ()`) et le rang, en comparant l'approche agrégée (`GROUP BY`) et le maintien du détail (`PARTITION BY`).
3. **Produits au-dessus de la moyenne & clients actifs (Cas 3 & 6) :** Comparer chaque produit à la moyenne des totaux par produit (via CTE), et distinguer `COUNT(*)`, `COUNT(DISTINCT id_vente)` et `COUNT(DISTINCT id_produit)` par client.
4. **Évolution temporelle, magasins & audit de jointure (Cas 5, 7 & 8) :** Analyser l'évolution mensuelle (`LAG`, cumul, moyenne mobile), comparer les magasins avec écart à la moyenne, et diagnostiquer une multiplication de lignes après jointure (`emplacements`).