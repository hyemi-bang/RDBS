-- 02_SELECT.sql

/*
    # SELECT 컬럼명 FROM 테이블명;
    
    - 원하는 테이블의 원하는 컬럼을 조회할 수 있는 쿼리문
    - 여러 컬럼을 조회할 떄는 , 를 사용해 구분한다
    - 컬럼명 자리에 *를 쓰는 것은 모든 컬럼을 의미한다.
    - 컬럼명과 테이블명은 대소문자를 구분하지 않는다
    - 쿼리문도 대소문자를 구분하지 않는다

*/

SELECT country_name,country_id FROM countries;
SELECT country_id, country_name FROM countries;
SELECT * FROM    countries;

--연습1> 모든 부서(departments)의 부서번호화 부서명을 조회해보세요
SELECT * FROM departments;
SELECT department_id, department_name FROM departments;

--연습2> 모든 사원(employees)의 사번/이름/월급/고용일을 조회해보세요
SELECT    * FROM    employees;

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    hire_date
FROM
    employees;

/*
    # DESC 테이블명
    - 해당 테이블의 컬럼정보를 볼 수 있다.
    - 컬럼명, NULL 허용여부, 컬럼 타입 및 크기 볼 수 있다.
    
    # NUBBER(n), NUMBER(n,m) 
    - 숫자데이터를 저장할 수 있는 컬럼 타입
    - 숫자가 하나만 적혀있으면 정수의 길이를 나타낸다
    - 숫자가 두개 적혀있으면 숫자 전체의 길이와 소수점 자리수를 나타낸다
    NUMBER(6)  >> 0~9의 정수가 6개
    NUMBER(8,2) >> 정수 6개 + 소수점 이하 2개
    NUMBER(2,2) >> 0.소수점 이하 2자리
    - 각 컬럼마다 제한이 걸려있다.
    
    # VARCHAR2(n)
    - VARCHAR보다 VARCHAR2 많이 사용~
    - 문자를 저장할 수 있는 타입
    - 저장되는 데이터의 크기에 맞춰 알맞은 공간만 사용하도록 설계되어 있다.
    - 저장 공간을 효율적으로 사용할 수 있다.
    
    # CHAR(n)
    - 문자를 저장할 수 있지만 크기가 자동으로 조절되지 않는 컬럼타입
    - 데이터 크기에 맞추지 않고 항상 일정한 공간을 차지한다
    - 해당 컬럼의 성격에 따라 저장공간의 낭비가 심해질 수 있다.
    - 국가코드 (KR, EN, JP...) 처럼 길이가 고정되어 있는 행만 지닌 컬럼은 CHAR타입이 효율적일 수도 있다.
    
    # DATE
    - 날짜 및 시간 데이터를 저장할 수 있는 컬럼 타입
    
*/
DESC countries;
DESC employees;

SELECT    *FROM    employees;

-- # 컬럼 조회시 AS를 이용해 해당 컬럼의 이름을 원하는 이름으로 설정하여 조회할 수 있다.
SELECT    first_name AS 이름,    salary     AS 월급 FROM    employees;

-- # 컬럼에 산술연산자를 활용하여 각 컬럼을 계산한 결과를 조회할 수 있다.
SELECT    salary     "한달치",    salary * 2 "두 달치",    salary * 3 AS "세 달치",    first_name AS "이름"FROM    employees;

-- # 컬럼끼리도 계산 할 수 있다
SELECT    employee_id,    first_name,    job_id,    commission_pct,    commission_pct * salary AS "건 당 커미션"FROM    employees;
    
-- # NVL(column, value) 함수
-- 계산할 떄 해당 컬럼 값이 null 인 경우 대신 사용할 값을 지정해준다.

SELECT    employee_id,    first_name,    job_id,    nvl(commission_pct, 0) * salary AS "건 당 커미션"FROM    employees;
    
    
-- #컬럼값 이어 붙여서 출력하기
SELECT    first_name    || ' '    || last_name AS full_name FROM    employees;

SELECT    first_name    || ':'    || last_name FROM    employees;

SELECT    salary    || '/'    || nvl(commission_pct, 0) AS "salary"
FROM
    employees;

-- # SELECT DISTINCT : 각 데이터를 한 번씩만 조회한다 (한번이라도 출력했던 적이 있는 값 조회. 즉, 등장한적이 있는 값 조회)
SELECT DISTINCT job_id FROM employees;
SELECT DISTINCT department_id FROM employees;
SELECT DISTINCT  first_name, salary FROM employees; -- 같은 이름과 같은 월급을 받아야
SELECT DISTINCT first_name FROM employees;

--퀴즈3> 모든 사원들의 사번/풀네임/직책/연봉/건당 커미션금액을 조회하시오
SELECT * FROM employees;

SELECT
    employee_id,
    first_name
    || ' '
    || last_name                    AS full_name,
    job_id,
    salary * 12                     AS "Annual Income",
    nvl(commission_pct, 0) * salary AS "건 당 커미션"
FROM
    employees;