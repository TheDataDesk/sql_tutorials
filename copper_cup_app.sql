-- =====================================================================
-- Copper Cup Coffee Co. - App Database (copper_cup_app)
-- The Data Desk  |  github.com/TheDataDesk
--
-- A second, separate database for the Copper Cup mobile app.
-- It stores the reviews customers leave in the app. It only keeps
-- customer_id and product_id, so to see names you join it with
-- the main copper_cup database (load copper_cup first).
-- All reviews are made up.
--
-- HOW TO USE: open this file in MySQL Workbench (File > Open SQL Script),
-- click the lightning bolt to run everything, then refresh SCHEMAS.
-- Running it again resets this database to its original state.
-- It does not change your copper_cup database.
-- =====================================================================

DROP DATABASE IF EXISTS copper_cup_app;
CREATE DATABASE copper_cup_app;
USE copper_cup_app;

-- ---------------------------------------------------------------------
-- reviews: one row per review left in the Copper Cup app
-- customer_id -> copper_cup.customers, product_id -> copper_cup.products
-- ---------------------------------------------------------------------
CREATE TABLE reviews (
    review_id    INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT          NOT NULL,
    product_id   INT          NOT NULL,
    rating       TINYINT      NOT NULL,
    review_date  DATE         NOT NULL,
    review_text  VARCHAR(255)
);

INSERT INTO reviews (review_id, customer_id, product_id, rating, review_date, review_text) VALUES
(1,  1,  3,  5, '2026-07-03', 'Perfect foam every time'),
(2,  2,  5,  4, '2026-07-04', 'Smooth, a little strong'),
(3,  3,  10, 5, '2026-07-06', 'Flaky and fresh'),
(4,  5,  6,  3, '2026-07-16', 'Too sweet for me'),
(5,  6,  1,  5, '2026-07-19', 'Best espresso in Austin'),
(6,  7,  9,  4, '2026-07-23', 'Lots of blueberries'),
(7,  1,  4,  4, '2026-08-02', 'Great, but pricey'),
(8,  9,  8,  5, '2026-08-05', 'Rich and creamy'),
(9,  10, 11, 2, '2026-08-10', 'Bread was dry'),
(10, 12, 1,  4, '2026-08-22', 'Strong and bold'),
(11, 2,  12, 3, '2026-08-29', 'Good but small'),
(12, 13, 7,  5, '2026-09-04', 'Just the right spice'),
(13, 14, 11, 4, '2026-09-15', 'Filling lunch');
