--13 서브쿼리.sql

/*
    #서브쿼리
    - 쿼리문 내부에 포함된 또 다른 쿼리문.
    - 서브 쿼리를 포함하고 있는 쿼리는 메인 쿼리라고 부른다.
    - 서브 쿼리의 실행 결과가 한 줄인지 여러 줄인지에 따라 단일행 서브쿼리와
      다중행 서브쿼리로 구분된다.
    - 단일행의 결과를 원한다면 주로 기본키를 사용하여 한 행을 조회한다.
    - 단일행 서비쿼리를 대상으로 하는 연산자와
      다중행 서브쿼리를 대상으로 하는 연산자는 나뉘어져 있다.
    - 서브쿼리의 결과는 비교해야 하는 대상으로 사용되거나 테이블 대용으로 활용될 수 있다.
    
    # 단일행 서브쿼리
    - 서브쿼리의 실행 결과가 단 한 줄인 경우 
    - 단일행 서브쿼리 연산자(=, >, <, <>, ^=, <=, ...)
    
    # 다중행 서브쿼리
    - 서브쿼리의 실행 결과가 2행 이상일 수 있는 경우
    - 다중행 서브쿼리 연산자 (IN, ANY, SOME, EXISTS....)
*/

-- 1> 비교값 대신 서브쿼리 활용하기
SELECT * FROM employees WHERE salary >= 10000;
SELECT * FROM employees 
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 169);
-- 위의 두개는 같은 값을 가진다.

SELECT * FROM employees 
WHERE salary >= (SELECT salary FROM employees WHERE first_name = Alexander);
-- Alexander 두 명이고 이들의 월급은 9000, 3100. 단일행이 아닌 컬럼을 사용하였기에 
-- ORA-00904: "ALEXANDER": invalid identifier 오류가 나온다.
-- 즉, 서브쿼리의 결과가 여러줄이 나오는 경우 일반연산자는 사용할 수 없다.


-- 2> 조회해야 할 테이블 대신 서브쿼리 사용하기
SELECT * FROM (SELECT * FROM employees WHERE job_id = 'IT_PROG'); 
SELECT * FROM 
(SELECT first_name, job_id FROM employees WHERE job_id = 'IT_PROG'); 
-- ()에서 테이블 대용으로 조회를 끝마쳤기 때문에 
-- 바깥쪽에서 모든것을 조회한다고 해도 ()에서 추출된 값에서만 조회되는 것이다.

--인터넷 검색>>
-- 전체 직원의 급여 평균값
SELECT avg(salary) FROM employees;
-- 전체 직원의 급여 평균보다 더 높은 급여를 받는 직원
-- 모든 레코드 검색
--SELECT * FROM employees WHERE salary> (전체직원의 급여 평균값);
-- 1개의 sql로 바꾸기
SELECT * FROM employees WHERE salary>(SELECT avg(salary) FROM employees);

/*
    #다중행 서브쿼리 연산자
    
    - IN : 여러값들 중 일치하는 것이 하나라도 있으면 TRUE
    - ANY : 여러 값들 중 조건을 만족시키는 것이 하나라도 있으면 TRUE
    - SOME : ANY와 같은 값
    - ALL : 여러 값들이 조건을 모두 만족시키는 경우에만 TRUE
    - EXISTS : 값이 하나라도 조회되면 TRUE
*/
-- IN
-- ex> Alexander라는 사람이 속해 있는 직책을 가지고 있는 모든 사원을 조회
SELECT * FROM employees WHERE job_id 
IN (SELECT job_id FROM employees WHERE first_name = 'Alexander');


-- ANY & SOME

SELECT * FROM employees WHERE salary >= 8000; -- 기존에 조회하던 방식
SELECT * FROM employees WHERE salary >= ANY(5000, 8000, 9000, 15000);
--ANY(서브쿼리자리)중에서 salary>=를 만족하는 값이 있으면 출력해서 보여줘라 라는 의미
-- 현재 기준으로 보면 5000 이상이면 모두 출력이 되는 것이다.

-- ex>  department_id = 60 부서 보다 많이 버는 직원을 조회
SELECT * FROM employees 
WHERE salary > ANY(SELECT salary FROM employees WHERE department_id = 60 );
SELECT * FROM employees WHERE department_id = 60 ;

-- ALL
-- ANY, SOME은 하나만 만족시키면 되는데, ALL 은 전부 만족시켜야한다 즉 제일 큰 값을 만족시켜야한다.
SELECT * FROM employees WHERE salary > ALL (500, 6000, 7000, 8000, 9000);
-- ex> 60번부서의 모든 사원들 보다 더 잘버는 사원을 조회해라
SELECT * FROM employees 
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 60);

-- EXISTS
SELECT * FROM employees WHERE EXISTS(SELECT * FROM employees);

-- ex1> 최대 급여를 받는 사원을 조회
SELECT
    *
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.salary = j.max_salary;
-- ex2> 최대 급여를 받는 사원이 있는 부서를 조회 
-- (ex1의 내용을 서브쿼리로 하며 바깥쪽 조건이 변경되면 서브쿼리 내용도 변경되어야한다)
SELECT department_name FROM departments d
WHERE EXISTS (SELECT
    *
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.salary = j.max_salary AND e.department_id = d.department_id);

-- 연습1> job_title에 Manager가 포함되는 사원들의 전화번호와 이메일 조회
SELECT
    phone_number,
    email
FROM
    employees
WHERE
    job_id IN (
        SELECT
            job_id
        FROM
            jobs
        WHERE
            job_title LIKE '%Manager%'
    );

-- 연습2> 고용일이 2007년인 사원들이 소속한 부서에서 가장 돈을 많이 버는 사원들을 조회

SELECT * FROM employees WHERE (first_name, last_name) IN 
( SELECT first_name, last_name FROM employees WHERE employee_id=100);
SELECT * FROM employees WHERE (first_name, last_name) IN 
( ('Steven','King'), ('Neena', 'Kochhar'));
-- 연습2번 풀이는 다중열이 필요하다
-- 다중열 서브쿼리 = 서브쿼리로 2열 이상을 한번에 비교하는 방법

-- 07년도 입사한 애들
SELECT e.* FROM employees e WHERE e.hire_date LIKE '07/%/%' AND department_id = e.department_id;

-- 부서 번호들 중에 가장 돈 많이 버는 애들
SELECT d.department_id, MAX(e.salary) FROM employees e, departments d
WHERE e.hire_date LIKE '07/%/%' GROUP BY d.department_id;


-- 선생님해설>>
SELECT
    *
FROM
    employees
WHERE
    ( salary, department_id ) IN (
        SELECT
            MAX(salary), department_id
        FROM
            employees
        WHERE
            department_id IN (
                SELECT DISTINCT
                    department_id
                FROM
                    employees
                WHERE
                    hire_date LIKE '07/%'
            )
        GROUP BY
            department_id
    )
ORDER BY
    employee_id;





