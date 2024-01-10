--08_����.sql

/*
    # ORDER BY �÷��� [ASC|DESC]
    - ��ȸ�� ���ϴ� �÷� �������� �����Ͽ� ��ȸ�ϴ� ����
    - ASC : �������� (Ascending)
    - DESC : �������� (Descending)
    - ASC, DESC �Է� ���� ������ �⺻������ ASC�� �����Ѵ�. (ASC ��������)
    - ���� ������ ������ ���� �� �� �ִ�.
    
*/


SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY phone_number DESC;


SELECT first_name, job_id, commission_pct FROM employees;
-- null�� �ִ� �÷��� �������� ������ �ϰ� �Ǹ�?
-- ���������� null�� ���� ���߿� ����
SELECT first_name, job_id, commission_pct FROM employees
ORDER BY commission_pct ASC;
-- ���������� null�� ���� ���� ����
SELECT first_name, job_id, commission_pct FROM employees
ORDER BY commission_pct DESC;

-- ���� ������ �ϱ�
-- �μ���ȣ�η� �������� ����, �μ���ȣ�� ������ �� �������� �������� �� �̸����� ��������, 
SELECT * FROM employees 
ORDER BY department_id ASC, last_name ASC, first_name ASC;
SELECT * FROM employees 
ORDER BY department_id, last_name, salary DESC; -- ASC��������

-- ����1 > �̸��� i�� ���ԵǾ� �ִ� ������� ���� ���� �޴� ������ ��ȸ (��������)
SELECT * From employees 
WHERE first_name LIKE '%i%' OR  first_name LIKE '%I%' ORDER BY salary DESC;

-- upper(column) : ���� ��� �빮�ڷ� �����ϴ� �Լ�
-- lower(column) : ���� ��� �ҹ��ڷ� �����ϴ� �Լ�
SELECT * FROM employees WHERE lower(first_name) LIKE '%i%'
ORDER BY salary DESC;

-- ����2> ��� ������� �� ���� ��������, ���� ������ �̸����� ��������
SELECT * FROM employees ORDER BY last_name, first_name;

-- ����3> �� �μ��� ��տ���, ��� ���� ��ȸ�ϰ� ��� �������� �������� ����
SELECT department_id AS "�μ���ȣ", 
       round(avg(salary),3) AS "��� ����",
       count(*) AS "��� ��" 
FROM employees GROUP BY department_id ORDER BY "��� ��" DESC;

/*
    # �Ҽ��� �ڸ��� ���� �Լ�
    - ceil(value) : ������ �ø�
    - floor(value) : ������ ����
    - rount(value, num) : �Ҽ��� �ݿø��ϱ�
    - trunc(value, num) : �Ҽ��� ����(�Ҽ��� �ڸ���)
*/ 

