-- This program is intended to explain cursors, and it does not handle any exceptions that might arise from the SQL query.
DECLARE
  v_bonus NUMBER(8,2) := 0;
   
  CURSOR c_emp_cursor IS
  SELECT employee_id, salary, hire_date FROM copy_emp2;
  
  v_emp_record c_emp_cursor%ROWTYPE;
  
BEGIN  
   
  OPEN c_emp_cursor;
  
  LOOP
    FETCH c_emp_cursor INTO v_emp_record;
    EXIT WHEN c_emp_cursor%NOTFOUND;
    
    v_bonus :=
      CASE 
        WHEN ROUND((MONTHS_BETWEEN (SYSDATE,v_emp_record.hire_date) / 12),0) = 10 THEN               
          v_emp_record.salary * 0.5
        WHEN ROUND((MONTHS_BETWEEN (SYSDATE,v_emp_record.hire_date) / 12),0) > 5 AND ROUND((MONTHS_BETWEEN (SYSDATE,v_emp_record.hire_date) / 12),0) < 10 THEN           
          v_emp_record.salary * 0.25
        ELSE          
          v_emp_record.salary * 0.1
      END;
      DBMS_OUTPUT.PUT_LINE( 'Employee ID: '||v_emp_record.employee_id|| ' gets a bonus amount: '||v_bonus);
      
  END LOOP;
  
  CLOSE c_emp_cursor;
  
END;
/