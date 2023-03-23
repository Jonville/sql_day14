---------------------20230323----------------------

-- 1. å ��� ���� �ݾ��� 10000 ������ ����� �ڵ��� ��ȣ�� 1�� ����
UPDATE CUSTOMER
SET PHONE = '1'
WHERE CUSTID IN (
                SELECT CUSTID
                FROM(
                        
                        SELECT AVG(SALEPRICE) AS AVG_S , CUSTID
                        FROM ORDERS
                        GROUP BY CUSTID
                        
                    ) WHERE AVG_S <= 10000
                )
 ;

-- 2. å ��� ���� �ݾ��� ���� ���� ����� �ڵ��� ��ȣ�� 2�� ����
UPDATE CUSTOMER
SET PHONE = '2'
WHERE CUSTID IN (                   -- IN ���� = �� �ᵵ �ȴ�. ���� ȥ���϶�
                 SELECT CUSTID
                FROM(
                        
                        SELECT AVG(SALEPRICE) AS AVG_S , CUSTID
                        FROM ORDERS
                        GROUP BY CUSTID
                        ORDER BY AVG_S
                        
                    ) WHERE ROWNUM = 1

)
;
-- 3. �л����� ��� ������ ���� ���� �л��� ���� ���� �л��� ���� ���ϱ�
SELECT MAX(AVG_G) - MIN(AVG_G)
FROM (
        SELECT AVG(ENR_GRADE) AS AVG_G , STU_NO
        FROM ENROL
        GROUP BY STU_NO
)
;
-- 4. 2���� ������ ���� �л����� ��������� 1���� ������ ���� �л����� ��������� ���� ���ϱ�
SELECT AVG_G1 - (
    SELECT AVG(AVG_G) AS AVG_G1
    FROM (
        SELECT COUNT(*) AS CNT, AVG(ENR_GRADE) AS AVG_G, STU_NO
        FROM ENROL
        GROUP BY STU_NO
    ) 
    WHERE CNT = 1
    GROUP BY CNT
) AVG_GAP
FROM (
    SELECT AVG(AVG_G) AS AVG_G1, CNT
    FROM (
        SELECT COUNT(*) AS CNT, AVG(ENR_GRADE) AS AVG_G, STU_NO
        FROM ENROL
        GROUP BY STU_NO
    )
    WHERE CNT = 2
    GROUP BY CNT
)
;

--------------------------------------------------------

SELECT AVG_G1 - AVG_G2
FROM (

SELECT AVG(AVG_G) AS AVG_G1 , CNT , 1 AS TEMP
         FROM (
                  SELECT COUNT(*) AS CNT , AVG(ENR_GRADE) AS AVG_G , STU_NO
                   FROM ENROL
                  GROUP BY STU_NO
            )
            WHERE CNT = 2
            GROUP BY CNT
) A
INNER JOIN (

            SELECT AVG(AVG_G) AS AVG_G2 , CNT , 1 AS TEMP
            FROM (
                  SELECT COUNT(*) AS CNT , AVG(ENR_GRADE) AS AVG_G , STU_NO
                   FROM ENROL
                  GROUP BY STU_NO
            )
            WHERE CNT = 1
            GROUP BY CNT
    ) B ON A.TEMP = B.TEMP
    
;

-- 5. ��ǻ������ �а����� ����� ���� �а��� ���� ���

SELECT *
FROM (

        SELECT AVG(ENR_GRADE) AS AVG_G, STU_DEPT
        FROM ENROL E
        INNER JOIN STUDENT S ON E.STU_NO = S.STU_NO
        GROUP BY STU_DEPT

        )

WHERE AVG_G < ( 
                SELECT AVG(ENR_GRADE) AS AVG_C
                FROM ENROL E
                INNER JOIN STUDENT S ON E.STU_NO = S.STU_NO
                WHERE STU_DEPT = '��ǻ������'
                GROUP BY STU_DEPT
            )
;


-- 6. ��ǻ�� ���� ������ ��� �л����� ��� �������� ���� ������ ������ �ִ� ��ǻ�������� �л� ���
SELECT STU_NAME , ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '��ǻ������'
    AND E.ENR_GRADE > (
                        SELECT AVG(ENR_GRADE) AS AVG_C 
                        FROM ENROL E
                        INNER JOIN SUBJECT SUB ON E.SUB_NO = SUB.SUB_NO
                        WHERE SUB.SUB_NAME = '��ǻ�Ͱ���'
                        GROUP BY SUB.SUB_NAME
                        
                    )
;                    
