---------------------20230323----------------------
SELECT CONCAT(BOOKNAME, ' TEST ') AS TEST        -- TEST �� �����شٴ� �ǹ�.
FROM BOOK;

SELECT CONCAT(CONCAT(BOOKNAME , ' ������ ' ),PRICE) AS å����
FROM BOOK ;

-- ���� �̾������
SELECT BOOKNAME || ' ������ ' || PRICE || '��' AS å����   -- CONCAT ���� || �̰ɷ� �����ִ�.
FROM BOOK ;

-- ù���� �빮��
SELECT INITCAP('test123') AS "ù���� �빮��"
FROM DUAL;

-- ���� ��ü �빮��
SELECT UPPER('test123') AS "��ü �빮��"
FROM DUAL;

-- ���� ��ü �ҹ���
SELECT LOWER('TEST123') AS "��ü �ҹ���"
FROM DUAL;

-- ���ʺ��� Ư�� �� ä���
SELECT LPAD('test123' , 10 , '*')       -- 10 ���ڸ� �������� * �� ä��ٴ� �ǹ�
FROM DUAL;

-- �����ʺ��� Ư�� �� ä���
SELECT RPAD('test123' , 10 , '*')       -- 10 ���ڸ� �������� * �� ä��ٴ� �ǹ�
FROM DUAL;

-- ������ ������ �����ش�.
SELECT LTRIM('        TEST123')  AS Ʈ��
FROM DUAL;

--
SELECT LTRIM('TTTTTTTEETEEEST123', 'TE')  AS Ʈ��    -- T �� E �� �����
FROM DUAL;

-- NULL ���� N ������ ��ü������
SELECT NVL(STU_HEIGHT, 0)       -- COUNT �Ҷ� NULL���� ��� 0���� ��ü�س��� ���⵵�Ѵ�.
FROM STUDENT