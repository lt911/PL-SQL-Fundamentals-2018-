/* Lesson 3 */
--A1
SET SERVEROUTPUT ON
DECLARE
v_dept_record ad_departments%ROWTYPE;
BEGIN
  SELECT * 
  INTO v_dept_record
  FROM ad_departments
  WHERE department_id = 30;
  DBMS_OUTPUT.PUT_LINE('department Id: '||v_dept_record.department_id || ' Departemnt Name: '|| v_dept_record.department_name || ' HOD: '|| v_dept_record.HOD);
END;
/

--A2
DECLARE 
  TYPE course_table_type IS TABLE OF
  ad_course_details.course_name%TYPE
  INDEX BY PLS_INTEGER;
  
  my_course_table course_table_type;
  f_loop_count NUMBER := 6;
  v_course_id NUMBER := 186;
  
BEGIN
 FOR i IN 1 .. f_loop_count LOOP
   v_course_id := v_course_id + 2;
  SELECT course_name 
  INTO my_course_table(v_course_id)
  FROM ad_course_details
  WHERE course_id = v_course_id;
 END LOOP;
 
 v_course_id := 186;
 FOR i IN 1 .. f_loop_count LOOP
   v_course_id := v_course_id + 2;
   DBMS_OUTPUT.PUT_LINE(my_course_table(v_course_id));
 END LOOP;
END;
/

--A3
DECLARE 
  TYPE course_table_type IS TABLE OF
  ad_course_details%ROWTYPE
  INDEX BY PLS_INTEGER;
  
  my_course_table course_table_type;
  f_loop_count NUMBER := 6;
  v_course_id NUMBER := 186;
  v_rec ad_course_details%ROWTYPE;
BEGIN
 FOR i IN 1 .. f_loop_count LOOP
   v_course_id := v_course_id + 2;
  SELECT *
  INTO my_course_table(v_course_id)
  FROM ad_course_details
  WHERE course_id = v_course_id;
 END LOOP;
 
 v_course_id := 186;
 FOR i IN 1 .. f_loop_count LOOP
   v_course_id := v_course_id + 2;
   v_rec := my_course_table(v_course_id);
   DBMS_OUTPUT.PUT_LINE('Course ID: ' || v_rec.course_id ||' Course name: '|| v_rec.course_name||' Session ID: '|| v_rec.session_id|| ' Department ID: '||v_rec.department_id);
 END LOOP;
END;
/

--A4
describe ad_student_details;
describe ad_parent_information;

DECLARE

    CURSOR c_parent_cursor IS
    SELECT s.parent_id, p.father_name, s.student_id, s.first_name, s.student_reg_year
    FROM ad_student_details s
    JOIN ad_parent_information p
    ON s.parent_id = p.parent_id;

BEGIN
    FOR rec IN c_parent_cursor LOOP
      DBMS_OUTPUT.PUT_LINE(rec.father_name|| ' '||rec.student_id||' '|| rec.first_name||' '|| TO_CHAR(rec.student_reg_year));
    END LOOP;
END;
/

--A4
DECLARE 
    CURSOR c_student_cursor IS
    SELECT s.student_id, s.first_name, a.no_of_days_off
    FROM ad_student_details s
    JOIN ad_student_attendance a
    ON s.student_id = a.student_id;

BEGIN
    FOR rec in c_student_cursor LOOP
      IF rec.no_of_days_off > 30 THEN
        DBMS_OUTPUT.PUT_LINE(rec.first_name || ' is Not Eligible for exam');
      ELSE
        DBMS_OUTPUT.PUT_LINE(rec.first_name || ' is Eligible for exam');
      END IF;
    END LOOP;
END;
/

--A5
DESCRIBE ad_course_details;

DECLARE
    CURSOR c_dept_cursor IS
    SELECT department_id, department_name, hod
    FROM ad_departments
    WHERE department_id < 50
    ORDER BY department_id;
    
    CURSOR c_course_cursor(deptno ad_course_details.department_id%TYPE)  IS
    SELECT course_id, course_name, session_id
    FROM ad_course_details
    WHERE course_id < 190
    AND department_id = deptno;
    
    v_dept_id ad_departments.department_id%TYPE;
    v_dept_name ad_departments.department_name%TYPE;
    v_hod ad_departments.hod%TYPE;
    
    v_course_id ad_course_details.course_id%TYPE;
    v_course_name ad_course_details.course_name%TYPE;
    v_session_id ad_course_details.session_id%TYPE;

BEGIN
    OPEN c_dept_cursor;
    <<loop1>>
    LOOP
        FETCH c_dept_cursor INTO v_dept_id, v_dept_name, v_hod;
        EXIT WHEN c_dept_cursor%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Department Number :' || v_dept_id || ' Department Name: '|| v_dept_name || ' HOD: '||v_hod);
        
        OPEN c_course_cursor(v_dept_id);
        <<loop2>>
        LOOP 
            FETCH c_course_cursor INTO v_course_id, v_course_name, v_session_id;
            EXIT WHEN c_course_cursor%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(v_course_id || ' '||v_course_name||' '||v_session_id);
        END LOOP loop2;
        CLOSE c_course_cursor;
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------');
    END LOOP loop1;
    CLOSE c_dept_cursor;
END;
/