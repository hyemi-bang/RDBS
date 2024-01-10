-- 05_DECODE.sql

/*
    # DECODE
    - �ڹ��� switch-case�� ������ ����
    - DECODE (column, case1, value1, case2, value ... defalut vlaue)
    
*/

SELECT
    first_name,
    department_id
FROM
    employees; -- ���� �μ����� �� �� ����
    
SELECT * FROM departments;

SELECT
    first_name,
    DECODE (department_id,
    10,'������',
    20,'�����ú�',
    30,'���ź�',
    40,'�λ��',
    60,'IT',
    department_id -- �� �������� defalut ��ġ
    )AS department_name
FROM
    employees; -- DECODE�� ����ϸ� case1 �̳����� value1�� ����
    
/*
    �������� : ��å�� ������ ���� �λ�� �޿��� ��� (�̸��� �޿��� ���)
    IT_PROG : 20%
    SH_CLERK : 5%
    ST_CLERK : 3%
    �� �� : ��������
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
    
    
    
    
    