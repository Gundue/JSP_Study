CREATE TABLE TBL_ARTIST_201905 (
    ARTIST_ID CHAR(4) NOT NULL,
    ARTIST_NAME VARCHAR(20),
    ARTIST_BIRTH CHAR(8),
    ARTIST_GENDER CHAR(1),
    TALENT CHAR(1),
    AGENCY VARCHAR(30),
    CONSTRAINT PK_ARTIST PRIMARY KEY (ARTIST_ID)
);

CREATE TABLE TBL_MENTO_201905 (
    MENTO_ID CHAR(4) NOT NULL,
    MENTO_NAME VARCHAR(20),
    CONSTRAINT PK_MENTO PRIMARY KEY (MENTO_ID)
);

CREATE TABLE TBL_POINT_201905 (
    SERIAL_NO NUMBER(8) NOT NULL,
    ARTIST_ID CHAR(4),
    MENTO_ID CHAR(4),
    POINT NUMBER(3),
    CONSTRAINT PK_POINT PRIMARY KEY (SERIAL_NO)
);

INSERT INTO TBL_ARTIST_201905 VALUES('A001', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A002', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A003', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A004', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
INSERT INTO TBL_ARTIST_201905 VALUES('A005', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

INSERT INTO TBL_MENTO_201905 VALUES('J001', '함멘토');
INSERT INTO TBL_MENTO_201905 VALUES('J002', '박멘토');
INSERT INTO TBL_MENTO_201905 VALUES('J003', '장멘토');

INSERT INTO TBL_POINT_201905 VALUES(2019001, 'A001', 'J001', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019002, 'A001', 'J002', 76);
INSERT INTO TBL_POINT_201905 VALUES(2019003, 'A001', 'J003', 70);
INSERT INTO TBL_POINT_201905 VALUES(2019004, 'A002', 'J001', 80);
INSERT INTO TBL_POINT_201905 VALUES(2019005, 'A002', 'J002', 72);
INSERT INTO TBL_POINT_201905 VALUES(2019006, 'A002', 'J003', 78);
INSERT INTO TBL_POINT_201905 VALUES(2019007, 'A003', 'J001', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019008, 'A003', 'J002', 92);
INSERT INTO TBL_POINT_201905 VALUES(2019010, 'A004', 'J001', 96);
INSERT INTO TBL_POINT_201905 VALUES(2019011, 'A004', 'J002', 90);
INSERT INTO TBL_POINT_201905 VALUES(2019012, 'A004', 'J003', 98);
INSERT INTO TBL_POINT_201905 VALUES(2019013, 'A005', 'J001', 88);
INSERT INTO TBL_POINT_201905 VALUES(2019014, 'A005', 'J002', 86);
INSERT INTO TBL_POINT_201905 VALUES(2019015, 'A005', 'J003', 6);

SELECT * FROM tbl_artist_201905

SELECT
    POINT.SERIAL_NO,ARTIST.ARTIST_ID,ARTIST.ARTIST_NAME,ARTIST.ARTIST_BIRTH,POINT.POINT,MENTO.MENTO_NAME
FROM TBL_MENTO_201905 MENTO, TBL_POINT_201905 POINT, TBL_ARTIST_201905 ARTIST
WHERE MENTO.MENTO_ID = POINT.MENTO_ID AND POINT.ARTIST_ID = ARTIST.ARTIST_ID