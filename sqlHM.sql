--1. Выведите на экран любое сообщение

CREATE OR REPLACE FUNCTION write_smth() RETURNS varchar
AS $$
BEGIN
	RETURN 'Hello!';
END
$$ LANGUAGE plpgsql;

--2. Выведите на экран текущую дату

CREATE OR REPLACE FUNCTION write_cur_date() RETURNS date
AS $$
BEGIN
	RETURN NOW();
END
$$ LANGUAGE plpgsql;

--3. Создайте две числовые переменные и присвойте им значение. 
Выполните математические действия с этими числами и выведите результат на экран.

CREATE OR REPLACE FUNCTION do_math(a int, b int) RETURNS int
AS $$
BEGIN
	RETURN a*b;
END
$$ LANGUAGE plpgsql;

--4. Написать программу двумя способами 1 - использование IF, 2 - использование CASE. 
--Объявите числовую переменную и присвоейте ей значение. 
--Если число равно 
--5 - выведите на экран "Отлично". 
--4 - "Хорошо". 
--3 - Удовлетворительно". 
--2 - "Неуд". 
--В остальных случаях выведите на экран сообщение, что введённая оценка не верна.

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


CREATE OR REPLACE FUNCTION string_marks(integer_mark int) RETURNS varchar
AS $$
DECLARE 
	res varchar;
BEGIN
	IF (integer_mark = 5) THEN 
		res := 'Отлично';
	ELSIF (integer_mark = 4) THEN
		res := 'Хоршо';
	ELSIF (integer_mark = 3) THEN
		res := 'Удовлетворительно';
	ELSIF (integer_mark = 2) THEN
		res := 'Неуд';
	ELSE
		res := 'Оценка не верна';
	END IF;
	RETURN res;
END
$$ LANGUAGE plpgsql;

--5. Выведите все квадраты чисел от 20 до 30 3-мя разными способами (LOOP, WHILE, FOR).

CREATE OR REPLACE PROCEDURE pow_nums()
LANGUAGE plpgsql
AS $$
DECLARE 
	nums int := 20;
BEGIN
	LOOP
		EXIT WHEN nums > 30;
		RAISE NOTICE 'number: %',nums*nums;
		nums := nums + 1;
	END LOOP;
END;
$$;

DO $$
DECLARE 
	nums int := 20;
BEGIN
	WHILE (nums <= 30)
	LOOP
		RAISE NOTICE 'number: %',nums*nums;
		nums := nums + 1;
	END LOOP;
END;
$$;


DO $$
DECLARE 
BEGIN
	FOR i IN 20..30 LOOP
		RAISE NOTICE 'number: %',i*i;
	END LOOP;
END;
$$;

--6. Последовательность Коллатца. Берётся любое натуральное число. 
--Если чётное - делим его на 2, если нечётное, то умножаем его на 3 и прибавляем 1.
--Такие действия выполняются до тех пор, пока не будет получена единица. 
--Гипотеза заключается в том, что какое бы начальное число n не было выбрано, 
--всегда получится 1 на каком-то шаге. Задания: написать функцию, 
--входной параметр - начальное число, на выходе - количество чисел, пока не получим 1;
--написать процедуру, которая выводит все числа последовательности. 
--Входной параметр - начальное число.


CREATE OR REPLACE FUNCTION collatz_alg(n int) RETURNS int
AS $$
BEGIN
	WHILE (n != 1)
	LOOP
		CASE n % 2
			WHEN 0 
				THEN n := n / 2;
			ELSE 
				n := n * 3 + 1;
		END CASE;
	END LOOP;
	RETURN n;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE collatz_alg_p(INOUT n int)
LANGUAGE plpgsql
AS $$
BEGIN
	WHILE (n != 1)
	LOOP
		CASE n % 2
			WHEN 0 
				THEN RAISE NOTICE 'numbers: %', n;
				 n := n / 2;
			ELSE 
				RAISE NOTICE 'numbers: %', n;
				n := n * 3 + 1;
		END CASE;
	END LOOP;
	RAISE NOTICE 'numbers: %', n;
END
$$;

--7. Числа Люка. Объявляем и присваиваем значение переменной - количество числе Люка. 
--Вывести на экран последовательность чисел. Где L0 = 2, L1 = 1 ; Ln=Ln-1 + Ln-2 (сумма двух предыдущих чисел). 
--Задания: написать фунцию, входной параметр - количество чисел, на выходе - последнее число 
--(Например: входной 5, 2 1 3 4 7 - на выходе число 7); написать процедуру, которая выводит все числа последовательности. 
--Входной параметр - количество чисел.

CREATE OR REPLACE FUNCTION luke_num(n int) 
RETURNS int
AS $$
BEGIN
	IF (n = 1) THEN
		RETURN 2;
	ELSIF (n=2) THEN
		RETURN 1;
	ELSE
		RETURN luke_num(n-1) + luke_num(n-2);
	END IF;
	RETURN -1;
END
$$ LANGUAGE plpgsql;

LANGUAGE plpgsql
AS $$
DECLARE 
	L0 int := 2;
	L1 int := 1;
	i int := 0;
	L_sum int := 0; 
BEGIN
	RAISE NOTICE E'nums = % \n nums = %', L0, L1;
	WHILE (i < n - 2)
	LOOP 
		L_sum := L0 + L1;
		L0 := L1;
		L1 := L_sum;
		i := i + 1;
		RAISE NOTICE 'nums = %', L1;
	END LOOP;
END;
$$;

--8.Напишите функцию, которая возвращает количество человек родившихся в заданном году.

CREATE OR REPLACE FUNCTION birth_count(birth_date date) RETURNS int
AS $$
DECLARE 
	my_count int;
BEGIN
	SELECT COUNT(*) INTO my_count
	FROM people
	WHERE people.birth_date = birth_count.birth_date;
	RETURN my_count;
END
$$ LANGUAGE plpgsql;

--9.Напишите функцию, которая возвращает количество человек с заданным цветом глаз.

CREATE OR REPLACE FUNCTION get_by_eyes(color varchar) RETURNS int
AS $$
DECLARE 
	my_count int;
BEGIN
	SELECT COUNT(*) INTO my_count
	FROM people
	WHERE people.eyes = get_by_eyes.color;
	RETURN my_count;
END
$$ LANGUAGE plpgsql;