SET SERVEROUTPUT ON

DECLARE
    v_outervariable   VARCHAR2(20) := 'GLOBAL VARIABLE';
BEGIN
    DECLARE
        v_innervariable   VARCHAR2(20) := 'LOCAL VARIABLE';
    BEGIN
        dbms_output.put_line(v_innervariable);
        dbms_output.put_line(v_outervariable);
    END;

    dbms_output.put_line(v_outervariable);
END;

