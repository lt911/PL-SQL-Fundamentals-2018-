SET SERVEROUTPUT ON
DECLARE
  TYPE rec_dept IS RECORD
  (
   v_deptno departments.department_id%TYPE NOT NULL := 10,
   v_deptname departments.department_name%TYPE DEFAULT 'ADMINISTRATION'
  ); 
  
  TYPE rec_emp IS RECORD
  (
	 v_first_name employees.first_name%TYPE,
   v_last_name employees.last_name%TYPE,
   v_job_id employees.job_id%TYPE,
	 v_sal employees.salary%TYPE,
   v_deprec rec_dept
	 );
   
  v_emprec rec_emp;
  
BEGIN
  DBMS_OUTPUT.PUT_LINE('Executable section begins...');
END;
/