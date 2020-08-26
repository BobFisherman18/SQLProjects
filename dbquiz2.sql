DROP DATABASE IF EXISTS dbquiz2;
CREATE DATABASE IF NOT EXISTS dbquiz2;
USE dbquiz2;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS student,
					 classes;
					 
/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;

CREATE TABLE students (
    student_ID      INT    AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    address     VARCHAR(50),
	
    PRIMARY KEY (student_ID)
);

CREATE TABLE classes (
    class_ID    INT        AUTO_INCREMENT,
    class_number VARCHAR(20),
	class_name   VARCHAR(50),
	dept         VARCHAR(50),
    PRIMARY KEY (class_ID)
);

CREATE TABLE student_enrolled (
	student_ID      INT    AUTO_INCREMENT,
	class_ID    INT,
	PRIMARY KEY (student_ID, class_ID),
    FOREIGN KEY (student_ID) REFERENCES students(student_ID),
	FOREIGN KEY (class_ID) REFERENCES classes(class_ID)
	
);


flush /*!50503 binary */ logs;

SELECT 'LOADING students' as 'INFO';
source load_students.dump ;
SELECT 'LOADING classes' as 'INFO';
source load_classes.dump ;
SELECT 'LOADING student_enrolled' as 'INFO';
source load_student_enrolled.dump ;
