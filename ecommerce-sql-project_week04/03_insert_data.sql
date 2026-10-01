-- ============================================
-- E-Commerce Database - Sample Data
-- ============================================

-- 1. Categories
INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Fashion'),
('Books'),
('Home Appliances'),
('Sports');


-- 2. Customers
INSERT INTO customers
(first_name, last_name, email, city, phone)
VALUES
('Aarav', 'Sharma', 'aarav@gmail.com', 'Bengaluru', '9876543210'),
('Ananya', 'Patil', 'ananya@gmail.com', 'Mumbai', '9876543211'),
('Rahul', 'Verma', 'rahul@gmail.com', 'Delhi', NULL),
('Sneha', 'Rao', 'sneha@gmail.com', 'Bengaluru', '9876543213'),
('Vikram', 'Singh', 'vikram@gmail.com', NULL, '9876543214'),
('Priya', 'Nair', 'priya@gmail.com', 'Chennai', NULL);


-- 3. Products
INSERT INTO products
(product_name, category_id, price, stock_quantity, description)
VALUES
('Wireless Mouse', 1, 799.00, 50, 'Ergonomic wireless mouse'),
('Mechanical Keyboard', 1, 2499.00, 30, 'RGB mechanical keyboard'),
('USB-C Cable', 1, 499.00, 100, 'Fast charging cable'),
('Running Shoes', 5, 2999.00, 25, 'Lightweight running shoes'),
('T-Shirt', 2, 899.00, 60, 'Cotton round neck t-shirt'),
('SQL Beginner Book', 3, 599.00, 40, 'SQL learning guide'),
('Air Fryer', 4, 4999.00, 15, 'Digital air fryer'),
('Yoga Mat', 5, 999.00, 35, 'Non-slip yoga mat');


-- 4. Orders
INSERT INTO orders
(customer_id, order_date, status)
VALUES
(1, '2026-01-05 10:30:00', 'Delivered'),
(2, '2026-01-08 14:20:00', 'Delivered'),
(1, '2026-02-10 11:15:00', 'Shipped'),
(3, '2026-02-15 16:40:00', 'Delivered'),
(4, '2026-03-01 09:10:00', 'Pending'),
(2, '2026-03-12 18:30:00', 'Cancelled'),
(5, '2026-03-20 13:45:00', 'Delivered');


-- 5. Order Items
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 2, 799.00),
(1, 6, 1, 599.00),

(2, 4, 1, 2999.00),
(2, 5, 2, 899.00),

(3, 2, 1, 2499.00),
(3, 3, 2, 499.00),

(4, 7, 1, 4999.00),

(5, 8, 2, 999.00),

(6, 1, 1, 799.00),

(7, 5, 3, 899.00);