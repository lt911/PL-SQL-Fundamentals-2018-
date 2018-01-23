SET SERVEROUTPUT ON
DECLARE
v_myName VARCHAR(20):= 'Steven';
BEGIN
DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
v_myName := 'John';
DBMS_OUTPUT.PUT_LINE('My name is: '||v_myName );
END;
/




