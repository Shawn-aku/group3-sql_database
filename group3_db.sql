CREATE DATABASE ALU_GRP3_DATABASE;
	CREATE TABLE Extra_Curricular_Activities (
		activity_id INT PRIMARY KEY AUTO-INCREMENT,
		activity_name VARCHAR(100),
		category VARCHAR(50),
		FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
	);
