CREATE DATABASE ALU_GRP3_DATABASE;
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);	
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
