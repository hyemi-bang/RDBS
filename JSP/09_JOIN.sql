-- 09_JOIN.sql

/*

    # 기본키 (Primary Key, PK)
    - 한 테이블에서 하나의 행을 유일하게 구분할 수 있는 컬럼
    - 각 테이블의 기본키는 하나만 설정할 수 잇다.
    - 기본키로 설정된 컬럼에는 중복값이 없어야 한다. (UNIQUE)
    - 기본키로 설정된 컬럼에는 NULL이 없어야 한다. (NOT NULL)

    # 후보키 (Candidate Key)
    - 기본키가 될 자격이 있지만 기본키로 설정되지 않은 컬럼
    
    # 외래키 (Foreign Key)
    - 다른 테이블에서는 기본키(또는 후보키)이지만, 
      현재 테이블에서는 중복되는 값을 지닌 일반 컬럼인 경우
    - 외래키 컬럼에는 참조하는 
      기본키(또는 후보키)컬럼에 없는 값이 존재해서는 안된다.(참조 무결성)
    - 어떤 테이블의 기본키(또는 후보키)가 다른 테이블의 외래키로 설정되었다면
      두 테이블간에는 1:N(일대다관계) 관계가 형성되었다고 할 수 있다.
      ex> 한 부서에 여러 사원이 소속될 수 있다. 
      (부서 테이블의 기본키가 사원테이블의 외래키)
      
    # 개체 간 관계의 종류  
    - 1 : 1 : 같은 테이블안에 컬럼으로 넣는다
    - 1 : N : 부서 - 사원, 게시글 - 댓글, 회원 - 게시글, 등등
    - N : N : 학원 - 학생, 선생 - 학생, 과목 - 교수, 렌트카 - 대여자 등등
    
*/

SELECT * FROM employees; -- employees의 department_id는 외래키
SELECT * FROM departments; -- departments의 department_id는 기본키
SELECT * FROM jobs; -- job_id 기본키

/*
    # JOIN
    - 기본키와 외래키로 엮어 관계가 형성되어 있는 두 테이블의 정보를 종합하여
      원하는 정보를 만들어 조회하는 것
      
    # CROSS JOIN
    - JOIN에 사용되는 테이블들의 
    모든 행을 조합하여 나올 수 있는 모든 경우를 출력하는  JOIN
    - 모든행을 조합한(모든 경우의 수를 보여주는) 쓸모없는 정보
*/
SELECT * FROM employees; -- 107rows
SELECT * FROM departments; -- 27rows
SELECT * FROM employees, departments; -- 2889rows (107 * 27)

SELECT
    employees_id,
    first_name,
    last_name,
    department_id, 
    department_name
FROM
    employees,
    departments; --  "column ambiguously defined" 53행, 5열에서 오류 발생
    /*
    cross join을 하면 두 테이블에 존재하는 모든 컬럼을 조회할 수 있다
    같은 이름의 컬럼이 존재하는 경우 반드시 어느 테이블 소속인지 명확하게 해야한다.
    */
SELECT
    employee_id,
    first_name,
    last_name,
    employees.department_id AS "emp_dept_id",
    departments.department_name AS "dept_dept_id"
FROM
    employees,
    departments;
    
/* 
    테이블명이 길어질 때 테이블 이름에도 별칭을 지정할 수 있다.

*/
SELECT
    employee_id,
    first_name,
    last_name,
    emp.department_id AS "emp_dept_id",
    dept.department_name AS "dept_dept_id"
FROM
    employees emp,
    departments dept;

/*
    EQUI JOIN
    - 두 테이블에서 서로 동일한 값을 지닌 컬럼(주로 기본키,외래키)들을 이용하여
      CROSS JOIN으로 부터 의미있는 데이터들만 걸러내는 JOIN
*/

SELECT * FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY employee_id ASC;

SELECT employee_id, first_name, department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY employee_id ASC;

-- 연습 1 > 모든 사원들의 사원번호(job_id)/이름/직책이름(job_title)을 조회
SELECT * FROM employees, jobs; -- 1. 크로스조인
-- 2. 짝이 있는 애들만 남기고 처리한다
SELECT * FROM employees, jobs WHERE employees.job_id = jobs.job_id; 
--3. 최종 필요한 조건을 출력
SELECT jobs.job_id, employees.first_name, jobs.job_title 
FROM employees, jobs
WHERE jobs.job_id = employees.job_id
ORDER BY employee_id ASC;

-- 연습 2 > job_title이 Programmer인 사원들의 사원번호/이름/부서번호/부서명 조회
SELECT jobs.job_id, emp.first_name, dept.department_id, dept.department_name
FROM employees emp, departments dept, jobs
WHERE emp.job_id = jobs.job_id
AND dept.department_id = emp.department_id
AND job_title ='Programmer'
ORDER BY employee_id ASC;

-- 연습 3> 커미션을 받는 사원들의 직책이름(job_title)에 어떤것이 있는지 조회해보세요
SELECT jobs.job_title, jobs.job_id, employees.first_name
FROM jobs, employees
WHERE jobs.job_id = employees.job_id
AND employees.commission_pct IS NOT NULL;

--선생님해설
SELECT DISTINCT job_title FROM employees, jobs;
SELECT DISTINCT job_title FROM employees e, jobs j
WHERE e.job_id = j.job_id;
SELECT DISTINCT job_title FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.commission_pct IS NOT NULL;

-- 연습 4> Seattle에서 근무하는 사원들의 이름/월급/부서명/우편번호 조회
SELECT emp.first_name, emp.salary, dept.department_name, loca.postal_code
FROM locations loca, employees emp, departments dept
WHERE emp.department_id = dept.department_id
AND loca.city = 'Seattle';

-- 선생님 해설 >
SELECT * FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

SELECT * FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Seattle';


SELECT first_name, salary, department_name, postal_code 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Seattle';

SELECT * FROM locations;
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM departments;

/*
    1> 사원과 부서처럼 1:N관계로 설정할 수 있는 실제 사례를 하나 생각해보기
    
    2> 1:N 관계로 설정한 각 개체를 테이블 형태로 설계해보세요
    - 테이블이름
    - 컬럼명
    - 각 컬럼의 타입
    - 기본키 컬럼
    - 왜래키 컬럼


*/
