--06_CASE.sql

/*
    # CASE
    - DECODE()�� switch-caseó�� ��Ȯ�ϰ� ��ġ�ϴ� ��츸 ������ �����ϴ�.
    - CASE�� if�� ó�� ���ϴ� ���ǿ� ���� ���ϴ� ������ �� �� �ִ�.
    �ۼ��� : 
    CASE
        WHEN ���� THEN ��°�
        WHEN ����2 THEN ��°�2
        ...
        ELSE �⺻��
    END
*/

SELECT * FROM employees;
SELECT 
    first_name, job_id, 
    CASE
      WHEN job_id = 'IT_PROG' THEN salary * 1.2
      WHEN job_id LIKE '%_CLERK' THEN salary * 1.03
      ELSE salary
    END AS "increased_salary"
FROM
    employees;
