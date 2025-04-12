-- I'm dropping the tables if they already exist so I can re-run this file during testing without errors.
-- This helps me start with a clean slate by removing any old versions of the tables each time I reload the data.
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS user;

-- 1. Create the user table to store information about each person
-- Each user has a unique ID, a first name, a last name, hobbies, and online status
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    hobbies TEXT,
    is_online BOOLEAN DEFAULT 0
);

-- 1.1 Add a record for Jane Doe with her hobbies and online status
-- I'm inserting a new user record for Jane, including her hobbies and online status
INSERT INTO user (
    first_name,
    last_name,
    hobbies,
    is_online
) VALUES (
    "Jane",
    "Doe",
    "playing tennis, video games",
    1
);

-- 1.2 Add a record for Tom Jones with his hobbies and online status
-- Here, I'm adding a record for Tom and noting his hobbies and online status
INSERT INTO user (
    first_name,
    last_name,
    hobbies,
    is_online
) VALUES (
    "Tom",
    "Jones",
    "skiing, bird watching",
    1
);

-- 1.3 Add a record for Jenny Rogers with her hobbies and online status
-- I'm also inserting a record for Jenny, capturing her hobbies and online status
INSERT INTO user (
    first_name,
    last_name,
    hobbies,
    is_online
) VALUES (
    "Jenny",
    "Rogers",
    "coding, watching YouTube videos",
    1
);

-- 2. Update Tom Jones' record so that his first name is changed to Thomas
-- I'm modifying Tom's record to change his first name to Thomas
UPDATE user
SET first_name = "Thomas"
WHERE first_name = "Tom" AND last_name = "Jones";

-- 3. Permanently remove Jane Doe's record from the table
-- I'm deleting Jane's record from the user table based on her name
DELETE FROM user
WHERE first_name = "Jane" AND last_name = "Doe";

-- 4. Retrieve all user records and sort them by last name and first name
-- I'm selecting all user records and sorting them alphabetically by last and first name
SELECT
    last_name,
    first_name,
    hobbies,
    is_online
FROM user
ORDER BY
    last_name,
    first_name;

-- 5. Create a vehicles table to store information about each user's car
-- Each vehicle is linked to a user by the owner_id foreign key
CREATE TABLE vehicles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    make VARCHAR(50),
    model VARCHAR(50),
    year INTEGER,
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES user(id)
);

-- I'm inserting a vehicle owned by Thomas (user id 2)
INSERT INTO vehicles (
    make,
    model,
    year,
    owner_id
) VALUES (
    "Toyota",
    "Camry",
    2020,
    2
);

-- I'm also inserting a vehicle owned by Jenny (user id 3)
INSERT INTO vehicles (
    make,
    model,
    year,
    owner_id
) VALUES (
    "Honda",
    "Civic",
    2018,
    3
);

-- 6. Join the vehicles and user tables to display each car with its owner's full name
-- I'm using an INNER JOIN here to combine the vehicle info with the user data using owner_id
-- I'm using table aliases in this query to make it easier to read.
-- 'v' is an alias for 'vehicles' and 'u' is an alias for 'user'.
-- These are just short nicknames I assign after each table name using this syntax: FROM table_name alias_name.
-- I can then reference columns using alias_name.column_name (like v.make or u.first_name).
SELECT
    v.make,
    v.model,
    v.year,
    u.first_name || ' ' || u.last_name AS owner_name
FROM vehicles v
JOIN user u ON v.owner_id = u.id;

-- 7. Create a service_records table to keep track of maintenance for each vehicle
-- Each record includes the service type, date, and cost, and is linked to a specific vehicle
CREATE TABLE service_records (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vehicle_id INTEGER,
    service_type VARCHAR(100),
    service_date DATE,  
    service_cost DECIMAL(10, 2),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

-- I'm inserting a service record for Thomas's vehicle (vehicle id 1)
INSERT INTO service_records (
    vehicle_id,
    service_type,
    service_date,
    service_cost
) VALUES (
    1,
    "Oil Change",
    "2024-12-15",
    89.99
);

-- I'm inserting a service record for Jenny's vehicle (vehicle id 2)
INSERT INTO service_records (
    vehicle_id,
    service_type,
    service_date,
    service_cost
) VALUES (
    2,
    "Tire Rotation",
    "2025-01-10",
    49.99
);

-- 8. Create a full report showing each service with the car details and owner's name
-- I'm joining all three tables: service_records, vehicles, and user to get a comprehensive view
-- The ORDER BY clause displays the most recent service first
-- I'm using aliases here too: 'sr' stands for service_records, 'v' stands for vehicles, and 'u' stands for user.
-- This lets me write shorter column references like sr.service_date or u.first_name || ' ' || u.last_name.
-- It keeps the query readable when joining multiple tables.
SELECT
    sr.service_date, -- From the service record (sr)
    sr.service_type,
    sr.service_cost,
    v.make,         -- From the vehicle (v)
    v.model,
    v.year,
    u.first_name || ' ' || u.last_name AS owner_name
FROM service_records sr
JOIN vehicles v ON sr.vehicle_id = v.id -- Connect service records to vehicles
JOIN user u ON v.owner_id = u.id        -- Connect vehicles to users
ORDER BY sr.service_date DESC; -- 'DESC' means descending order, so the most recent service appears first based on the date
