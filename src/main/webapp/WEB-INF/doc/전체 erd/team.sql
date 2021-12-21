/**********************************/
/* Table Name: 카테고리 그룹  */
/**********************************/
CREATE TABLE categorygrp(
		categorygrp_no NUMERIC(10) NOT NULL PRIMARY KEY,
		categorygrp_name VARCHAR(50) NOT NULL,
		seq_no NUMERIC(7) NOT NULL,
		print_mode CHAR(1) NOT NULL,
		cdate DATE NOT NULL
);

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
		category_no NUMERIC(10) NOT NULL PRIMARY KEY,
		categorygrp_no NUMERIC(10) NOT NULL,
		category_name VARCHAR(10) NOT NULL,
		cdate DATE NOT NULL,
		product_cnt NUMERIC(10) NOT NULL,
  FOREIGN KEY (categorygrp_no) REFERENCES categorygrp (categorygrp_no)
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE ADMIN(
		ADMINNO NUMERIC(10) NOT NULL PRIMARY KEY,
		ID VARCHAR(20) NOT NULL,
		NAME VARCHAR(300) NOT NULL,
		PASSWORD VARCHAR(100) NOT NULL,
		AUTHORITY VARCHAR(20) NOT NULL,
		ENABLED NUMERIC(38) NOT NULL,
		RDATE DATE NOT NULL
);

/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE item(
		itemsno NUMBER(10) NOT NULL PRIMARY KEY,
		ADMINNO NUMBER(10) NOT NULL,
		category_no NUMBER(10) NOT NULL,
		ITEM_NAME VARCHAR2(300) NOT NULL,
		CONTENT VARCHAR2(4000) NOT NULL,
		RECOM_CNT NUMBER(7) NOT NULL,
		VIEW_CNT NUMBER(7) NOT NULL,
		COMMENT_CNT NUMBER(7) NOT NULL,
		PASSWORD VARCHAR2(15) NOT NULL,
		SEARCH_WORD VARCHAR2(300) NOT NULL,
		CDATE DATE NOT NULL,
		FILE1 VARCHAR2(100) NOT NULL,
		FILE1SAVED VARCHAR2(100) NOT NULL,
		THUMB1 VARCHAR2(100) NOT NULL,
		SIZE NUMBER(10) NOT NULL,
		ITEM_PRICE NUMBER(10) NOT NULL,
		DISCOUNT NUMBER(10) NOT NULL,
		TOTAL_PRICE NUMBER(10) NOT NULL,
		ITEM_POINT NUMBER(10) NOT NULL,
		ITEM_CNT NUMBER(10) NOT NULL,
  FOREIGN KEY (category_no) REFERENCES category (category_no),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);


