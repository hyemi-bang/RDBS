-- 07 �׷� �Լ�.sql

/*
    #�׷� �Լ�
    - ���ϴ� �÷��� �������� �׷��� ��� ����� �� �ִ� �Լ���.
    - �׷��� ���� �� ������ �Ǵ� �÷��� GROUP BY���� ������ �� �ִ�.
    - �׷� �Լ��� ����ϸ� �Ϲ� �÷��� �Բ� ����� �� ����.
      => 00937. 00000 -  "not a single-group group function"
    - �׷� �Լ��� ����� �׷��� ������ �Ǵ� �÷��� ����� �� �ִ�.
*/

-- SUM(column) : �ش� �÷��� ������ �����ִ� �׷� �Լ�
SELECT sum(salary) FROM employees;-- 691416 ��� ������� ���� ����
-- SELECT sum(salary), first_name FROM employees;
-- �׷��Լ��� ����ϸ� �Ϲ� �÷��� ����� �� ����. 

-- ��å�� ���� ����
SELECT sum(salary), job_id FROM employees GROUP BY job_id; 
-- �μ��� ���� ����
SELECT sum(salary), department_id FROM employees GROUP BY department_id;

-- avg(column) : �ش� �÷��� ��հ��� �����ִ� �׷� �Լ�
SELECT avg(salary), sum(salary), job_id FROM employees GROUP BY job_id; 

-- count(column) : �ش� �÷��� ���� ������ ���� �� �ִ� (null ���� ���� �ʴ´�)
SELECT count(commission_pct) FROM employees;
-- Ŀ�̼��� ����μ����� ����� �ް� �ִ���
SELECT department_id, count(commission_pct) FROM employees GROUP BY department_id;

-- max(column) : �׷캰 �� �÷� �ִ��� ���� �� �ִ�.
SELECT max(salary),job_id FROM employees GROUP BY job_id;

-- min(column) : �׷캰 �� �÷� �ּڰ��� ���� �� �ִ�.
SELECT min(salary),job_id FROM employees GROUP BY job_id;

-- ����1> �� ��å�� ��տ���
SELECT avg(salary * 12)||'$' AS annual_income, job_id FROM employees GROUP BY job_id; 

-- ����2> �� �μ��� ���� �ֱٿ� ����� �Ի��� ��¥�� ���� ������ �Ի��� ��¥ ��ȸ
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
    - �׷� �Լ��� ��� ����� ����� ���� ������ �����ϰ� ���� ��� ����ϴ� ����
    - WHERE�� �׷����� �������� ����Ǳ� ������
      �׷� �Լ��� ����� WHERE���� �������� ����� �� ����.
*/

SELECT avg(salary), job_id FROM employees GROUP BY job_id;
-- ��� ������ 8000$ �Ѿ�� ��å�� �˰� ������
SELECT avg(salary), job_id FROM employees 
WHERE salary >= 8000 GROUP BY job_id;
--��ó�� WHERE ����Ѵٸ� groub by ���� ���� ������ �ޱ� ������ ������ �ʴ� �� ����
--���� HAVING �� ���
SELECT avg(salary), job_id FROM employees 
GROUP BY job_id HAVING avg(salary) >8000;

-- ��� ������ 8000$ �Ѵ� ������� ��å�� ��տ���
SELECT avg(salary), job_id FROM employees
WHERE salary > 8000 GROUP BY job_id;

-- ����1> ������ 8õ�޷� �̻��� ����� 3�� �̻��� �μ��� ���
SELECT department_id FROM employees WHERE salary >= 8000
GROUP BY department_id HAVING count(*) >= 3;



