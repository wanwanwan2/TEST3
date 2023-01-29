-- SUBQUERY(��������)
-- ������� ���ö�� ����� �μ� ��ȸ
SELECT
       E.DEPT_CODE
  FROM EMPLOYEE E
 WHERE E.DEPT_CODE = (SELECT E2.DEPT_CODE
                        FROM EMPLOYEE E2
                       WHERE E2.EMP_NAME = '���ö'
                       );
                    
-- �� ������ ��� �޿����� ���� �޿��� �ް� �ִ� ������
-- ���, �̸�, �����ڵ�, �޿��� ��ȸ�ϼ���
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.JOB_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE E.SALARY > (SELECT AVG(E2.SALARY)
                     FROM EMPLOYEE E2
                   );

SELECT 
       AVG(E.SALARY)
  FROM EMPLOYEE E;
  
-- ���������� ����
-- ������ ��������
-- ������ ��������
-- ���߿� ��������
-- ������ ���߿� ��������

-- �������� ������ ���� �������� �տ� �ٴ� �����ڰ� �ٸ���
-- ������ �������� �տ��� �Ϲ� �� ������ ��� ����
-- >, <, >=, <=, =, !=/<>/^=

-- ���ö ����� �޿����� ���� �޿��� �޴� ������ 
-- ���, �̸�, �μ�, ����, �޿��� ��ȸ�ϼ���
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.DEPT_CODE
     , E.JOB_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE E.SALARY > (SELECT E2.SALARY
                     FROM EMPLOYEE E2
                    WHERE E2.EMP_NAME = '���ö'
                    );

-- ���������� SELECT, FROM, WHERE, HAVING, ORDER BY ������ ��� �����ϴ�.
-- �μ��� �޿��� �հ� �� ���� ū �μ��� �μ��� �޿� �հ踦 ���ϼ���
SELECT
       D.DEPT_TITLE
     , SUM(E.SALARY)
  FROM EMPLOYEE E
  LEFT JOIN DEPARTMENT D ON(E,DEPT_CODE = DE. DEPT_ID)
 GROUP BY D.DEPT_TITLE
HAVING SUM(E.SALARY) = (SELECT MAX(SUM(E2.SALARY))
                          FROM EMPLOYEE E2
                         GROUP BY DEPT_CODE
                         );
                         
-- ������ ��������
-- ������ �������� �տ��� �Ϲ� �񱳿����� ������� ����
-- IN / NOT IN ������ : ���� �� ����� �߿��� �� ���� ��ġ�ϴ� ���� �ִٸ� TRUE / FALSE
-- > ANY, < ANY : ���� ���� ����� �߿��� �� ���� ū/���� ���
--                ���� ���� �� ���� ũ��? / ���� ū �� ���� �۳�?
-- > ALL, < ALL : ��� �� ���� ū / ���� ���
--                ���� ū �� ���� ũ��? / ���� ���� �� ���� �۳�?
-- EXISTS / NOT EXISTS : ���� �����ϳ�? �������� �ʴ���?

-- �μ��� �ְ� �޿��� �޴� ������ �̸�, ����, �μ�, �޿� ��ȸ
SELECT 
       E.DEPT_CODE
     , MAX(E.SALARY)
  FROM EMPLOYEE E
 GROUP BY E.DEPT_CODE;

SELECT 
       E.EMP_NAME
     , E.JOB_CODE
     , E.DEPT_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE E.SALARY IN (SELECT MAX(E2.SALARY)
                      FROM EMPLOYEE E2
                     GROUP BY E2.DEPT_CODE
                     );
                     
-- �븮 ������ ������ �� ���� ������ �ּ� �޿����� ���� �޴� ������
-- ���, �̸�, ���޸�, �޿��� ��ȸ�ϼ���
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , J.JOB_NAME
     , E.SALARY
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
 WHERE J.JOB_NAME = '����';
 
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , J.JOB_NAME
     , E.SALARY
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE
 WHERE J.JOB_NAME = '����';
 
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , J.JOB_NAME
     , E.SALARY
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
 WHERE J.JOB_NAME = '�븮'
   AND E.SALARY > ANY (SELECT E2.SALARY
                         FROM EMPLOYEE E2
                         JOIN JOB J2 ON(E2.JOB_CODE = J2.JOB_CODE)
                        WHERE J2.JOB_NAME = '����'
                        );

