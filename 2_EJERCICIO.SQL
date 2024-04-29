---EJERCICIO 2---
DECLARE
    v_contador NUMBER(3):= 0;
    v_inicio NUMBER(3):= 1;
    v_fin NUMBER(3):= 200;
BEGIN
    FOR i in v_inicio..v_fin LOOP
        IF MOD(i,3) = 0 THEN
            dbms_output.put_line(i || ' Es múltiplo de 3');  
            v_contador := v_contador + 1;
        END IF;
    END LOOP;
                dbms_output.put_line(v_contador || ' números son múltiplo(s) de 3');  

END;