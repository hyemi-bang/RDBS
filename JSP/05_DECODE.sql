-- 05_DECODE.sql

/*
    # DECODE
    - 자바의 switch-case와 유사한 문법
    - DECODE (column, case1, value1, case2, value ... defalut vlaue)
    
*/

SELECT
    first_name,
    department_id
FROM
    employees; -- 현재 부서명은 알 수 없다
    
SELECT * FROM departments;

SELECT
    first_name,
    DECODE (department_id,
    10,'관리부',
    20,'마케팅부',
    30,'구매부',
    40,'인사부',
    60,'IT',
    department_id -- 맨 마지막은 defalut 위치
    )AS department_name
FROM
    employees; -- DECODE를 사용하면 case1 이나오면 value1로 변경
    
/*
    연습문제 : 직책에 다음과 같이 인상된 급여를 출력 (이름과 급여만 출력)
    IT_PROG : 20%
    SH_CLERK : 5%
    ST_CLERK : 3%
    그 외 : 변동없음
*/
SELECT * FROM employees;
SELECT first_name,job_id,salary FROM employees;    
SELECT
    first_name,
    DECODE (job_id,
    'IT_PROG', NVL(commission_pct, 0.2)* salary + salary,
    'SH_CLERK', NVL(commission_pct, 0.05)* salary + salary,
    'ST_CLERK', NVL(commission_pct, 0.03) * salary + salary,
    salary
    )AS salary
FROM
    employees;

SELECT
    first_name,job_id,
    salary AS original_salary,
    DECODE (job_id,
    'IT_PROG', salary * 1.2,
    'SH_CLERK',salary * 1.05,
    'ST_CLERK',salary * 1.03,
    salary
    )AS increased_salary
FROM
    employees;
    
    
    
    
    