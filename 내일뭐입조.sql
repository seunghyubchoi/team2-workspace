-- TABLE DROP
DROP TABLE TB_MILEAGE_HISTORY;
DROP TABLE TB_LOCATION;
DROP TABLE TB_LIKE;
DROP TABLE TB_ANSWER_INSTAGRAM;
DROP TABLE TB_SPEECHBUBBLE;
DROP TABLE TB_CART;
DROP TABLE TB_INQUIRE;
DROP TABLE TB_HEADER;
DROP TABLE TB_REVIEW_IMAGE;
DROP TABLE TB_REVIEW;
DROP TABLE TB_RETURN;
DROP TABLE TB_ORDER;
DROP TABLE TB_PRODUCT_IMAGE;
DROP TABLE TB_OPTION;
DROP TABLE TB_INSTAGRAM;
DROP TABLE TB_INSTA_IMAGE;
DROP TABLE TB_FOLLOW;
DROP TABLE TB_MEMBER;
DROP TABLE TB_PRODUCT;
DROP TABLE TB_BRAND;
DROP TABLE TB_MANAGER;
DROP TABLE TB_CATEGORY;
-- SEQUENCE DROP
DROP SEQUENCE SEQ_MILEAGE_HISTORY;
DROP SEQUENCE SEQ_LOCATION;
DROP SEQUENCE SEQ_LIKE;
DROP SEQUENCE SEQ_INSTA_IMAGE;
DROP SEQUENCE SEQ_ANSWER_INSTAGRAM;
DROP SEQUENCE SEQ_SPEECHBUBBLE;
DROP SEQUENCE SEQ_CART;
DROP SEQUENCE SEQ_INQUIRE;
DROP SEQUENCE SEQ_HEADER;
DROP SEQUENCE SEQ_REVIEW_IMAGE;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_RETURN;
DROP SEQUENCE SEQ_ORDER;
DROP SEQUENCE SEQ_PRODUCT_IMAGE;
DROP SEQUENCE SEQ_OPTION;
DROP SEQUENCE SEQ_INSTAGRAM;
DROP SEQUENCE SEQ_FOLLOW;
DROP SEQUENCE SEQ_MEMBER;
DROP SEQUENCE SEQ_PRODUCT;
DROP SEQUENCE SEQ_BRAND;
DROP SEQUENCE SEQ_MANAGER;
DROP SEQUENCE SEQ_CATEGORY;
-- CREATE TABLE
CREATE TABLE TB_MEMBER (
	MEM_NO	NUMBER PRIMARY KEY,
	MEM_ID	VARCHAR2(20) NOT NULL UNIQUE,
	MEM_PWD	VARCHAR2(20) NOT NULL,
	MEM_NAME VARCHAR2(30) NOT NULL,
	EMAIL	VARCHAR2(30),
	PHONE	VARCHAR2(15) NOT NULL,
	ENROLL_DATE	DATE DEFAULT SYSDATE NOT NULL ,
	AD_CHECK CHAR(1) DEFAULT 'N' CHECK(AD_CHECK IN('Y', 'N')) NOT NULL,
	GENDER	CHAR(3)	CHECK(GENDER IN('��', '��')) ,
	BIRTHDAY VARCHAR2(10),
	INSTA_ID VARCHAR2(30),
    DEACT_YN CHAR(1) DEFAULT 'N' CHECK(DEACT_YN IN('Y','N')),
    MILEAGE	NUMBER
);

