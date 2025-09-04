# README: SQL JOIN Workflow

This project explores how JOINs work in SQL using an Airbnb-style database.

## JOIN Workflow

1. **INNER JOIN**

   - Combines rows from two tables where there is a match in both.
   - Returns only the matching records.

2. **LEFT JOIN**

   - Returns all rows from the left table, and matching rows from the right.
   - Non-matching rows from the right appear as NULL.

3. **RIGHT JOIN**

   - Returns all rows from the right table, and matching rows from the left.
   - Non-matching rows from the left appear as NULL.

4. **FULL OUTER JOIN**
   - Returns all rows when there is a match in either table.
   - In MySQL/MariaDB, it can be simulated using `LEFT JOIN` + `RIGHT JOIN` with `UNION`.

## Notes

- JOINs help connect related data across tables.
- Aliases (like `u` for User, `b` for Booking) are optional but improve readability.

# SQL Subquery Workflow

This project demonstrates how **subqueries** work in SQL using an Airbnb-style database.

---

## Subquery Workflow

1. **Definition**

   - A subquery is a **query inside another query**.
   - It can return a single value, a list of values, or a table of rows.

2. **Usage Types**

   - **In WHERE clauses** → filter results based on values from another table.
   - **In SELECT statements** → calculate derived values for each row.
   - **In FROM clauses** → treat the subquery as a temporary table.

3. **Execution Flow**

   1. Inner query (subquery) is executed first.
   2. Results from the subquery are passed to the outer query.
   3. The outer query uses those results to filter, compare, or calculate final output.

4. **Notes**
   - Subqueries can be **scalar**, **multi-row**, or **multi-column**.
   - They allow dynamic filtering and complex queries without manually joining tables.
   - In some cases, subqueries can be replaced with JOINs for performance optimization.
