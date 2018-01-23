SET SERVEROUTPUT ON
DECLARE
  v_emp_id employees.employee_id%TYPE := 150;
  v_new_jobid employees.job_id%TYPE := 'SA_MAN';
  v_new_salary employees.salary%TYPE := 10500;
  v_emp_rec employees%ROWTYPE;  
  
BEGIN
  
  SELECT * INTO v_emp_rec FROM employees WHERE employee_id = v_emp_id;
  
  DBMS_OUTPUT.PUT_LINE('****Before Promotion****');
  DBMS_OUTPUT.PUT_LINE('Employee Name: '||v_emp_rec.first_name ||' ' ||v_emp_rec.last_name||chr(10)||
                       'Job ID: '||v_emp_rec.job_id ||chr(10)||
                       'Salary: '||v_emp_rec.salary);

  -- Update promotion details into Employees table.
  v_emp_rec.job_id := 'SA_MAN';
  v_emp_rec.salary := 10500; 
  
  UPDATE employees SET ROW = v_emp_rec WHERE employee_id = v_emp_id;
  
  SELECT * INTO v_emp_rec FROM employees WHERE employee_id = v_emp_id;
  
  DBMS_OUTPUT.PUT_LINE('****After Promotion****');
  DBMS_OUTPUT.PUT_LINE('Employee Name: '||v_emp_rec.first_name ||' ' ||v_emp_rec.last_name||chr(10)||
                       'Job ID: '||v_emp_rec.job_id ||chr(10)||
                       'Salary: '||v_emp_rec.salary);

END;
/


