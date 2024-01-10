--10_SELF JOIN.sql

/*
 #SELF JOIN
 - 하나의 테이블이 자기 자신의 컬럼과 join하여 원하는 데이터를 얻어내는 경우
 - 자기 자신 테이블의 기본키를 외래키로 삼아 사용하는 경우
    ex> employees의 manager_id는 employee_id를 참조하는 외래키
 -셀프조인의 경우 모든 컬럼의 이름이 동일하므로 컬럼명 앞에 테이블명을 반드시 명시해야한다.
*/

SELECT manager_id From employees;

SELECT * From employees e1, employees e2
WHERE e1.manager_id = e2.employee_id; -- e1사원, e2매니저

SELECT emp.first_name || ' ' || emp.last_name AS "사원이름", 
mgr.first_name || ' ' || mgr.last_name AS "매니저이름" 
From employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id;

-- 연습1> 매니저 이름에 e가 포함되는 사원들의 모든 정보를 조회

SELECT emp.first_name || ' ' || emp.last_name AS "사원이름"
FROM employees emp, employees mgr  
WHERE emp.manager_id = mgr.employee_id
AND (emp.first_name LIKE '%e%' OR emp.first_name LIKE '%E%');

SELECT * FROM employees emp, employees mgr; -- 사원+매니저 정보 다 나옴
SELECT emp.* FROM employees emp, employees mgr; -- 사원 정보만 볼수 있다
SELECT emp.* FROM employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id AND lower(mgr.first_name) LIKE '%e%';


-- 연습2> 담당하는 사원이 8명 이상인 매니저들의 정보조회
-- Hint : Group by, Having, in사용

SELECT mgr.employee_id, mgr.first_name || ' ' || mgr.last_name AS "manager name"
FROM employees mgr WHERE mgr.employee_id
IN (
SELECT manager_id FROM employees
Group by manager_id HAVING COUNT(*) >=8 );

SELECT * FROM employees mgr, employees emp
WHERE emp.manager_id = mgr.employee_id AND mgr.employee_id IN(
SELECT manager_id FROM employees
Group by manager_id HAVING COUNT(*) >=8 );

-- 매니저들이 가지고 있는 사원수
SELECT manager_id, count(*) FROM employees GROUP BY manager_id; 
-- 위 내용이 in 안에 들어갈 수 있고, 매니저 정보는 employees  안에 있음으로 아래와 같이
SELECT * FROM employees WHERE employee_id IN(
SELECT manager_id FROM employees 
GROUP BY manager_id HAVING count(*) >= 8);



