# Class 2 – SQL CRUDS Examples (In-Class Practice)

## 🎯 Purpose

This README documents an in-class SQL exercise where I practiced the basic CRUDS operations using SQLite. It represents one of my early steps in learning how databases work — not just by reading concepts, but by actually writing and executing real commands.

---

## 📘 What I Learned

- The difference between **commands** (which change data or structure) and **queries** (which return data for viewing)
- The meaning and application of **CRUDS**:
  1. **Create** — how to structure and insert new data
  2. **Read** — how to fetch records using `SELECT`
  3. **Update** — how to modify existing data
  4. **Delete** — how to remove records permanently
  5. **Search** — how to filter and locate data using `WHERE` conditions
- How to properly define a table using `CREATE TABLE`, including:
  - Choosing the right data types (`VARCHAR`, `TEXT`, `BOOLEAN`)
  - Setting a `PRIMARY KEY` with `AUTOINCREMENT`
  - Using `DEFAULT` values for columns

---

## 🛠 What I Practiced in This Setup

### Table Created:
- **`user`**: A table to store individual user records with:
  - `id` (INTEGER, primary key)
  - `first_name` (VARCHAR)
  - `last_name` (VARCHAR)
  - `hobbies` (TEXT)
  - `is_online` (BOOLEAN)

### SQL Operations I Executed:

```sql
-- Create the user table
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    hobbies TEXT,
    is_online BOOLEAN DEFAULT 0
);
```

```sql
-- Insert a user
INSERT INTO user (first_name, last_name, hobbies)
VALUES ("Koiree", "Descoteaux", "reading, cooking, hiking, traveling, swimming");
```

```sql
-- Read the user by ID
SELECT * FROM user WHERE id = 1;
```

```sql
-- Update the user's hobbies
UPDATE user
SET hobbies = "reading, cooking, running, cycling"
WHERE id = 1;
```

```sql
-- Delete the user by ID
DELETE FROM user WHERE id = 1;
```

```sql
-- Search by name
SELECT * FROM user WHERE first_name = "Koiree" AND last_name = "Descoteaux";
```
---

## 💡 Reflections

This was one of my latest practical exposures to SQL. Before this session, I didn’t fully understand how structured queries were built, or the difference between what alters data and what simply retrieves it. Writing the `CREATE`, `INSERT`, `UPDATE`, and `DELETE` commands helped me realize how logical and readable SQL syntax can be.

Something that really stood out was how CRUDS forms the foundation of most applications that rely on databases — from small tools to full-scale web apps. I also learned how important it is to plan your table structure thoughtfully, and how using constraints like `PRIMARY KEY` and `DEFAULT` helps enforce rules behind the scenes.

I’m starting to see how these basics will connect to future projects — especially when building full stack applications where I’ll be integrating SQL with frontend and backend code.

---

## 💾 How to Run This Practice Locally

```bash
# Load the setup file into SQLite
sqlite3 sandbox.db < setup.sql

# Enter the SQLite shell
sqlite3 sandbox.db
```

Once inside:
- Use `.tables` to see available tables
- Use `.schema` to view column structure
- Run any `SELECT`, `UPDATE`, or `DELETE` queries to test your knowledge

---

## 📁 File in This Branch

- `setup.sql`: Includes all table creation, insert, and query commands written during this practice session
