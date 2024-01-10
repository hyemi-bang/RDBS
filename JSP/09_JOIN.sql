-- 09_JOIN.sql

/*

    # �⺻Ű (Primary Key, PK)
    - �� ���̺��� �ϳ��� ���� �����ϰ� ������ �� �ִ� �÷�
    - �� ���̺��� �⺻Ű�� �ϳ��� ������ �� �մ�.
    - �⺻Ű�� ������ �÷����� �ߺ����� ����� �Ѵ�. (UNIQUE)
    - �⺻Ű�� ������ �÷����� NULL�� ����� �Ѵ�. (NOT NULL)

    # �ĺ�Ű (Candidate Key)
    - �⺻Ű�� �� �ڰ��� ������ �⺻Ű�� �������� ���� �÷�
    
    # �ܷ�Ű (Foreign Key)
    - �ٸ� ���̺����� �⺻Ű(�Ǵ� �ĺ�Ű)������, 
      ���� ���̺����� �ߺ��Ǵ� ���� ���� �Ϲ� �÷��� ���
    - �ܷ�Ű �÷����� �����ϴ� 
      �⺻Ű(�Ǵ� �ĺ�Ű)�÷��� ���� ���� �����ؼ��� �ȵȴ�.(���� ���Ἲ)
    - � ���̺��� �⺻Ű(�Ǵ� �ĺ�Ű)�� �ٸ� ���̺��� �ܷ�Ű�� �����Ǿ��ٸ�
      �� ���̺����� 1:N(�ϴ�ٰ���) ���谡 �����Ǿ��ٰ� �� �� �ִ�.
      ex> �� �μ��� ���� ����� �Ҽӵ� �� �ִ�. 
      (�μ� ���̺��� �⺻Ű�� ������̺��� �ܷ�Ű)
      
    # ��ü �� ������ ����  
    - 1 : 1 : ���� ���̺�ȿ� �÷����� �ִ´�
    - 1 : N : �μ� - ���, �Խñ� - ���, ȸ�� - �Խñ�, ���
    - N : N : �п� - �л�, ���� - �л�, ���� - ����, ��Ʈī - �뿩�� ���
    
*/

SELECT * FROM employees; -- employees�� department_id�� �ܷ�Ű
SELECT * FROM departments; -- departments�� department_id�� �⺻Ű
SELECT * FROM jobs; -- job_id �⺻Ű

/*
    # JOIN
    - �⺻Ű�� �ܷ�Ű�� ���� ���谡 �����Ǿ� �ִ� �� ���̺��� ������ �����Ͽ�
      ���ϴ� ������ ����� ��ȸ�ϴ� ��
      
    # CROSS JOIN
    - JOIN�� ���Ǵ� ���̺���� 
    ��� ���� �����Ͽ� ���� �� �ִ� ��� ��츦 ����ϴ�  JOIN
    - ������� ������(��� ����� ���� �����ִ�) ������� ����
*/
SELECT * FROM employees; -- 107rows
SELECT * FROM departments; -- 27rows
SELECT * FROM employees, departments; -- 2889rows (107 * 27)

SELECT
    employees_id,
    first_name,
    last_name,
    department_id, 
    department_name
FROM
    employees,
    departments; --  "column ambiguously defined" 53��, 5������ ���� �߻�
    /*
    cross join�� �ϸ� �� ���̺� �����ϴ� ��� �÷��� ��ȸ�� �� �ִ�
    ���� �̸��� �÷��� �����ϴ� ��� �ݵ�� ��� ���̺� �Ҽ����� ��Ȯ�ϰ� �ؾ��Ѵ�.
    */
SELECT
    employee_id,
    first_name,
    last_name,
    employees.department_id AS "emp_dept_id",
    departments.department_name AS "dept_dept_id"
FROM
    employees,
    departments;
    
/* 
    ���̺���� ����� �� ���̺� �̸����� ��Ī�� ������ �� �ִ�.

*/
SELECT
    employee_id,
    first_name,
    last_name,
    emp.department_id AS "emp_dept_id",
    dept.department_name AS "dept_dept_id"
FROM
    employees emp,
    departments dept;

/*
    EQUI JOIN
    - �� ���̺��� ���� ������ ���� ���� �÷�(�ַ� �⺻Ű,�ܷ�Ű)���� �̿��Ͽ�
      CROSS JOIN���� ���� �ǹ��ִ� �����͵鸸 �ɷ����� JOIN
*/

SELECT * FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY employee_id ASC;

SELECT employee_id, first_name, department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id
ORDER BY employee_id ASC;

-- ���� 1 > ��� ������� �����ȣ(job_id)/�̸�/��å�̸�(job_title)�� ��ȸ
SELECT * FROM employees, jobs; -- 1. ũ�ν�����
-- 2. ¦�� �ִ� �ֵ鸸 ����� ó���Ѵ�
SELECT * FROM employees, jobs WHERE employees.job_id = jobs.job_id; 
--3. ���� �ʿ��� ������ ���
SELECT jobs.job_id, employees.first_name, jobs.job_title 
FROM employees, jobs
WHERE jobs.job_id = employees.job_id
ORDER BY employee_id ASC;

-- ���� 2 > job_title�� Programmer�� ������� �����ȣ/�̸�/�μ���ȣ/�μ��� ��ȸ
SELECT jobs.job_id, emp.first_name, dept.department_id, dept.department_name
FROM employees emp, departments dept, jobs
WHERE emp.job_id = jobs.job_id
AND dept.department_id = emp.department_id
AND job_title ='Programmer'
ORDER BY employee_id ASC;

-- ���� 3> Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� ����� �ִ��� ��ȸ�غ�����
SELECT jobs.job_title, jobs.job_id, employees.first_name
FROM jobs, employees
WHERE jobs.job_id = employees.job_id
AND employees.commission_pct IS NOT NULL;

--�������ؼ�
SELECT DISTINCT job_title FROM employees, jobs;
SELECT DISTINCT job_title FROM employees e, jobs j
WHERE e.job_id = j.job_id;
SELECT DISTINCT job_title FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.commission_pct IS NOT NULL;

-- ���� 4> Seattle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ ��ȸ
SELECT emp.first_name, emp.salary, dept.department_name, loca.postal_code
FROM locations loca, employees emp, departments dept
WHERE emp.department_id = dept.department_id
AND loca.city = 'Seattle';

-- ������ �ؼ� >
SELECT * FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

SELECT * FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Seattle';


SELECT first_name, salary, department_name, postal_code 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Seattle';

SELECT * FROM locations;
SELECT * FROM employees;
SELECT * FROM jobs;
SELECT * FROM departments;

/*
    1> ����� �μ�ó�� 1:N����� ������ �� �ִ� ���� ��ʸ� �ϳ� �����غ���
    
    2> 1:N ����� ������ �� ��ü�� ���̺� ���·� �����غ�����
    - ���̺��̸�
    - �÷���
    - �� �÷��� Ÿ��
    - �⺻Ű �÷�
    - �ַ�Ű �÷�


*/