CREATE TABLE items(
		itemsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		ADMINNO                       		NUMBER(10)		 NOT NULL,
		category_no                        		NUMBER(10)		 NOT NULL,
		ITEM_NAME                  		VARCHAR2(50)		 NOT NULL,
		content                       		VARCHAR2(4000)		 NOT NULL,
        RECOM_CNT                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        VIEW_CNT                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        COMMENT_CNT                     NUMBER(7)         DEFAULT 0         NOT NULL,
		PASSWORD                      		VARCHAR2(20)		 NOT NULL,
        SEARCH_WORD                                  VARCHAR2(300)         NULL ,
        CDATE                                 DATE               NOT NULL,
        file1                                 VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                                VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
		ITEM_PRICE                 		NUMBER(10)      DEFAULT 0 NULL,  
		DISCOUNT                          		NUMBER(10)      DEFAULT 0 NULL,  
		TOTAL_PRICE                   		NUMBER(10)      DEFAULT 0 NULL,  
        ITEM_POINT                                 NUMBER(10)      DEFAULT 0 NULL,  
        ITEM_CNT                                 NUMBER(10)      DEFAULT 0 NULL,  
  FOREIGN KEY (category_no) REFERENCES category (category_no),
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

/**********************************/
/* Table Name: 첨부 파일 */
/**********************************/
CREATE TABLE attachfile(
		attachfile_no NUMERIC(10) NOT NULL PRIMARY KEY,
		itemsno NUMERIC(10) NOT NULL,
  FOREIGN KEY (itemsno) REFERENCES item (itemsno)
);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEMBER(
		MEMBERNO NUMERIC(10) NOT NULL PRIMARY KEY,
		ID VARCHAR(20) NOT NULL,
		PASSWORD VARCHAR(60) NOT NULL,
		MNAME VARCHAR(30) NOT NULL,
		TEL VARCHAR(14) NOT NULL,
		ZIPCODE VARCHAR(5) NOT NULL,
		COLUMN_7 VARCHAR(80) NOT NULL,
		COLUMN_8 VARCHAR(50) NOT NULL,
		MDATE DATE NOT NULL,
		GRADE NUMERIC(2) NOT NULL
);

/**********************************/
/* Table Name: 질문답변 */
/**********************************/
CREATE TABLE Q&A(
		Q&A_NO NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		itemsno NUMERIC(10) NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (itemsno) REFERENCES item (itemsno)
);

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE COMMENT(
		COMMENTNO NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		itemsno NUMERIC(10) NOT NULL,
  FOREIGN KEY (itemsno) REFERENCES item (itemsno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE CART(
		CARTNO NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		itemsno NUMERIC(10) NOT NULL,
		CNT NUMERIC(10) NOT NULL,
		TOT NUMERIC(10) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (itemsno) REFERENCES item (itemsno)
);

/**********************************/
/* Table Name: 상품 추천 */
/**********************************/
CREATE TABLE ITEMRECOM(
		ITEMRECOMNO NUMERIC(10) NOT NULL PRIMARY KEY,
		itemsno NUMERIC(10) NOT NULL,
		MEMBERNO NUMERIC(10) NOT NULL,
		RDATE DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (itemsno) REFERENCES item (itemsno)
);

/**********************************/
/* Table Name: 주문_결재 */
/**********************************/
CREATE TABLE order_pay(
		order_payno NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		rname VARCHAR(30) NOT NULL,
		rtel VARCHAR(14) NOT NULL,
		rzipcode VARCHAR(5) NOT NULL,
		raddress1 VARCHAR(80) NOT NULL,
		raddress2 VARCHAR(50) NOT NULL,
		paytype NUMERIC(1) NOT NULL,
		amount NUMERIC(10) NOT NULL,
		rdate DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

/**********************************/
/* Table Name: 주문상세 */
/**********************************/
CREATE TABLE order_item(
		order_itemno NUMERIC(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10) NOT NULL,
		itemsno NUMERIC(10) NOT NULL,
		order_payno NUMERIC(10) NOT NULL,
		cnt NUMERIC(5) NOT NULL,
		tot NUMERIC(10) NOT NULL,
		stateno NUMERIC(10) NOT NULL,
		rdate DATE NOT NULL,
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO),
  FOREIGN KEY (order_payno) REFERENCES order_pay (order_payno),
  FOREIGN KEY (itemsno) REFERENCES item (itemsno)
);

/**********************************/
/* Table Name: 설문조사 */
/**********************************/
CREATE TABLE wesurvey(
		wesurveyno NUMBER(10) NOT NULL PRIMARY KEY,
		topic VARCHAR2(200) NOT NULL,
		startdate VARCHAR2(10) NOT NULL,
		enddate VARCHAR2(10),
		poster VARCHAR2(100),
		cnt NUMBER(7) DEFAULT 0 NOT NULL,
		continueyn CHAR(1) DEFAULT 'Y'
);

/**********************************/
/* Table Name: 설문 조사 항목 */
/**********************************/
CREATE TABLE wesurveyitem(
		wesurveyitemno NUMBER(10) NOT NULL PRIMARY KEY,
		wesurveyno NUMBER(10),
		itemseq NUMBER(2) DEFAULT 1 NOT NULL,
		item VARCHAR2(200) NOT NULL,
		itemfile INTEGER(10),
		itemcnt NUMBER(7) DEFAULT 0 NOT NULL,
  FOREIGN KEY (wesurveyno) REFERENCES wesurvey (wesurveyno)
);

/**********************************/
/* Table Name: 설문 참여 회원 */
/**********************************/
CREATE TABLE wesurveymember(
		wesurveymemberno NUMBER(10) NOT NULL PRIMARY KEY,
		wesurveyitemno NUMBER(10),
		MEMBERNO NUMERIC(10),
		rdate DATE NOT NULL,
  FOREIGN KEY (wesurveyitemno) REFERENCES wesurveyitem (wesurveyitemno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

/**********************************/
/* Table Name: 설문 댓글 */
/**********************************/
CREATE TABLE wesurveyreply(
		wesurveyreplyno INTEGER(10) NOT NULL PRIMARY KEY,
		MEMBERNO NUMERIC(10),
		wesurveyno NUMBER(10),
		content VARCHAR2(500) NOT NULL,
		goodcnt NUMBER(7) DEFAULT 0 NOT NULL,
		badcnt NUMBER(7) DEFAULT 0 NOT NULL,
		replycnt INTEGER(7) DEFAULT 0 NOT NULL,
  FOREIGN KEY (wesurveyno) REFERENCES wesurvey (wesurveyno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

/**********************************/
/* Table Name: 설문 댓글의 답글 */
/**********************************/
CREATE TABLE wesurveyreplyans(
		wesurveyreplyans INTEGER(10) NOT NULL PRIMARY KEY,
		wesurveyreplyno INTEGER(10),
		MEMBERNO NUMERIC(10),
		content VARCHAR2(300) NOT NULL,
  FOREIGN KEY (wesurveyreplyno) REFERENCES wesurveyreply (wesurveyreplyno),
  FOREIGN KEY (MEMBERNO) REFERENCES MEMBER (MEMBERNO)
);

/**********************************/
/* Table Name: 운동정보게시판 */
/**********************************/
CREATE TABLE exercise(
		exercise_no INT NOT NULL PRIMARY KEY,
		exercise_name VARCHAR(100) NOT NULL,
		exercise_mkid VARCHAR(100) NOT NULL,
		exercise_mkdate DATE NOT NULL,
		exercise_use VARCHAR(100) NOT NULL
);

/**********************************/
/* Table Name: 운동게시글 */
/**********************************/
CREATE TABLE post(
		post_no INT NOT NULL PRIMARY KEY,
		exercise_no INT NOT NULL,
		post_name VARCHAR(100) NOT NULL,
		post_mkid VARCHAR(100) NOT NULL,
		post_mkdate DATE NOT NULL,
		post_notice VARCHAR(100) NOT NULL,
		post_view INT NOT NULL,
		post_recommend INT NOT NULL,
		post_content VARCHAR(1000) NOT NULL,
  FOREIGN KEY (exercise_no) REFERENCES exercise (exercise_no)
);

/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE excomment(
		excomment_no INT NOT NULL PRIMARY KEY,
		post_no INT NOT NULL,
		excomment_content VARCHAR(500) NOT NULL,
		excomment_mkid VARCHAR(100) NOT NULL,
		excomment_mkdate DATE NOT NULL,
  FOREIGN KEY (post_no) REFERENCES post (post_no)
);

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE exfile(
		exfile_no INT NOT NULL PRIMARY KEY,
		post_no INT NOT NULL,
		exfile_name VARCHAR(100) NOT NULL,
		exfile_routename VARCHAR(100) NOT NULL,
		exfile_volume VARCHAR(100) NOT NULL,
  FOREIGN KEY (post_no) REFERENCES post (post_no)
);
