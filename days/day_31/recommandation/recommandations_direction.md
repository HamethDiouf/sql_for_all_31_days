# Phase 9 — Restitution et recommandations a la direction

> **Rigueur d'analyse :** Distinguer systematiquement les **faits** (chiffres issus de nos requetes sur RetailPlus), les **hypotheses** (a verifier) et les **recommandations** (actions proposees).

## 1. Faits observes (a renseigner avec tes chiffres reels)
- *Exemple de structure :* "Sur RetailPlus, [X] clients sont enregistres pour [Y] clients actifs, avec un CA brut total de [Z] sur [N] ventes." (Completer chaque chiffre a partir des requetes de `phase_05_07_analyse.sql`.)

## 2. Hypotheses a verifier
- *Exemple :* "On peut supposer que les clients sans achat n'ont pas encore trouve d'offre adaptee ou n'ont pas ete sollicites depuis leur inscription."
- *Exemple :* "On peut supposer que les clients occasionnels a fort panier ont un potentiel de fidelisation rapide si l'on encourage une 2e et 3e commande."

## 3. Recommandations d'actions par segment
- **Clients fideles / a forte valeur :** mettre en place un programme de reconnaissance ou d'avantages cibles pour proteger la retention et limiter le churn.
- **Clients occasionnels :** proposer des offres de relance ou de reachat ciblees apres le premier achat pour faire croitre la frequence.
- **Clients sans achat / inactifs :** lancer une campagne de reactivation segmentee et auditer l'origine de ces fiches clients.

## 4. Limites et informations manquantes
- Format exact et regle metier de `remise` non encore confirmes.
- Couverture/fiabilite des dates et traitement des cas particuliers (doublons potentiels, orphelins, valeurs atypiques) a valider avec le metier.