---EJERCICIO 3---
    --PASO 1 
    --Hacer que la cuestionsita imprima la tabla del 1
    --i es el número que aumentará la multiplicación 1, 2, 3 ... 10
    --v_inicio es el número que será multiplicado.
    --En este punto sé como manejar i, pero no sé aumentar el número que será multiplicado.
    
    --PASO 2
    --no sé como explicar lo que hice, solo sabía que tenia que repetir el proceso 10 veces
    --primero había usado la variable v_inicio pero eso terminaba achicando el rango por el cual el for
    --iba a trabajar, así que hice una variable aparte y funcionó yuju. 
DECLARE
v_inicio NUMBER(3):= 1;
v_fin NUMBER(3):=10;
v_multiplicacion NUMBER(8):=0;
v_contador NUMBER(3):= 1;
BEGIN
WHILE v_contador <= v_fin LOOP
    FOR i in v_inicio..v_fin LOOP
        v_multiplicacion := i * v_contador;
        dbms_output.put_line(v_contador || '*' || i || '= ' || v_multiplicacion);  
    END LOOP;
    v_contador := v_contador + 1;
END LOOP;
END;