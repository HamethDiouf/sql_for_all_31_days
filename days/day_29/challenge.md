# 🎯 Challenge - Jour 29 : Qualité et fiabilité des données (Analyse client)

## Objectifs
- Diagnostiquer en lecture seule (`SELECT`) les doublons exacts et potentiels, les `NULL` / chaînes vides, les valeurs aberrantes et les écarts de totaux.
- Comprendre pourquoi `= NULL` ne fonctionne pas et comment `NULL` affecte agrégats, moyennes, jointures et `NOT IN`.
- Mesurer l'impact des anomalies sur les totaux et les classements (avec et sans lignes à vérifier) sans modifier ni supprimer de données.
- Construire une analyse client fiable (fréquence `COUNT(DISTINCT id_vente)`, volume/lignes, montant brut, panier moyen et rangs comparés).

## Contrôles & Cas Fil Rouge
1. **Doublons clients & ventes :** Détecter doublons exacts, doublons potentiels après normalisation (`LOWER(TRIM(...))`) avec identifiant canonique (`MIN(...) OVER (PARTITION BY ...)`), et doublons suspects dans `lignes_vente`.
2. **Audit des `NULL` et vides :** Compter les valeurs manquantes (`COUNT(*) - COUNT(col)`) et chaînes vides (`TRIM(col) = ''`), puis lister les fiches incomplètes.
3. **Valeurs aberrantes & cohérence des totaux :** Appliquer des règles de contrôle sur `quantite`, `prix_unitaire` et `remise`, réconcilier les totaux avant/après jointure avec `ventes`, repérer les orphelines (`LEFT JOIN ... IS NULL`) et diagnostiquer le risque de double comptage.
4. **Cas fil rouge — Analyse client :** Regrouper les fiches partageant le même e-mail normalisé sous un `id_client_canonique`, signaler les lignes à vérifier, calculer `nombre_ventes`, `montant_brut_total`, `montant_brut_hors_anomalies`, `panier_moyen_brut` et comparer les classements.