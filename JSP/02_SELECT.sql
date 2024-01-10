-- 02_SELECT.sql

/*
    # SELECT �÷��� FROM ���̺��;
    
    - ���ϴ� ���̺��� ���ϴ� �÷��� ��ȸ�� �� �ִ� ������
    - ���� �÷��� ��ȸ�� ���� , �� ����� �����Ѵ�
    - �÷��� �ڸ��� *�� ���� ���� ��� �÷��� �ǹ��Ѵ�.
    - �÷���� ���̺���� ��ҹ��ڸ� �������� �ʴ´�
    - �������� ��ҹ��ڸ� �������� �ʴ´�

*/

SELECT country_name,country_id FROM countries;
SELECT country_id, country_name FROM countries;
SELECT * FROM    countries;

--����1> ��� �μ�(departments)�� �μ���ȣȭ �μ����� ��ȸ�غ�����
SELECT * FROM departments;
SELECT department_id, department_name FROM departments;

--����2> ��� ���(employees)�� ���/�̸�/����/������� ��ȸ�غ�����
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
    # DESC ���̺��
    - �ش� ���̺��� �÷������� �� �� �ִ�.
    - �÷���, NULL ��뿩��, �÷� Ÿ�� �� ũ�� �� �� �ִ�.
    
    # NUBBER(n), NUMBER(n,m) 
    - ���ڵ����͸� ������ �� �ִ� �÷� Ÿ��
    - ���ڰ� �ϳ��� ���������� ������ ���̸� ��Ÿ����
    - ���ڰ� �ΰ� ���������� ���� ��ü�� ���̿� �Ҽ��� �ڸ����� ��Ÿ����
    NUMBER(6)  >> 0~9�� ������ 6��
    NUMBER(8,2) >> ���� 6�� + �Ҽ��� ���� 2��
    NUMBER(2,2) >> 0.�Ҽ��� ���� 2�ڸ�
    - �� �÷����� ������ �ɷ��ִ�.
    
    # VARCHAR2(n)
    - VARCHAR���� VARCHAR2 ���� ���~
    - ���ڸ� ������ �� �ִ� Ÿ��
    - ����Ǵ� �������� ũ�⿡ ���� �˸��� ������ ����ϵ��� ����Ǿ� �ִ�.
    - ���� ������ ȿ�������� ����� �� �ִ�.
    
    # CHAR(n)
    - ���ڸ� ������ �� ������ ũ�Ⱑ �ڵ����� �������� �ʴ� �÷�Ÿ��
    - ������ ũ�⿡ ������ �ʰ� �׻� ������ ������ �����Ѵ�
    - �ش� �÷��� ���ݿ� ���� ��������� ���� ������ �� �ִ�.
    - �����ڵ� (KR, EN, JP...) ó�� ���̰� �����Ǿ� �ִ� �ุ ���� �÷��� CHARŸ���� ȿ������ ���� �ִ�.
    
    # DATE
    - ��¥ �� �ð� �����͸� ������ �� �ִ� �÷� Ÿ��
    
*/
DESC countries;
DESC employees;

SELECT    *FROM    employees;

-- # �÷� ��ȸ�� AS�� �̿��� �ش� �÷��� �̸��� ���ϴ� �̸����� �����Ͽ� ��ȸ�� �� �ִ�.
SELECT    first_name AS �̸�,    salary     AS ���� FROM    employees;

-- # �÷��� ��������ڸ� Ȱ���Ͽ� �� �÷��� ����� ����� ��ȸ�� �� �ִ�.
SELECT    salary     "�Ѵ�ġ",    salary * 2 "�� ��ġ",    salary * 3 AS "�� ��ġ",    first_name AS "�̸�"FROM    employees;

-- # �÷������� ��� �� �� �ִ�
SELECT    employee_id,    first_name,    job_id,    commission_pct,    commission_pct * salary AS "�� �� Ŀ�̼�"FROM    employees;
    
-- # NVL(column, value) �Լ�
-- ����� �� �ش� �÷� ���� null �� ��� ��� ����� ���� �������ش�.

SELECT    employee_id,    first_name,    job_id,    nvl(commission_pct, 0) * salary AS "�� �� Ŀ�̼�"FROM    employees;
    
    
-- #�÷��� �̾� �ٿ��� ����ϱ�
SELECT    first_name    || ' '    || last_name AS full_name FROM    employees;

SELECT    first_name    || ':'    || last_name FROM    employees;

SELECT    salary    || '/'    || nvl(commission_pct, 0) AS "salary"
FROM
    employees;

-- # SELECT DISTINCT : �� �����͸� �� ������ ��ȸ�Ѵ� (�ѹ��̶� ����ߴ� ���� �ִ� �� ��ȸ. ��, ���������� �ִ� �� ��ȸ)
SELECT DISTINCT job_id FROM employees;
SELECT DISTINCT department_id FROM employees;
SELECT DISTINCT  first_name, salary FROM employees; -- ���� �̸��� ���� ������ �޾ƾ�
SELECT DISTINCT first_name FROM employees;

--����3> ��� ������� ���/Ǯ����/��å/����/�Ǵ� Ŀ�̼Ǳݾ��� ��ȸ�Ͻÿ�
SELECT * FROM employees;

SELECT
    employee_id,
    first_name
    || ' '
    || last_name                    AS full_name,
    job_id,
    salary * 12                     AS "Annual Income",
    nvl(commission_pct, 0) * salary AS "�� �� Ŀ�̼�"
FROM
    employees;