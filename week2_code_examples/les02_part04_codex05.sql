SET SERVEROUTPUT ON;
DECLARE
  v_bonus  NUMBER(8,2) NOT NULL := 0;
  v_service_period NUMBER NOT NULL := 3;
  v_salary NUMBER(8,2) := 11000;
BEGIN
  v_bonus :=
    CASE 
      WHEN v_service_period = 10 THEN     
        -- This employee is with the organization since its inception.
        v_salary * 0.5
      WHEN v_service_period < 10 AND v_service_period >= 5 THEN 
        -- This employee has a service period between 9 to 5 years.
        v_salary * 0.25
      ELSE
        -- This employee has a service period less than 5 years.
        v_salary * 0.1
    END;
    DBMS_OUTPUT.PUT_LINE( 'The bonus amount is: '||v_bonus);
END;
/

