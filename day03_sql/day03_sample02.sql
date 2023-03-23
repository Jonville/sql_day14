---------------------20230323----------------------
SELECT CONCAT(BOOKNAME, ' TEST ') AS TEST        -- TEST 를 붙혀준다는 의미.
FROM BOOK;

SELECT CONCAT(CONCAT(BOOKNAME , ' 가격은 ' ),PRICE) AS 책가격
FROM BOOK ;

-- 글자 이어붙히기
SELECT BOOKNAME || ' 가격은 ' || PRICE || '원' AS 책가격   -- CONCAT 말고 || 이걸로 쓸수있다.
FROM BOOK ;

-- 첫글자 대문자
SELECT INITCAP('test123') AS "첫글자 대문자"
FROM DUAL;

-- 영어 전체 대문자
SELECT UPPER('test123') AS "전체 대문자"
FROM DUAL;

-- 영어 전체 소문자
SELECT LOWER('TEST123') AS "전체 소문자"
FROM DUAL;

-- 왼쪽부터 특정 값 채우기
SELECT LPAD('test123' , 10 , '*')       -- 10 글자를 기준으로 * 을 채운다는 의미
FROM DUAL;

-- 오른쪽부터 특정 값 채우기
SELECT RPAD('test123' , 10 , '*')       -- 10 글자를 기준으로 * 을 채운다는 의미
FROM DUAL;

-- 왼쪽의 공백을 지워준다.
SELECT LTRIM('        TEST123')  AS 트림
FROM DUAL;

--
SELECT LTRIM('TTTTTTTEETEEEST123', 'TE')  AS 트림    -- T 랑 E 를 지운다
FROM DUAL;

-- NULL 값을 N 값으로 대체시켜줌
SELECT NVL(STU_HEIGHT, 0)       -- COUNT 할때 NULL값을 잠깐 0으로 대체해놓고 쓰기도한다.
FROM STUDENT