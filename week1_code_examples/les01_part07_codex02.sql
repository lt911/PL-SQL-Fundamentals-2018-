DECLARE
    v_fathername     VARCHAR2(20) := 'Patrick';
    v_dateofbirth   DATE := '20-Apr-1972';
BEGIN
    DECLARE
        v_childname      VARCHAR2(20) := 'Mike';
        v_dateofbirth   DATE := '12-Dec-2002';
    BEGIN
        dbms_output.put_line('Father''s Name: ' || v_fathername);
        dbms_output.put_line('Date of Birth: ' || v_dateofbirth);
        dbms_output.put_line('Child''s Name: ' || v_childname);
    END;

    dbms_output.put_line('Date of Birth: ' || v_dateofbirth);
END;
/
