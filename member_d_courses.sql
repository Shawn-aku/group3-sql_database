-- =========================================================
-- Desire De Dieu Manzi  Jabo Member D — Courses table

-- =========================================================

USE alu_db;

-- 1. CREATE TABLE 
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
