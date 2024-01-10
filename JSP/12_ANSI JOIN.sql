--12_ANSI JOIN.sql

/*
    # ANSI JOIN
    - ANSI에서 지정한 표준 JOIN문법
    - 다른 DBMS에서도 사용할 수 있는 공통문법
    
    ※ ANSI : America National Standard Institute, 미국 국제 표준 기구
    
*/

/*  
    CROSS JOIN
*/
SELECT * FROM employees CROSS JOIN departments;

/* 
    INNER JOIN (OUTER JOIN 반대 즉, 조인 조건을 충족하는 행만 등장하는 조인)
    - 조인 조건에는 ON절을 사용하고 다른 조건에는 WHERE절을 사용할 수 있다.
    - 조인하는 두 테이블을 연결하기 위해 사용하는 컬럼의 이름이 동일한 경우
      ON 대신 USING 키워드를 사용할 수 있다.
    - USING을 사용하면 조인에 사용했던 컬럼의 이름 중복 문제가 해결된다.
    
*/

SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id
WHERE
    salary >= 8000;
    
-- USING 사용
--> 테이블 연결에 사용되는 두 컬럼의 이름이 같은 경우 USING 을 사용하면 문법이 훨씬 간단해진다
--> 이 공통된 컬럼을 써서 조인을 하는 것이기 때문에 중복없이 나온다.ㅣ
SELECT * FROM employees 
    INNER JOIN departments USING (department_id)
WHERE salary <= 8000;

-- 연습 1 > 모든 사원들의 사원번호/이름/직책이름 을 조회해보세요 
SELECT
    emp.employee_id,
    emp.first_name,
    j.job_title
FROM
         employees emp
    INNER JOIN jobs j ON j.job_id = emp.job_id
    ORDER BY employee_id;

-- 연습 2 > job_title이 Programmer인 사원들의 사원번호/이름/부서번호/부서명 조회해보세요  
SELECT
    employee_id,
    first_name,
    department_id,
    department_name
FROM
         employees
    INNER JOIN jobs USING ( job_id )
    INNER JOIN departments USING ( department_id )
WHERE
    job_title = 'Programmer';
    
-- 연습 3> 커미션을 받는 사원들의 직책이름(job_title)에 어떤것이 있는지 조회해보세요 
SELECT DISTINCT
    job_title
FROM
         employees
    INNER JOIN jobs USING ( job_id )
WHERE
    commission_pct IS NOT NULL;
    
-- 연습 4> Seattle에서 근무하는 사원들의 이름/월급/부서명/우편번호 조회    
SELECT
    first_name,
    salary,
    department_name,
    postal_code
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN locations USING ( location_id )
WHERE
    city = 'Seattle'
    ORDER BY first_name;
    
    
/* 
    OUTER JOIN (조인 조건을 충족하지 않는 행도 등장하는 조인)
    1. LEFT OUTER JOIN : 오른쪽 테이블에 (+) 추가하는 효과
    2. RIGTH OUTER JOIN : 왼쪽 테이블에 (+)를 추가하는 효과
    3. FULL OUTER JOIN : 양쪽 모두에 (+)를 추가하는 효과
    
*/

-- LEFT OUTER JOIN 등장하지 못한 왼쪽 테이블의 행이 등장하는 outer join이다.
--                  오른쪽 테이블에 (+)한 효과
SELECT * FROM employees LEFT OUTER JOIN departments USING (department_id)
ORDER BY department_id;

-- RIGTH OUTER JOIN 등장하지 못한 오른쪽 테이블의 행이 등장하는 outer join이다.
SELECT * FROM employees RIGHT OUTER JOIN departments USING (department_id);

-- FULL OUTER JOIN
SELECT
    *
FROM
    employees   e,
    departments d
WHERE
    e.department_id (+) = d.department_id (+); 
-- ANSI JOIN을 사용하지 않으면 양쪽에 (+)붙일 수 없다    

-- FULL OUTER JOIN 양 테이블 모두에서 등장하지 못했던 행들이 모두 들어난다.
SELECT * FROM employees FULL OUTER JOIN departments USING (department_id);     
    
    
-- 연습1> 사원이름/담당 매니저이름을 모두 출력하되 담당하는 매니저가 없는 사원도 조회
-- 선생님해설> 셀프조인은 using을 사용할 수 없으니 ON사용
   
SELECT
    emp.first_name || ' ' || emp.last_name AS "사원이름",
    mgr.first_name || ' ' || mgr.last_name AS "담당 매니저 이름"
FROM
    employees emp
LEFT OUTER JOIN
    employees mgr ON mgr.employee_id = emp.manager_id;
 
-- 연습2> 모든 지역의 소속 도시 이름/주소/우편 번호/소속 부서 존재여부를 조회
SELECT l.city, l.street_address, l.postal_code,
    CASE
        WHEN d.department_id IS NOT NULL THEN '부서 소속'
        ELSE '부서 미소속'
    END AS "소속 부서 여부"
FROM
    locations   l
    LEFT OUTER JOIN departments d ON l.location_id = d.location_id;

SELECT DISTINCT city, street_address, postal_code,
    CASE
        WHEN department_id IS NULL THEN 'F' -- 등장하지 못했던 행(소속부서없는경우)
        ELSE 'T'
        -- 나머지는 여러번 등장하더라도 같은 결과인 T이기 떄문에 DISTINCT압축 가능
    END AS "has Dept"
FROM
    locations  
    LEFT OUTER JOIN departments  USING (location_id);
   
    
    
    
    
    