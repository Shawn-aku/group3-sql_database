CREATE DATABASE ALU_GP3_DATABASE;
-- ================================
-- Member A: Students Table
-- ================================

-- 1 & 2 & 3: CREATE TABLE with PK and FK
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- 4: Insert at least 5 sample rows
INSERT INTO Students VALUES (1, 'Shawn Dark', 'shawn@alu.edu', 1, '2024-09-01');
INSERT INTO Students VALUES (2, 'Amara Noneik', 'amara@alu.edu', 1, '2024-09-01');
INSERT INTO Students VALUES (3, 'Kofi Mesiah', 'kofi@alu.edu', 2, '2024-09-02');
INSERT INTO Students VALUES (4, 'Fatima Nkosi', 'fatima@alu.edu', 2, '2024-09-03');
INSERT INTO Students VALUES (5, 'Kyleeh shiga', 'kyleeh@alu.edu', 3, '2024-09-04');

-- 5: UPDATE and DELETE
UPDATE Students SET email = 'shawn.dark@alu.edu' WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 5;

-- 6: SELECT with WHERE
SELECT * FROM Students WHERE classroom_id = 1;
-- ================================
-- Member C: Faculty Table
-- ================================

-- CREATE TABLE
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

-- INSERT 5 sample rows
INSERT INTO Faculty (faculty_id, name, email, department)
VALUES
(1, 'John Smith', 'john.smith@alu.edu', 'Computer Science'),
(2, 'Mary Johnson', 'mary.johnson@alu.edu', 'Mathematics'),
(3, 'David Brown', 'david.brown@alu.edu', 'Business'),
(4, 'Sarah Wilson', 'sarah.wilson@alu.edu', 'Engineering'),
(5, 'Grace Niyonzima', 'grace.niyonzima@alu.edu', 'Information Systems');

-- UPDATE statement
UPDATE Faculty
SET department = 'Software Engineering'
WHERE faculty_id = 1;

-- DELETE statement
DELETE FROM Faculty
WHERE faculty_id = 5;

-- SELECT statement
SELECT *
FROM Faculty
WHERE department = 'Mathematics';
