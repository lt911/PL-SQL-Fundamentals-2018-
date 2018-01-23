SET SERVEROUTPUT ON

DECLARE
v_new_empid NUMBER;
BEGIN
v_new_empid := employees_seq.NEXTVAL;
DBMS_OUTPUT.PUT_LINE('The new employee ID is:'||v_new_empid);
END;
/