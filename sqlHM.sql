1. Выведите на экран любое сообщение

CREATE OR REPLACE FUNCTION write_smth() RETURNS varchar
AS $$
BEGIN
	RETURN 'Hello!';
END
$$ LANGUAGE plpgsql;

2. Выведите на экран текущую дату

CREATE OR REPLACE FUNCTION write_cur_date() RETURNS date
AS $$
BEGIN
	RETURN NOW();
END
$$ LANGUAGE plpgsql;

3. Создайте две числовые переменные и присвойте им значение. 
Выполните математические действия с этими числами и выведите результат на экран.

CREATE OR REPLACE FUNCTION do_math(a int, b int) RETURNS int
AS $$
BEGIN
	RETURN a*b;
END
$$ LANGUAGE plpgsql;

4. Написать программу двумя способами 1 - использование IF, 2 - использование CASE. 
Объявите числовую переменную и присвоейте ей значение. 
Если число равно 
5 - выведите на экран "Отлично". 
4 - "Хорошо". 
3 - Удовлетворительно". 
2 - "Неуд". 
В остальных случаях выведите на экран сообщение, что введённая оценка не верна.

a)
CREATE OR REPLACE FUNCTION string_marks(integer_mark int) RETURNS varchar
AS $$
DECLARE 
	res varchar;
BEGIN
	CASE integer_mark
		WHEN 5 THEN res := 'Отлично';
		WHEN 4 THEN res := 'Хорошо';
		WHEN 3 THEN res := 'Удовлетворительно';
		WHEN 2 THEN res := 'Неуд';
		ELSE res := 'Оценка не верна';
	END CASE;
	RETURN res;
END
$$ LANGUAGE plpgsql;

b)


