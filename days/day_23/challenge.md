# 🎯 Challenge - Jour 23 : Structurer les requêtes longues avec des CTE (`WITH`)

## Objectifs
- Décomposer une requête complexe en étapes logiques nommées à l'aide de la clause `WITH`.
- Transformer des sous-requêtes ou tables dérivées en CTE pour maximiser la lisibilité.
- Enchaîner plusieurs CTE dépendantes pour croiser des indicateurs agrégés.
- Comparer l'usage des CTE, des sous-requêtes et des tables temporaires.

## Exercices Pratiques (RetailPlus)
1. **Exercice 1 :** Calculer la quantité totale vendue par produit en isolant le calcul dans une CTE.
2. **Exercice 2 :** Filtrer les produits dont la quantité totale vendue dépasse un seuil de 5 unités à partir d'une CTE.
3. **Exercice 3 :** Calculer le montant brut total (`quantite * prix_unitaire`) par produit via une CTE dédiée.
4. **Exercice 4 :** Comparer les totaux par produit à la moyenne globale des totaux en utilisant deux CTE enchaînées et un `CROSS JOIN`.
5. **Exercice 5 (Synthèse) :** Combiner plusieurs CTE pour extraire à la fois la quantité totale et le montant brut par produit, puis filtrer sur les produits dont le total dépasse 5 unités.