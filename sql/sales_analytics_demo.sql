-- ============================================================================
-- Learn With AI | Necessary SQL for YouTube demo
-- Repo: https://github.com/Vekri/Postgre
-- Tool: pgAdmin 4 Query Tool  (or psql)
-- ============================================================================

-- --------------------------------------------------------------------------
-- STEP 1 — Run this while connected to database: postgres
-- --------------------------------------------------------------------------
CREATE DATABASE sales_analytics;

-- Then: Refresh Databases → open Query Tool on sales_analytics
-- psql: \c sales_analytics


-- --------------------------------------------------------------------------
-- STEP 2 — Schema + table
-- --------------------------------------------------------------------------
CREATE SCHEMA sales;

CREATE TABLE sales.orders (
    order_id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    amount        NUMERIC(10, 2) NOT NULL CHECK (amount >= 0),
    city          VARCHAR(30) NOT NULL DEFAULT 'Unknown',
    status        VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at    TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- --------------------------------------------------------------------------
-- STEP 3 — Sample data (sales table)
-- --------------------------------------------------------------------------
INSERT INTO sales.orders (customer_name, amount, city, status) VALUES
    ('Ravi',  12000, 'Bangalore', 'paid'),
    ('Priya',  4500, 'Hyderabad', 'pending'),
    ('Arun',  18000, 'Chennai',   'shipped'),
    ('Sneha',  9200, 'Bangalore', 'paid'),
    ('Kiran',  3100, 'Mumbai',    'cancelled'),
    ('Meena', 15500, 'Hyderabad', 'paid');

SELECT * FROM sales.orders ORDER BY order_id;


-- --------------------------------------------------------------------------
-- STEP 4 — Index (faster city filter)
-- --------------------------------------------------------------------------
CREATE INDEX idx_orders_city ON sales.orders (city);

SELECT * FROM sales.orders WHERE city = 'Bangalore';


-- --------------------------------------------------------------------------
-- STEP 5 — Trigger (auto-normalize on INSERT/UPDATE)
-- --------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION sales.touch_order()
RETURNS TRIGGER AS $$
BEGIN
    NEW.city := COALESCE(NULLIF(NEW.city, ''), 'Unknown');
    NEW.status := LOWER(NEW.status);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_orders_biu
BEFORE INSERT OR UPDATE ON sales.orders
FOR EACH ROW
EXECUTE FUNCTION sales.touch_order();


-- --------------------------------------------------------------------------
-- STEP 6 — View + function (analytics on sample data)
-- --------------------------------------------------------------------------
CREATE VIEW sales.v_high_value_orders AS
SELECT order_id, customer_name, amount, city, status
FROM sales.orders
WHERE amount >= 10000
  AND status IN ('paid', 'shipped');

SELECT * FROM sales.v_high_value_orders ORDER BY amount DESC;

CREATE FUNCTION sales.total_paid_revenue()
RETURNS NUMERIC
LANGUAGE sql STABLE AS $$
    SELECT COALESCE(SUM(amount), 0)
    FROM sales.orders
    WHERE status = 'paid';
$$;

SELECT sales.total_paid_revenue();  -- 36700.00
