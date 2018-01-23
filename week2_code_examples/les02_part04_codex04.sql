SET SERVEROUTPUT ON;
DECLARE
  v_bonus  NUMBER(8,2) NOT NULL := 0;
  v_service_period NUMBER NOT NULL := 3;
  v_salary NUMBER(8,2) := 11000;
BEGIN
  CASE v_service_period
    WHEN 10 THEN     
      -- This employee is with the organization since its inception.
      v_bonus := v_salary * 0.5;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);
    WHEN 9 THEN 
      -- This employee has a service period of 9 years.
      v_bonus := v_salary * 0.25;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus); 
    WHEN 8 THEN 
      -- This employee has a service period of 8 years.
      v_bonus := v_salary * 0.25;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);
    WHEN 7 THEN 
      -- This employee has a service period of 7 years.
      v_bonus := v_salary * 0.25;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus); 
    WHEN 6 THEN 
      -- This employee has a service period of 6 years.
      v_bonus := v_salary * 0.25;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);  
    WHEN 5 THEN 
      -- This employee has a service period of 5 years.
      v_bonus := v_salary * 0.25;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);  
    ELSE 
      -- This employee has a service period less than 5 years.
      v_bonus := v_salary * 0.1;
      DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);
  END CASE;
END;
/

