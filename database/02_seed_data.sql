-- ==========================================
-- 02_seed_data.sql - RetailPlus (PostgreSQL)
-- ==========================================

-- 1. Insertion des clients (Prénom et Nom séparés)
INSERT INTO clients VALUES
(1, 'Paul', 'Martin', 'Paris', 25, 'paul@mail.com'),
(2, 'Sarah', 'Cohen', 'Lyon', 31, 'sarah@mail.com'),
(3, 'Marc', 'Dubois', 'Lille', 28, NULL),
(4, 'Léa', 'Bernard', 'Paris', 24, 'lea@mail.com'),
(5, 'Karim', 'Benali', 'Lyon', 35, 'karim@mail.com'),
(6, 'Inès', 'Moreau', 'Lille', 29, NULL),
(7, 'Hugo', 'Petit', 'Paris', 41, 'hugo@mail.com'),
(8, 'Nina', 'Lopez', 'Marseille', 33, 'nina@mail.com'),
(9, 'Yanis', 'Haddad', 'Lyon', 30, 'yanis@mail.com'),
(10, 'Chloé', 'Girard', 'Paris', 35, 'chloe@mail.com'),
(11, 'Omar', 'Diallo', 'Lille', 44, NULL),
(12, 'Alice', 'Fontaine', 'Paris', 27, 'alice@mail.com'),
(13, 'Amine', 'Mansour', 'Lyon', 38, NULL);

-- 2. Insertion des magasins
INSERT INTO magasins VALUES
(1, 'Paris Centre', 'Paris', 1200),
(2, 'Lyon Part-Dieu', 'Lyon', 2100),
(3, 'Lille Gare', 'Lille', 850),
(4, 'Marseille Vieux-Port', 'Marseille', 1500),
(5, 'Bordeaux Lac', 'Bordeaux', 2600),
(6, 'Nantes Centre', 'Nantes', 1800);

-- 3. Insertion des catégories (nécessaire pour la table produits)
INSERT INTO categories VALUES
(1, 'Boulangerie'),
(2, 'Laitier'),
(3, 'Boissons'),
(4, 'Épicerie'),
(5, 'Biscuits'),
(6, 'Fruits');

-- 4. Insertion des produits (17 produits, incluant les produits 16 et 17 jamais vendus)
INSERT INTO produits VALUES
(1, 'Baguette tradition', 1, 1.10, 'Boulco'),
(2, 'Croissant Beurre', 1, 1.20, 'Boulco'),
(3, 'Lait demi-écrémé 1L', 2, 1.05, 'LaitPur'),
(4, 'Yaourt nature x4', 2, 2.30, 'LaitPur'),
(5, 'Fromage râpé 200g', 2, 2.80, NULL),
(6, 'Jus orange 1L', 3, 2.00, 'Fruitia'),
(7, 'Eau minérale 1.5L', 3, 0.80, 'AquaClair'),
(8, 'Café moulu 250g', 4, 3.50, 'Cafetia'),
(9, 'Pâtes 500g', 4, 1.60, 'Savora'),
(10, 'Riz basmati 500g', 4, 2.40, NULL),
(11, 'Chocolat noir 100g', 4, 1.90, 'ChocoVal'),
(12, 'Biscuits chocolat 300g', 5, 2.90, 'ChocoVal'),
(13, 'Pommes 1kg', 6, 2.60, NULL),
(14, 'Lait de coco 400ml', 4, 1.95, 'Savora'),
(15, 'Thé vert 20 sachets', NULL, 2.75, 'Cafetia'),
(16, 'Miel acacia 250g', 4, 5.90, 'ApiBon'),
(17, 'Huile olive 1L', 4, 6.50, NULL);

-- 5. Insertion des ventes (En-têtes de tickets - 14 ventes avec mode_paiement)
INSERT INTO ventes VALUES
(1, 1, 1, '2026-01-03', 'Carte'),
(2, 2, 2, '2026-01-10', 'Especes'),
(3, 4, 1, '2026-01-15', 'Carte'), 
(4, 5, 2, '2026-01-20', NULL),
(5, 7, 1, '2026-01-31', 'Carte'),
(6, 3, 3, '2026-02-01', 'Cheque'),
(7, 8, 4, '2026-02-09', 'Carte'),
(8, 10, 1, '2026-02-14', 'Especes'),
(9, 12, 1, '2026-02-20', 'Carte'),
(10, 6, 3, '2026-03-02', 'Cheque'),
(11, 9, 2, '2026-03-15', 'Carte'),
(12, 1, 1, '2026-03-20', 'Especes'),
(13, 2, 2, '2026-03-25', 'Carte'),
(14, 11, 3, '2026-03-31', 'Cheque');

-- 6. Insertion des lignes de vente (22 lignes de détail des articles par ticket)
INSERT INTO lignes_vente VALUES
(1, 1, 1, 3, 1.10, NULL),
(2, 1, 3, 2, 1.05, NULL),
(3, 2, 8, 1, 3.50, 10),
(4, 2, 9, 4, 1.60, NULL),
(5, 3, 2, 6, 1.20, 5),
(6, 3, 4, 2, 2.30, NULL),
(7, 4, 5, 1, 2.80, NULL),
(8, 4, 6, 2, 2.00, 10),
(9, 5, 7, 12, 0.80, NULL),
(10, 5, 11, 2, 1.90, NULL),
(11, 6, 10, 1, 2.40, NULL),
(12, 6, 13, 3, 2.60, 15),
(13, 7, 12, 5, 2.90, NULL),
(14, 7, 14, 2, 1.95, NULL),
(15, 8, 8, 2, 3.50, NULL),
(16, 8, 15, 1, 2.75, 20),
(17, 8, 1, 1, 1.10, NULL),
(18, 9, 1, 2, 1.10, NULL),
(19, 9, 3, 1, 1.05, NULL),
(20, 10, 7, 1, 0.80, NULL),
(21, 10, 9, 2, 1.60, NULL),
(22, 10, 11, 1, 1.90, NULL);

-- 7. Insertion des emplacements
INSERT INTO emplacements VALUES
(1, 1, 1, 'Boulangerie', 1),
(2, 1, 3, 'Frais', 2),
(3, 1, 8, 'Épicerie', 3),
(4, 1, 6, 'Boissons', NULL),
(5, 2, 3, 'Frais', 1),
(6, 2, 11, 'Épicerie', NULL),
(7, 2, 8, 'Épicerie', 2),
(8, 3, 9, 'Épicerie', 4);