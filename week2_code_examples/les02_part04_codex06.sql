-- This code example is for illustration purpose only. It can't be executed.
SET SERVEROUTPUT ON;
DECLARE
  v_bonus  NUMBER(8,2) NOT NULL := 0;
  v_service_period NUMBER NOT NULL := 3;
  v_salary NUMBER(8,2) := 11000;
BEGIN
  CASE v_service_period
      WHEN 10 THEN     
        -- This employee is with the organization since its inception.
        v_bonus := v_salary * 0.5
        DBMS_OUTPUT.PUT_LINE( 'The bonus amount is: '||v_bonus);
        
        -- You can even write an SQL statement to update the bonus value into the database.
        UPDATE ...
        SET ...
        WHERE ..       
     
      ELSE
        -- This employee has a service period less than 5 years.
        v_bonus := v_salary * 0.1
        DBMS_OUTPUT.PUT_LINE( 'The bonus amount is: '||v_bonus);
        
        -- You can even write an SQL statement to update the bonus value into the database.
        UPDATE ...
        SET ...
        WHERE .. 
    END CASE;    
END;
/

