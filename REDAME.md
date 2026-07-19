# ALU-GP3-DATABASE

A relational database project built for the ALU Database group assignment. It models a small academic institution — students, faculty, classrooms, courses, and extracurricular activities — and demonstrates schema design, CRUD operations, joins, and aggregation in MySQL.

## contributors
Shawn  , question 1 --> creating Table A: "Students" and  its content 
Beryl, question 2  --> creating Table B : "Classroom" and its content
Desire de Dieu, question4 --> creating table D:  "Courses" and its content
Mireille, question 3  --> creating Table C : "Faculty" and its contents
Daniella question 5  --> Creating the student-courses table, 3 join quer and aggregated query
Belin question 5  --> Creating the student-activites table and its content
Kelvin, question 5  --> creating Table E: "Extracurricular-activities" and its content

## Overview

The database is organized around five core entities, each originally owned by a different group member, plus two junction tables that resolve many-to-many relationships:

| Table | Description | Owner |
|---|---|---|
| `Classroom` | Physical rooms available for classes | Member B |
| `Students` | Enrolled students and their assigned classroom | Member A |
| `Faculty` | Teaching staff and their department | Member C |
| `Courses` | Courses offered, linked to a faculty member and a classroom | Member D |
| `Extra_Curricular_Activities` | Clubs/activities, each with a faculty advisor | Member E |
| `Student_Courses` | Junction table linking students to the courses they take | Group |
| `Student_Activities` | Junction table linking students to the activities they join | Group |

## Entity Relationship Summary

- A **Student** belongs to one `Classroom`.
- A **Course** is taught by one `Faculty` member and held in one `Classroom`.
- An **Extra_Curricular_Activity** is advised by one `Faculty` member.
- **Students** and **Courses** have a many-to-many relationship, resolved by `Student_Courses`.
- **Students** and **Activities** have a many-to-many relationship, resolved by `Student_Activities`.

```
Classroom ──< Students
Classroom ──< Courses >── Faculty
Faculty   ──< Extra_Curricular_Activities
Students ──< Student_Courses >── Courses
Students ──< Student_Activities >── Extra_Curricular_Activities
```

## Setup

### Prerequisites
- MySQL Server installed and running
- Terminal access with a MySQL user that has `CREATE DATABASE` privileges

### Running the script

From your Linux terminal (not inside the `mysql>` prompt):

```bash
sudo mysql < group3_db.sql
```

If the database already exists from a previous run, drop it first for a clean slate:

```bash
sudo mysql -e "DROP DATABASE ALU_GP3_DATABASE;"
sudo mysql < group3_db.sql
```

The script will:
1. Create the `ALU_GP3_DATABASE` database and switch to it.
2. Create all five core tables plus the two junction tables.
3. Populate every table with sample data.
4. Run a set of `UPDATE`, `DELETE`, and `SELECT` statements demonstrating CRUD operations for each entity.
5. Run three `JOIN` queries and one aggregate query across the full schema.

## Normalization

The schema is normalized to at least 3NF. Each table stores only the attributes that depend on its own primary key — for example, `Courses` references `faculty_id` and `classroom_id` rather than duplicating faculty or classroom details inline. Many-to-many relationships are handled through dedicated junction tables (`Student_Courses`, `Student_Activities`) that store only the linking foreign keys plus relationship-specific attributes (`join_date`, `role`), avoiding duplication of student, course, or activity data.

## Sample Queries

**Query 1 — Student enrolled in Course, taught by Faculty, in Classroom**
```sql
SELECT s.name AS student_name, c.course_name, f.name AS faculty_name, cl.room_number
FROM Student_Courses sc
JOIN Students s ON sc.student_id = s.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;
```

**Query 2 — Student participates in Activity, advised by Faculty**
```sql
SELECT s.name AS student_name, a.activity_name, f.name AS advisor_name
FROM Student_Activities sa
JOIN Students s ON sa.student_id = s.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;
```

**Query 3 — Faculty teaches Course in Classroom**
```sql
SELECT f.name AS faculty_name, c.course_name, cl.room_number, cl.building
FROM Faculty f
JOIN Courses c ON f.faculty_id = c.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;
```

**Aggregate — Total students per course**
```sql
SELECT c.course_name, COUNT(sc.student_id) AS total_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_students DESC;
```

## Notes on Deletion Order

Because `Courses` and `Extra_Curricular_Activities` both hold foreign keys pointing to `Faculty`, any `DELETE` against a `Faculty` row must happen **after** removing or reassigning dependent rows in those child tables. The script deletes the dependent `Courses` row before deleting the corresponding `Faculty` row to avoid a foreign key constraint violation (`ERROR 1451`).

## Contributors

Group 3 — ALU Database Project, organized by table ownership as listed above, with joins and aggregation completed collaboratively.
