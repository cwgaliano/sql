CREATE OR REPLACE FUNCTION contactos_get_direccion(
    in p_dni                 integer
) RETURNS text AS
$$
    SELECT direccion FROM contactos 
        WHERE dni = p_dni;
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION contactos_get_telefono(
    in p_dni                 integer
) RETURNS text AS
$$
    SELECT telefono FROM contactos 
        WHERE dni = p_dni;
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION contactos_get_email(
    in p_dni                 integer
) RETURNS text AS
$$
    SELECT email FROM contactos 
        WHERE dni = p_dni;
    
$$ LANGUAGE sql STABLE STRICT;

CREATE OR REPLACE FUNCTION contactos_set_direccion(
    IN p_dni                 integer
    IN p_direccion           text
) RETURNS text AS
$$
    UPDATE contactos SET direccion = p_ direccion 
        WHERE dni = p_dni;
    
$$ LANGUAGE sql VOLATILE STRICT;
