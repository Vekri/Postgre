-- ============================================================================
-- Learn With AI | NEXT VIDEO — PostgreSQL EXPLAIN / EXPLAIN ANALYZE
-- Repo: https://github.com/Vekri/Postgre
-- Requires: sales_analytics database + sales.orders from sales_analytics_demo.sql
-- ============================================================================

-- Connect Query Tool to: sales_analytics

-- --------------------------------------------------------------------------
-- 0) Confirm sample data is loaded
-- --------------------------------------------------------------------------
SELECT order_id, customer_name, amount, city, status
FROM sales.orders
ORDER BY order_id;


-- --------------------------------------------------------------------------
-- 1) EXPLAIN — shows the PLAN only (does NOT run the query for real results)
--    Read bottom → top: how PostgreSQL intends to get rows
-- --------------------------------------------------------------------------
EXPLAIN
SELECT * FROM sales.orders
WHERE city = 'Bangalore';


-- --------------------------------------------------------------------------
-- 2) EXPLAIN ANALYZE — runs the query and shows ACTUAL time + rows
--    Use this to prove if an index helped
-- --------------------------------------------------------------------------
EXPLAIN ANALYZE
SELECT * FROM sales.orders
WHERE city = 'Bangalore';


-- --------------------------------------------------------------------------
-- 3) Friendly format for YouTube / teaching screens
-- --------------------------------------------------------------------------
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT * FROM sales.orders
WHERE city = 'Bangalore';


-- --------------------------------------------------------------------------
-- 4) Compare: filter without using city index vs with index
--    Drop index temporarily to demo Seq Scan, then recreate
-- --------------------------------------------------------------------------
DROP INDEX IF EXISTS sales.idx_orders_city;

EXPLAIN ANALYZE
SELECT * FROM sales.orders
WHERE city = 'Bangalore';
-- Expect: Seq Scan on orders  (reads all rows, then filters)

CREATE INDEX idx_orders_city ON sales.orders (city);

EXPLAIN ANALYZE
SELECT * FROM sales.orders
WHERE city = 'Bangalore';
-- Expect: Index Scan / Bitmap Index Scan using idx_orders_city


-- --------------------------------------------------------------------------
-- 5) Aggregation plan — GROUP BY city paid revenue
-- --------------------------------------------------------------------------
EXPLAIN ANALYZE
SELECT city,
       COUNT(*) AS paid_orders,
       SUM(amount) AS paid_revenue
FROM sales.orders
WHERE status = 'paid'
GROUP BY city
ORDER BY paid_revenue DESC;


-- --------------------------------------------------------------------------
-- 6) Window function plan — RANK within city
-- --------------------------------------------------------------------------
EXPLAIN ANALYZE
SELECT customer_name, city, amount,
       RANK() OVER (
           PARTITION BY city
           ORDER BY amount DESC
       ) AS city_rank
FROM sales.orders;


-- --------------------------------------------------------------------------
-- 7) What YouTubers should say on screen (cheat sheet)
-- --------------------------------------------------------------------------
-- Seq Scan     = read whole table (OK for tiny tables; costly at scale)
-- Index Scan   = use index to find matching rows fast
-- Filter       = condition applied after reading
-- Planning Time / Execution Time = analyzer metrics
-- Always test with EXPLAIN ANALYZE before/after CREATE INDEX
