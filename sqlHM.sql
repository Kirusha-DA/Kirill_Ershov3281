1. Выведите на экран любое сообщение

CREATE OR REPLACE FUNCTION write_smth() RETURNS varchar
AS $$
DECLARE 
	my_string varchar;
BEGIN
	RETURN 'Hello!';
END
$$ LANGUAGE plpgsql;

