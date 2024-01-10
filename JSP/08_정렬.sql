--08_정렬.sql

/*
    # ORDER BY 컬럼명 [ASC|DESC]
    - 조회시 원하는 컬럼 기준으로 정렬하여 조회하는 문법
    - ASC : 오름차순 (Ascending)
    - DESC : 내림차순 (Descending)
    - ASC, DESC 입력 하지 않으면 기본적으로 ASC로 정렬한다. (ASC 생략가능)
    - 정렬 기준을 여러개 설정 할 수 있다.
    
*/


SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY phone_number DESC;


SELECT first_name, job_id, commission_pct FROM employees;
-- null이 있는 컬럼을 기준으로 정렬을 하게 되면?
-- 오름차순시 null은 가장 나중에 등장
SELECT first_name, job_id, commission_pct FROM employees
ORDER BY commission_pct ASC;
-- 내림차순시 null은 가장 먼저 등장
SELECT first_name, job_id, commission_pct FROM employees
ORDER BY commission_pct DESC;

-- 정렬 여러개 하기
-- 부서번호로로 오름차순 정렬, 부서번호가 같으면 성 기준으로 오름차순 후 이름기준 오름차순, 
SELECT * FROM employees 
ORDER BY department_id ASC, last_name ASC, first_name ASC;
SELECT * FROM employees 
ORDER BY department_id, last_name, salary DESC; -- ASC생략가능

-- 연습1 > 이름에 i가 포함되어 있는 사원들을 월급 많이 받는 순으로 조회 (내림차순)
SELECT * From employees 
WHERE first_name LIKE '%i%' OR  first_name LIKE '%I%' ORDER BY salary DESC;

-- upper(column) : 값을 모두 대문자로 변경하는 함수
-- lower(column) : 값을 모두 소문자로 변경하는 함수
SELECT * FROM employees WHERE lower(first_name) LIKE '%i%'
ORDER BY salary DESC;

-- 연습2> 모든 사원들을 성 기준 오름차순, 성이 같으면 이름기준 오름차순
SELECT * FROM employees ORDER BY last_name, first_name;

-- 연습3> 각 부서의 평균월급, 사원 수를 조회하고 평균 월급으로 내림차순 정렬
SELECT department_id AS "부서번호", 
       round(avg(salary),3) AS "평균 월급",
       count(*) AS "사원 수" 
FROM employees GROUP BY department_id ORDER BY "사원 수" DESC;

/*
    # 소수점 자리수 정리 함수
    - ceil(value) : 정수로 올림
    - floor(value) : 정수로 내림
    - rount(value, num) : 소수점 반올림하기
    - trunc(value, num) : 소수점 내림(소수점 자르기)
*/ 

