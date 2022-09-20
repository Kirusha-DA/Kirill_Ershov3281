1. Выведите на экран любое сообщение

CREATE OR REPLACE FUNCTION write_smth() RETURNS varchar
AS $$
DECLARE 
	my_string varchar;
BEGIN
	RETURN 'Hello!';
END
$$ LANGUAGE plpgsql;

2. Выведите на экран текущую дату

CREATE OR REPLACE FUNCTION write_cur_date() RETURNS date
AS $$
DECLARE 
	my_string date;
BEGIN
	RETURN NOW();
END
$$ LANGUAGE plpgsql;

3. Создайте две числовые переменные и присвойте им значение. 
Выполните математические действия с этими числами и выведите результат на экран.

CREATE OR REPLACE FUNCTION do_math(a int, b int) RETURNS int
AS $$
DECLARE 
	res int;
BEGIN
	RETURN a*b;
END
$$ LANGUAGE plpgsql;
