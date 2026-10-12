# PostgreSQL Tutorial Scripts — Learn With AI

Minimal SQL for **pgAdmin 4 Query Tool** (or `psql`) while watching Learn With AI videos.

**Repo:** https://github.com/Vekri/Postgre

## Video order

| # | Topic | SQL file |
|---|--------|----------|
| 1 | Database → Schema → Table → Index → Trigger | `sql/sales_analytics_demo.sql` |
| 2 | **EXPLAIN / EXPLAIN ANALYZE** (next) | `sql/02_explain_analyze_demo.sql` |

## Quick start

### Video 1 — build sales demo
1. Query Tool on `postgres` → run `CREATE DATABASE` from `sales_analytics_demo.sql`
2. Open Query Tool on `sales_analytics` → run the rest

### Video 2 — EXPLAIN (requires Video 1 data)
1. Connect to `sales_analytics`
2. Run `sql/02_explain_analyze_demo.sql` step by step
3. On screen, compare **Seq Scan** (no index) vs **Index Scan** (with index)

## What EXPLAIN teaches

```text
EXPLAIN              → planned steps only
EXPLAIN ANALYZE      → plan + real runtime
Seq Scan             → read whole table
Index Scan           → use index (e.g. city = Bangalore)
Planning/Execution   → time metrics for YouTube demos
```

## Sample data (sales.orders)

| order_id | customer_name | amount | city | status |
|---------:|---------------|-------:|------|--------|
| 1 | Ravi | 12000 | Bangalore | paid |
| 2 | Priya | 4500 | Hyderabad | pending |
| 3 | Arun | 18000 | Chennai | shipped |
| 4 | Sneha | 9200 | Bangalore | paid |
| 5 | Kiran | 3100 | Mumbai | cancelled |
| 6 | Meena | 15500 | Hyderabad | paid |

## Channel

**Learn With AI** — PostgreSQL, Python, data engineering.
