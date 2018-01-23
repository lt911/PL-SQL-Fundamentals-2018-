DECLARE

 TYPE email_table_type IS VARRAY(5) OF VARCHAR2(20);
 emails email_table_type := email_table_type('SKING', 'NKOCHAR', 'LDEHAAN', 'AHUNOLD', 'ANETOFF');

BEGIN

 FOR i IN emails.FIRST..emails.LAST LOOP
   DBMS_OUTPUT.PUT_LINE(emails(i));
 END LOOP;

END;
/