DECLARE
    TYPE tipo_registro IS RECORD (
        tipo VARCHAR2(20),
        id VARCHAR2(20),
        nombre VARCHAR2(100),
        rut VARCHAR2(20),
        grupo VARCHAR2(100),
        categoria VARCHAR2(100),
        sueldo NUMBER
    );

    v_registro tipo_registro;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('                    INFORME DE EMPLEADOS, CLIENTES Y VENDEDORES');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TIPO        ID  NOMBRE COMPLETO         RUT         GRUPO      CATEGORIA       SUELDO');
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------');

       FOR vendedor_rec IN (
        SELECT 'Vendedor' AS tipo,
               id_vendedor AS id,
               nombres || ' ' || apellidos AS nombre,
               rut_vendedor AS rut,
               g.nom_grupo AS grupo,
               c.nom_categoria AS categoria,
               sueldo
        FROM GRUPO g
        RIGHT JOIN VENDEDOR v ON g.id_grupo = v.id_grupo
        LEFT JOIN categoria c ON c.id_categoria = v.id_categoria
    ) LOOP
        v_registro.tipo := vendedor_rec.tipo;
        v_registro.id := vendedor_rec.id;
        v_registro.nombre := vendedor_rec.nombre;
        v_registro.rut := vendedor_rec.rut;
        v_registro.grupo := vendedor_rec.grupo;
        v_registro.categoria := vendedor_rec.categoria;
        v_registro.sueldo := vendedor_rec.sueldo;

        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_registro.tipo, 10) || 
            RPAD(v_registro.id, 4) || 
            RPAD(v_registro.nombre, 24) || 
            RPAD(v_registro.rut, 12) || 
            RPAD(v_registro.grupo, 12) || 
            RPAD(v_registro.categoria, 15) || 
            TO_CHAR(v_registro.sueldo, '$999G999G999')
        );
    END LOOP;


    FOR cliente_rec IN (
        SELECT 'Cliente' AS tipo,
               id_cliente AS id,
               nombre_cliente AS nombre,
               NULL AS rut,
               NULL AS grupo,
               NULL AS categoria,
               NULL AS sueldo
        FROM CLIENTE
    ) LOOP
        v_registro.tipo := cliente_rec.tipo;
        v_registro.id := cliente_rec.id;
        v_registro.nombre := cliente_rec.nombre;
        v_registro.rut := cliente_rec.rut;
        v_registro.grupo := cliente_rec.grupo;
        v_registro.categoria := cliente_rec.categoria;
        v_registro.sueldo := cliente_rec.sueldo;

        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_registro.tipo, 10) || 
            RPAD(v_registro.id, 4) || 
            RPAD(v_registro.nombre, 24) || 
            RPAD(v_registro.rut, 12) || 
            RPAD(v_registro.grupo, 12) || 
            RPAD(v_registro.categoria, 15) || 
            TO_CHAR(v_registro.sueldo, '$999G9999G999')
        );
        
    END LOOP;
    
 
END;
/
