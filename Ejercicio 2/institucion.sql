CREATE TABLE personas(
	dni							integer PRIMARY KEY,
	nombre						text NOT NULL,
	apellido					text NOT NULL,	
	fecha_nac					date NOT NULL CHECK(fecha_nac < current_date)
);


CREATE TABLE contactos(
	dni							integer PRIMARY KEY REFERENCES personas(dni),
	direccion					text NOT NULL,
	telefono					integer,
	email						text
);


CREATE TABLE alumnos(
	nro_legajo					serial PRIMARY KEY,
	dni							integer UNIQUE NOT NULL REFERENCES personas(dni),
	fecha_inscripcion			date NOT NULL CHECK(fecha_inscripcion < current_date)
);


CREATE TABLE docentes(
	cuil						text PRIMARY KEY,
	dni							integer UNIQUE NOT NULL REFERENCES personas(dni),
	fecha_contratacion			date NOT NULL CHECK(fecha_contratacion < current_date),
	honorarios					double precision NOT NULL check(honorarios >= 0)

);


CREATE TABLE cursos(
	codigo						serial PRIMARY KEY,
	nombre						text  UNIQUE NOT NULL,
	descripcion					text NOT NULL,
	costo						double precision NOT NULL CHECK(costo >= 0)
);


CREATE TABLE es_alumno_de(
	nro_legajo					integer UNIQUE NOT NULL REFERENCES alumnos(nro_legajo),
	codigo						integer UNIQUE NOT NULL REFERENCES cursos(codigo),
	PRIMARY KEY					(nro_legajo, codigo)
);	


CREATE TABLE es_docente_de(
	cuil						text UNIQUE NOT NULL REFERENCES docentes(cuil),
	codigo						integer UNIQUE NOT NULL REFERENCES cursos(codigo),
	PRIMARY KEY					(cuil, codigo)
);	

