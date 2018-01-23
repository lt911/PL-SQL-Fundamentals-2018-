SET SERVEROUTPUT ON;
DECLARE
  TYPE expense_table_type IS TABLE OF
    employees.salary%TYPE 
    INDEX BY PLS_INTEGER;
    v_expense_list       expense_table_type;   
    v_loop_counter NUMBER := 0;
  
BEGIN
  
  v_expense_list(10) := 100000;
  v_expense_list(20) := 25000;
  v_expense_list(30) := 85999;
  
  WHILE v_loop_counter < 30 LOOP
      v_loop_counter := v_loop_counter + 10;
      DBMS_OUTPUT.PUT_LINE('Key: '||v_loop_counter ||'Value: '||v_expense_list(v_loop_counter));
  END LOOP;
END; 
/
