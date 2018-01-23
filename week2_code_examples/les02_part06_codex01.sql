-- This program is intended to explain nested loops, and it does not handle any exceptions that might arise from the SQL query.
DECLARE
  v_dept_id departments.department_id%TYPE := 0;
  v_emp_id employees.employee_id%TYPE := 0;
  v_dept_name departments.department_name%TYPE;
  v_emp_count NUMBER;
  v_dept_count NUMBER;
  v_emp_rec employees%ROWTYPE;
  
BEGIN
  SELECT COUNT(*)INTO v_dept_count FROM departments;  
  
  WHILE v_dept_count > 0 LOOP
  
    -- Query to get the next minimum department ID and department name from the table.
    SELECT department_id, department_name
    INTO v_dept_id, v_dept_name
    FROM departments
    WHERE department_id = (SELECT MIN(department_id)              
                           FROM departments 
                           WHERE department_id > v_dept_id);  
  
    DBMS_OUTPUT.PUT_LINE('**************************************************************');                       
    DBMS_OUTPUT.PUT_LINE(v_dept_name||' Department');
    DBMS_OUTPUT.PUT_LINE('**************************************************************');     
    DBMS_OUTPUT.PUT_LINE('EMP ID     EMPLOYEE NAME	    CONTACT');
  
    SELECT COUNT(*)INTO v_emp_count FROM employees WHERE department_id = v_dept_id;   
    
    IF v_emp_count = 0 THEN
      DBMS_OUTPUT.PUT_LINE('** NO EMPLOYEES IN THIS DEPARTMENT **');
    ELSE
      WHILE v_emp_count > 0 LOOP
  
        -- Query to get the next minimum employee value from the table.
        SELECT *       
        INTO v_emp_rec
        FROM employees        
        WHERE employee_id = ( SELECT MIN(employee_id)                              
                              FROM employees 
                              WHERE employee_id > v_emp_id 
                              AND department_id = v_dept_id); 
                            
        DBMS_OUTPUT.PUT_LINE(RPAD (v_emp_rec.employee_id, 7) ||
                             RPAD (v_emp_rec.first_name||' '||v_emp_rec.last_name, 20) ||
   	                         RPAD (v_emp_rec.phone_number,14));      
 
        v_emp_id := v_emp_rec.employee_id;      
        v_emp_count := v_emp_count - 1; 
      
      END LOOP;
    END IF;
    
    v_emp_id := 0;
    v_dept_count := v_dept_count - 1;    
      
  END LOOP;  
  
END;
/