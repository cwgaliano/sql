 CREATE TABLE person (
 	dni						integer PRIMARY KEY,
 	name 						text NOT NULL,
 	surname						text NOT NULL,
 	birthday					date NOT NULL CHECK(birthday <= current_date)
 );
 
 CREATE OR REPLACE FUNCTION person (
 	IN p_dni					INTEGER,
 	IN p_name					TEXT,
 	IN p_surname				TEXT,
 	IN p_birthday				DATE
 
 )RETURNS person AS
 $$
 	INSERT INTO person(dni, name, surname, birthday) VALUES (p_dni, p_name, p_surname, p_birthday)
 	RETURNING *;
 $$ LANGUAGE sql VOLATILE STRICT;
 
  select person(423232, 'antonio','cremades', '1998-10-04'::date);
  select person(3955232, 'jose','ades', '1938-07-14'::date);
  select person(19990232, 'casa','crem', '1968-12-24'::date);
  select person(41566923, 'cintia','koch', '2000-02-01'::date);

  select * from person;

  
