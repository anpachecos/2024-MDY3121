------CASO 4------
DECLARE
    V_VENDEDOR  VENDEDOR%ROWTYPE;
    V_MIN       NUMBER(4); 
    V_MAX       NUMBER(4);
    v_ID_VENDEDOR NUMBER(4):= 0;
BEGIN
    SELECT
        MIN(ID_VENDEDOR),
        MAX(ID_VENDEDOR)
    INTO 
        V_MIN, 
        V_MAX
    FROM VENDEDOR;
    
    FOR i in V_MIN..V_MAX LOOP
        V_ID_VENDEDOR := i *5;
        SELECT 
         *
        INTO
            V_VENDEDOR
        FROM
            vendedor
        WHERE
            id_vendedor = v_id_vendedor;
        
        IF V_VENDEDOR.SUELDO <= 354000 THEN 
            dbms_output.put_line( '['|| i ||']'|| ' Empleado N°' || V_VENDEDOR.id_vendedor ||
            ' -' || V_VENDEDOR.nombres ||' ' || V_VENDEDOR.APELLIDOS ||' tiene un sueldo de ' ||
            TO_CHAR(V_VENDEDOR.sueldo, '999G999G999'));  
        END IF;
    
    END LOOP;
        
END;

SELECT * FROM VENDEDOR;
