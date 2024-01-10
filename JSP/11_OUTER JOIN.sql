--11_OUTER JOIN.sql

/*
    # OUTER JOIN
    - JOIN 조건을 만족하지 못하여 등장하지 못하는 행을 추가로 확인할 수 있는 JOIN
    - (+)를 붙인 쪽에 NULL을 추가해서 조건을 만족하지 못했던 행을 드러낸다
    
*/
SELECT * FROM employees; -- 107행

SELECT
    employee_id,
    first_name,
    e.department_id AS "edid",
    d.department_id AS "ddid",
    department_name
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id; -- 106행 / 1행이 사라졌다

SELECT employee_id, first_name, e.department_id AS "edid", d.department_id AS "ddid", department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
-- employees 테이블에 null이 추가되었다.
SELECT employee_id, first_name, e.department_id AS "edid", d.department_id AS "ddid", department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
-- departments 테이블에 null이 추가되었다.


-- 연습1> 부서번호/부서명/주소/도시를 조회하되 소속된 부서가 하나도 없는 지역정보도 조회
SELECT department_id, department_name, street_address, city
FROM departments dept, locations loc
WHERE dept.location_id = loc.location_id
ORDER BY dept.department_id; 
-- 부서가 소속된 지역만 존재한다, 어디에 null을 추가해야할까? 생각하고 풀기
SELECT department_id, department_name, street_address, city
FROM departments dept, locations loc
WHERE dept.location_id(+) = loc.location_id
ORDER BY dept.department_id; 



-- 연습2> 소속된 사원이 없는 부서만 조회하기
SELECT dept.* FROM departments dept, employees emp
WHERE emp.department_id(+) = dept.department_id
    AND emp.employee_id IS NULL
ORDER BY  dept.department_id;












