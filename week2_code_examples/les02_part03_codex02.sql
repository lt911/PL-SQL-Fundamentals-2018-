-- SELECT query to retrieve the salary value of the employee with employee_id = 125
SELECT job_id, salary
FROM employees
WHERE employee_id = 125;

DECLARE
    sal_increase   employees.salary%type := 800;
BEGIN
    -- UPDATE query to increment the salary of all employees with job_title = 'ST_CLERK' by 800.
    UPDATE employees
    SET salary = salary + sal_increase
    WHERE job_id = 'ST_CLERK';
END;
/

-- SELECT query to retrieve the salary value of the employee with employee_id = 125
SELECT job_id, salary
FROM employees
WHERE employee_id = 125;

