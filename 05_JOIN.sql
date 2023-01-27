-- ����(JOIN)
-- JOIN : �� ���� ���̺��� �ϳ��� ���ļ� ����� ��ȸ�Ѵ�.

-- ����Ŭ ���� ����
-- FROM���� ','�� �����Ͽ� ����� ���̺��� �� ����Ѵ�.
-- WHERE���� ��ġ�⿡ ����� �÷��� �̿��Ͽ� ������ ����Ѵ�.

-- ���ῡ ����� �� �÷����� �ٸ� ���
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID;

-- ���ῡ ����� �� �÷����� ���� ���
SELECT
       EMP_ID
     , EMP_NAME
     , EMPLOYEE.JOB_CODE
     , JOB_NAME
  FROM EMPLOYEE
     , JOB
 WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

-- ���̺� ��Ī �̿�
SELECT 
       E.EMP_ID
     , E.EMP_NAME
     , E.JOB_CODE
     , J.JOB_NAME
  FROM EMPLOYEE E
     , JOB J
WHERE E.JOB_CODE = J.JOB_CODE;


-- ANSI ǥ�� ����
-- ���ῡ ����� �÷����� ���� ��� USING(�÷���)
SELECT
       EMP_ID
     , EMP_NAME
     , JOB_CODE
     , JOB_NAME
  FROM EMPLOYEE
  JOIN JOB USING(JOB_CODE);
  
  
-- ���ῡ ����� �÷����� �ٸ� ��� ON()�� ���
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
  
-- �÷����� ���� ��쿡�� ON()�� ����� �� �ִ�.
SELECT
       EMP_ID
     , EMP_NAME
     , JOB_CODE
     , JOB_NAME
  FROM EMPLOYEE E
  JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-- �μ� ���̺�� ���� ���̺��� �����Ͽ� ���̺��� ��� �����͸� ��ȸ�ϼ���
-- ANSI ǥ��
SELECT 
       D.*
     , L.*  
  FROM DEPARTMENT D
  JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE); 
-- ����Ŭ ����
SELECT 
       D.*
     , L.*  
  FROM DEPARTMENT D
     , LOCATOION L
 WHERE LOCATION_ID = L.LOCAL_CODE;
 
-- ������ �⺻�� EQUAL JOIN�̴�. (EQU JOIN �̶�� ��) (�����)
-- ��ġ�ϴ� ���� ���� ���� ���ο��� �����ϴ� ���� INNER JOIN �̶�� �Ѵ�. (NULL���� ���ο��� ����)

-- JOIN�� �⺻�� INNER JOIN & EQUAL JOIN �̴�.

-- OUTER JOIN : �� ���̺��� �����ϴ� �÷� ���� ��ġ���� �ʴ� �൵(NULL ���� ���� ��)
--              ���� ����� ���Խ�Ŵ
--              OUTER JOIN�� ����ؾ� �Ѵ�.

-- 1. LEFT OUTER JOIN : ��ġ�⿡ ����� �� ���̺� �� ���� ����� ���̺��� ���� ���� �������� JOIN
-- 2. RIGHT OUTER JOIN : ��ġ�⿡ ����� �� ���̺� �� ������ ����� ���̺��� ���� ���� �������� JOIN
-- 3. FULL OUTER JOIN : ��ġ�⿡ ����� �� ���̺��� ���� ��� ���� ����� ���Խ��� JOIN
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- LEFT OUTER JOIN
-- ANSI ǥ��
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
--  LEFT OUTER JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
 LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
 
-- ORACLE ����
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE = DEPT_ID(+);
 
 -- RIGHT OUTER JOIN
 --ANSI
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
 -- RIGHT OUTER JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
 RIGHT OUTER JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

 --ORACLE



-- FULL OUTER JOIN
-- ANSI
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
  FULL OUTER JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ORACLE
-- ����Ŭ ���� �������δ� FULL OUTER JOIN�� ���� ���Ѵ�.
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT
 WHERE DEPT_CODE(+) = DEPT_ID(+);
 
-- CROSS JOIN : ī���̼ǰ�
--              ���εǴ� ���̺��� �� ����� ��� ���ε� ������ �˻��Ǵ� ���
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
 CROSS JOIN DEPARTMENT;
 
SELECT
       EMP_NAME
     , DEPT_TITLE
  FROM EMPLOYEE
     , DEPARTMENT;
     
-- NON EQUAL JOIN(NON EQU JOIN - ������)
-- : ������ �÷��� ���� ��ġ�ϴ� ��찡 �ƴ� ���� ������ ���ԵǴ� ����� �����ϴ� ���
-- ANSI 
SELECT
       EMP_NAME
     , SALARY
     , E.SAL_LEVEL
     , S.SAL_LEVEL
  FROM EMPLOYEE E
  JOIN SAL_GRADE S ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

-- ORACLE
SELECT
       EMP_NAME
     , SALARY
     , E.SAL_LEVEL
     , S.SAL_LEVEL
  FROM EMPLOYEE E
     , SAL_GRADE S
 WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

-- SELF JOIN : ������ ���̺��� �����ϴ� �� (�ڰ�����)
-- ����Ŭ ����
SELECT
       E1.EMP_ID
     , E1.EMP_NAME ����̸�
     , E1.DEPT_CODE
     , E1.MANAGER_ID
     , E2.EMP_NAME �������̸�
  FROM EMPLOYEE E1
     , EMPLOYEE E2
 WHERE E1.MANAGER_ID = E2.EMP_ID;

-- ANSI ǥ��
SELECT
       E1.EMP_ID
     , E1.EMP_NAME �����
     , E1.DEPT_CODE
     , E1.MANAGER_ID
     , E2.EMP_NAME �������̸�
  FROM EMPLOYEE E1
  JOIN EMPLOYEE E2 ON (E1.MANAGER_ID = E2.EMP_ID);

-- ���� ����: ���� �� ���̺� ����
-- ANSI
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , DEPT_TITLE
     , LOCAL_NAME
  FROM EMPLOYEE
  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
  JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)

-- ORACLE
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , LOCAL_NAME
  FROM EMPLOYEE
     , DEPARTMENT
     , LOCATION
 WHERE DEPT_CODE = DEPT_ID
   AND LOCATION_ID = LOCAL_CODE;
   
-- ������ �븮�̸鼭 �ƽþ� ������ �ٹ��ϴ� ������ȸ
-- ���, �̸�, ���޸�, �μ���, �ٹ�������, �޿��� ��ȸ�ϼ���
-- (��ȸ �ÿ��� ��� �÷��� ���̺� ��Ī�� �ٿ��� ��ȸ�Ѵ�.)

-- ANSI ǥ��
SELECT
       EMP_ID
     , EMP_NAME
     , JOB_CODE
     , DEPY_CODE
     , LOCAL_NAME
     , SALARY
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
  JOIN DEPARTMENT D (E.DEPT_CODE = D.DEPT_ID)
  JOIN LOCATI
-- ����Ŭ ����
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , J.JOB_CODE
     , D.DEPY_CODE
     , L.LOCAL_NAME
     , E.SALARY
  FROM EMPLOYEE E
     , JONB