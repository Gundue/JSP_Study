CREATE TABLE PRODUCT (
    PRODUCT_ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(40),
    PRICE NUMBER(10),
    CATEGORY_ID NUMBER(10) NOT NULL,
    CONSTRAINT PK_PRODUCT PRIMARY KEY (PRODUCT_ID)
);

CREATE TABLE CATEGORY (
    CATEGORY_ID NUMBER(10) NOT NULL,
    NAME VARCHAR2(20),
    CONSTRAINT PK_CATEGORY PRIMARY KEY (CATEGORY_ID)
);

CREATE TABLE SALE (
    SALE_ID NUMBER(10) NOT NULL,
    PRODUCT_ID NUMBER(10) NOT NULL,
    PURCHASE_DATE DATE,
    SALE_PRICE NUMBER(10) NOT NULL,
    AMOUNT NUMBER(5) NOT NULL,
    CONSTRAINT PK_SALE PRIMARY KEY (SALE_ID)
);

CREATE SEQUENCE SALES_SEQ
INCREMENT BY 1
START WITH 16;


INSERT INTO PRODUCT VALUES(1,'컴퓨터', 1000000, 1);
INSERT INTO PRODUCT VALUES(2, '태블릿 PC', 800000, 1);
INSERT INTO PRODUCT VALUES(3, '핸드폰', 1200000, 1);
INSERT INTO PRODUCT VALUES(4, '헤드셋', 80000, 1);
INSERT INTO PRODUCT VALUES(5, '무선 이어폰', 210000, 1);
INSERT INTO PRODUCT VALUES(6, '책상', 160000, 2);
INSERT INTO PRODUCT VALUES(7, '의자', 90000, 2);
INSERT INTO PRODUCT VALUES(8, '소고기', 12000, 3);
INSERT INTO PRODUCT VALUES(9, '티셔츠', 58000, 4);

INSERT INTO CATEGORY VALUES(1, '전자제품');
INSERT INTO CATEGORY VALUES(2, '가구');
INSERT INTO CATEGORY VALUES(3, '식품');
INSERT INTO CATEGORY VALUES(4, '의류');

INSERT INTO SALE VALUES(1, 1, '20200101', 1000000, 1);
INSERT INTO SALE VALUES(2, 2, '20200101', 1600000, 2);
INSERT INTO SALE VALUES(3, 1, '20200101', 2000000, 2);
INSERT INTO SALE VALUES(4, 4, '20200102', 240000, 3);
INSERT INTO SALE VALUES(5, 5, '20200104', 210000, 1);
INSERT INTO SALE VALUES(6, 6, '20200106', 320000, 2);
INSERT INTO SALE VALUES(7, 7, '20200111', 360000, 4);
INSERT INTO SALE VALUES(8, 8, '20200115', 60000, 5);
INSERT INTO SALE VALUES(9, 9, '20200117', 58000, 1);
INSERT INTO SALE VALUES(10, 9,'20200120', 580000, 10);
INSERT INTO SALE VALUES(11, 2,'20200121', 1600000, 2);
INSERT INTO SALE VALUES(12, 1,'20200122', 1000000, 1);
INSERT INTO SALE VALUES(13, 4,'20200124', 80000, 1);
INSERT INTO SALE VALUES(14, 5,'20200126', 210000, 1);
INSERT INTO SALE VALUES(15, 6,'20200129', 260000, 1);

SELECT
    SALE.SALE_ID,PRODUCT.NAME,
    SALE.PURCHASE_DATE, SALE.SALE_PRICE, SALE.AMOUNT
FROM
    PRODUCT, SALE
WHERE
    PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID
ORDER BY
    SALE.SALE_ID ASC;

SELECT
    PRODUCT.NAME,
    SUM(PRODUCT.PRICE * SALE.AMOUNT),
    SUM(SALE.AMOUNT)
FROM
    PRODUCT, SALE
WHERE
    PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID
GROUP BY
    PRODUCT.PRODUCT_ID, PRODUCT.NAME

SELECT
    CATEGORY.NAME,
    SUM(SALE.SALE_PRICE),
    SUM(SALE.AMOUNT)
FROM
    PRODUCT, CATEGORY, SALE
WHERE
    PRODUCT.CATEGORY_ID = CATEGORY.CATEGORY_ID
    AND PRODUCT.PRODUCT_ID = SALE.PRODUCT_ID
GROUP BY
    CATEGORY.CATEGORY_ID, CATEGORY.NAME

SELECT PRODUCT_ID, NAME FROM PRODUCT