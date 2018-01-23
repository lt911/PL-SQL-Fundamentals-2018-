/*  PL/SQL lession 1 */
/*Q1*/
/* Choice d: at leaset one statement in the execution block*/

/*Q2*/
SET SERVEROUTPUT ON
BEGIN 
  DBMS_OUTPUT.PUT_LINE('Hello World');
END;

/*Q3*/
/* c is invalid: ' is not allowed
f is invalid: number start with character*/

/*Q4*/
/* b is not valid as CONSTANT must be initialized by a value;
c is not valid: literal should be enclosed by single quotes*/

/*Q5*/
--DECLARE
-- v_fname VARCHAR2(20);
---- v_lname VARCHAR2(20);
-- v_lname VARCHAR2(15) DEFAULT 'fernandez';
--BEGIN
-- DBMS_OUTPUT.PUT_LINE(v_fname ||' ' ||v_lname);
--END;
/* choice a*/

/*Q6*/
DECLARE
  v_today_date DATE:=SYSDATE;
  v_tomorrow_date v_today_date%TYPE;
BEGIN 
  DBMS_OUTPUT.PUT_LINE('Hello World');
  DBMS_OUTPUT.PUT_LINE('TODAY IS : '|| v_today_date);
  v_tomorrow_date :=v_today_date+1;
  DBMS_OUTPUT.PUT_LINE('TOMORROW IS :'|| v_tomorrow_date); 
END;
/

/*Q7*/
VARIABLE b_basic_percent NUMBER;
VARIABLE b_pf_percent NUMBER;
BEGIN
  :b_basic_percent:=45;
  :b_pf_percent:=12;
END;
/
print b_basic_percent;
print b_pf_percent;
/

/*Q8*/
DECLARE   
  v_weight NUMBER(3) := 600; -- position 1
  v_message VARCHAR2(255) := 'Product 10012';
BEGIN
 DECLARE
   v_weight NUMBER(3) := 1; -- position 2
   v_message VARCHAR2(255) := 'Product 11001';
   v_new_locn VARCHAR2(50) := 'Europe';
 BEGIN
   v_weight := v_weight + 1;
   v_new_locn := 'Western ' || v_new_locn;
 END;
 v_weight := v_weight + 1;
 v_message := v_message || ' is in stock';
 v_new_locn := 'Western ' || v_new_locn;
END;
/
/* a. v_weight at position 1 is number , 600
b. v_new_locn at  1 is Nothhing, is it not declared.
c. v_weight at position 2 is number , 1
d. v_message at position 2 is varchar2, 'Product 11001'
e. v_new_locn at postion 2 is varchar2, 'Europe
*/

--Q9
DECLARE
 v_customer VARCHAR2(50) := 'Womansport';
 v_credit_rating VARCHAR2(50) :=
'EXCELLENT';
BEGIN
 DECLARE
 v_customer NUMBER(7) := 201;
 v_name VARCHAR2(25) := 'Unsorts';
 BEGIN
 v_credit_rating :='GOOD';
 …
 END;
 …
END;
/
/*
a. v_customer in the nested block : 201, Number
b. v_name in the nexted block: 'Unsorts', Varchar2
c. v_credit_rating in the nested block: 'GOOD', Varchar2
d. v_customer in the main block: 'Womansport', Varchar2
e. v_name in the main block: Nothing , it is not declared in the main block
v_credit_rating in the main_block: 'EXCELLENT;, Varchar2
*/

DECLARE 
  myChar VARCHAR2(20) := '$123,256.75';
  myNumber NUMBER;
BEGIN
myNumber := To_Number(myChar);
DBMS_OUTPUT.PUT_LINE('The converted number is: '|| myNumber);
END;
/