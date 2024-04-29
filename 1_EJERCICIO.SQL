DECLARE
v_numero NUMBER(4);
v_contador NUMBER(4):= 1;
v_iteracion NUMBER(4):=0;
v_sumatoria NUMBER(4):=0;
BEGIN
        v_iteracion := FLOOR(DBMS_RANDOM.value(1,20));
        dbms_output.put_line('Cantida de Iteraciones:' || v_iteracion);  
    WHILE v_contador <= v_iteracion LOOP
        v_numero := FLOOR(DBMS_RANDOM.value(20,200));
                dbms_output.put_line('Numero '|| v_contador || ' : '|| v_numero);  
        v_contador := v_contador + 1;
        v_sumatoria:= v_numero + v_sumatoria;
    END LOOP;
                dbms_output.put_line('Sumatoria de '|| (v_contador - 1) || ' numeros:  '|| v_sumatoria);  

END;
