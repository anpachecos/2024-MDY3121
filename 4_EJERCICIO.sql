DECLARE
        v_id        VENDEDOR.ID_VENDEDOR%TYPE;
        v_nombres   VENDEDOR.NOMBRES%TYPE;
        v_apellidos VENDEDOR.APELLIDOS%TYPE;
        v_sueldo    VENDEDOR.SUELDO%TYPE;
        v_contador  NUMBER(2):=0;

    CURSOR cur_vendedor IS (
        SELECT 
            id_vendedor,
            nombres, 
            apellidos,
            sueldo
        FROM vendedor 
            WHERE sueldo <= 354000);
BEGIN
    OPEN cur_vendedor;
    
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('INFORME DE EMPLEADOS');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    
    
        LOOP
            v_contador := v_contador + 1;
            FETCH cur_vendedor INTO
            v_id,
            v_nombres,
            v_apellidos,
            v_sueldo;
            EXIT WHEN cur_vendedor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE( '['|| v_contador || '] ' || 'Empleado N° ' || v_id
            || ' - ' || v_nombres || ' ' || v_apellidos || 
            ' tiene un sueldo de ' || TO_CHAR(v_sueldo, '$999g999g999'));
        END LOOP;
    CLOSE cur_vendedor;
END;

/*-------------Forma dos de hacer el ejercicio--------------*/
DECLARE
      

    CURSOR cur_vendedor IS (
        SELECT 
            id_vendedor,
            nombres, 
            apellidos,
            sueldo
        FROM vendedor 
            WHERE sueldo <= 354000);

        --Esto nos crea una estructura la cual modemos usar las veces que queramos para almacenar los datos de un empleado
        TYPE r_vendedor IS RECORD(
            id_vendedor VENDEDOR.ID_VENDEDOR%TYPE,
            nombres VENDEDOR.NOMBRES%TYPE,
            apellidos VENDEDOR.APELLIDOS%TYPE,
            sueldo VENDEDOR.SUELDO%TYPE
        );
        
        v_vendedor r_vendedor; --De tipo Record 
        
BEGIN
    OPEN cur_vendedor;
    
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('INFORME DE EMPLEADOS');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    
    
        LOOP
            v_contador := v_contador + 1;
            FETCH cur_vendedor INTO
            v_vendedor;
            EXIT WHEN cur_vendedor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE( '['|| v_contador || '] ' || 'Empleado N° ' || v_vendedor.id_vendedor
            || ' - ' || v_vendedor.nombres || ' ' || v_vendedor.apellidos || 
            ' tiene un sueldo de ' || TO_CHAR(v_sueldo, '$999g999g999'));
        END LOOP;
    CLOSE cur_vendedor;
END;