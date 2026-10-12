
DROP DATABASE IF EXISTS copper_cup;
CREATE DATABASE copper_cup;
USE copper_cup;



CREATE TABLE locations (
    location_id  INT PRIMARY KEY AUTO_INCREMENT,
    city         VARCHAR(50) NOT NULL,
    state        CHAR(2)     NOT NULL,
    opened_date  DATE        NOT NULL
);

INSERT INTO locations (location_id, city, state, opened_date) VALUES
(1, 'Austin',   'TX', '2019-03-15'),
(2, 'Denver',   'CO', '2020-06-01'),
(3, 'Phoenix',  'AZ', '2022-09-10'),
(4, 'Portland', 'OR', '2026-08-20');

CREATE TABLE employees (
    employee_id  INT PRIMARY KEY AUTO_INCREMENT,
    first_name   VARCHAR(50)   NOT NULL,
    last_name    VARCHAR(50)   NOT NULL,
    gender       VARCHAR(10),
    birth_date   DATE,
    hire_date    DATE          NOT NULL,
    job_title    VARCHAR(50)   NOT NULL,
    salary       DECIMAL(10,2),
    location_id  INT           NOT NULL,
    manager_id   INT,
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (manager_id)  REFERENCES employees(employee_id)
);

INSERT INTO employees
(employee_id, first_name, last_name, gender, birth_date, hire_date, job_title, salary, location_id, manager_id) VALUES
(1,  'Maria',   'Delgado', 'Female', '1980-04-12', '2019-01-10', 'Owner',            98000.00, 1, NULL),
(2,  'James',   'Carter',  'Male',   '1986-09-03', '2019-02-01', 'Regional Manager', 72000.00, 1, 1),
(3,  'Priya',   'Nair',    'Female', '1990-11-21', '2019-03-01', 'Store Manager',    58000.00, 1, 2),
(4,  'Daniel',  'Kim',     'Male',   '1992-06-30', '2020-05-15', 'Store Manager',    56000.00, 2, 2),
(5,  'Fatima',  'Yusuf',   'Female', '1994-02-14', '2022-08-01', 'Store Manager',    55000.00, 3, 2),
(6,  'Tyler',   'Brooks',  'Male',   '1999-07-08', '2019-04-12', 'Barista',          36000.00, 1, 3),
(7,  'Sofia',   'Rossi',   'Female', '2001-12-02', '2021-06-20', 'Barista',          34500.00, 1, 3),
(8,  'Marcus',  'Lee',     'Male',   '1997-03-17', '2020-06-01', 'Shift Lead',       41000.00, 2, 4),
(9,  'Hannah',  'Price',   'Female', '2000-10-25', '2020-07-15', 'Barista',          35000.00, 2, 4),
(10, 'Yusuf',   'Demir',   'Male',   '1998-01-30', '2022-09-01', 'Shift Lead',       40500.00, 3, 5),
(11, 'Grace',   'Okafor',  'Female', '2002-05-19', '2023-01-09', 'Barista',          33500.00, 3, 5),
(12, 'Lucas',   'Moreau',  'Male',   '2003-08-11', '2024-03-04', 'Barista',          33000.00, 3, 5),
(13, 'Mei',     'Lin',     'Female', '1995-04-04', '2026-07-01', 'Store Manager',    57000.00, 4, 2),
(14, 'Noah',    'Bennett', 'Male',   NULL,         '2026-08-01', 'Barista',          NULL,     4, 13);

CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(50)  NOT NULL,
    category      VARCHAR(30)  NOT NULL,
    price         DECIMAL(5,2) NOT NULL
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(1,  'Espresso',            'Coffee',       2.95),
(2,  'Americano',           'Coffee',       3.45),
(3,  'Cappuccino',          'Coffee',       4.25),
(4,  'Caramel Latte',       'Coffee',       4.95),
(5,  'Cold Brew',           'Coffee',       4.50),
(6,  'Iced Matcha Latte',   'Tea',          5.25),
(7,  'Chai Latte',          'Tea',          4.75),
(8,  'Hot Chocolate',       'Other Drinks', 3.95),
(9,  'Blueberry Muffin',    'Bakery',       3.25),
(10, 'Butter Croissant',    'Bakery',       3.50),
(11, 'Turkey Panini',       'Food',         8.95),
(12, 'Avocado Toast',       'Food',         7.95),
(13, 'Pumpkin Spice Latte', 'Seasonal',     5.75);


CREATE TABLE customers (
    customer_id     INT PRIMARY KEY AUTO_INCREMENT,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(100) NOT NULL,
    phone           VARCHAR(20),
    city            VARCHAR(50),
    state           CHAR(2),
    birth_date      DATE,
    loyalty_points  INT NOT NULL DEFAULT 0
);

