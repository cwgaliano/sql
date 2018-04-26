CREATE OR REPLACE FUNCTION personas (
 	IN p_dni                      integer,
 	IN p_name                     text,
 	IN p_apellido                 text,
 	IN p_fecha_nac                date,
 
 )RETURNS personas AS
 $$
    INSERT INTO person(dni, nombre, apellido, fecha_nac) VALUES (p_dni, p_nombre, p_apellido, p_fecha_nac)
 	RETURNING *;
 $$ LANGUAGE sql VOLATILE STRICT;

CREATE OR REPLACE FUNCTION contactos (

 	IN p_dni                      integer,
 	IN p_direccion                text,
 	IN p_telefono                 integer,
 	IN p_email                    text
 
 )RETURNS personas AS
 $$
	INSERT INTO contactos(dni, direccion, telefono, email) VALUES(p_dni, p_direccion, p_telefono, p_email)
 	RETURNING *;
 $$ LANGUAGE sql VOLATILE STRICT;

CREATE OR REPLACE FUNCTION docentes (
 	IN p_dni                      integer,
 	IN p_fecha_contratacion       date,
 	IN p_honorarios               double precision,
 
 )RETURNS personas AS
 $$
	INSERT INTO docentes(cuil, dni, fecha_contratacion, honorarios) VALUES (p_cuil, p_dni, p_fecha_contratacion, p_honorarios)
 	RETURNING *;
 $$ LANGUAGE sql VOLATILE STRICT;

 CREATE OR REPLACE FUNCTION personas_alumno (
	IN p_nro_legajo               serial,
 	IN p_dni                      integer,
 	IN p_fecha_inscripcion        date,

 )RETURNS personas AS
 $$
	INSERT INTO alumnos(nro_legajo, dni, fecha_inscripcion) VALUES (p_nro_legajo, p_dni, p_fecha_inscripcion)
 	RETURNING *;
 $$ LANGUAGE sql VOLATILE STRICT;
 
 CREATE OR REPLACE FUNCTION personas_get_dni(
	p_personas				personas
)RETURNS personas AS
$$
	select dni(p_personas);
$$LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION contacto_set_direccion(
	IN -
	IN p_direccion				text
)RETURNS VOID AS
$$
	UPDATE - x set direccion = p_direccion where x = p_-;
$$LANGUAGE sql VOLATILE STRICT;

CREATE OR REPLACE FUNCTION contacto_set_telefono(
	IN -
	IN p_telefono				integer
)RETURNS VOID AS
$$
	UPDATE - x set telefono = p_telefono where x = p_-;
$$LANGUAGE sql VOLATILE STRICT;

CREATE OR REPLACE FUNCTION contacto_set_direccion(
	IN -
	IN p_email				text
)RETURNS VOID AS
$$
	UPDATE - x set email = p_email where x = p_-;
$$LANGUAGE sql VOLATILE STRICT;
