--11_OUTER JOIN.sql

/*
    # OUTER JOIN
    - JOIN ������ �������� ���Ͽ� �������� ���ϴ� ���� �߰��� Ȯ���� �� �ִ� JOIN
    - (+)�� ���� �ʿ� NULL�� �߰��ؼ� ������ �������� ���ߴ� ���� �巯����
    
*/
SELECT * FROM employees; -- 107��

SELECT
    employee_id,
    first_name,
    e.department_id AS "edid",
    d.department_id AS "ddid",
    department_name
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id; -- 106�� / 1���� �������

SELECT employee_id, first_name, e.department_id AS "edid", d.department_id AS "ddid", department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
-- employees ���̺� null�� �߰��Ǿ���.
SELECT employee_id, first_name, e.department_id AS "edid", d.department_id AS "ddid", department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
-- departments ���̺� null�� �߰��Ǿ���.


-- ����1> �μ���ȣ/�μ���/�ּ�/���ø� ��ȸ�ϵ� �Ҽӵ� �μ��� �ϳ��� ���� ���������� ��ȸ
SELECT department_id, department_name, street_address, city
FROM departments dept, locations loc
WHERE dept.location_id = loc.location_id
ORDER BY dept.department_id; 
-- �μ��� �Ҽӵ� ������ �����Ѵ�, ��� null�� �߰��ؾ��ұ�? �����ϰ� Ǯ��
SELECT department_id, department_name, street_address, city
FROM departments dept, locations loc
WHERE dept.location_id(+) = loc.location_id
ORDER BY dept.department_id; 



-- ����2> �Ҽӵ� ����� ���� �μ��� ��ȸ�ϱ�
SELECT dept.* FROM departments dept, employees emp
WHERE emp.department_id(+) = dept.department_id
    AND emp.employee_id IS NULL
ORDER BY  dept.department_id;












