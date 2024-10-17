USE FitnessCenter_db;


CREATE TABLE Members (
	id INT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	age INT
);

CREATE TABLE WorkoutSessions (
	session_id INT PRIMARY KEY,
	member_id INT,
	session_date DATE,
	session_time VARCHAR(50),
	activity VARCHAR(255),
FOREIGN KEY (member_id) REFERENCES Members(id)
);

INSERT INTO Members (id, name, age)
VALUES 
(123, 'Jane Doe', '34'),
(456, 'John Smith', 20),
(789, 'Bob lowe', 24),
(012, 'Alice Brown', 28);

SELECT * FROM Members;

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES
(1, 123, '2024-10-12', 'Morning', 'Cardio'),
(2, 456, '2024-10-20', 'Afternoon', 'Core'),
(3, 789, '2024-10-12', 'Morning', 'Full Body'),
(4, 012, '2024-10-8', 'Evening', 'Zumba');

SELECT * FROM WorkoutSessions;

UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = 123;

-- john smith cancelled membership

SET SQL_SAFE_UPDATES = 0;
DELETE FROM WorkoutSessions
WHERE member_id = 456;
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Members
WHERE id = 456;
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Members;