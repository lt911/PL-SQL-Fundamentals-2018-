CREATE TABLE COPY_EMP 
   (	EMPLOYEE_ID NUMBER(6,0), 
	FIRST_NAME VARCHAR2(20 BYTE), 
	LAST_NAME VARCHAR2(25 BYTE) NOT NULL ENABLE, 
	EMAIL VARCHAR2(25 BYTE) NOT NULL ENABLE, 
	PHONE_NUMBER VARCHAR2(20 BYTE), 
	HIRE_DATE DATE NOT NULL ENABLE, 
	JOB_ID VARCHAR2(10 BYTE) NOT NULL ENABLE, 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2), 
	MANAGER_ID NUMBER(6,0), 
	DEPARTMENT_ID NUMBER(4,0)
   );
   
   BEGIN
    MERGE INTO copy_emp c USING employees e ON (
        e.employee_id = c.employee_id
    ) WHEN MATCHED THEN
        UPDATE
    SET c.first_name = e.first_name,
        c.last_name = e.last_name,
        c.email = e.email,
        c.phone_number = e.phone_number,
        c.hire_date = e.hire_date,
        c.job_id = e.job_id,
        c.salary = e.salary,
        c.commission_pct = e.commission_pct,
        c.manager_id = e.manager_id,
        c.department_id = e.department_id
    WHEN NOT MATCHED THEN INSERT VALUES ( e.employee_id,e.first_name,e.last_name,e.email,e.phone_number,e.hire_date,
                                          e.job_id,e.salary,e.commission_pct,e.manager_id,e.department_id );

END;
/

SELECT COUNT(*) FROM copy_emp;

