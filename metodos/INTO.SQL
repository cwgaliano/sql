CREATE OR REPLACE FUNCTION personas (
 	IN p_dni                      integer,
 	IN p_name                     text,
 	IN p_apellido                 text,
 	IN p_fecha_nac                date,
  	IN p_dni                      integer,
 	IN p_direccion                text,
 	IN p_telefono                 integer,
 	IN p_email                    text
 
 )RETURNS personas AS
 $$
    INSERT INTO person(dni, nombre, apellido, fecha_nac) 
        VALUES (p_dni, p_nombre, p_apellido, p_fecha_nac)
        
	INSERT INTO contactos(dni, direccion, telefono, email)
        VALUES(p_dni, p_direccion, p_telefono, p_email)
       
 	SELECT * FROM personas where dni = p_dni;
 $$ LANGUAGE sql VOLATILE;

CREATE OR REPLACE FUNCTION personas_get_dni(
    in p_personas                 personas
) RETURNS integer AS
$$
    select dni(p_personas);
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_nombre(
    in p_personas                 personas
) RETURNS text AS
$$
    select nombre(p_personas);
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_apellido(
    in p_personas                 personas
) RETURNS text AS
$$
    select apellido(p_personas);
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_fecha_nac(
    in p_personas                 personas
) RETURNS date AS
$$
    select fecha_nac(p_personas);
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_edad(
    in p_personas                 personas
) RETURNS integer AS
$$
    SELECT date_part('year',age(personas_get_fecha_nac(p_personas)));
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_direccion(
    in p_personas                 personas
) RETURNS text AS
$$
    SELECT direccion FROM contactos 
        WHERE dni = personas_get_dni(p_personas);
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_telefono(
    in p_personas                 personas
) RETURNS text AS
$$
    SELECT telefono FROM contactos 
        WHERE dni = personas_get_dni(p_personas);
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_get_email(
    in p_personas                 personas
) RETURNS text AS
$$
    SELECT email FROM contactos 
        WHERE dni = personas_get_dni(p_personas);
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION personas_set_email(
    in p_personas                 personas
) RETURNS text AS
$$
    SELECT email FROM contactos 
        WHERE dni = personas_get_dni(p_personas);
    
$$ LANGUAGE sql STABLE STRICT;
