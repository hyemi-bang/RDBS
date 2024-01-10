--12_ANSI JOIN.sql

/*
    # ANSI JOIN
    - ANSI���� ������ ǥ�� JOIN����
    - �ٸ� DBMS������ ����� �� �ִ� ���빮��
    
    �� ANSI : America National Standard Institute, �̱� ���� ǥ�� �ⱸ
    
*/

/*  
    CROSS JOIN
*/
SELECT * FROM employees CROSS JOIN departments;

/* 
    INNER JOIN (OUTER JOIN �ݴ� ��, ���� ������ �����ϴ� �ุ �����ϴ� ����)
    - ���� ���ǿ��� ON���� ����ϰ� �ٸ� ���ǿ��� WHERE���� ����� �� �ִ�.
    - �����ϴ� �� ���̺��� �����ϱ� ���� ����ϴ� �÷��� �̸��� ������ ���
      ON ��� USING Ű���带 ����� �� �ִ�.
    - USING�� ����ϸ� ���ο� ����ߴ� �÷��� �̸� �ߺ� ������ �ذ�ȴ�.
    
*/

SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id
WHERE
    salary >= 8000;
    
-- USING ���
--> ���̺� ���ῡ ���Ǵ� �� �÷��� �̸��� ���� ��� USING �� ����ϸ� ������ �ξ� ����������
--> �� ����� �÷��� �Ἥ ������ �ϴ� ���̱� ������ �ߺ����� ���´�.��
SELECT * FROM employees 
    INNER JOIN departments USING (department_id)
WHERE salary <= 8000;

-- ���� 1 > ��� ������� �����ȣ/�̸�/��å�̸� �� ��ȸ�غ����� 
SELECT
    emp.employee_id,
    emp.first_name,
    j.job_title
FROM
         employees emp
    INNER JOIN jobs j ON j.job_id = emp.job_id
    ORDER BY employee_id;

-- ���� 2 > job_title�� Programmer�� ������� �����ȣ/�̸�/�μ���ȣ/�μ��� ��ȸ�غ�����  
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
    
-- ���� 3> Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� ����� �ִ��� ��ȸ�غ����� 
SELECT DISTINCT
    job_title
FROM
         employees
    INNER JOIN jobs USING ( job_id )
WHERE
    commission_pct IS NOT NULL;
    
-- ���� 4> Seattle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ ��ȸ    
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
    OUTER JOIN (���� ������ �������� �ʴ� �൵ �����ϴ� ����)
    1. LEFT OUTER JOIN : ������ ���̺� (+) �߰��ϴ� ȿ��
    2. RIGTH OUTER JOIN : ���� ���̺� (+)�� �߰��ϴ� ȿ��
    3. FULL OUTER JOIN : ���� ��ο� (+)�� �߰��ϴ� ȿ��
    
*/

-- LEFT OUTER JOIN �������� ���� ���� ���̺��� ���� �����ϴ� outer join�̴�.
--                  ������ ���̺� (+)�� ȿ��
SELECT * FROM employees LEFT OUTER JOIN departments USING (department_id)
ORDER BY department_id;

-- RIGTH OUTER JOIN �������� ���� ������ ���̺��� ���� �����ϴ� outer join�̴�.
SELECT * FROM employees RIGHT OUTER JOIN departments USING (department_id);

-- FULL OUTER JOIN
SELECT
    *
FROM
    employees   e,
    departments d
WHERE
    e.department_id (+) = d.department_id (+); 
-- ANSI JOIN�� ������� ������ ���ʿ� (+)���� �� ����    

-- FULL OUTER JOIN �� ���̺� ��ο��� �������� ���ߴ� ����� ��� ����.
SELECT * FROM employees FULL OUTER JOIN departments USING (department_id);     
    
    
-- ����1> ����̸�/��� �Ŵ����̸��� ��� ����ϵ� ����ϴ� �Ŵ����� ���� ����� ��ȸ
-- �������ؼ�> ���������� using�� ����� �� ������ ON���
   
SELECT
    emp.first_name || ' ' || emp.last_name AS "����̸�",
    mgr.first_name || ' ' || mgr.last_name AS "��� �Ŵ��� �̸�"
FROM
    employees emp
LEFT OUTER JOIN
    employees mgr ON mgr.employee_id = emp.manager_id;
 
-- ����2> ��� ������ �Ҽ� ���� �̸�/�ּ�/���� ��ȣ/�Ҽ� �μ� ���翩�θ� ��ȸ
SELECT l.city, l.street_address, l.postal_code,
    CASE
        WHEN d.department_id IS NOT NULL THEN '�μ� �Ҽ�'
        ELSE '�μ� �̼Ҽ�'
    END AS "�Ҽ� �μ� ����"
FROM
    locations   l
    LEFT OUTER JOIN departments d ON l.location_id = d.location_id;

SELECT DISTINCT city, street_address, postal_code,
    CASE
        WHEN department_id IS NULL THEN 'F' -- �������� ���ߴ� ��(�ҼӺμ����°��)
        ELSE 'T'
        -- �������� ������ �����ϴ��� ���� ����� T�̱� ������ DISTINCT���� ����
    END AS "has Dept"
FROM
    locations  
    LEFT OUTER JOIN departments  USING (location_id);
   
    
    
    
    
    