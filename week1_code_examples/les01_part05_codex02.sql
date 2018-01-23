VARIABLE b_emp_salary NUMBER

BEGIN
    SELECT salary
    INTO   :b_emp_salary
    FROM   employees
    WHERE  employee_id = 178;

END;
/

PRINT b_emp_salary

