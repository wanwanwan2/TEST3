-- SELECT �⺻ ���� �� ������

-- EMPLOYEE ���̺��� ��� ���� ��ȸ
SELECT
       *
  FROM EMPLOYEE;

-- Ư�� �÷� ��ȸ
-- EMPLOYEE ���̺��� ���, �̸� ��ȸ
SELECT
       EMP_ID
     , EMP_NAME
  FROM EMPLOYEE;
  
-- ���ϴ� �� ��ȸ
-- EMPLOYEE ���̺��� �μ��ڵ尡 D9�� ��� ��ȸ
SELECT
       * 
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D9';
 
-- EMPLOYEE ���̺��� �����ڵ尡 J1�� ��� ��ȸ
SELECT
       *
  FROM EMPLOYEE
 WHERE JOB_CODE = 'J1'
 
-- ���ϴ� ��� �÷� ��ȸ
-- EMPLOYEE ���̺��� �޿��� 300���� �̻��� �����
-- ���, �̸�, �μ��ڵ�, �޿��� ��ȸ�ϼ���
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE SALARY >= 3000000;
 
-- �÷��� ��Ī ����
-- AS + ��Ī�� ����Ͽ� ��Ī�� ���� �� �ִ�.
-- ��, ����, Ư������ ���� ���� ��Ī�� �̿��ϴ� ��� ""�� ��Ī�� ���ξ� �Ѵ�.
-- AS ���� ������
SELECT
       EMP_NAME AS �̸�
     , SALARY * 12 AS "1��޿�"
     , (SALARY + (SALARY * NVL(BONUS,0))) * 12 "���ʽ����Կ���"
  FROM EMPLOYEE;
  
-- ���Ƿ� ������ ���ڿ��� SELECT������ ����� �� �ִ�.
SELECT
       EMP_ID
     , EMP_NAME
     , SALARY
     , '��' AS ����
  FROM EMPLOYEE;
  
-- DISTINCT Ű����� �ߺ��� �÷����� �����Ͽ� ��ȸ�Ѵ�.
SELECT
       DISTINCT JOB_CODE
  FROM EMPLOYEE;
  
-- DISTINCT Ű����� SELECT ������ �� �� ���� ��� �����ϴ�
-- ���� �� �÷��� ��� �ߺ��� ���ܽ�Ų��. 
SELECT
       DISTINCT JOB_CODE
     , /* DISTINCT */ DEPT_CODE
  FROM EMPLOYEE;
  
-- WHERE ��
-- ���̺��� ������ �����ϴ� ���� ��� �� ����Ѵ�.
-- ������ ������ ��� AND Ȥ�� OR�� ����� �� �ִ�.

-- �μ��ڵ尡 D6�̰� �޿��� 200�������� ���� �޴� ������
-- �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE = 'D6'
   AND SALARY >= 2000000;

-- ���ʽ��� ���޹��� �ʴ� ����� 
-- ���, �̸�, �޿�, ���ʽ��� ��ȸ�ϼ���
SELECT
       EMP_ID
     , EMP_NAME
     , SALARY
     , BONUS
  FROM EMPLOYEE
-- WHERE BONUS IS NOT NULL;
 WHERE NOT BONUS IS NULL;

-- ���Ῥ���ڸ� �̿��Ͽ� ���� �÷��� ���� �ϳ��� �÷��� ���� �� ó�� ������ �� �ִ�.(||)
SELECT
       EMP_ID || EMP_NAME || SALARY
  FROM EMPLOYEE;

SELECT
       EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�.'
  FROM EMPLOYEE;
  
-- �񱳿�����
-- = ����?, > ũ��?, < �۳�?, >= ũ�ų� ����?, <= �۰ų� ����?
-- !=, ^=, <> ���� �ʳ�?
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
  FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D9';
-- WHERE DEPT_CODE ^= 'D9';
 WHERE DEPT_CODE <> 'D9';
 
 -- EMPLOYEE ���̺��� ��翩�ΰ� N�� ����(������� ���� ����)�� ��ȸ�ϰ�
 -- �ٹ����θ� ��Ī���� �Ͽ� ������ �̶�� ���ڿ��� ������տ� �����Ͽ� ��ȸ
 -- ���, �̸�, �Ի���, �ٹ����θ� ��ȸ�ϼ���
 SELECT
        EMP_ID
      , EMP_NAME
      , HIRE_DATE
      , '������' �ٹ�����
  FROM EMPLOYEE
 WHERE ENT_YN = 'N';

