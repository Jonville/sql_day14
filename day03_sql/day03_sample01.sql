---------------------20230323----------------------

-- 1. 책 평균 구매 금액이 10000 이하인 사람의 핸드폰 번호를 1로 변경
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

-- 2. 책 평균 구매 금액이 가장 낮은 사람의 핸드폰 번호를 2로 변경
UPDATE CUSTOMER
SET PHONE = '2'
WHERE CUSTID IN (                   -- IN 말고 = 로 써도 된다. 값이 혼자일땐
                 SELECT CUSTID
                FROM(
                        
                        SELECT AVG(SALEPRICE) AS AVG_S , CUSTID
                        FROM ORDERS
                        GROUP BY CUSTID
                        ORDER BY AVG_S
                        
                    ) WHERE ROWNUM = 1

)
;
-- 3. 학생들의 평균 성적이 가장 높은 학생과 가장 낮은 학생의 차이 구하기
SELECT MAX(AVG_G) - MIN(AVG_G)
FROM (
        SELECT AVG(ENR_GRADE) AS AVG_G , STU_NO
        FROM ENROL
        GROUP BY STU_NO
)
;
-- 4. 2개의 수업을 들은 학생들의 평균점수와 1개의 수업을 들은 학생들의 평균점수의 차이 구하기
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

-- 5. 컴퓨터정보 학과보다 평균이 낮은 학과와 점수 출력

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
                WHERE STU_DEPT = '컴퓨터정보'
                GROUP BY STU_DEPT
            )
;


-- 6. 컴퓨터 개론 수업을 듣는 학생들의 평균 점수보다 높은 점수를 가지고 있는 컴퓨터정보과 학생 출력
SELECT STU_NAME , ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
WHERE STU_DEPT = '컴퓨터정보'
    AND E.ENR_GRADE > (
                        SELECT AVG(ENR_GRADE) AS AVG_C 
                        FROM ENROL E
                        INNER JOIN SUBJECT SUB ON E.SUB_NO = SUB.SUB_NO
                        WHERE SUB.SUB_NAME = '컴퓨터개론'
                        GROUP BY SUB.SUB_NAME
                        
                    )
;                    
