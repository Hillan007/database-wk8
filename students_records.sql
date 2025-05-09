CREATE DATABASE StudentRecords;
USE StudentRecords;

-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dob DATE NOT NULL
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);

-- Enrollments Table (Many-to-Many Relationship)
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Grades Table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT,
    grade CHAR(2) CHECK (grade IN ('A', 'B', 'C', 'D', 'F')),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);
