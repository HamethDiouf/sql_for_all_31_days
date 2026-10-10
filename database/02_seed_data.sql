-- Insertion des clients (11 clients du cours du Jour 3)
INSERT INTO clients VALUES
(1, 'Paul', 'Paris', 25, 'paul@mail.com'),
(2, 'Sarah', 'Lyon', 31, 'sarah@mail.com'),
(3, 'Marc', 'Lille', 28, 'marc@mail.com'),
(4, 'Léa', 'Paris', 24, 'lea@mail.com'),
(5, 'Karim', 'Lyon', 35, 'karim@mail.com'),
(6, 'Inès', 'Lille', 29, 'ines@mail.com');

-- Insertion de nouveaux clients (7 et 8) pour le Jour 1
INSERT INTO clients VALUES
(7, 'Hugo', 'Paris', 41, 'hugo@mail.com'),
(8, 'Nina', 'Marseille', 33, 'nina@mail.com');


-- Insertion de nouveaux clients (9 à 11) pour le Jour 3
INSERT INTO clients VALUES
(9, 'Yanis', 'Lyon', 30, 'yanis@mail.com'),
(10, 'Chloé', 'Paris', 35, 'chloe@mail.com'),
(11, 'Omar', 'Lille', 44, 'omar@mail.com');

-- Insertion de nouveaux clients (12 et 13) pour le Jour 3
INSERT INTO clients VALUES
(12, 'Alice', 'Paris', 27, 'alice@mail.com'),
(13, 'Amine', 'Lyon', 38, NULL);

-- Insertion des magasins
INSERT INTO magasins VALUES
(1, 'Paris Centre', 'Paris'),
(2, 'Lyon Part-Dieu', 'Lyon'),
(3, 'Lille Gare', 'Lille'),
(4, 'Marseille Vieux-Port', 'Marseille');

-- Insertion des produits
INSERT INTO produits VALUES
(1, 'Baguette tradition', 'Boulangerie', 1.10, 'Boulco'),
(2, 'Croissant Beurre', 'Boulangerie', 1.20, 'Boulco'),
(3, 'Lait demi-écrémé 1L', 'Laitier', 1.05, 'LaitPur'),
(4, 'Yaourt nature x4', 'Laitier', 2.30, 'LaitPur'),
(5, 'Fromage râpé 200g', 'Laitier', 2.80, NULL),
(6, 'Jus orange 1L', 'Boissons', 2.00, 'Fruitia'),
(7, 'Eau minérale 1.5L', 'Boissons', 0.80, 'AquaClair'),
(8, 'Café moulu 250g', 'Épicerie', 3.50, 'Cafetia'),
(9, 'Pâtes 500g', 'Épicerie', 1.60, 'Savora'),
(10, 'Riz basmati 500g', 'Épicerie', 2.40, NULL),
(11, 'Chocolat noir 100g', 'Épicerie', 1.90, 'ChocoVal'),
(12, 'Biscuits chocolat 300g', 'Biscuits', 2.90, 'ChocoVal'),
(13, 'Pommes 1kg', 'Fruits', 2.60, NULL),
(14, 'Lait de coco 400ml', 'Épicerie', 1.95, 'Savora'),
(15, 'Thé vert 20 sachets', NULL, 2.75, 'Cafetia');

-- Insertion des ventes
INSERT INTO ventes VALUES
(1, 1, 1, 1, '2026-01-03', 3),
(2, 2, 3, 2, '2026-01-10', 2),
(3, 4, 2, 1, '2026-01-15', 6),  
(4, 5, 8, 2, '2026-01-20', 1),
(5, 7, 6, 1, '2026-01-31', 2),
(6, 3, 9, 3, '2026-02-01', 4),
(7, 8, 7, 4, '2026-02-09', 12),
(8, 10, 11, 1, '2026-02-14', 2),
(9, 12, 12, 1, '2026-02-20', 3),
(10, 6, 4, 3, '2026-03-02', 1),
(11, 9, 5, 2, '2026-03-15', 5),
(12, 1, 14, 1, '2026-03-20', 2),
(13, 2, 10, 2, '2026-03-25', 3),
(14, 11, 13, 3, '2026-03-31', 4);