-- ���� ������ �޿��� ���� ū ������ ���� �޴� ���� ������
-- ���, �̸�, ����, �޿��� ��ȸ�ϼ���
-- ��, > ALL Ȥ�� < ALL �����ڸ� �̿�
SELECT 
       E.EMP_ID
     , E.EMP_NAME
     , J.JOB_NAME
     , E.SALARY
  FROM EMPLOYEE E
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
 WHERE J.JOB_NAME = '����'
   AND E.SALARY > ALL (SELECT E2.SALARY
                         FROM EMPLOYEE E2
                         JOIN JOB J2 ON(E2.JOB_CODE = J2.JOB_CODE)
                        WHERE J2.JOB_NAME = '����'
                        );

SELECT
       E.*
  FROM EMPLOYEE E
 WHERE EXISTS (SELECT E2.*
                 FROM EMPLOYEE E2
                WHERE E2.EMP_ID = '200'
                );

-- �ڱ� ������ ��� �޿��� �ް� �ִ� ������
-- ���, �̸�, �����ڵ�, �޿��� ��ȸ�ϼ���
-- ��, �޿��� �޿� ����� ���������� ����ϼ��� (TRUNC(�÷���, -5))
SELECT
       E.JOB_CODE
     , TRUNC(AVG(E.SALARY), -5)
  FROM EMPLOYEE E
 GROUP BY E.JOB_CODE;
 
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.JOB_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE E.SALARY IN (SELECT TRUNC(AVG(E2.SALARY), -5)
                      FROM EMPLOYEE E2
                     GROUP BY E2.JOB_CODE
                     );

SELECT 
       E.EMP_NAME
     , E.JOB_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE (E.JOB_CODE, E.SALARY) IN (SELECT E2.JOB_CODE
                                       , TRUNC(AVG(E2.SALARY), -5)
                                   FROM EMPLOYEE E2
                                  GROUP BY E2.JOB_CODE
                                );
                                
-- ����� �������� ���� �μ�, ���� ���޿� �ش��ϴ� �����
-- �̸�, ����, �μ��ڵ�, �Ի��� ��ȸ
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.DEPT_CODE
     , E.JOB_CODE
  FROM EMPLOYEE E
 WHERE SUBSTR(E.EMP_NO, 8, 1) = '2'
   AND E.ENT_YN = 'Y';
   
SELECT
       E.EMP_NAME
     , E.JOB_CODE
     , E.DEPT_CODE
     , E.HIRE_DATE
  FROM EMPLOYEE E
 WHERE (E.DEPT_CODE, E.JOB_CODE) IN (SELECT E2.DEPT_CODE
                                          , E2.JOB_CODE
                                       FROM EMPLOYEE E2
                                      WHERE SUBSTR(E2.EMP_NO, 8, 1) = '2'
                                        AND ENT_YN = 'Y'
                                    )
   AND E.EMP_ID NOT IN (SELECT E3.EMP_ID
                          FROM EMPLOYEE E3
                         WHERE SUBSTR(E3.EMP_NO, 8, 1) = '2'
                           AND ENT_YN = 'Y'
                        );
        
-- FROM ���� ���������� ����� �� �ִ�.
-- �ζ��� ��(INLINE VIEW)��� ��
SELECT
       E.EMP_NAME
     , J.JOB_NAME
     , E.SALARY
  FROM (SELECT E2,JOB_CODE
             , TRUNC(AVG(E2.SALARY), -5) AS JOBAVG
          FROM EMPLOYEE E2
         GROUP BY E2.JOB_CODE
         )V
  JOIN EMPLOYEE E ON(V.JOBAVG = E.SALARY AND E.JOB_CODE = V.JOB_CODE)
  JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
 ORDER BY J.JOB_NAME;
 
SELECT 
       V.EMP_NAME
     , V.�μ���
     , V.�����̸�
  FROM (SELECT EMP_NAME
             , DEPT_TITLE �μ���
             , JOB_NAME �����̸�
          FROM EMPLOYEE E
          LEFT JOIN DEPARTMENT D ON(E.DEPT_CODE = D.DEPT_ID)
          JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
          )V
 WHERE V.�μ��� = '�λ������';
 
-- �ζ��κ並 Ȱ���� TOP-N �м�
SELECT 
       ROWNUM  -- ���� �÷�
     , E.EMP_NAME
     , E.SALARY
  FROM EMPLOYEE E
 ORDER BY E.SALARY DESC;
 
SELECT
       ROWNUM
     , V.EMP_NAME
     , V.SALARY
  FROM (SELECT E.*
          FROM EMPLOYEE E
         ORDER BY E.SALARY DESC
        ) V
-- WHERE ROWNUM BETWEEN 6 AND 10;

