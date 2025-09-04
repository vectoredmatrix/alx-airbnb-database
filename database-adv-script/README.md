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
