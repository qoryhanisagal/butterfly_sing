# Class 2 Mini Challenge – SQL Practice

## 🎯 Objective

This challenge focuses on practicing essential SQL commands and working with related tables using a local SQLite database (`sandbox.db`).

---

## 📝 Mini Challenge Instructions

1. Using your `sandbox.db`, create the following records in your `user` table:
   - Jane Doe — hobbies: playing tennis and video games
   - Tom Jones — hobbies: skiing and birdwatching
   - Jenny Rogers — hobbies: coding and watching YouTube videos
2. Update Tom Jones so that his first name becomes **Thomas**
3. Permanently delete **Jane Doe**’s record from the database
4. Create a report displaying user records ordered by `last_name`, `first_name`

### 🔧 Bonus:
- If you have extra time, create a **`vehicles`** table

---

## ✅ What I Completed

### 🗂 Tables Created:
- `user`: Stores first name, last name, hobbies, and online status
- `vehicles`: Stores vehicle make/model/year and links to a user via `owner_id`
- `service_records`: Stores maintenance data and links to a vehicle via `vehicle_id`

### 📌 Key Features Implemented:
- Inserted required user records and applied update/delete logic
- Ordered user report using `ORDER BY last_name, first_name`
- Created a `vehicles` table with two sample entries (Toyota Camry and Honda Civic)
- Built a `service_records` table with two sample maintenance logs

---

## 🔄 Relational Logic

- I connected service records to vehicles using a `vehicle_id` foreign key
- Then connected vehicles to users using an `owner_id` foreign key
- Used **JOINs with aliases (`sr`, `v`, `u`)** to efficiently pull related data across all three tables

### Final Report Query:

```sql
SELECT
    sr.service_date,
    sr.service_type,
    sr.service_cost,
    v.make,
    v.model,
    v.year,
    u.first_name || ' ' || u.last_name AS owner_name
FROM service_records sr
JOIN vehicles v ON sr.vehicle_id = v.id
JOIN user u ON v.owner_id = u.id
ORDER BY sr.service_date DESC;
```
---

---

## 📈 Output from Final Query

| Date       | Service        | Cost  | Make   | Model | Year | Owner         |
|------------|----------------|-------|--------|--------|------|---------------|
| 2025-01-10 | Tire Rotation  | 49.99 | Honda  | Civic | 2018 | Jenny Rogers   |
| 2024-12-15 | Oil Change     | 89.99 | Toyota | Camry | 2020 | Thomas Jones   |

---

## 💡 What I Learned

- How to write and chain multiple SQL commands in a single file
- How to use `JOIN` statements to pull data from related tables
- How to create clean, readable queries using table aliases (`sr`, `v`, `u`)
- How to order reports by specific fields using `ORDER BY`

---

## 💾 How to Run This Project

```bash
# Load the full setup into SQLite
sqlite3 sandbox.db < setup.sql

# Open the database for manual queries
sqlite3 sandbox.db
```

From there, use:
- `.tables` — see available tables
- `.schema` — view table structure
- `SELECT * FROM ...` — query tables directly

---

## 📁 Relevant Files in This Branch

- `setup.sql`: Full database schema, data inserts, queries, and report logic for this challenge
