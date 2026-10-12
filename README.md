# PostgreSQL Tutorial Scripts — Learn With AI

Minimal SQL you can run in **pgAdmin 4 Query Tool** (or `psql`) while watching the Learn With AI videos.

**Repo:** https://github.com/Vekri/Postgre

## Quick start (pgAdmin 4)

1. Open **pgAdmin 4** → connect to your PostgreSQL server.
2. Open **Query Tool** on the default `postgres` database.
3. Run **Step 1 only** from `sql/sales_analytics_demo.sql` (`CREATE DATABASE`).
4. Refresh **Databases** → right-click `sales_analytics` → **Query Tool**.
5. Run the remaining steps in order (schema → table → sample data → index → trigger → view → function).

## Files

| File | Use |
|------|-----|
| `sql/sales_analytics_demo.sql` | **Necessary code only** — one clean script for the full video |
| `YOUTUBE.md` | Short + Long video titles and descriptions (copy-paste ready) |

## What the demo builds

```text
Database: sales_analytics
  Schema: sales
    Table: orders (+ 6 sample rows)
    Index, Trigger, View, Function
```

## Sample data preview

| order_id | customer_name | amount | city | status |
|---------:|---------------|-------:|------|--------|
| 1 | Ravi | 12000 | Bangalore | paid |
| 2 | Priya | 4500 | Hyderabad | pending |
| 3 | Arun | 18000 | Chennai | shipped |
| 4 | Sneha | 9200 | Bangalore | paid |
| 5 | Kiran | 3100 | Mumbai | cancelled |
| 6 | Meena | 15500 | Hyderabad | paid |

## Channel

Subscribe to **Learn With AI** for PostgreSQL, Python, and data engineering tutorials.
