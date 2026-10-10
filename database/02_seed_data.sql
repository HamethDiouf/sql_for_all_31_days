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
(1, 'Baguette', 'Boulangerie', 1.10),
(2, 'Croissant', 'Boulangerie', 1.20),
(3, 'Lait', 'Laitier', 1.05),
(4, 'Fromage', 'Laitier', 4.50),
(5, 'Jus orange', 'Boissons', 2.20),
(6, 'Eau', 'Boissons', 0.80),
(7, 'Pommes', 'Fruits', 2.40),
(8, 'Cookies', 'Biscuits', 2.90);

-- Insertion des ventes
INSERT INTO ventes VALUES
(1, 1, 1, 1, '2025-01-05', 3),
(2, 2, 3, 2, '2025-01-08', 2),
(3, 3, 4, 3, '2025-01-12', 1),
(4, 1, 8, 1, '2025-02-02', 4),
(5, 5, 5, 2, '2025-02-10', 2),
(6, 4, 2, 1, '2025-02-14', 6),
(7, 7, 7, 1, '2025-03-03', 5),
(8, 8, 6, 4, '2025-03-09', 12),
(9, 2, 4, 2, '2025-03-15', 1),
(10, 6, 3, 3, '2025-04-01', 3),
(11, 10, 1, 1, '2025-04-07', 2),
(12, 9, 5, 2, '2025-04-20', 4);