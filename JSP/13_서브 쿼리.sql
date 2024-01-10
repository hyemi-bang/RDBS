--13 ��������.sql

/*
    #��������
    - ������ ���ο� ���Ե� �� �ٸ� ������.
    - ���� ������ �����ϰ� �ִ� ������ ���� ������� �θ���.
    - ���� ������ ���� ����� �� ������ ���� �������� ���� ������ ����������
      ������ ���������� ���еȴ�.
    - �������� ����� ���Ѵٸ� �ַ� �⺻Ű�� ����Ͽ� �� ���� ��ȸ�Ѵ�.
    - ������ ���������� ������� �ϴ� �����ڿ�
      ������ ���������� ������� �ϴ� �����ڴ� �������� �ִ�.
    - ���������� ����� ���ؾ� �ϴ� ������� ���ǰų� ���̺� ������� Ȱ��� �� �ִ�.
    
    # ������ ��������
    - ���������� ���� ����� �� �� ���� ��� 
    - ������ �������� ������(=, >, <, <>, ^=, <=, ...)
    
    # ������ ��������
    - ���������� ���� ����� 2�� �̻��� �� �ִ� ���
    - ������ �������� ������ (IN, ANY, SOME, EXISTS....)
*/

-- 1> �񱳰� ��� �������� Ȱ���ϱ�
SELECT * FROM employees WHERE salary >= 10000;
SELECT * FROM employees 
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 169);
-- ���� �ΰ��� ���� ���� ������.

SELECT * FROM employees 
WHERE salary >= (SELECT salary FROM employees WHERE first_name = Alexander);
-- Alexander �� ���̰� �̵��� ������ 9000, 3100. �������� �ƴ� �÷��� ����Ͽ��⿡ 
-- ORA-00904: "ALEXANDER": invalid identifier ������ ���´�.
-- ��, ���������� ����� �������� ������ ��� �Ϲݿ����ڴ� ����� �� ����.


-- 2> ��ȸ�ؾ� �� ���̺� ��� �������� ����ϱ�
SELECT * FROM (SELECT * FROM employees WHERE job_id = 'IT_PROG'); 
SELECT * FROM 
(SELECT first_name, job_id FROM employees WHERE job_id = 'IT_PROG'); 
-- ()���� ���̺� ������� ��ȸ�� �����Ʊ� ������ 
-- �ٱ��ʿ��� ������ ��ȸ�Ѵٰ� �ص� ()���� ����� �������� ��ȸ�Ǵ� ���̴�.

--���ͳ� �˻�>>
-- ��ü ������ �޿� ��հ�
SELECT avg(salary) FROM employees;
-- ��ü ������ �޿� ��պ��� �� ���� �޿��� �޴� ����
-- ��� ���ڵ� �˻�
--SELECT * FROM employees WHERE salary> (��ü������ �޿� ��հ�);
-- 1���� sql�� �ٲٱ�
SELECT * FROM employees WHERE salary>(SELECT avg(salary) FROM employees);

/*
    #������ �������� ������
    
    - IN : �������� �� ��ġ�ϴ� ���� �ϳ��� ������ TRUE
    - ANY : ���� ���� �� ������ ������Ű�� ���� �ϳ��� ������ TRUE
    - SOME : ANY�� ���� ��
    - ALL : ���� ������ ������ ��� ������Ű�� ��쿡�� TRUE
    - EXISTS : ���� �ϳ��� ��ȸ�Ǹ� TRUE
*/
-- IN
-- ex> Alexander��� ����� ���� �ִ� ��å�� ������ �ִ� ��� ����� ��ȸ
SELECT * FROM employees WHERE job_id 
IN (SELECT job_id FROM employees WHERE first_name = 'Alexander');


-- ANY & SOME

SELECT * FROM employees WHERE salary >= 8000; -- ������ ��ȸ�ϴ� ���
SELECT * FROM employees WHERE salary >= ANY(5000, 8000, 9000, 15000);
--ANY(���������ڸ�)�߿��� salary>=�� �����ϴ� ���� ������ ����ؼ� ������� ��� �ǹ�
-- ���� �������� ���� 5000 �̻��̸� ��� ����� �Ǵ� ���̴�.

-- ex>  department_id = 60 �μ� ���� ���� ���� ������ ��ȸ
SELECT * FROM employees 
WHERE salary > ANY(SELECT salary FROM employees WHERE department_id = 60 );
SELECT * FROM employees WHERE department_id = 60 ;

-- ALL
-- ANY, SOME�� �ϳ��� ������Ű�� �Ǵµ�, ALL �� ���� �������Ѿ��Ѵ� �� ���� ū ���� �������Ѿ��Ѵ�.
SELECT * FROM employees WHERE salary > ALL (500, 6000, 7000, 8000, 9000);
-- ex> 60���μ��� ��� ����� ���� �� �߹��� ����� ��ȸ�ض�
SELECT * FROM employees 
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 60);

-- EXISTS
SELECT * FROM employees WHERE EXISTS(SELECT * FROM employees);

-- ex1> �ִ� �޿��� �޴� ����� ��ȸ
SELECT
    *
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.salary = j.max_salary;
-- ex2> �ִ� �޿��� �޴� ����� �ִ� �μ��� ��ȸ 
-- (ex1�� ������ ���������� �ϸ� �ٱ��� ������ ����Ǹ� �������� ���뵵 ����Ǿ���Ѵ�)
SELECT department_name FROM departments d
WHERE EXISTS (SELECT
    *
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.salary = j.max_salary AND e.department_id = d.department_id);

-- ����1> job_title�� Manager�� ���ԵǴ� ������� ��ȭ��ȣ�� �̸��� ��ȸ
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

-- ����2> ������� 2007���� ������� �Ҽ��� �μ����� ���� ���� ���� ���� ������� ��ȸ

SELECT * FROM employees WHERE (first_name, last_name) IN 
( SELECT first_name, last_name FROM employees WHERE employee_id=100);
SELECT * FROM employees WHERE (first_name, last_name) IN 
( ('Steven','King'), ('Neena', 'Kochhar'));
-- ����2�� Ǯ�̴� ���߿��� �ʿ��ϴ�
-- ���߿� �������� = ���������� 2�� �̻��� �ѹ��� ���ϴ� ���

-- 07�⵵ �Ի��� �ֵ�
SELECT e.* FROM employees e WHERE e.hire_date LIKE '07/%/%' AND department_id = e.department_id;

-- �μ� ��ȣ�� �߿� ���� �� ���� ���� �ֵ�
SELECT d.department_id, MAX(e.salary) FROM employees e, departments d
WHERE e.hire_date LIKE '07/%/%' GROUP BY d.department_id;


-- �������ؼ�>>
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





