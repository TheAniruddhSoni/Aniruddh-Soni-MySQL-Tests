-- MySQL Built-in Functions — Practice Exercise

DROP DATABASE IF EXISTS training_functions;

CREATE DATABASE training_functions;

USE training_functions;

CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);

INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');

SELECT * FROM CourseEnrollments;

-- Practice Questions

-- STRING FUNCTIONS

-- Q1. Display each student’s full name in uppercase with a single space between the first and last
-- names using CONCAT() and UPPER().
select 
	Upper(Concat(FirstName, ' ', LastName)) As Full_Name
from CourseEnrollments;

-- Q2. Display each student’s full name with the first letter of FirstName in uppercase and the
-- remaining letters unchanged, using CONCAT(), UPPER() and SUBSTRING().
select
	Concat(upper(substring(FirstName, 1,1)), substring(FirstName, 2), ' ', LastName) As 
    FullName
from CourseEnrollments;

-- Q3. Create a student code consisting of the first three letters of CourseName in uppercase, a
-- hyphen, and StudentID using LEFT(), UPPER() and CONCAT().
select 
	concat(upper(left(CourseName, 3)), '-', StudentID) As StudentCode
from CourseEnrollments;

-- Q4. Display FirstName reversed and also display its original character count using REVERSE() and
-- CHAR_LENGTH().
select
	Reverse(FirstName) as Reversed_FirstName,
    char_length(FirstName) as Character_Count
from CourseEnrollments;

-- Q5. Display the position of the letter a in FirstName using LOCATE(), along with FirstName.
select
	FirstName,
	Locate('a', FirstName) as Position_of_a
from CourseEnrollments;

-- Q6. Replace every letter a in FirstName with o, then convert the result to uppercase using
-- REPLACE() and UPPER().
select
	Upper(Replace(FirstName, 'a', 'o')) As Replace_letter_A_to_O
from CourseEnrollments;

-- Q7. Display FirstName padded on the left with zeroes to a total length of 12 characters using
-- LPAD().
select
	Lpad(FirstName, 12, '0') As Lpad_FirstName
from CourseEnrollments;

-- Q8. Display a course label made of the last two letters of CourseName, a hyphen, and the first two
-- letters of FirstName using RIGHT(), LEFT() and CONCAT().
select
	Concat(Right(CourseName, 2), '-', Left(FirstName, 2)) As Course_Label
from CourseEnrollments;

-- Q9. Display the first three letters of FirstName in uppercase followed by the last two letters of
-- LastName in lowercase using SUBSTRING(), RIGHT(), UPPER(), LOWER() and CONCAT().
select
	Concat(Upper(Substring(FirstName, 1, 3)), Lower(Right(LastName, 2))) As Mix_Name
from CourseEnrollments;

-- NUMERIC FUNCTIONS

-- Q10. Display Fee rounded to one decimal place and also Fee rounded to the nearest whole
-- number using ROUND().
select
	Fee as Original_Fee,
	Round(Fee, 1) as Rounded_Fee_One_Decimal,
    Round(Fee) as Rounded_Fee_Whole_Number
from CourseEnrollments;

-- Q11. Display Fee rounded upward and downward to whole numbers in separate columns using
-- CEIL() and FLOOR().
select
	Fee as Original_Fee,
	Ceil(Fee) as Rounded_Fee_Upward,
    Floor(Fee) as Rounded_Fee_Downward
from CourseEnrollments;

-- Q12. Display the remainder when Fee is divided by 500 using MOD(), alongside the original Fee.
select 
	Fee as Original_Fee,
    Mod(fee, 500) as Fee_Modulus
from CourseEnrollments;

-- Q13. Display the absolute difference between Fee and 10000 using ABS().
select 
	Fee as Original_Fee,
	Abs(Fee - 10000) as Absolute_Difference
from CourseEnrollments;

-- Q14. Display Fee multiplied by 1.18 and rounded to two decimal places using ROUND().
select
	Fee As Original_Fee,
	Round(Fee * 1.18, 2) As Multiplied_Fee
from CourseEnrollments;

-- Q15. Display Fee formatted with a thousands separator and exactly two decimal places using
-- FORMAT().
select
	Fee as Original_Fee,
    Format(Fee, 2) As Formatted_Fee
from CourseEnrollments;

-- DATE FUNCTIONS

-- Q16. Display the enrollment year, enrollment month name and enrollment day name in separate
-- columns using YEAR(), MONTHNAME() and DAYNAME().
select
	Year(EnrollmentDate) as Enrollment_Year,
    Monthname(EnrollmentDate) as Enrollment_Month_Name,
    DayName(EnrollmentDate) as Enrollment_Day
from CourseEnrollments;

-- Q17. Display EnrollmentDate in DD/MM/YYYY format and CompletionDate in Month DD, YYYY
-- format using DATE_FORMAT().
select
	Date_format(EnrollmentDate, '%d/%m/%Y') as EnrollmentDate,
    Date_format(CompletionDate, '%M %d, %Y') as CompletionDate
from CourseEnrollments;

-- Q18. Calculate the number of days between EnrollmentDate and CompletionDate using
-- TIMESTAMPDIFF().
select
	timestampdiff(Day, EnrollmentDate, CompletionDate) as No_of_Days
from CourseEnrollments;

-- Q19. Display the date 1 month and 10 days after EnrollmentDate using nested DATE_ADD() calls.
select
	EnrollmentDate as Old_Enrollment_Date,
	Date_Add(Date_Add(EnrollmentDate, Interval 1 month), Interval 10 day) as New_Enrollment_Date
from CourseEnrollments;

-- Q20. Display the date exactly 7 days before CompletionDate using DATE_ADD() with a negative
-- interval.
select
	CompletionDate,
	Date_Add(CompletionDate, interval -7 day) as 7_Days_Before_CompletionDate
from CourseEnrollments;

-- Q21. Display the number of complete months between EnrollmentDate and CompletionDate using
-- TIMESTAMPDIFF().
select 
	timestampdiff(month, EnrollmentDate, CompletionDate) as No_of_months
from CourseEnrollments;

-- Q22. Display the enrollment date shifted forward by 1 year, 2 months and 5 days using nested
-- DATE_ADD() calls.
select
	EnrollmentDate as Old_Enrollment_Date,
	Date_Add(Date_Add(Date_Add(EnrollmentDate, Interval 1 year), Interval 2 month), Interval 5 day) as Shifted_Forward_Enrollment_Date
from CourseEnrollments;

-- Q23. Display EnrollmentDate and CompletionDate with their weekday names using DAYNAME().
select
	EnrollmentDate,
	Dayname(EnrollmentDate) as EnrollmentDay,
    CompletionDate,
    Dayname(CompletionDate) as CompletionDay
from CourseEnrollments;

-- Q24. Display the number of days from EnrollmentDate until the current date using
-- TIMESTAMPDIFF() and CURDATE().
select
	EnrollmentDate,
    Timestampdiff(Day, EnrollmentDate, Curdate()) as No_of_Days
from CourseEnrollments;

-- Q25. Display the original CompletionDate and its date after adding 15 days, formatted as
-- DD/MM/YYYY using DATE_ADD() and DATE_FORMAT().
select
	CompletionDate as Original_Completion_Date,
    Date_format(Date_Add(CompletionDate, Interval 15 day), '%d/%m/%Y') as 15_Days_After_CompletionDate
from CourseEnrollments;