INSERT INTO customers
(customer_id, first_name, last_name, email, phone, city, state, birth_date, loyalty_points) VALUES
(1,  'Ava',      'Thompson', 'ava.thompson@example.com',  '512-555-0142', 'Austin',   'TX', '1993-05-11', 1250),
(2,  'Ethan',    'Walker',   'ethan.walker@example.com',  NULL,           'Austin',   'TX', '1988-02-23',  340),
(3,  'Isabella', 'Garcia',   'bella.garcia@example.com',  '720-555-0187', 'Denver',   'CO', '1996-08-30',  910),
(4,  'Mason',    'Wright',   'mason.wright@example.com',  NULL,           'Denver',   'CO', '1985-12-14',   60),
(5,  'Zoe',      'Patel',    'zoe.patel@example.com',     '602-555-0119', 'Phoenix',  'AZ', '2000-03-02',  780),
(6,  'Liam',     'O''Brien', 'liam.obrien@example.com',   '512-555-0166', 'Austin',   'TX', '1991-07-19',  520),
(7,  'Chloe',    'Martin',   'chloe.martin@example.com',  '480-555-0133', 'Tempe',    'AZ', '1998-11-05',  230),
(8,  'Benjamin', 'Scott',    'ben.scott@example.com',     '303-555-0171', 'Boulder',  'CO', '1979-04-27',  150),
(9,  'Layla',    'Hassan',   'layla.hassan@example.com',  NULL,           'Phoenix',  'AZ', '2002-09-09',   95),
(10, 'Henry',    'Adams',    'henry.adams@example.com',   '720-555-0128', 'Denver',   'CO', '1975-01-31',  410),
(11, 'Mia',      'Robinson', 'mia.robinson@example.com',  '737-555-0154', 'Round Rock','TX', '1999-06-22',   40),
(12, 'Elijah',   'Turner',   'eli.turner@example.com',    '602-555-0190', 'Phoenix',  'AZ', NULL,          300),
(13, 'Aria',     'Nguyen',   'aria.nguyen@example.com',   '303-555-0149', 'Denver',   'CO', '1994-10-08',  670),
(14, 'Samuel',   'Reed',     'sam.reed@example.com',      '512-555-0177', 'Austin',   'TX', '1983-02-16',  880),
(15, 'Nora',     'Fischer',  'nora.fischer@example.com',  '503-555-0102', 'Portland', 'OR', '1997-05-25',    0);


CREATE TABLE orders (
    order_id     INT PRIMARY KEY AUTO_INCREMENT,
    customer_id  INT  NOT NULL,
    location_id  INT  NOT NULL,
    employee_id  INT  NOT NULL,
    order_date   DATE NOT NULL,
    status       VARCHAR(20) NOT NULL DEFAULT 'Completed',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (location_id) REFERENCES locations(location_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO orders (order_id, customer_id, location_id, employee_id, order_date, status) VALUES
(1,  1,  1, 6,  '2026-07-02', 'Completed'),
(2,  2,  1, 7,  '2026-07-03', 'Completed'),
(3,  3,  2, 9,  '2026-07-05', 'Completed'),
(4,  1,  1, 6,  '2026-07-09', 'Completed'),
(5,  4,  2, 8,  '2026-07-12', 'Cancelled'),
(6,  5,  3, 11, '2026-07-15', 'Completed'),
(7,  6,  1, 7,  '2026-07-18', 'Completed'),
(8,  7,  3, 12, '2026-07-22', 'Completed'),
(9,  8,  2, 9,  '2026-07-26', 'Completed'),
(10, 1,  1, 6,  '2026-08-01', 'Completed'),
(11, 9,  3, 10, '2026-08-04', 'Completed'),
(12, 10, 2, 8,  '2026-08-09', 'Completed'),
(13, 3,  2, 9,  '2026-08-13', 'Completed'),
(14, 11, 1, 7,  '2026-08-17', 'Cancelled'),
(15, 12, 3, 11, '2026-08-21', 'Completed'),
(16, 2,  1, 6,  '2026-08-28', 'Completed'),
(17, 13, 2, 9,  '2026-09-03', 'Completed'),
(18, 5,  3, 12, '2026-09-08', 'Completed'),
(19, 14, 1, 7,  '2026-09-14', 'Completed'),
(20, 6,  1, 6,  '2026-09-20', 'Completed');


CREATE TABLE order_items (
    order_id    INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL,
    unit_price  DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 3, 1, 4.25), (1, 9, 1, 3.25),
(2, 5, 2, 4.50),
(3, 4, 1, 4.95), (3, 10, 1, 3.50),
(4, 3, 1, 4.25),
(5, 11, 1, 8.95), (5, 2, 1, 3.45),
(6, 6, 1, 5.25), (6, 12, 1, 7.95),
(7, 1, 2, 2.95),
(8, 7, 1, 4.75), (8, 9, 2, 3.25),
(9, 2, 1, 3.45),
(10, 4, 2, 4.95), (10, 10, 2, 3.50),
(11, 8, 1, 3.95),
(12, 5, 1, 4.50), (12, 11, 1, 8.95),
(13, 3, 1, 4.25),
(14, 6, 1, 5.25),
(15, 1, 1, 2.95), (15, 9, 1, 3.25),
(16, 12, 1, 7.95), (16, 2, 1, 3.45),
(17, 7, 2, 4.75),
(18, 4, 1, 4.95),
(19, 11, 2, 8.95), (19, 5, 2, 4.50),
(20, 3, 1, 4.25), (20, 10, 1, 3.50);


