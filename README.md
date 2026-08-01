# Student Placement Management System

## Project Overview

The Student Placement Management System is a MySQL-based relational database project developed to manage student information, company details, job applications, and placement outcomes.

The system demonstrates the use of SQL for storing, managing, and analyzing placement-related data through relational database concepts and analytical queries.

## Objectives

- Manage student and department information.
- Store company and job-role details.
- Track student applications to different companies.
- Record final placement outcomes and salary packages.
- Generate useful placement insights using SQL queries.
- Demonstrate relational database concepts using MySQL.

## Technologies Used

- MySQL
- SQL
- MySQL Workbench

## Database Structure

The database consists of the following tables:

| Table | Description |
|---|---|
| `departments` | Stores department information |
| `students` | Stores student details and CGPA |
| `companies` | Stores recruiting company and job-role information |
| `applications` | Tracks student applications and application status |
| `placements` | Stores final placement details and salary packages |

A database view named `placement_report` is also created to provide a consolidated placement report.

## Key SQL Concepts Demonstrated

- Database and table creation
- Primary keys and foreign keys
- Data insertion and updating
- Filtering using `WHERE`
- Sorting using `ORDER BY`
- Inner and left joins
- Aggregate functions such as `COUNT`, `AVG`, and `MAX`
- `GROUP BY` and `HAVING`
- Subqueries
- SQL views
- Placement analytics

## Key Features

### Student Management

Stores student details including name, email, department, graduation year, and CGPA.

### Company Management

Stores company names, job roles, offered packages, and minimum CGPA requirements.

### Application Tracking

Records which companies students have applied to and tracks statuses such as Applied, Shortlisted, Rejected, and Selected.

### Placement Tracking

Stores final placement information including company, placement date, and salary package.

### Placement Analytics

The database can be used to answer questions such as:

- What is the overall placement percentage?
- Which department has the highest number of placements?
- What is the average placement package?
- Which company has the highest number of placements?
- Which students have not been placed?
- Which students have a CGPA above the overall average?
- What is the highest package offered in each department?

## How to Run

1. Install MySQL and MySQL Workbench.
2. Open `Student_Placement_Management_System_Clean.sql` in MySQL Workbench.
3. Connect to a running MySQL server.
4. Execute the SQL script.
5. The database `student_placement_management` will be created automatically.
6. The tables, sample data, queries, and placement report view will be available for use.

## Project Purpose

This project was developed as a B.Tech-level SQL/database project to gain practical experience with relational database design and SQL-based data analysis.

## Future Enhancements

- Add a web-based user interface.
- Add user authentication for students and placement administrators.
- Add dashboards for placement statistics.
- Add automated eligibility checking based on CGPA and company requirements.
- Add interview and recruitment-round tracking.
