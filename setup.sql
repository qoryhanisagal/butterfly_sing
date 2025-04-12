CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    hobbies TEXT,
    is_online BOOLEAN DEFAULT 0
);

INSERT INTO user (
    first_name, 
    last_name, 
    hobbies
) VALUES (
    "Koiree", 
    "Descoteaux", 
    "reading, cooking, hiking, traveling, swimming, running, cycling, fishing, hunting, camping"
);


SELECT * FROM user WHERE id = 1;


UPDATE user
    SET first_name = "Koiree", 
        last_name = "Descoteaux", 
        hobbies = "reading, cooking, running, cycling"
WHERE id = 1;

DELETE FROM user WHERE id = 1;

SELECT * FROM user WHERE first_name = "Koiree" AND last_name = "Descoteaux";




