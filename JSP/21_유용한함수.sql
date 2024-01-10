--21_유용한함수.sql

/*              숫자 타입 함수들                    */

-- TO_NUMBER(data) : 다른 타입 데이터를 숫자타입으로 변환하는 함수
SELECT to_number('123') FROM dual;
SELECT to_number('22/11/01') FROM dual; --  The specified number was invalid.
-- 포맷을 사용해 형식이 있는 문자열도 숫자 타입으로 변환할 수 있다
-- '999,999' 자리가 포맷자리
SELECT to_number('10,000', '999,999') FROM dual;
SELECT to_number('1,000,000', '9,999,999') FROM dual;
SELECT to_number('$100', '$999') FROM dual;
SELECT to_number('100￦', '999L') FROM dual;

-- abs(n) : 절대값
SELECT abs(-5) FROM dual;

-- floor(n) : 내림
SELECT floor(123.999) FROM dual;

-- ceil(n) : 올림
SELECT ceil(123.111) FROM dual;

-- round(n,m) : 반올림, 자릿수 설정가능
SELECT round(123.12345,4) FROM dual;

-- mod(n,m) : 나머지연산
SELECT mod(10,3) FROM dual;

-- trunc(n,m) : 원하는 자리수에서 자르기
SELECT trunc(123.12345, 3) FROM dual; -- 123.123 출력
SELECT trunc(123.12345, -2) FROM dual; -- 100출력

/*              문자 타입 함수들                    */

-- to_char(data) : 데이터를 문자타입으로 변환
SELECT to_char(1234) FROM dual;
SELECT to_char(sysdate) FROM dual; -- 현재시간을 문자타입으로 변환
-- 숫자를 원하는 포맷의 문자열로 변환
SELECT to_char(1000000,'9,999,999') FROM dual;  -- 1,000,000
SELECT to_char(1000000,'$9,999,999') FROM dual;  --  $1,000,000
SELECT to_char(1000000,'9,999,999L') FROM dual;  --         1,000,000￦

-- 날짜를 원하는 포맷의 문자열로 변환
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;
SELECT first_name, to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM employees;
-- 기기에 저장되어있는 시간 출력

-- substr(str, start, count) : 문자열 자르기
SELECT substr('Hellooooooo', 2, 5) FROM dual;
SELECT substr('Hellooooooo', 1, 5) FROM dual; -- 0부터 시작이 아니다.
SELECT substr('Hellooooooo', 0, 5) FROM dual; -- 0과1모두 H를 읽는다.

-- ltrim (str, 제거대상문자들) : 왼쪽의 제거 대상 문자들을 제거한다
SELECT ltrim('!!!!!!!Hello', '!') FROM dual;
SELECT ltrim('           Hello', ' ') FROM dual;
SELECT ltrim('!!!@@#!!Hello', '!@#') FROM dual;

-- rtrim (str, 제거대상문자들) : 오른쪽의 제거 대상 문자들을 제거한다
SELECT rtrim('!!!!!!!Hello!!!!!!!!', '!') FROM dual;
SELECT rtrim('ABC!!!@@#!!', '!@#') FROM dual;

-- lpad(str, len, char) : 원하는 길이만큼 왼쪽에 문자들을 채워준다
SELECT lpad('Hello', 20, ' ') FROM dual;
SELECT lpad('Nice to meet you', 40, ' ') FROM dual;
SELECT lpad('Nice to meet you', 40, '0') FROM dual;

-- rpad(str, len, char) : 원하는 길이만큼 오른쪽에 문자들을 채워준다
SELECT rpad('Hello', 20, ' ') FROM dual;
SELECT rpad('Nice to meet you', 20, ' ') FROM dual;
SELECT rpad('Shoes', 15, '>') FROM dual;

-- upper(str) : 대문자로
-- lower(str) : 소문자로
-- initcap(str) : 첫 글자만 대문자로
SELECT initcap('employees') FROM dual;
SELECT email FROM employees;
SELECT initcap('email') FROM employees;
SELECT lpad(first_name,13,' ') FROM employees;

-- replace(str, old, new) 치환하기
SELECT replace('abc@naver.com', 'naver', 'gmail')FROM dual;

/*              날짜 타입 함수들                    */

-- to_date(data) : 데이터를 날짜 타입으로 변환
SELECT to_date('1999/12/12') FROM dual;
--변환할때 형식을 지정하면 더 정확하게 변환가능
SELECT to_date('1999/12/12 12:12:12', 'YYYY/MM/DD HH:MI:SS') FROM dual;

-- trunc(date) : 원하는 단위로 날짜를 자름
SELECT to_char(sysdate, 'YYYY/MM/DD HH:MI:SS') FROM dual;
-- 2023/11/02 04:19:11 출력
SELECT 
    to_char(trunc(sysdate, 'day'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- day 밑으로 자름(요일제거 -> 일요일로감) 
-- 2023/10/29 12:00:00 출력 (HH ::  12시기준)

SELECT 
    to_char(trunc(sysdate, 'DD'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- day 밑으로 자름(날짜 밑을 다 자름) 
-- 2023/11/02 12:00:00 출력 (HH ::  12시기준)

SELECT 
    to_char(trunc(sysdate, 'HH'), 'YYYY/MM/DD HH:MI:SS')
FROM dual; -- 시간 밑으로 자름
-- 2023/11/02 04:00:00 출력 

SELECT 
    to_char(trunc(sysdate, 'month'), 'YYYY/MM/DD HH24:MI:SS')
FROM dual; -- month 밑으로 자름(시간제거) 
-- 2023/11/01 00:00:00

SELECT 
    to_char(trunc(sysdate, 'year'), 'YYYY/MM/DD HH24:MI:SS')
FROM dual; -- year 밑으로 자름(시간제거) 
-- 2023/01/01 00:00:00











