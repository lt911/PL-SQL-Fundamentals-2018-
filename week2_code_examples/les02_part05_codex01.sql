-- This script creates a copy of employees table and updates all the hire_date values to more recent years.

CREATE TABLE copy_emp2
AS ( SELECT * FROM employees );

UPDATE copy_emp2
SET HIRE_DATE = ADD_MONTHS(HIRE_DATE,48);
