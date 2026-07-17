CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Studnet_Courses (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-09-01'),
(1, 2, '2025-09-01'),
(2, 1, '2025-09-02'),
(3, 3, '2025-09-01'),
(4, 2, '2025-09-03');
-==================================
--GRP TASK 1: 3 join QUERIES
-==================================
-- QUERY 1: Student enrolled in Course, taught by Faculty, in Classroom
SELECT 
    s.name AS student_name,
    c.course_name,
    f.name AS faculty_name,
    cl.room_number
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;
 
-- QUERY 2: Student participates in Activity, advised by Faculty
SELECT 
    s.name AS student_name,
    a.activity_name,
    f.name AS advisor_name
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;

-- QUERY 3: Faculty teaches Course in Classroom
SELECT 
    f.name AS faculty_name,
    c.course_name,
    cl.room_number,
    cl.building
FROM Faculty f
JOIN Courses c ON f.faculty_id = c.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-===============================
--GRP TASK: Aggregated query
-===============================
-- QUERY :Aggregated  query
SELECT
    c.course_name,
    COUNT(sc.student_id) AS total_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_students DESC;
=======
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
-- ================================
-- Member E: Extra_Curricular_Activities Table
-- ================================

-- CREATE TABLE
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100),
    category VARCHAR(50),
    faculty_advisor_id INT,
    FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

-- INSERT 5 sample rows
INSERT INTO Extra_Curricular_Activities (activity_id, activity_name, category, faculty_advisor_id)
VALUES
(1, 'Football Club', 'Sports', 1),
(2, 'Debate Club', 'Academic', 2),
(3, 'Coding Club', 'Technology', 3),
(4, 'Drama Club', 'Arts', 4),
(5, 'Music Club', 'Arts', 1);

-- UPDATE statement
UPDATE Extra_Curricular_Activities
SET category = 'STEM'
WHERE activity_id = 3;

-- DELETE statement
DELETE FROM Extra_Curricular_Activities
WHERE activity_id = 5;

-- SELECT statement
SELECT *
FROM Extra_Curricular_Activities
WHERE category = 'Sports';
>>>>>>> main:
