SELECT
       DEPT_CODE
     , JOB_CODE
     , SUM(SALARY)
     , COUNT(*)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
     , JOB_CODE
 ORDER BY 1;

-- ���� ���̺��� �μ��ڵ庰 �׷��� �����Ͽ�
-- �μ��ڵ�, �׷캰 �޿��� �հ�, �׷캰 �޿��� ���, �ο����� ��ȸ�ϰ�
-- �μ��ڵ� ������ �������� �����ϼ���
SELECT
       DEPT_CODE
     , SUM(SALARY) �հ�
     , AVG(SALARY) ���
     , COUNT(*) �ο���
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
 ORDER BY DEPT_CODE ASC;
 
 -- ���� ���̺��� �����ڵ�, ���ʽ��� �޴� ��� ���� ��ȸ�Ͽ�
 -- �����ڵ� ������ �������� �����ϼ���
SELECT
       JOB_CODE
     , COUNT(*) 
  FROM EMPLOYEE
 WHERE BONUS IS NOT NULL
 GROUP BY JOB_CODE
 ORDER BY JOB_CODE

-- ���� ���̺��� �ֹι�ȣ 8° �ڸ��� ��ȸ�Ͽ�
-- 1�̸� ��, 2�̸� ���� ��� ��ȸ�ϰ�
-- ����, ������ �޿� ���(����ó��), �޿� �հ�, �ο����� ��ȸ�� ��
-- �ο����� �������� �����ϼ���.
SELECT
       DECODE(SUBSTR(EMP_NO, 8, 1), '1', '��', '2', '��') AS ����
     , FLOOR(AVG(SALARY)) ���
     , SUM(SALARY) �հ�
     , COUNT(*) �ο���
  FROM EMPLOYEE
 GROUP BY DECODE(SUBSTR(EMP_NO, 8, 1) '1', '��', '2', '��')
 ORDER BY �ο��� DESC;
 
 -- HAVING : �׷쿡 ���� ������ ������ �� ����Ѵ�.
 SELECT
        DEPT_CODE
      , FLOOR(AVG(SALARY)) ���
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING FLOOR(AVG(SALARY)) > 3000000
 ORDER BY 1;
 
SELECT
       DEPT_CODE
     , FLOOR(AVG(SALARY) ���
  FROM EMPLOYEE
 WHERE SALARY > 3000000
 GROUP BY DEPT_CODE
 ORDER BY 1;
 
 -- �μ��� �׷��� �޿� �հ谡 9�鸸���� �ʰ��ϴ� �μ��� �μ��ڵ�� �޿� �հ���ȸ
SELECT
        DEPT_CODE
      , (SUM(SALARY)
   FROM EMPLOYEE
  GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 9000000;

-- �޿� �հ谡 ���� ���� �μ��� �μ��ڵ�� �޿� �հ踦 ���ϼ���
SELECT 
       MAX(SUM(SALARY))
  FROM EMPLOYEE
 GROUP BY DEPT_CODE;
 
SELECT 
       DEPT_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

SELECT
       DEPT_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                      GROUP BY DEPT_CODE
                      );

-- �����Լ�
-- ROLLUP �Լ� : �׷캰�� �߰� ���� ó���� �ϴ� �Լ��� GROUP BY �������� ����Ѵ�.
SELECT
       JOB_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY ROLLUP(JOB_CODE)
 ORDER BY 1;
 
-- CUBE �Լ� : �׷캰 ������ ����� �����ϴ� �Լ��̴�. ROLLUP�� ����ϰ� ����Ѵ�.
SELECT
       JOB_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY CUBE(JOB_CODE)
 ORDER BY 1;
 
SELECT 
       DEPT_CODE
     , JOB_CODE3
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY ROLLUP(DEPT_CODE, JOB_CODE)
 ORDER BY 1;
 
SELECT 
       DEPT_CODE
     , JOB_CODE
     , SUM(SALARY)
  FROM EMPLOYEE
 GROUP BY CUBE(DEPT_CODE, JOB_CODE)
 ORDER BY 1;
 
-- GROUPIG �Լ�: ROLLUP�̳� CUBE�� ���� ���⹰��
-- ���ڷ� ���޹��� �÷� ������ ���⹰�̸� 0�� ��ȯ�ϰ�, �ƴϸ� 1�� ��ȯ�ϴ� �Լ�
SELECT
       DEPT_CODE
     , JOB_CODE
     , SUM(SALARY)
     , GROUPING(DEPT_CODE) "�μ����׷칭�λ���"
     , GROUPING(JOB_CODE) "���޺��׷칭�λ���"
  FROM EMPLOYEE
 GROUP BY CUBE(DEPT_CODE, JOB_CODE)
 ORDER BY DEPT_CODE;
 
SELECT
       DEPT_CODE
     , JOB_CODE
     , SUM(SALARY)
     , CASE
        WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 1 THEN '�μ����հ�'
        WHEN GROUPING(DEPT_CODE) = 1 AND GROUPING(JOB_CODE) = 0 THEN '���޺��հ�'
        WHEN GROUPING(DEPT_CODE) = 0 AND GROUPING(JOB_CODE) = 0 THEN '�μ����޺��հ�'
        ELSE '���հ�'
    END AS ����
 GROUP BY CUBE(DEPT_CODE, JOB_CODE)
 ORDER BY 1;
 
 -- SET OPERATION(���տ���)
 -- UNION : ���� ���� ���� ����� �ϳ��� ��ġ�� �������̴�.
 --         �ߺ��� ������ �����Ͽ� �ϳ��� ��ģ��.
SELECT /* ȣ�� �Լ��� ���� */
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5';
 UNION
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY > 3000000;
 
 -- UNION ALL : ���� ���� ���� ����� �ϳ��� ��ġ�� ������
 --             UNINON�� ����
SELECT 
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5'
 UNION
   ALL
SELECT EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY > 3000000;
 
 -- INTERSECT : ���� ���� SELECT�� ������� ���� �κи� ����� ���� 
 --             ���п����� �����հ� ����ϴ�.

SELECT 
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5'
INTERSECT
SELECT EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY > 3000000;
 
 -- MINUS : ���� SELECT ������� ���� SELECT ����� ��ġ�� �κ��� ������ �������� ����
 --         ���п��� �����԰� ����ϴ�.
 
SELECT 
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D5'
 MINUS
SELECT EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY > 3000000;
 