SELECT
       V2.RNUM
     , V2.EMP_NAME
     , V2.SALARY
  FROM (SELECT ROWNUM RNUM
             , V.EMP_NAME
             , V.SALARY
          FROM (SELECT E.EMP_NAME
                     , E.SALARY
                  FROM EMPLOYEE E
                 ORDER BY E.SALARY DESC
                 ) V
         ) V2
WHERE RNUM BETWEEN 6 AND 10;

-- STOPKEY Ȱ��
SELECT
       V2.RNUM
     , V2.EMP_NAME
     , V2.SALARY
  FROM (SELECT ROWNUM RNUM
             , V.EMP_NAME
             , V.SALARY
          FROM EMPLOYEE E
         ORDER BY E.SALARY DESC
        ) V
     WHERE ROWNUM < 11
    ) V2
 WHERE RNUM > 5;
 
-- �޿� ��� 3�� �ȿ� ��� �μ���
-- �μ��ڵ�, �μ���, ��ձ޿��� ��ȸ�ϼ���
SELECT
       V.DEPT_CODE
     , V.DEPT_TITLE
     , V.��ձ޿�
  FROM (SELECT E.DEPT_CODE
             , AVG(E.SALARY) ��ձ޿�
          FROM EMPLOYEE E
         GROUP BY E.DEPT_CODE
         ORDER BY AVG(E.SALARY) DESC
        ) V
  JOIN DEPARTMENT D ON (V.DEPT_CODE = D.DEPT_ID)
 WHERE ROWNUM <= 3;
 
-- RANK() : ������ ���� ������ ����� ������ �ο� �� ��ŭ �ǳʶٰ� ������ ����ϴ� ���
-- DENSE_RANK(): �ߺ��Ǵ� ���� ������ ����� ���� ����� ó���ϴ� ���
SELECT
       E.EMP_NAME
     , E.SALARY
     , RANK() OVER(ORDER BY E.SALARY DESC) ����
  FROM EMPLOYEE E;
  
SELECT 
       E.EMP_NAME
     , E.SALARY
     , DENSE_RANK() OVER(ORDER BY E.SALARY DESC) ����
  FROM EMPLOYEE E;
  
SELECT
       V.*
  FROM (SELECT E.EMP_NAME
             , E.SALARY
             , RANK() OVER(ORDER BY E.SALARY DESC) ����
          FROM EMPLOYEE E
        )V
WHERE V. ���� BETWEEN 10 AND 19;

-- ��[ȣ��]�� ��������
-- ���������� ���� ����Ǵ°ſ� ���� ���������� ������ ��ġ��
-- ���������� ������� ���� ���� ������ ��ȣ ���� �Ǿ� �ִ� ���� ����

-- ������ ����� EMPLOYEE ���̺� �����ϴ� ������ ���� ���� ��ȸ
SELECT 
     , E.EMP_ID
     , E.EMP_NAME
     , E.DEPT_CODE
     , E.MANAGER_ID
  FROM EMPLOYEE E
 WHERE EXISTS (SELECT E2.EMP_ID
                 FROM EMPLOYEE E2
                WHERE E.MANAGER_ID = E2.EMP_ID
                );

-- ��Į�� ��������
-- ������ �������� + �������

-- ������ ������ ��� �޿����� �޿��� ���� �ް� �ִ� ������ ���� ��ȸ
SELECT
       E.EMP_NAME
     , E.JOB_CODE
     , E.SALARY
  FROM EMPLOYEE E
 WHERE E.SALARY > SELECT TRUNC(AVG(E2.SALARY), -5)
                    FROM EMPLOYEE E2
                   WHERE E.JOB_CODE = E2.JOB_CODE
                   );

-- SELECT������ ��Į�� �������� �̿�
-- ��� ����� ���, �̸�, �����ڻ��, �����ڸ��� ��ȸ
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.MANAGER_ID
     , NVL((SELECT E2.EMP_NAME
              FROM EMPLOYEE E2
             WHERE E.MANAGER_ID = E2.EMP_ID
             ), '����')
  FROM EMPLOYEE E
 ORDER BY 1;
 
-- ORDER BY ������ ��Į�� �������� �̿�
-- ��� ������ ���, �̸�, �ҼӺμ� ��ȸ
-- �� �μ��� �������� ����
SELECT
       E.EMP_ID
     , E.EMP_NAME
     , E.DEPT_CODE
  FROM EMPLOYEE E
 ORDER BY (SELECT D.DEPT_TITLE
             FROM DEPARTMENT D
            WHERE E.DEPT_CODE = D.DEPT_ID
           ) DESC NULLS LAST;