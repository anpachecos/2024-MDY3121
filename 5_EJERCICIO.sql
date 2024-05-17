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


/*FORMA DEL PROFE

Antonia Por favor repasa esto porque me simplificó la vida 
Entiendelo por favorrrrrrrrrrrrrr. Aprende a usar Cursores y loops cursores loop cursores looooop*/

DECLARE
    CURSOS cur_departamentos IS (
        SELECT 
        id_categoria, 
        nom_categoria
         FROM categoria;
    )

    CURSOR cur_vendedores(categoria VARCHAR2) IS
        SELECT 
            v.id_vendedor,
            v.nombres,
            v.apellidos,
            v.sueldo
        FROM vendedor v
        WHERE v.sueldo <= 400000
        AND id_categoria = id_categoria
        ORDER BY c.nom_categoria, v.id_vendedor;
    TYPE r_vendedor IS RECORD(
        id_vendedor vendedor.id_vendedor%TYPE,
        nombres vendedor.nombres%TYPE,
        apellidos vendedor.apellidos%TYPE,
        sueldo vendedor.sueldo%TYPE
    );

        v_id_categoria         categoria.id_categoria%TYPE;
        v_nom_categoria        categoria.nom_categoria%TYPE;
BEGIN

    LOOP
        FETCH cur_categoria INTO
            v_id_categoria,
            v_nom_categoria;
        
            EXIT WHEN cur_categoria%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');
            DBMS_OUTPUT.PUT_LINE(v_nom_categoria || ':');

            OPEN cur_vendores(v_id_categoria);
            LOOP
                FETCH cur_vendedores INTO
                    v_vendedor;
                EXIT WHEN cur_vendedores%NOTFOUND;
                
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(v_id_vendedor, 5) || 
                    RPAD(v_nombres || ' ' || v_apellidos, 25) || 
                    RPAD('$' || TO_CHAR(v_sueldo, '999,999'), 15));

            END LOOP;
            CLOSE cur_vendedores;
            
    END LOOP;