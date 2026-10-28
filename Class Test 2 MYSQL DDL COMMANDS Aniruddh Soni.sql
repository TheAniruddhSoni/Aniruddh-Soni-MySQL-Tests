# MYSQL DDL COMMANDS
# Table Structure & 15 Practical Questions

-- Initial Database & Table Schema
-- Database: company_training | Tables: departments, employees
-- Create the following database and tables before performing the numbered tasks. No primary keys or foreign keys are defined initially.

CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);

describe departments;
select * from departments;

describe staff;
select * from staff;

# DDL Practical Questions

-- Q1. Add a PRIMARY KEY constraint on departments.department_id.
Alter Table departments Add Primary Key (department_id);

-- Q2. Add a PRIMARY KEY constraint on employees.employee_id.
Alter Table employees Add Primary Key (employee_id);

-- Q3. Add a new column named location of type VARCHAR(100) to the departments table.
Alter Table departments Add Column location Varchar(100);

-- Q4. Rename the column dept_name to department_name in the departments table, keeping its existing data type and NOT NULL requirement.
Alter Table departments Change Column dept_name department_name Varchar(80) Not Null;

-- Q5. Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.
Alter Table employees Modify Column salary Decimal(12,2) Not Null;

-- Q6. Set the default value of employees.status to Active.
Alter Table employees Modify Column status VARCHAR(20) default 'Active';

-- Q7. Add a UNIQUE constraint on employees.email.
Alter Table employees Add Unique (email);

-- Q8. Rename the employees table to staff.
Rename Table employees to staff;

-- Q9. Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
Alter Table staff Add Constraint FK1 Foreign Key staff(department_id) References departments(department_id);

-- Q10. Drop the UNIQUE constraint added to staff.email in Question 7.
Alter Table staff Drop Constraint email;

-- Q11. Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.
Alter Table staff Drop Foreign Key FK1;

-- Q12. Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.
Alter Table staff Drop Primary Key;

-- Q13. Add the PRIMARY KEY constraint back on staff.employee_id.
Alter Table staff Add Primary Key (employee_id);

-- Q14. Drop the location column from the departments table.
Alter Table departments Drop Column location;

-- Q15. Rename the database from company_training to company_management using MySQL-supported DDL operations. Create the new database, move both tables to it, and remove the old empty database. (MySQL does not support a direct RENAME DATABASE command.)
Create Database company_management;
Use company_management;

CREATE TABLE departments (
department_id INT NOT NULL Primary Key,
department_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);

CREATE TABLE staff (
employee_id INT NOT NULL Primary Key,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(12,2),
status VARCHAR(20) Default 'Active'
);

describe departments;
select * from departments;

describe staff;
select * from staff;

Drop Database company_training;
