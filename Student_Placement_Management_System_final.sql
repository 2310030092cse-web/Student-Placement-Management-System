-- Student Placement Management System
-- MySQL database project for student, company, application, and placement management.

-- STUDENT PLACEMENT MANAGEMENT SYSTEM
-- B.Tech Mini Project - MySQL
-- companies, applications, and placement outcomes.

DROP DATABASE IF EXISTS student_placement_management;
CREATE DATABASE student_placement_management;
USE student_placement_management;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT NOT NULL,
    graduation_year YEAR NOT NULL,
    cgpa DECIMAL(3,2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL UNIQUE,
    job_role VARCHAR(100) NOT NULL,
    package_lpa DECIMAL(5,2) NOT NULL,
    minimum_cgpa DECIMAL(3,2) NOT NULL
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    company_id INT NOT NULL,
    application_date DATE NOT NULL,
    application_status ENUM('Applied', 'Shortlisted', 'Rejected', 'Selected') DEFAULT 'Applied',
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    UNIQUE (student_id, company_id)
);

CREATE TABLE placements (
    placement_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL UNIQUE,
    company_id INT NOT NULL,
    placement_date DATE NOT NULL,
    package_lpa DECIMAL(5,2) NOT NULL,
    placement_status ENUM('Placed', 'Internship') DEFAULT 'Placed',
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

INSERT INTO departments (department_name) VALUES
('Computer Science and Engineering'),
('Electronics and Communication Engineering'),
('Electrical and Electronics Engineering'),
('Mechanical Engineering'),
('Information Technology');

INSERT INTO students
(student_name, email, department_id, graduation_year, cgpa)
VALUES
('Aarav Sharma', 'aarav.sharma@example.com', 1, 2026, 8.72),
('Priya Reddy', 'priya.reddy@example.com', 1, 2026, 9.10),
('Rahul Kumar', 'rahul.kumar@example.com', 1, 2026, 7.85),
('Sneha Patel', 'sneha.patel@example.com', 2, 2026, 8.45),
('Arjun Rao', 'arjun.rao@example.com', 2, 2026, 7.92),
('Kavya Nair', 'kavya.nair@example.com', 3, 2026, 8.80),
('Vikram Singh', 'vikram.singh@example.com', 3, 2026, 7.65),
('Ananya Das', 'ananya.das@example.com', 4, 2026, 8.20),
('Rohit Verma', 'rohit.verma@example.com', 4, 2026, 7.55),
('Meera Iyer', 'meera.iyer@example.com', 5, 2026, 9.25),
('Aditya Joshi', 'aditya.joshi@example.com', 5, 2026, 8.60),
('Nisha Gupta', 'nisha.gupta@example.com', 1, 2026, 8.05),
('Kiran Reddy', 'kiran.reddy@example.com', 2, 2026, 8.30),
('Pooja Menon', 'pooja.menon@example.com', 5, 2026, 7.90),
('Sanjay Rao', 'sanjay.rao@example.com', 1, 2026, 7.40);

INSERT INTO companies
(company_name, job_role, package_lpa, minimum_cgpa)
VALUES
('Cognizant', 'Programmer Analyst', 6.75, 7.50),
('Infosys', 'Systems Engineer', 5.00, 7.00),
('TCS', 'Graduate Engineer Trainee', 7.20, 7.50),
('Accenture', 'Associate Software Engineer', 6.50, 7.50),
('Wipro', 'Project Engineer', 4.50, 7.00),
('Tech Mahindra', 'Software Engineer', 5.50, 7.25);

INSERT INTO applications
(student_id, company_id, application_date, application_status)
VALUES
(1, 1, '2026-01-10', 'Selected'),
(1, 2, '2026-01-15', 'Shortlisted'),
(1, 4, '2026-01-20', 'Rejected'),

(2, 1, '2026-01-11', 'Selected'),
(2, 3, '2026-01-16', 'Selected'),
(2, 4, '2026-01-21', 'Shortlisted'),

(3, 2, '2026-01-12', 'Selected'),
(3, 5, '2026-01-18', 'Rejected'),

(4, 2, '2026-01-13', 'Selected'),
(4, 6, '2026-01-19', 'Shortlisted'),

(5, 3, '2026-01-14', 'Rejected'),
(5, 5, '2026-01-20', 'Selected'),

(6, 1, '2026-01-15', 'Selected'),
(6, 3, '2026-01-22', 'Selected'),

(7, 5, '2026-01-16', 'Rejected'),
(7, 6, '2026-01-23', 'Shortlisted'),

(8, 4, '2026-01-17', 'Selected'),
(8, 5, '2026-01-24', 'Rejected'),

(9, 2, '2026-01-18', 'Selected'),
(9, 5, '2026-01-25', 'Rejected'),

(10, 1, '2026-01-19', 'Selected'),
(10, 3, '2026-01-26', 'Selected'),

(11, 1, '2026-01-20', 'Selected'),
(11, 4, '2026-01-27', 'Selected'),

(12, 2, '2026-01-21', 'Shortlisted'),
(12, 5, '2026-01-28', 'Selected'),

(13, 3, '2026-01-22', 'Shortlisted'),
(13, 6, '2026-01-29', 'Selected'),

(14, 2, '2026-01-23', 'Selected'),
(14, 4, '2026-01-30', 'Rejected'),

(15, 1, '2026-01-24', 'Rejected'),
(15, 5, '2026-01-31', 'Shortlisted');

-- the final placement outcome.

INSERT INTO placements
(student_id, company_id, placement_date, package_lpa, placement_status)
VALUES
(1, 1, '2026-02-10', 6.75, 'Placed'),
(2, 3, '2026-02-11', 7.20, 'Placed'),
(3, 2, '2026-02-12', 5.00, 'Placed'),
(4, 2, '2026-02-13', 5.00, 'Placed'),
(5, 5, '2026-02-14', 4.50, 'Placed'),
(6, 1, '2026-02-15', 6.75, 'Placed'),
(8, 4, '2026-02-17', 6.50, 'Placed'),
(9, 2, '2026-02-18', 5.00, 'Placed'),
(10, 3, '2026-02-19', 7.20, 'Placed'),
(11, 1, '2026-02-20', 6.75, 'Placed'),
(12, 5, '2026-02-21', 4.50, 'Placed'),
(13, 6, '2026-02-22', 5.50, 'Placed'),
(14, 2, '2026-02-23', 5.00, 'Placed');

SELECT * FROM students;

SELECT student_id, student_name, cgpa
FROM students
WHERE cgpa > 8.50
ORDER BY cgpa DESC;

SELECT company_name, job_role, package_lpa
FROM companies
WHERE package_lpa > 6.00
ORDER BY package_lpa DESC;

UPDATE students
SET cgpa = 7.95
WHERE student_id = 3;

SELECT *
FROM applications
WHERE application_status = 'Selected';

SELECT
    s.student_name,
    d.department_name,
    s.cgpa
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
ORDER BY s.student_name;

SELECT
    s.student_name,
    d.department_name,
    c.company_name,
    p.package_lpa,
    p.placement_date
FROM placements p
JOIN students s
    ON p.student_id = s.student_id
JOIN departments d
    ON s.department_id = d.department_id
JOIN companies c
    ON p.company_id = c.company_id
ORDER BY p.package_lpa DESC;

SELECT
    s.student_name,
    c.company_name,
    c.job_role,
    a.application_status
FROM applications a
JOIN students s
    ON a.student_id = s.student_id
JOIN companies c
    ON a.company_id = c.company_id
ORDER BY s.student_name;

SELECT
    s.student_name,
    d.department_name,
    p.package_lpa
FROM placements p
JOIN students s
    ON p.student_id = s.student_id
JOIN departments d
    ON s.department_id = d.department_id
JOIN companies c
    ON p.company_id = c.company_id
WHERE c.company_name = 'Cognizant';

SELECT
    d.department_name,
    COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_students DESC;

SELECT
    d.department_name,
    ROUND(AVG(s.cgpa), 2) AS average_cgpa
FROM departments d
JOIN students s
    ON d.department_id = s.department_id
GROUP BY d.department_id, d.department_name
ORDER BY average_cgpa DESC;

SELECT
    c.company_name,
    ROUND(AVG(p.package_lpa), 2) AS average_package_lpa,
    COUNT(p.placement_id) AS students_placed
FROM companies c
LEFT JOIN placements p
    ON c.company_id = p.company_id
GROUP BY c.company_id, c.company_name
ORDER BY average_package_lpa DESC;

SELECT
    MAX(package_lpa) AS highest_package_lpa
FROM placements;

SELECT
    c.company_name,
    COUNT(p.placement_id) AS number_of_placements
FROM companies c
LEFT JOIN placements p
    ON c.company_id = p.company_id
GROUP BY c.company_id, c.company_name
ORDER BY number_of_placements DESC;

SELECT student_name, cgpa
FROM students
WHERE cgpa > (
    SELECT AVG(cgpa)
    FROM students
)
ORDER BY cgpa DESC;

-- average placement package
SELECT
    s.student_name,
    c.company_name,
    p.package_lpa
FROM placements p
JOIN students s
    ON p.student_id = s.student_id
JOIN companies c
    ON p.company_id = c.company_id
WHERE p.package_lpa > (
    SELECT AVG(package_lpa)
    FROM placements
)
ORDER BY p.package_lpa DESC;

SELECT
    s.student_name,
    c.company_name,
    p.package_lpa
FROM placements p
JOIN students s
    ON p.student_id = s.student_id
JOIN companies c
    ON p.company_id = c.company_id
WHERE p.package_lpa = (
    SELECT MAX(package_lpa)
    FROM placements
);

SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    s.cgpa
FROM students s
JOIN departments d
    ON s.department_id = d.department_id
LEFT JOIN placements p
    ON s.student_id = p.student_id
WHERE p.placement_id IS NULL
ORDER BY s.cgpa DESC;

SELECT
    d.department_name,
    COUNT(p.placement_id) AS placed_students
FROM departments d
JOIN students s
    ON d.department_id = s.department_id
JOIN placements p
    ON s.student_id = p.student_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(p.placement_id) > 2
ORDER BY placed_students DESC;

SELECT
    ROUND(
        COUNT(p.student_id) * 100.0 / COUNT(s.student_id),
        2
    ) AS placement_percentage
FROM students s
LEFT JOIN placements p
    ON s.student_id = p.student_id;

SELECT
    d.department_name,
    MAX(p.package_lpa) AS highest_package_lpa
FROM departments d
JOIN students s
    ON d.department_id = s.department_id
JOIN placements p
    ON s.student_id = p.student_id
GROUP BY d.department_id, d.department_name
ORDER BY highest_package_lpa DESC;

SELECT
    s.student_name,
    COUNT(a.application_id) AS number_of_applications
FROM students s
JOIN applications a
    ON s.student_id = a.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(a.application_id) > 2
ORDER BY number_of_applications DESC;

CREATE OR REPLACE VIEW placement_report AS
SELECT
    s.student_id,
    s.student_name,
    d.department_name,
    c.company_name,
    c.job_role,
    p.package_lpa,
    p.placement_date
FROM placements p
JOIN students s
    ON p.student_id = s.student_id
JOIN departments d
    ON s.department_id = d.department_id
JOIN companies c
    ON p.company_id = c.company_id;

-- Display the view
SELECT * FROM placement_report
ORDER BY package_lpa DESC;

-- END OF PROJECT
