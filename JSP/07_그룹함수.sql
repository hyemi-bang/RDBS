-- 07 그룹 함수.sql

/*
    #그룹 함수
    - 원하는 컬럼을 기준으로 그룹을 묶어서 계산할 수 있는 함수들.
    - 그룹을 묶을 떄 기준이 되는 컬럼은 GROUP BY절로 설정할 수 있다.
    - 그룹 함수를 사용하면 일반 컬럼은 함꼐 출력할 수 없다.
      => 00937. 00000 -  "not a single-group group function"
    - 그룹 함수의 결과와 그룹의 기준이 되는 컬럼만 사용할 수 있다.
*/

-- SUM(column) : 해당 컬럼의 총합을 구해주는 그룹 함수
SELECT sum(salary) FROM employees;-- 691416 모든 사원들의 월급 총합
-- SELECT sum(salary), first_name FROM employees;
-- 그룹함수를 출력하면 일반 컬럼을 출력할 수 없다. 

-- 직책별 월급 총합
SELECT sum(salary), job_id FROM employees GROUP BY job_id; 
-- 부서별 월급 총합
SELECT sum(salary), department_id FROM employees GROUP BY department_id;

-- avg(column) : 해당 컬럼의 평균값을 구해주는 그룹 함수
SELECT avg(salary), sum(salary), job_id FROM employees GROUP BY job_id; 

-- count(column) : 해당 컬럼의 행의 개수를 구할 수 있다 (null 값은 세지 않는다)
SELECT count(commission_pct) FROM employees;
-- 커미션을 어느부서에서 몇명이 받고 있는지
SELECT department_id, count(commission_pct) FROM employees GROUP BY department_id;

-- max(column) : 그룹별 각 컬럼 최댓값을 구할 수 있다.
SELECT max(salary),job_id FROM employees GROUP BY job_id;

-- min(column) : 그룹별 각 컬럼 최솟값을 구할 수 있다.
SELECT min(salary),job_id FROM employees GROUP BY job_id;

-- 연습1> 각 직책별 평균연봉
SELECT avg(salary * 12)||'$' AS annual_income, job_id FROM employees GROUP BY job_id; 

-- 연습2> 각 부서별 가장 최근에 사원이 입사한 날짜와 가장 오래전 입사한 날짜 조회
SELECT hire_date FROM employees;
SELECT 
    department_id,
    MAX(hire_date) AS recently,
    MIN(hire_date) AS oldest
FROM
    employees
GROUP BY
    department_id;

/*
    # HAVING
    - 그룹 함수로 묶어서 도출된 결과에 대해 조건을 적용하고 싶은 경우 사용하는 문법
    - WHERE은 그룹으로 묶기전에 적용되기 때문에
      그룹 함수의 결과는 WHERE절의 조건으로 사용할 수 없다.
*/

SELECT avg(salary), job_id FROM employees GROUP BY job_id;
-- 평균 월급이 8000$ 넘어가는 직책을 알고 싶을때
SELECT avg(salary), job_id FROM employees 
WHERE salary >= 8000 GROUP BY job_id;
--이처럼 WHERE 사용한다면 groub by 전에 먼저 적용을 받기 때문에 원하지 않는 값 도출
--따라서 HAVING 절 사용
SELECT avg(salary), job_id FROM employees 
GROUP BY job_id HAVING avg(salary) >8000;

-- 평균 월급이 8000$ 넘는 사원들의 직책별 평균월급
SELECT avg(salary), job_id FROM employees
WHERE salary > 8000 GROUP BY job_id;

-- 연습1> 월급이 8천달러 이상인 사원이 3명 이상인 부서만 출력
SELECT department_id FROM employees WHERE salary >= 8000
GROUP BY department_id HAVING count(*) >= 3;



