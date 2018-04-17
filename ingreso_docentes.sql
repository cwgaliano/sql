INSERT INTO  personas(dni, nombre, apellido, fecha_nac) VALUES(39655, 'jose', 'villanueva', '1980-12-10');

INSERT INTO  contactos(dni, direccion, telefono, email) VALUES(39655, 'lanus', 15566684, 'profe@lumux.com');

INSERT INTO  docentes(cuil, dni, fecha_contratacion, honorarios) VALUES('20-3-1', 39655, '2012-12-12', 0.1);

INSERT INTO  cursos(nombre, descripcion, costo) VALUES('Programacion', 'Java', 0.9);

INSERT INTO  es_docente_de(cuil, codigo) VALUES('20-3-1', 2);
