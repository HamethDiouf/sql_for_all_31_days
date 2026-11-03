# Day 14 - Consolidation et Challenge Final (Semaine 2)

## Objectif

Mobiliser de manière totalement autonome l'ensemble des compétences acquises du Jour 8 au Jour 13 : analyser un besoin métier complexe, identifier les tables nécessaires, enchaîner des jointures (`INNER JOIN` et `LEFT JOIN`), anticiper la granularité et appliquer un protocole rigoureux de contrôle (sans masquer les erreurs avec `DISTINCT`).

---

## Le Challenge Principal : La Vue Complète des Ventes

Le responsable RetailPlus souhaite une vue détaillée globale pour analyser l'ensemble de l'activité. Pour chaque vente, le résultat doit afficher :
- L'identifiant de la vente et sa date (`ventes`)
- Le client associé : prénom et nom (`clients`)
- Le magasin où l'achat a eu lieu (`magasins`)
- Le détail de la ligne d'achat : identifiant de la ligne et quantité (`lignes_vente`)
- Le produit acheté et sa catégorie (`produits` et `categories`)

### Les Contraintes du Challenge :
1. **Granularité** : Le résultat doit avoir une granularité de *« une ligne par ligne de vente »*.
2. **Tables à écarter** : La table `emplacements` ne doit **pas** être jointe (car elle n'est pas nécessaire au besoin et risquerait de multiplier artificiellement les lignes).
3. **Robustesse** : Utiliser des `LEFT JOIN` judicieux là où des données peuvent être absentes (ex: ventes sans client rattaché), et des `INNER JOIN` sécurisés par des contrôles d'intégrité.
4. **Contrôles obligatoires** : Valider le volume des lignes avant/après chaque jointure et vérifier l'absence d'anomalies de duplication sur la clé primaire de détail (`id_ligne`).

---

## Exercices et Défis Bonus

1. **Bonus A (Contrôle de flux)** : En partant de la table `lignes_vente`, ajoutez les jointures une par une et comparez le `COUNT(*)` à chaque étape pour expliquer les variations de volumes.
2. **Bonus B (Vue exhaustive)** : Modifiez la requête pour partir de la table `ventes` avec uniquement des `LEFT JOIN` afin de conserver l'intégralité des tickets, même ceux ne comportant aucune ligne de vente ou aucun client.
3. **Bonus C (Chasse aux anomalies)** : Utilisez `GROUP BY` et `HAVING COUNT(*) > 1` sur les différentes clés (`id_vente`, `id_ligne`) pour prouver mathématiquement qu'il n'y a pas de doublons illégitimes sur le détail des lignes.