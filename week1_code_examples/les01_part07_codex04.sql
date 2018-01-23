BEGIN
    << outer >> DECLARE
        v_father_name     VARCHAR2(20) := 'Patrick';
        v_date_of_birth   DATE := '20-Apr-1972';
    BEGIN
        DECLARE
            v_child_name      VARCHAR2(20) := 'Mike';
            v_date_of_birth   DATE := '12-Dec-2002';
        BEGIN
            dbms_output.put_line('Father''s Name: ' || v_father_name);
            dbms_output.put_line('Date of Birth: ' || outer.v_date_of_birth);
            dbms_output.put_line('Child''s Name: ' || v_child_name); 
            dbms_output.put_line('Date of Birth: ' || v_date_of_birth);
        END;        
        
    END;
END outer;
/