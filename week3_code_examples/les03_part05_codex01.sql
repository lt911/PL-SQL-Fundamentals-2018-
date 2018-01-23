-- This program is intended to explain cursor with parameters, and it does not handle any exceptions that might arise from the SQL query.
DECLARE  
  CURSOR c_emp_cursor (deptno employees.department_id%TYPE)
  IS
    SELECT * FROM employees WHERE department_id = deptno;
    
  v_emp_record c_emp_cursor%ROWTYPE;  
  
BEGIN   
    OPEN c_emp_cursor(30);
    
    LOOP
      FETCH c_emp_cursor INTO v_emp_record;
      EXIT WHEN c_emp_cursor%NOTFOUND;      
    
      DBMS_OUTPUT.PUT_LINE(RPAD (v_emp_record.employee_id, 7) ||
                           RPAD (v_emp_record.first_name||' '||v_emp_record.last_name, 20) ||
   	                       RPAD (v_emp_record.phone_number,14));       
              
    END LOOP;
    
    IF c_emp_cursor%ROWCOUNT = 0 THEN
      DBMS_OUTPUT.PUT_LINE('** NO EMPLOYEES IN THIS DEPARTMENT **');
    END IF;
    
    CLOSE c_emp_cursor;  
    
END;
/