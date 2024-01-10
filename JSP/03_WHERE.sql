--03_WHERE.sql

/*
    # SELECT �÷��� FROM ���̺�� WHERE ������;
    - SELECT�� �ڿ� WHERE���� �߰��Ͽ� �ش� ������ �����ϴ� �ุ ��ȸ�� �� �ִ�.
    - ����Ŭ�� �� �����ڿ� �� �����ڸ� ���� �������� ���� �� �ִ�.
    
    # �񱳿�����
    =           : ������ true
    !=, <>, ^=  : �ٸ��� true
    <, >, <=, >=: ��
    
    # ��������
    
    AND, OR, NOT
    
*/
-- ���� 1000�޷� �̻��� ��� ��ȸ
Select * From employees Where salary >= 10000;

-- manager_id 101�� ��� ��� ��ȸ
Select * From employees Where manager_id = 101;

-- ���ڿ� �����ʹ� ''�� ����Ѵ�
Select * From employees WHERE last_name  = 'Austin';

-- �����ʹ� ��ҹ��� �����Ѵ�. �÷���, ���̺��, Ŀ������ ��ҹ��� �������� �ʴ´�.
Select * From employees WHERE last_name  = 'austin'; -- ��ȸ���� �ʴ´�.

-- ��������
SELECT
    first_name,
    department_id
FROM
    employees
WHERE
        department_id = 50
    AND salary < 3000;
    
SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    NOT department_id = 50
    AND salary < 3000;    
 
 SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    NOT (department_id = 50
    AND salary < 3000);   
    
-- �����ͺ��̽������� ����Ÿ�Ե� �񱳰� �����ϴ�
SELECT * FROM employees WHERE first_name >='A' AND first_name < 'D';
SELECT * FROM employees WHERE first_name <='Curtis';

-- ��¥ Ÿ�� ��
SELECT * FROM employees WHERE hire_date >'2007/12/31';

SELECT * FROM employees;
-- ���� 1> ������ 2000���� 3000������ ������� Ǯ���Ӱ�, ����, ��å���ϱ�
SELECT first_name || ' '|| last_name AS full_name, salary, job_id FROM employees WHERE salary >= 2000 AND salary <=3000;
-- ���� 2> ��å�� SH_CLERK �Ǵ� ST_CLERK�� ������� �̸�, ��ȭ��ȣ ��ȸ�ϱ�
SELECT first_name, phone_number FROM employees WHERE job_id = 'ST_CLERK' OR job_id = 'SH_CLERK';
-- ���� 3> 30/60/100�� �μ��� ���� ������� �̸�, ����� ��ȸ�ϱ�
SELECT first_name, hire_date FROM employees WHERE department_id = '30' OR department_id = 60 OR department_id = 100; -- '30' �̳� 30 ��� ����
-- ���� 4> ������ 5000�޷� ������ ����� �ִ� ��å�� ����� �ִ��� ��ȸ�ϱ�
SELECT DISTINCT job_id FROM employees WHERE salary <= 5000;


--�÷��� BETWEEN A AND B : �ش� �÷� ���� A �� B ������ ��� true (2000 < salary <= 3000)
SELECT first_name, salary FROM employees WHERE salary BETWEEN 2000 AND 3000;

-- �÷��� IN(A,B,C...) : ()���� ���뿡 �ش� ���� ������ true;
SELECT
    first_name,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'ST_CLERK', 'SH_CLERK' );

SELECT
    first_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 30, 60, 100 );

-- ()���� ���� �����ϴ� ��ҿ� �ٸ� �������� Ȱ���� �� �ִ�. (���� ����)
-- ()���� ���� ���� �� �Ŀ� () ���� ���� �����Ѵ�.
SELECT first_name, department_id 
    FROM employees WHERE department_id IN (
        SELECT department_id FROM departments WHERE location_id = 1700);

-- null�� ũ�� �񱳰� �Ұ����ϱ� ������ �Ϲ����� �� �����ڸ� ��� �ϸ� false�� ���´�.
SELECT * FROM employees WHERE commission_pct = null; -- ��ȸ�ȵ�

 -- NULL ����� ��ȸ�ϰ� ������
SELECT * FROM employees WHERE commission_pct IS null;
SELECT * FROM employees WHERE nvl(commission_pct, 0) = 0; 

 -- NULL�� �ƴ� ����� ��ȸ�ϰ� ������
SELECT * FROM employees WHERE NOT commission_pct IS null;
SELECT * FROM employees WHERE commission_pct IS NOT null;

-- �����ȣ�� Ȧ���� ����鸸 ��ȸ�ϱ�(java���� ����ϴ� %�� �ٸ���
-- mod(value, divisor) �Լ��� ����� �������� ���� �� �ִ�.)
SELECT * FROM employees WHERE mod(employee_id, 2) = 1;


/*
    # Like 
    - �������� �Ϻκ��� ��ġ�ϴ� ���� ��ȸ�� �� �ִ�.
    - % : ���ڰ� �־ �ǰ� ��� �Ǵ� �ڸ� (����ǥ���� * �� ����)
    - _ : �ݵ�� �� ���ڰ� �־�� �ϴ� �ڸ�
*/
SELECT first_name, last_name FROM employees WHERE first_name LIKE 'S%';
-- �̸��� S�� �����ϴ� ���
SELECT first_name, last_name FROM employees WHERE first_name LIKE '_t%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '__l%';
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%r';
-- r�� ������ �̸�
SELECT first_name, last_name FROM employees WHERE first_name LIKE '%e__';
-- �ڿ��� 3��° �ڸ� e�� ���

SELECT hire_date FROM employees WHERE hire_date LIKE '%/02/%'; 
-- �Ի��� ���� 2��

-- ���� 1> first_name�� a�� ���Ե� ��� ������� �̸� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '%a%' OR first_name LIKE '%A%';
-- ���� 2> first_name�� e�� 2�� ���Ե� ��� ������� �̸� ��ȸ
SELECT first_name FROM employees WHERE first_name LIKE '%e%e%' OR first_name LIKE '%E%e%'; 
-- ���� 3> first_name�� 5���� �̸鼭 r�� ������ ��� ������� �̸� ��ȸ
SELECT first_name, last_name FROM employees WHERE first_name LIKE '____r%';
-- ���� 3> 8���� �Ի��� ������� �̸��� ����� ��ȸ
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '%/08/%' 


















