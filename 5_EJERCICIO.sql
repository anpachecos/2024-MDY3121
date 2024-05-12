DECLARE
    v_id_vendedor           vendedor.id_vendedor%TYPE;
    v_nombres               vendedor.nombres%TYPE;
    v_apellidos             vendedor.apellidos%TYPE;
    v_sueldo                vendedor.sueldo%TYPE;
    v_nom_categoria         categoria.nom_categoria%TYPE;
    v_categoria_anterior    categoria.nom_categoria%TYPE := NULL; 
    
    CURSOR cur_empleados IS
        SELECT 
            v.id_vendedor,
            v.nombres,
            v.apellidos,
            v.sueldo,
            c.nom_categoria
        FROM vendedor v
        LEFT JOIN categoria c ON v.id_categoria = c.id_categoria
        WHERE v.sueldo <= 400000
        ORDER BY c.nom_categoria, v.id_vendedor;
    
 
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('INFORME DE EMPLEADOS POR DEPARTAMENTO');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
    
    OPEN cur_empleados;
    
    LOOP
        FETCH cur_empleados INTO
            v_id_vendedor,
            v_nombres,
            v_apellidos,
            v_sueldo,
            v_nom_categoria;
        
        EXIT WHEN cur_empleados%NOTFOUND;
        
        IF v_categoria_anterior IS NULL OR v_nom_categoria != v_categoria_anterior THEN
            DBMS_OUTPUT.PUT_LINE(v_nom_categoria || ':');
            v_categoria_anterior := v_nom_categoria;
        END IF;
        
            DBMS_OUTPUT.PUT_LINE(
            RPAD(v_id_vendedor, 5) || 
            RPAD(v_nombres || ' ' || v_apellidos, 25) || 
            RPAD('$' || TO_CHAR(v_sueldo, '999,999'), 15));
    END LOOP;
    
    CLOSE cur_empleados;
    
END;