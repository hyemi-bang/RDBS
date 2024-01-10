--10_SELF JOIN.sql

/*
 #SELF JOIN
 - �ϳ��� ���̺��� �ڱ� �ڽ��� �÷��� join�Ͽ� ���ϴ� �����͸� ���� ���
 - �ڱ� �ڽ� ���̺��� �⺻Ű�� �ܷ�Ű�� ��� ����ϴ� ���
    ex> employees�� manager_id�� employee_id�� �����ϴ� �ܷ�Ű
 -���������� ��� ��� �÷��� �̸��� �����ϹǷ� �÷��� �տ� ���̺���� �ݵ�� ����ؾ��Ѵ�.
*/

SELECT manager_id From employees;

SELECT * From employees e1, employees e2
WHERE e1.manager_id = e2.employee_id; -- e1���, e2�Ŵ���

SELECT emp.first_name || ' ' || emp.last_name AS "����̸�", 
mgr.first_name || ' ' || mgr.last_name AS "�Ŵ����̸�" 
From employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id;

-- ����1> �Ŵ��� �̸��� e�� ���ԵǴ� ������� ��� ������ ��ȸ

SELECT emp.first_name || ' ' || emp.last_name AS "����̸�"
FROM employees emp, employees mgr  
WHERE emp.manager_id = mgr.employee_id
AND (emp.first_name LIKE '%e%' OR emp.first_name LIKE '%E%');

SELECT * FROM employees emp, employees mgr; -- ���+�Ŵ��� ���� �� ����
SELECT emp.* FROM employees emp, employees mgr; -- ��� ������ ���� �ִ�
SELECT emp.* FROM employees emp, employees mgr
WHERE emp.manager_id = mgr.employee_id AND lower(mgr.first_name) LIKE '%e%';


-- ����2> ����ϴ� ����� 8�� �̻��� �Ŵ������� ������ȸ
-- Hint : Group by, Having, in���

SELECT mgr.employee_id, mgr.first_name || ' ' || mgr.last_name AS "manager name"
FROM employees mgr WHERE mgr.employee_id
IN (
SELECT manager_id FROM employees
Group by manager_id HAVING COUNT(*) >=8 );

SELECT * FROM employees mgr, employees emp
WHERE emp.manager_id = mgr.employee_id AND mgr.employee_id IN(
SELECT manager_id FROM employees
Group by manager_id HAVING COUNT(*) >=8 );

-- �Ŵ������� ������ �ִ� �����
SELECT manager_id, count(*) FROM employees GROUP BY manager_id; 
-- �� ������ in �ȿ� �� �� �ְ�, �Ŵ��� ������ employees  �ȿ� �������� �Ʒ��� ����
SELECT * FROM employees WHERE employee_id IN(
SELECT manager_id FROM employees 
GROUP BY manager_id HAVING count(*) >= 8);



