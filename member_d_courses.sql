-- =========================================================
-- Member D — Courses table
-- Depends on: Faculty (Member C), Classroom (Member B)
-- Run this AFTER Faculty and Classroom tables exist and have data.
-- =========================================================

USE alu_db;

-- 1. CREATE TABLE with PK + FKs
CREATE TABLE Courses (
    course_id     INT AUTO_INCREMENT PRIMARY KEY,
    course_name   VARCHAR(100) NOT NULL,
    credits       INT NOT NULL,
    faculty_id    INT,
    classroom_id  INT,
    FOREIGN KEY (faculty_id)   REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- 2. INSERT sample rows
-- IMPORTANT: before running these, check the real IDs in your
-- teammates' tables — don't guess:
--   SELECT * FROM Faculty;
--   SELECT * FROM Classroom;
-- Then swap the faculty_id / classroom_id values below to match.

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id)
VALUES ('Introduction to Databases', 3, 1, 1);

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id)
VALUES ('Data Structures', 4, 2, 2);

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id)
VALUES ('Software Engineering Principles', 3, 3, 3);

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id)
VALUES ('Operating Systems', 4, 4, 1);

INSERT INTO Courses (course_name, credits, faculty_id, classroom_id)
VALUES ('Computer Networks', 3, 5, 2);

-- 3. UPDATE
UPDATE Courses
SET credits = 4
WHERE course_id = 1;

-- 4. DELETE
DELETE FROM Courses
WHERE course_id = 5;

-- 5. SELECT with WHERE
SELECT *
FROM Courses
WHERE credits >= 4;
