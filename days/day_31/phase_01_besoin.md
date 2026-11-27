# Phase 1 — Comprendre le besoin metier

## 1. Reformulation du besoin
La direction de **RetailPlus** souhaite structurer une analyse client fiable afin de mieux connaitre sa base, mesurer la contribution de chaque client et identifier des leviers d'action commerciale. L'analyse doit appuyer deux decisions concretes : **fideliser les clients a forte valeur/regularite** et **reactiver ou convertir les clients inactifs ou occasionnels**.

## 2. Questions metier mesurables
1. **Base et activation :** Combien de clients sont enregistres, combien ont realise au moins une vente et quelle part n'a jamais achete ?
2. **Valeur monetaire :** Quels clients generent le plus de chiffre d'affaires brut (`quantite * prix_unitaire`), et quel est le panier moyen par vente et par client ?
3. **Frequence :** Combien de ventes realise chaque client, et quelle part effectue un achat unique contre des achats recurrents ?
4. **Concentration :** Quel pourcentage du chiffre d'affaires brut est porte par le Top 10 des clients ?
5. **Segmentation :** Comment repartir les clients en segments actionnables selon des regles explicites et justifiees ?
6. **Temporalite / Perimetre :** Quelles dates sont disponibles et fiables dans `ventes`, et observe-t-on des variations selon les magasins ou periodes ?

## 3. Points a confirmer avec la direction
- Definition metier exacte attendue pour un **client important** (priorite au montant brut, a la frequence ou a la recence).
- Seuil exact retenu pour un **client fidele** (ex. `>= 2` ou `>= 3` ventes).
- Format et signification exacts de `remise` avant tout calcul de montant net.
- Fiabilite et couverture temporelle des dates dans `ventes`.