/* Lesson 2 */
--A1
SET SERVEROUTPUT ON
DECLARE 
  v_basic_percent NUMBER := 45;
  v_pf_percent NUMBER := 12;
  v_fname ad_faculty_details.first_name%TYPE;
  v_salary ad_faculty_details.salary%TYPE;
BEGIN
  SELECT first_name, salary
  INTO v_fname, v_salary
  FROM ad_faculty_details
  WHERE faculty_id = 105;
  
  DBMS_OUTPUT.PUT_LINE('Hello '|| v_fname);
  DBMS_OUTPUT.PUT_LINE('Your Salary is :' || v_salary);
  DBMS_OUTPUT.PUT_LINE('Your Contribuition Toward PF: ' || v_salary * v_basic_percent/100*v_pf_percent/100); 
END;
/

--A2
DECLARE 
  v_max_deptno NUMBER;
BEGIN
  SELECT max(department_id)
  INTO v_max_deptno
  FROM ad_departments;
  DBMS_OUTPUT.PUT_LINE('The maximum department_id is: ' || v_max_deptno);
END;
/

--A3
DECLARE 
  v_max_deptno NUMBER;
BEGIN
  SELECT max(department_id)
  INTO v_max_deptno
  FROM ad_departments;
  
  INSERT INTO ad_departments(
  department_id, department_name, hod)
  VALUES(v_max_deptno+10, 'Education', Null);
  DBMS_OUTPUT.PUT_LINE('The maximum department_id is: ' || v_max_deptno);
  DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT give ' || SQL%ROWCOUNT);
END;
/
SELECT * FROM ad_departments
WHERE department_id = (SELECT max(department_id) FROM ad_departments);

--A4
DECLARE 
 v_hod ad_departments.hod%type :='JEN YAM';
BEGIN
  UPDATE ad_departments
  SET hod = v_hod
  WHERE department_id = 50;
END;
/
SELECT * FROM ad_departments 
WHERE department_id = 50;

--A5
CREATE TABLE messages (results VARCHAR2(80));

DROP TABLE messages;

BEGIN
 FOR i IN 1 .. 10 LOOP
    CONTINUE WHEN i IN (6, 8);
    INSERT INTO messages (results)
    VALUES (i);
  END LOOP;
COMMIT;
END;
/
SELECT results FROM messages;

--A6
CREATE TABLE results AS
SELECT a.first_name, b.exam_id, c.course_name, b.marks
FROM ad_student_details a, ad_exam_results b,
ad_course_details c
WHERE a.student_id = b.student_id
AND c.course_id = b.course_id;

ALTER TABLE results ADD stars VARCHAR2(50);

SELECT * from results
WHERE first_name = 'JACK';

DECLARE 
  v_fname results.first_name%TYPE := 'JACK';
  v_exam_id results.exam_id%TYPE := 530;
  v_asterisk results.stars%TYPE NULL;
  v_marks results.marks%TYPE;
BEGIN
  SELECT marks
  INTO v_marks
  FROM results
  WHERE first_name = v_fname
  AND exam_id = v_exam_id;
  
  FOR i in 1 .. v_marks LOOP
    CONTINUE WHEN (MOD(i,20) != 0);
    v_asterisk := v_asterisk||'*';
    DBMS_OUTPUT.PUT_LINE(v_asterisk);
  END LOOP;
  
  UPDATE results
  SET stars = v_asterisk
  WHERE first_name = v_fname
  AND exam_id = v_exam_id;
  COMMIT;
END;
/

SELECT * FROM results
WHERE first_name = 'JACK'
AND exam_id = 530;