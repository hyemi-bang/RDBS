--04_집합.sql
SELECT * FROM employees; --107명
SELECT first_name FROM employees WHERE first_name LIKE '%a%'; -- 66행
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 56행

-- SELECT를 여러개 사용할 수 있고, 위에서부터 순서대로 진행이 될 것이다.

-- INTERSECT : 교집합
-- e도 들어가고 a도 들어가는 직원들
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 23행 

--UNION : 합집합
-- first_name에 a있거나 e있는 모든 사원
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 81행

--UNION ALL : 중복행 제거 안한 합집합
-- first_name에 a있는 사람 조회하고 e있는 사람도 조회
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
UNION ALL
SELECT first_name FROM employees WHERE first_name LIKE '%e%'; -- 122행 조회

--MINUS : 차집합
 -- first_name a는 포함, e는 불포함인 사원
SELECT first_name FROM employees WHERE first_name LIKE '%a%'
MINUS
SELECT first_name FROM employees WHERE first_name LIKE '%e%';
-- first_name e는 포함, a는 불포함인 사원
SELECT first_name FROM employees WHERE first_name LIKE '%e%'
MINUS
SELECT first_name FROM employees WHERE first_name LIKE '%a%'; 