-- EMPLOYEE ���̺��� �޿��� 350���� �̻�
-- 550���� ���ϸ� �޴�
-- ������ ���, �̸�, �޿�, �μ��ڵ�, �����ڵ带 ��ȸ�ϼ���
SELECT
       EMP_ID
     , EMP_NAME
     , SALARY
     , DEPT_CODE
     , JOB_CODE
  FROM EMPLOYEE
 WHERE SALARY >= 3500000
   AND SALARY <= 5500000;

--BETWEEN AND ������
-- �÷��� BETWEEN ���Ѱ� AND ���Ѱ�
-- : ���Ѱ� �̻�, ���Ѱ� ������ ��
SELECT
       EMP_ID
     , EMP_NAME
     , DEPT_CODE
     , JOB_CODE
  FROM EMPLOYEE
-- WHERE NOT SALARY BETWEEN 3500000 AND 5500000;
 WHERE SALARY > 5500000
    OR SALARY < 3500000;

-- LIKE ������ : ���� ������ ��ġ�ϴ� ���� ��ȸ�� �� ���
-- �÷��� LIKE '��������'
-- �������� : '����%' (���ڷ� �����ϴ� ��)
--          '%����%' (���ڸ� �����ϴ� ��)
--          '%����' (���ڸ� ������ ��)

-- EMPLOYEE ���̺��� ���� �达�� ������
-- ���, �̸�, �Ի��� ��ȸ
SELECT
       EMP_ID
     , EMP_NAME
     , HIRE_DATE
  FROM EMPLOYEE
-- WHERE EMP_NAME LIKE '��%';
 WHERE NOT EMP_NAME LIKE '��%';
 
-- EMPLOYEE ���̺��� '��'�� �̸��� ���Ե� ������
-- �̸�, �ֹι�ȣ, �μ��ڵ� ��ȸ
SELECT
       EMP_NAME
     , EMP_NO
     , DEPT_CODE
  FROM EMPLOYEE
 WHERE EMP_NAME LIKE '%��%';

-- % (0�� �̻��� ����), _(���� �� �ڸ�)

-- EMPLOYEE ���̺��� ��ȭ��ȣ ������ 9�� �����ϴ� ������
-- ���, �̸�, ��ȭ��ȣ�� ��ȸ�ϼ���
SELECT
       EMP_ID
     , EMP_NAME
     , PHONE
  FROM EMPLOYEE
 WHERE PHONE LIKE '___9%';
 
-- EMPLOYEE ���̺��� ��ȭ��ȣ ������ 4�ڸ��̸鼭
-- 9�� �����ϴ� ������ ���, �̸�, ��ȭ��ȣ�� ��ȸ�ϼ���
SELECT
       EMP_ID
     , EMP_NAME
     , PHONE
  FROM EMPLOYEE
 WHERE PHONE LIKE '___9_______';

-- EMPLOYEE ���̺��� �̸��� �ּ��� _ �ձ��ڰ� 3�ڸ��� �̸��� �ּҸ� ����
-- ����� ���, �̸�, �̸����ּ� ��ȸ
SELECT
       EMP_ID
     , EMP_NAME
     , EMAIL
  FROM EMPLOYEE
 WHERE PHONE LIKE '__#_%' ESCAPE '#';

-- �μ��ڵ尡 'D6'�̰ų� 'D8'�� ������
-- �̸�, �μ�, �޿��� ��ȸ�ϼ���
-- IN ������ : ���Ϸ��� �� ��Ͽ� ��ġ�ϴ� ���� �ִ��� Ȯ��
SELECT
       EMP_NAME
     , DEPT_CODE
     , SALARY
  FROM EMPLOYEE
 WHERE DEPT_CODE IN ('D6', 'D8');
 
-- ������ �켱����
/*
1. ���������
2. ���Ῥ����
3. �񱳿�����
4. IS NULL/IS NOT NULL, LIKE/NOT LIKE, IN/NOT IN
5. BETWEEN AND/NOT BETWEEN AND
6. NOT
7. AND
8.OR
*/

-- J7 �����̰ų� J2������ ������ ��
-- �޿��� 200���� �̻��� ������
-- �̸�, �޿�, �����ڵ带 ��ȸ�ϼ���
SELECT
       EMP_NAME
     , SALARY
     , JOB_CODE
  FROM EMPLOYEE
 WHERE JOB_CODE
    OR JOB_CODE = 'J7'
   AND SALARY >= 2000000;