CREATE TABLE TB_BRAND(
    BRAND_NO NUMBER PRIMARY KEY,
    BRAND_NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE TB_CATEGORY (
	CATEGORY_NO	NUMBER	PRIMARY KEY,
	CATEGORY_NAME VARCHAR2(30) NOT NULL
);


CREATE TABLE TB_PRODUCT (
	PRODUCT_NO NUMBER PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(30) NOT NULL,
	PRODUCT_DESC VARCHAR2(4000)	NOT NULL,
	PRODUCT_PRICE NUMBER NOT NULL,
	PRODUCT_BRAND VARCHAR2(30) NOT NULL,
	PRODUCT_STOCK NUMBER DEFAULT 0	NOT NULL,
	PRODUCT_ENROLL_DATE	DATE DEFAULT SYSDATE NOT NULL,
	PRODUCT_VIEW_COUNT	NUMBER	NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	CATEGORY_NO2 NUMBER	NOT NULL REFERENCES TB_CATEGORY,
    BRAND_NO NUMBER NOT NULL REFERENCES TB_BRAND
);

CREATE TABLE TB_MANAGER (
	MANAGER_NO	NUMBER	PRIMARY KEY,
	MANAGER_ID	VARCHAR2(20) NOT NULL UNIQUE,
	MANAGER_PWD	VARCHAR2(20) NOT NULL
);

CREATE TABLE TB_FOLLOW (
	FOLLOW_NO NUMBER PRIMARY KEY,
	FOLLOWING_ID NUMBER	NOT NULL REFERENCES TB_MEMBER,
	FOLLOWER_ID	NUMBER NOT NULL REFERENCES TB_MEMBER
);

CREATE TABLE TB_REVIEW (
	REVIEW_NO NUMBER PRIMARY KEY,
	REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
	REVIEW_STAR	NUMBER CHECK(REVIEW_STAR IN(1,2,3,4,5))	NOT NULL,
	REVIEW_DATE	DATE DEFAULT SYSDATE NOT NULL ,
	REVIEW_ANS_CONTENT	VARCHAR2(2000) NULL,
	REVIEW_ANS_DATE	DATE,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	PRODUCT_NO2	NUMBER	NOT NULL REFERENCES TB_PRODUCT,
	MEM_NO	NUMBER	NOT NULL REFERENCES TB_MEMBER,
	MANAGER_NO NUMBER REFERENCES TB_MANAGER
);

CREATE TABLE TB_INSTA_IMAGE (
	INSTA_IMG_NO NUMBER	PRIMARY KEY,
	INSTA_IMG_NAME VARCHAR2(30)	NOT NULL,
	INSTA_IMG_SRC VARCHAR2(30) NOT NULL
);


CREATE TABLE TB_INSTAGRAM (
	COM_NO	NUMBER PRIMARY KEY,
	COM_CONTENT	VARCHAR2(2000) NOT NULL,
	COM_TAG	VARCHAR2(20) NOT NULL,
	INSTA_ID VARCHAR2(30) NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	MEM_NO	NUMBER	NOT NULL REFERENCES TB_MEMBER,
    IMG_NO NUMBER NOT NULL REFERENCES TB_INSTA_IMAGE
);

CREATE TABLE TB_LIKE (
	LIKE_NO	NUMBER PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	COM_NO NUMBER NOT NULL REFERENCES TB_INSTAGRAM
);
CREATE TABLE TB_SPEECHBUBBLE (
	BUBLLE_NO NUMBER PRIMARY KEY,
	PRODUCT_BRAND VARCHAR2(30) NOT NULL,
	PRODUCT_NAME VARCHAR2(30) NOT NULL,
	PRODUCT_SIZE VARCHAR2(20) NOT NULL,
	PRODUCT_PRICE NUMBER NOT NULL,
	LINK VARCHAR2(1000)	NOT NULL,
	COM_NO NUMBER NOT NULL,
    BRAND_NO NUMBER NOT NULL REFERENCES TB_BRAND,
	CATEGORY_NO	NUMBER NOT NULL REFERENCES TB_CATEGORY
);

CREATE TABLE TB_HEADER (
	HEADER_NO NUMBER PRIMARY KEY,
	HERADER_CONTENT	VARCHAR2(20) NOT NULL
);

CREATE TABLE TB_INQUIRE (
	QNA_NO	NUMBER	PRIMARY KEY,
	QNA_TITLE VARCHAR2(100)	NOT NULL,
	QNA_CONTENT	VARCHAR2(2000) NOT NULL,
	QNA_DATE DATE DEFAULT SYSDATE NOT NULL ,
	QNA_VIEW_COUNT NUMBER NOT NULL,
	ANS_CONTENT	VARCHAR2(2000),
	ANS_DATE DATE,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	HEADER_NO NUMBER NOT NULL REFERENCES TB_HEADER,
	MANAGER_NO NUMBER REFERENCES TB_MANAGER
);

CREATE TABLE TB_LOCATION (
	LOC_NO NUMBER PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	LOC_ADDRESS_NAME VARCHAR2(30) NOT NULL,
	LOC_NAME VARCHAR2(30) NOT NULL,
	LOC_PHONE VARCHAR2(15) NOT NULL,
	LOC_ADDRESS	VARCHAR2(50) NOT NULL,
	LOC_ADDRESS_DTL	VARCHAR2(50) NOT NULL,
	LOC_POST_CODE VARCHAR2(20) NOT NULL,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	LOC_YN	CHAR(1) CHECK(LOC_YN IN('Y', 'N'))	NOT NULL
);

CREATE TABLE TB_ORDER (
	ORDER_NO NUMBER	PRIMARY KEY,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER,
	PRODUCT_NO NUMBER NOT NULL  REFERENCES TB_PRODUCT,
	ORDER_QNT NUMBER DEFAULT 1 NOT NULL,
	ORDER_DATE DATE DEFAULT SYSDATE	NOT NULL,
	ORDER_STATUS VARCHAR2(20) NOT NULL,
	RCP_ADDRESS_NAME VARCHAR2(30),
	RCP_NAME VARCHAR2(30) NOT NULL,
	RCP_PHONE VARCHAR2(15) NOT NULL,
	RCP_ADDRESS	VARCHAR2(50) NOT NULL,
	RCP_ADDRESS_DTL	VARCHAR2(50) NOT NULL,
	RCP_POST_CODE VARCHAR2(20) NOT NULL,
	RCP_MSG	VARCHAR2(50)
);



CREATE TABLE TB_CART (
	CART_NO	NUMBER PRIMARY KEY,
	CART_QNT NUMBER	NOT NULL,
	PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER
);


CREATE TABLE TB_RETURN (
	RETURN_NO NUMBER PRIMARY KEY,
	RETURN_STATUS CHAR(6) CHECK(RETURN_STATUS IN('��ȯ','��ǰ'))	NOT NULL,
	RETURN_REASON VARCHAR2(4000) NOT NULL,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER ,
	ORDER_NO NUMBER	NOT NULL REFERENCES TB_ORDER
);

CREATE TABLE TB_PRODUCT_IMAGE (
	PRODUCT_IMG_NO NUMBER PRIMARY KEY,
	PRODUCT_IMG_NAME VARCHAR2(30) NOT NULL,
	PRODUCT_IMG_SRC	VARCHAR2(30) NOT NULL,
	PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT
);

CREATE TABLE TB_ANSWER_INSTAGRAM (
	ANS_NO NUMBER PRIMARY KEY,
	ANS_CONTENT	VARCHAR2(500),
	ANS_DATE DATE,
	ADD_ANS_YN CHAR(1) CHECK(ADD_ANS_YN IN('Y', 'N')),
	OG_ANS_NO NUMBER,
    DEL_YN CHAR(1) DEFAULT 'N' CHECK(DEL_YN IN('Y','N')),
	COM_NO NUMBER NOT NULL REFERENCES TB_INSTAGRAM,
	MEM_NO NUMBER NOT NULL REFERENCES TB_MEMBER
);



CREATE TABLE TB_REVIEW_IMAGE (
	REVIEW_IMG_NO NUMBER PRIMARY KEY,
	REVIEW_IMG_NAME	VARCHAR2(30) NOT NULL,
	REVIEW_IMG_SRC VARCHAR2(30) NOT NULL,
	REVIEW_NO NUMBER NOT NULL REFERENCES TB_REVIEW
);



CREATE TABLE TB_OPTION (
	OPTION_NO NUMBER PRIMARY KEY,
	OPTION_SIZE	VARCHAR2(20) NOT NULL,
	PRODUCT_NO NUMBER NOT NULL REFERENCES TB_PRODUCT
);

CREATE TABLE TB_MILEAGE_HISTORY(
    MILEAGE_NO NUMBER PRIMARY KEY,
    MILEAGE_HISTORY CHAR(6) CHECK(MILEAGE_HISTORY IN('���','����')),
    MEM_NO NUMBER NOT NULL
);
--CREATE SEQUENCE 
CREATE SEQUENCE SEQ_MEMBER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CATEGORY
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_BRAND
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_MANAGER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_FOLLOW
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_REVIEW
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INSTAGRAM
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LIKE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_SPEECHBUBBLE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_HEADER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INQUIRE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_LOCATION
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ORDER
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_CART
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_RETURN
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_PRODUCT_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_ANSWER_INSTAGRAM
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_REVIEW_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_INSTA_IMAGE
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_OPTION
NOCYCLE
NOCACHE;

CREATE SEQUENCE SEQ_MILEAGE_HISTORY
NOCYCLE
NOCACHE;

-- INSERT��
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user01','pass01','����','email01@kh.kr','01062612122',DEFAULT,DEFAULT,NULL,NULL,NULL,NULL,NULL);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user02','pass02','����ȭ','email02@kh.kr','01064622323',DEFAULT,DEFAULT,NULL,NULL,NULL,NULL,NULL);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user03','pass03','������','email03@kh.kr','01066632524',DEFAULT,DEFAULT,NULL,NULL,NULL,NULL,NULL);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user04','pass04','������','email04@kh.kr','01068642725',DEFAULT,DEFAULT,NULL,NULL,NULL,NULL,NULL);
INSERT INTO TB_MEMBER VALUES(SEQ_MEMBER.NEXTVAL,'user05','pass05','�ֽ���','email05@kh.kr','01060652926',DEFAULT,DEFAULT,NULL,NULL,NULL,NULL,NULL);
























































