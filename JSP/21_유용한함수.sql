--21_�������Լ�.sql

/*              ���� Ÿ�� �Լ���                    */

-- TO_NUMBER(data) : �ٸ� Ÿ�� �����͸� ����Ÿ������ ��ȯ�ϴ� �Լ�
SELECT to_number('123') FROM dual;
SELECT to_number('22/11/01') FROM dual; --  The specified number was invalid.
-- ������ ����� ������ �ִ� ���ڿ��� ���� Ÿ������ ��ȯ�� �� �ִ�
-- '999,999' �ڸ��� �����ڸ�
SELECT to_number('10,000', '999,999') FROM dual;
SELECT to_number('1,000,000', '9,999,999') FROM dual;
SELECT to_number('$100', '$999') FROM dual;
SELECT to_number('100��', '999L') FROM dual;

-- abs(n) : ���밪
SELECT abs(-5) FROM dual;

-- floor(n) : ����
SELECT floor(123.999) FROM dual;

-- ceil(n) : �ø�
SELECT ceil(123.111) FROM dual;

-- round(n,m) : �ݿø�, �ڸ��� ��������
SELECT round(123.12345,4) FROM dual;

-- mod(n,m) : ����������
SELECT mod(10,3) FROM dual;

-- trunc(n,m) : ���ϴ� �ڸ������� �ڸ���
SELECT trunc(123.12345, 3) FROM dual; -- 123.123 ���
SELECT trunc(123.12345, -2) FROM dual; -- 100���

/*              ���� Ÿ�� �Լ���                    */

-- to_char(data) : �����͸� ����Ÿ������ ��ȯ
SELECT to_char(1234) FROM dual;
SELECT to_char(sysdate) FROM dual; -- ����ð��� ����Ÿ������ ��ȯ
-- ���ڸ� ���ϴ� ������ ���ڿ��� ��ȯ
SELECT to_char(1000000,'9,999,999') FROM dual;  -- 1,000,000
SELECT to_char(1000000,'$9,999,999') FROM dual;  --  $1,000,000
SELECT to_char(1000000,'9,999,999L') FROM dual;  --         1,000,000��

-- ��¥�� ���ϴ� ������ ���ڿ��� ��ȯ
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;
SELECT first_name, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM employees;
-- ��⿡ ����Ǿ��ִ� �ð� ���

-- substr(str, start, count) : ���ڿ� �ڸ���
SELECT substr('Hellooooooo', 2, 5) FROM dual;
SELECT substr('Hellooooooo', 1, 5) FROM dual; -- 0���� ������ �ƴϴ�.
SELECT substr('Hellooooooo', 0, 5) FROM dual; -- 0��1��� H�� �д´�.

-- ltrim (str, ���Ŵ���ڵ�) : ������ ���� ��� ���ڵ��� �����Ѵ�
SELECT ltrim('!!!!!!!Hello', '!') FROM dual;
SELECT ltrim('           Hello', ' ') FROM dual;
SELECT ltrim('!!!@@#!!Hello', '!@#') FROM dual;

-- rtrim (str, ���Ŵ���ڵ�) : �������� ���� ��� ���ڵ��� �����Ѵ�
SELECT rtrim('!!!!!!!Hello!!!!!!!!', '!') FROM dual;
SELECT rtrim('ABC!!!@@#!!', '!@#') FROM dual;

-- lpad(str, len, char) : ���ϴ� ���̸�ŭ ���ʿ� ���ڵ��� ä���ش�
SELECT lpad('Hello', 20, ' ') FROM dual;
SELECT lpad('Nice to meet you', 40, ' ') FROM dual;
SELECT lpad('Nice to meet you', 40, '0') FROM dual;

-- rpad(str, len, char) : ���ϴ� ���̸�ŭ �����ʿ� ���ڵ��� ä���ش�
SELECT rpad('Hello', 20, ' ') FROM dual;
SELECT rpad('Nice to meet you', 20, ' ') FROM dual;
SELECT rpad('Shoes', 15, '>') FROM dual;

-- upper(str) : �빮�ڷ�
-- lower(str) : �ҹ��ڷ�
-- initcap(str) : ù ���ڸ� �빮�ڷ�
SELECT initcap('employees') FROM dual;
SELECT email FROM employees;
SELECT initcap('email') FROM employees;
SELECT lpad(first_name,13,' ') FROM employees;

-- replace(str, old, new) ġȯ�ϱ�
SELECT replace('abc@naver.com', 'naver', 'gmail')FROM dual;

/*              ��¥ Ÿ�� �Լ���                    */

-- to_date(data) : �����͸� ��¥ Ÿ������ ��ȯ
SELECT to_date('1999/12/12') FROM dual;
--��ȯ�Ҷ� ������ �����ϸ� �� ��Ȯ�ϰ� ��ȯ����
SELECT to_date('1999/12/12 12:12:12', 'YYYY/MM/DD HH:MI:SS') FROM dual;

-- trunc(date) : ���ϴ� ������ ��¥�� �ڸ�
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;
-- 2023/11/02 04:19:11 ���
SELECT 
    to_char(trunc(sysdate, 'day'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- day ������ �ڸ�(�������� -> �Ͽ��Ϸΰ�) 
-- 2023/10/29 12:00:00 ��� (HH ::  12�ñ���)

SELECT 
    to_char(trunc(sysdate, 'DD'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- day ������ �ڸ�(��¥ ���� �� �ڸ�) 
-- 2023/11/02 12:00:00 ��� (HH ::  12�ñ���)

SELECT 
    to_char(trunc(sysdate, 'HH'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- �ð� ������ �ڸ�
-- 2023/11/02 04:00:00 ��� 

SELECT 
    to_char(trunc(sysdate, 'month'), 'YYYY/MM/DD HH24:MI:SS')
FROM dual; -- month ������ �ڸ�(�ð�����) 
-- 2023/11/01 00:00:00

SELECT 
    to_char(trunc(sysdate, 'year'), 'YYYY/MM/DD HH24:MI:SS')
FROM dual; -- year ������ �ڸ�(�ð�����) 
-- 2023/01/01 00:00:00











