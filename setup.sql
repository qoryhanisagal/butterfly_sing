
-- This is a comment in SQL


-- In SQL there are two types of statements:
--1. Commmds: These are statements that do not return any data
----   Examples: CREATE, ALTER, DROP, INSERT, UPDATE, DELETE
---- These are statements that change the structure of the database or the data in the database
---- These are statements that when executed effect some change in the database
--   Examples: CREATE TABLE, ALTER TABLE, DROP TABLE, INSERT INTO, UPDATE, DELETE FROM
--2. Queries: These are statements that return data: These are statements when executed return data for read-only purposes
--   Examples: SELECT, SHOW, DESCRIBE
--   These are statements that when executed return data for read-only purposes
--   Examples: SELECT * FROM table_name, SHOW TABLES, DESCRIBE table_name
--   
-- Our basic set up should consist of at least one command to create a database, one command to create a table, and one command to insert data into the table.
--   We will also create a table to store the data for our database
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    hobbies TEXT,
    is_online BOOLEAN DEFAULT 0
);

-- Each table should have a primary key, which is a unique identifier for each row in the table
-- The table name is user
-- SQL is not case-sensitive, but it is a good practice to use lowercase for table and column names
--   Naming tables and columns is important for readability and maintainability
--   The table name should be singular and descriptive of the data it contains
--   The column names should be descriptive of the data they contain
--   The table name should be in lowercase and use underscores to separate words
--   The column names should be in lowercase and use underscores to separate words
--   The table name should be plural and descriptive of the data it contains
--   The column names should be descriptive of the data they contain

--   The primary key is used to uniquely identify each row in the table
--   The primary key is used to enforce the uniqueness of each row in the table
--   The primary keys are not recyclable
-- Your table should have at a minimum one column that is a primary key
-- Constraints are used to enforce the rules of the database
--   id is the primary key for the user table
--   INT(integer) is the data type for the id column
--   AUTO_INCREMENT is used to automatically increment the value of the id column for each new row
--   VARCHAR is used to store variable-length strings
--   45 is the maximum length of the string
--   TEXT is used to store long strings
--       Searching data in the TEXT column is slower than searching data in the VARCHAR column
--   BOOLEAN is used to store true/false values or 1 or 0
--   DEFAULT is used to set a default value for the column
--     The default value for the is_online column is 0
--   The default value is used when no value is provided for the column



-- CRUDS: Commands will do one statement at a time
--   CRUDS is an acronym for Create, Read, Update, Delete, and Search
--   CRUDS is used to describe the basic operations that can be performed on a database
--   1. CREATE: This operation is used to create a new record in the database
--   Always add a comma at the end of the last value to let SQL know that you are done with the values

INSERT INTO user (
    first_name, 
    last_name, 
    hobbies
) VALUES (
    "Koiree", 
    "Descoteaux", 
    "reading, cooking, hiking, traveling, swimming, running, cycling, fishing, hunting, camping"
);
--  This will insert a new record into the user table with the values provided

--   2. READ: This operation is used to read data from the database
--      SELECT is used to read data from the database
--      This will select all columns from the user table where the id is 1. 
--      This is most important select statement

SELECT * FROM user WHERE id = 1;
-- SELECT last_name. first_name, hobbies FROM user WHERE id = 1;
-- SELECT first_name, last_name, hobbies FROM user WHERE first_name = "Koiree" AND last_name = "Descoteaux" AND id = 1;

--   3. Update: This operation is used to update an existing record in the database

UPDATE user
    SET first_name = "Koiree", 
        last_name = "Descoteaux", 
        hobbies = "reading, cooking, running, cycling"
WHERE id = 1;
--   This will update the record in the user table where the id is 1    

--   4. Delete: This operation is used to delete a record from the database
DELETE FROM user WHERE id = 1;
--   This will delete the record from the user table where the id is 1

--   5. Search: This operation is used to search for a record in the database
SELECT * FROM user WHERE first_name = "Koiree" AND last_name = "Descoteaux";

--   This will search for the record in the user table where the first name is Koiree and the last name is Descoteaux^


