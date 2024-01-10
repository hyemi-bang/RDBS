--03_WHERE.sql

/*
    # SELECT 컬럼명 FROM 테이블명 WHERE 조건절;
    - SELECT문 뒤에 WHERE절을 추가하여 해당 조건을 만족하는 행만 조회할 수 있다.
    - 오라클의 비교 연산자와 논리 연산자를 통해 조건절을 만들 수 있다.
    
    # 비교연산자
    =           : 같으면 true
    !=, <>, ^=  : 다르면 true
    <, >, <=, >=: 비교
    
    # 논리연산자
    
    AND, OR, NOT
    
*/
-- 월급 1000달러 이상인 사람 조회
Select * From employees Where salary >= 10000;

-- manager_id 101번 사원 모두 조회
Select * From employees Where manager_id = 101;

-- 문자열 데이터는 ''를 사용한다
Select * From employees WHERE last_name  = 'Austin';

-- 데이터는 대소문자 구분한다. 컬럼명, 테이블명, 커리문은 대소문자 구분하지 않는다.
Select * From employees WHERE last_name  = 'austin'; -- 조회되지 않는다.

-- 논리연산자
SELECT
    first_name,
    department_id
FROM
    employees
WHERE
        department_id = 50
    AND salary < 3000;
    
SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    NOT department_id = 50
    AND salary < 3000;    
 
 SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    NOT (department_id = 50
    AND salary < 3000);   
    
-- 데이터베이스에서는 문자타입도 비교가 가능하다
SELECT * FROM employees WHERE first_name >='A' AND first_name < 'D';
SELECT * FROM employees WHERE first_name <='Curtis';

-- 날짜 타입 비교
SELECT * FROM employees WHERE hire_date >'2007/12/31';

SELECT * FROM employees;
-- 연습 1> 월급이 2000에서 3000사이인 사원들의 풀네임과, 월급, 직책구하기
SELECT first_name || ' '|| last_name AS full_name, salary, job_id FROM employees WHERE salary >= 2000 AND salary <=3000;
-- 연습 2> 직책이 SH_CLERK 또는 ST_CLERK인 사원들의 이름, 전화번호 조회하기
SELECT first_name, phone_number FROM employees WHERE job_id = 'ST_CLERK' OR job_id = 'SH_CLERK';
-- 연습 3> 30/60/100번 부서에 속한 사원들의 이름, 고용일 조회하기
SELECT first_name, hire_date FROM employees WHERE department_id = '30' OR department_id = 60 OR department_id = 100; -- '30' 이나 30 모두 가능
-- 연습 4> 월급이 5000달러 이하인 사원이 있는 직책은 어떤것이 있는지 조회하기
SELECT DISTINCT job_id FROM employees WHERE salary <= 5000;


--컬럼명 BETWEEN A AND B : 해당 컬럼 값이 A 와 B 사이인 경우 true (2000 < salary <= 3000)
SELECT first_name, salary FROM employees WHERE salary BETWEEN 2000 AND 3000;

-- 컬럼명 IN(A,B,C...) : ()안의 내용에 해당 값이 있으면 true;
SELECT
    first_name,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'ST_CLERK', 'SH_CLERK' );

SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 30, 60, 100 );

-- ()안의 값을 나열하는 장소에 다른 쿼리문을 활용할 수 있다. (서브 쿼리)
-- ()값을 먼저 실행 한 후에 () 밖의 값을 실행한다.
SELECT first_name, department_id 
    FROM employees WHERE department_id IN (
        SELECT department_id FROM departments WHERE location_id = 1700);

-- null은 크기 비교가 불가능하기 떄문에 일반적인 비교 연산자를 사용 하면 false가 나온다.
SELECT * FROM employees WHERE commission_pct = null; -- 조회안됨

 -- NULL 행들을 조회하고 싶을때
SELECT * FROM employees WHERE commission_pct IS null;
SELECT * FROM employees WHERE nvl(commission_pct, 0) = 0; 

 -- NULL이 아닌 행들을 조회하고 싶을때
SELECT * FROM employees WHERE NOT commission_pct IS null;
SELECT * FROM employees WHERE commission_pct IS NOT null;

-- 사원번호가 홀수인 사원들만 조회하기(java에서 사용하던 %와 다르게
-- mod(value, divisor) 함수를 사용해 나머지를 구할 수 있다.)
SELECT * FROM employees WHERE mod(employee_id, 2) = 1;


/*
    # Like 
    - 데이터의 일부분이 일치하는 행을 조회할 수 있다.
    - % : 문자가 있어도 되고 없어도 되는 자리 (정규표현식 * 와 유사)
    - _ : 반드시 한 글자가 있어야 하는 자리
*/
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'S%';
-- 이름이 S로 시작하는 사람
SELECT first_name, last_name FROM employees WHERE first_name LIKE '_t%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '__l%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%r';
-- r로 끝나는 이름
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%e__';
-- 뒤에서 3번째 자리 e인 사람

SELECT hire_date FROM employees WHERE hire_date LIKE '%/02/%'; 
-- 입사한 월이 2월

-- 연습 1> first_name에 a가 포함된 모든 사원들의 이름 조회
SELECT first_name FROM employees WHERE first_name LIKE '%a%' OR first_name LIKE '%A%';
-- 연습 2> first_name에 e가 2개 포함된 모든 사원들의 이름 조회
SELECT first_name FROM employees WHERE first_name LIKE '%e%e%' OR first_name LIKE '%E%e%'; 
-- 연습 3> first_name이 5글자 이면서 r로 끝나는 모든 사원들의 이름 조회
SELECT first_name, last_name FROM employees WHERE first_name LIKE '____r%';
-- 연습 3> 8월에 입사한 사원들의 이름과 고용일 조회
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '%/08/%' 


















