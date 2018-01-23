SET SERVEROUTPUT ON

DECLARE
v_desc_size INTEGER(5);
v_prod_description VARCHAR2(70):='You can use this product with your radios for higher frequency';

BEGIN
-- get the length of the string in prod_description
v_desc_size:= LENGTH(v_prod_description);
DBMS_OUTPUT.PUT_LINE('The length of the product description is:'||v_desc_size);

END;
/
