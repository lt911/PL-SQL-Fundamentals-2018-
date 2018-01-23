SET SERVEROUTPUT ON
DECLARE
  TYPE rec_emp IS RECORD
  (
	 v_first_name employees.first_name%TYPE,
   v_last_name employees.last_name%TYPE,
   v_job_id employees.job_id%TYPE,
	 v_sal employees.salary%TYPE
	 );
  v_emprec rec_emp;
BEGIN
SELECT first_name, last_name, job_id, salary
INTO   v_emprec 
FROM   employees 
WHERE employee_id = 100;

  DBMS_OUTPUT.PUT_LINE('Employee Name: '||v_emprec.v_first_name ||' ' ||v_emprec.v_last_name||chr(10)||
                       'Job ID: '||v_emprec.v_job_id ||chr(10)||
                       'Salary: '||v_emprec.v_sal);
END;
