-- ============================================
-- ALTER TABLE
-- Adding columns and constraints
-- ============================================


-- 1. Add loyalty points to customers
ALTER TABLE customers
ADD COLUMN loyalty_points INT DEFAULT 0;


-- 2. Add a CHECK constraint
-- Loyalty points cannot be negative
ALTER TABLE customers
ADD CONSTRAINT chk_loyalty_points
CHECK (loyalty_points >= 0);


-- 3. Add brand information to products
ALTER TABLE products
ADD COLUMN brand VARCHAR(50);