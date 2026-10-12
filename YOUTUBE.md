# YouTube Titles & Descriptions — Learn With AI

Code: https://github.com/Vekri/Postgre

---

# VIDEO 1 — Objects (Database → Trigger)

## SHORT
**Title:** `PostgreSQL in 60 Seconds | Database → Schema → Table → Index → Trigger`

**Description:**
```
PostgreSQL in 60 seconds — Database, Schema, Table, Index, Trigger, View, Function.

📦 Free SQL: https://github.com/Vekri/Postgre
Subscribe to Learn With AI 🔔

#PostgreSQL #SQL #YouTubeShorts #LearnWithAI
```

## LONG
**Title:** `PostgreSQL Full Tutorial | sales Table with Sample Data (Database to Triggers)`

**Description:**
```
Full-screen PostgreSQL masterclass with sales.orders sample data.

📦 SQL: https://github.com/Vekri/Postgre
File: sql/sales_analytics_demo.sql

#PostgreSQL #SQLTutorial #pgAdmin #LearnWithAI
```

---

# VIDEO 2 — EXPLAIN / EXPLAIN ANALYZE (NEXT)

## What this video explains (for you / viewers)

PostgreSQL does not guess randomly how to run SQL. It builds a **query plan**.

| Command | Meaning |
|---------|---------|
| `EXPLAIN` | Show the plan only (cheap, no full execution focus) |
| `EXPLAIN ANALYZE` | **Run** the query and show **actual** time + rows |
| `Seq Scan` | Read the whole `sales.orders` table |
| `Index Scan` | Use `idx_orders_city` for `WHERE city = 'Bangalore'` |

**YouTube demo story:**  
1. `EXPLAIN ANALYZE` with index dropped → **Seq Scan**  
2. Recreate index → **Index Scan**  
3. Say: “Same SQL, different plan — this is how pros tune queries.”

## SHORT (~1 min)

### Title
```
PostgreSQL EXPLAIN in 60 Seconds | Seq Scan vs Index Scan
```

### Description
```
Why is my SQL slow? PostgreSQL EXPLAIN shows the plan.

✅ EXPLAIN vs EXPLAIN ANALYZE
✅ Seq Scan (full table read)
✅ Index Scan (fast city filter on sales.orders)
✅ Before/after CREATE INDEX

📦 Free SQL:
https://github.com/Vekri/Postgre
File: sql/02_explain_analyze_demo.sql

Prerequisite: run Video 1 script first (sales sample data).

Subscribe to Learn With AI 🔔

#PostgreSQL #EXPLAIN #SQLPerformance #YouTubeShorts #LearnWithAI
```

## LONG (~8–10 min)

### Title
```
PostgreSQL EXPLAIN ANALYZE Tutorial | Make sales Queries Faster with Indexes
```

### Description
```
Learn PostgreSQL EXPLAIN and EXPLAIN ANALYZE with a real sales.orders table.

In this tutorial you will:
• Read a query plan bottom → top
• Understand Seq Scan vs Index Scan
• Use EXPLAIN ANALYZE on WHERE city = 'Bangalore'
• Drop and recreate idx_orders_city to prove the difference live
• Explain GROUP BY and window function plans
• Know when an index helps — and when it does not on tiny tables

📦 Free SQL (copy & run in pgAdmin):
https://github.com/Vekri/Postgre

Files:
1) sql/sales_analytics_demo.sql   ← create sample data first
2) sql/02_explain_analyze_demo.sql ← EXPLAIN lessons

How to run:
1. Open Query Tool on sales_analytics
2. Run EXPLAIN, then EXPLAIN ANALYZE
3. DROP INDEX → see Seq Scan
4. CREATE INDEX → see Index Scan
5. Compare Planning Time and Execution Time on screen

Next on Learn With AI: JOINs on sales data / Window Functions deep dive / Python + PostgreSQL.

🔔 Subscribe to Learn With AI

#PostgreSQL #EXPLAINANALYZE #SQLOptimization #pgAdmin #DataEngineering #SQLInterview #LearnWithAI
```

### Pinned comment
```
SQL for this video 👉 https://github.com/Vekri/Postgre/blob/main/sql/02_explain_analyze_demo.sql
Did your plan show Seq Scan or Index Scan? Comment below!
```

### On-camera voice cues (Long)
```
0:00  What is a query plan?
0:40  EXPLAIN on sales.orders
1:30  EXPLAIN ANALYZE — actual time
2:30  Bangalore filter — 2 rows (Ravi, Sneha)
3:20  DROP INDEX → Seq Scan demo
4:30  CREATE INDEX → Index Scan demo
5:30  GROUP BY paid revenue plan
6:30  Window RANK plan
7:30  Rules of thumb + subscribe
```
