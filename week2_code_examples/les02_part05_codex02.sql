-- This program is intended to explain loops, and it does not handle any exceptions that might arise from the SQL query.

SET SERVEROUTPUT ON;
DECLARE
  v_emp_id  copy_emp2.employee_id%TYPE := 0;
  v_emp_count NUMBER NOT NULL := 0;
  v_bonus NUMBER(8,2) := 0;
  v_salary copy_emp2.salary%TYPE;
  v_hire_date copy_emp2.hire_date%TYPE;
  
BEGIN  
  -- Query to get the total count of employee records.
  SELECT COUNT(*)INTO v_emp_count FROM copy_emp2;  
  LOOP
    -- Query to get the next minimum salary value from the table.
    SELECT MIN(employee_id) INTO v_emp_id FROM copy_emp2 WHERE employee_id > v_emp_id;     
    -- Query to get the salary and hire date for the employee id.
    SELECT salary, hire_date INTO v_salary, v_hire_date FROM copy_emp2 WHERE employee_id = v_emp_id;      
    v_bonus :=
      CASE 
        WHEN ROUND((MONTHS_BETWEEN (SYSDATE,v_hire_date) / 12),0) = 10 THEN               
          v_salary * 0.5
        WHEN ROUND((MONTHS_BETWEEN (SYSDATE,v_hire_date) / 12),0) > 5 AND ROUND((MONTHS_BETWEEN (SYSDATE,v_hire_date) / 12),0) < 10 THEN           
          v_salary * 0.25
        ELSE          
          v_salary * 0.1
      END;
      DBMS_OUTPUT.PUT_LINE( 'Employee ID: '||v_emp_id|| ' gets a bonus amount: '||v_bonus);    
            
      v_emp_count := v_emp_count - 1;
      EXIT WHEN v_emp_count = 0;
      
  END LOOP;
END;
/