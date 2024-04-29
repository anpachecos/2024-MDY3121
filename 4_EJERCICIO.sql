DECLARE
    V_VENDEDOR  VENDEDOR%ROWTYPE;
    TYPE tipo_varray_vendedor IS VARRAY(10) OF VENDEDOR.ID_VENDEDOR%TYPE;
    varray_vendedor tipo_varray_vendedor := tipo_varray_vendedor();
BEGIN
    FOR v_vendedor_rec IN (SELECT * FROM vendedor) LOOP
        IF v_vendedor_rec.SUELDO <= 354000 THEN 
            varray_vendedor.EXTEND;
            varray_vendedor(varray_vendedor.LAST) := v_vendedor_rec.ID_VENDEDOR;
        END IF;
    END LOOP;
    
    -- Imprimir el contenido de varray_vendedor con el formato solicitado
    FOR i IN 1..varray_vendedor.COUNT LOOP
        SELECT *
        INTO V_VENDEDOR
        FROM vendedor
        WHERE ID_VENDEDOR = varray_vendedor(i);
        
        DBMS_OUTPUT.PUT_LINE('[' || i || '] Empleado N°' || V_VENDEDOR.ID_VENDEDOR ||
            ' - ' || V_VENDEDOR.NOMBRES || ' ' || V_VENDEDOR.APELLIDOS || ' tiene un sueldo de ' ||
            TO_CHAR(V_VENDEDOR.SUELDO, '999G999G999'));
    END LOOP;
END;
/
