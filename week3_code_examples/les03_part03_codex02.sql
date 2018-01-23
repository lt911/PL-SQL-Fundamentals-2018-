DECLARE

 TYPE email_table_type IS TABLE OF VARCHAR2(20);
 emails email_table_type := email_table_type('SKING', 'NKOCHAR', 'LDEHAAN', 'AHUNOLD');

BEGIN

 FOR i IN emails.FIRST..emails.LAST LOOP
   DBMS_OUTPUT.PUT_LINE(emails(i));
 END LOOP;

END;
/
