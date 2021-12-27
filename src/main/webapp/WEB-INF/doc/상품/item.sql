/**********************************/
/* Table Name: 상품 */
/**********************************/
DROP TABLE attachfile;
DROP TABLE items CASCADE CONSTRAINTS;

CREATE TABLE items(
		itemsno NUMERIC(10) NOT NULL PRIMARY KEY,
		ADMINNO NUMERIC(10) NOT NULL,
		category_no NUMERIC(10) NOT NULL,
		item_name VARCHAR(50) NOT NULL,
		content VARCHAR2(4000) NOT NULL,
		recom_cnt NUMERIC(10) DEFAULT 0 NOT NULL,
		view_cnt NUMERIC(10) DEFAULT 0 NOT NULL,
		comment_cnt NUMERIC(10) NOT NULL,
		password VARCHAR(20) NOT NULL,
		search_word VARCHAR(300),
		cdate DATE NOT NULL,
		file1 VARCHAR2(100),
		file1saved VARCHAR2(100),
		thumb1 VARCHAR2(100),
		size1 VARCHAR(100) DEFAULT 0,
		item_price NUMERIC(10) DEFAULT 0 NOT NULL,
		discount NUMERIC(10) DEFAULT 0 NOT NULL,
		total_price NUMBER(10) DEFAULT 0 NOT NULL,
		item_point NUMERIC(10) DEFAULT 0 NOT NULL,
		item_cnt NUMERIC(10) NOT NULL,
  FOREIGN KEY (category_no) REFERENCES category (category_no),
  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
);

COMMENT ON TABLE items is '상품';
COMMENT ON COLUMN items.itemsno is '컨텐츠 번호';
COMMENT ON COLUMN items.ADMINNO is '관리자 번호';
COMMENT ON COLUMN items.category_no is '카테고리 번호';
COMMENT ON COLUMN items.ITEM_NAME is '제목';
COMMENT ON COLUMN items.content is '내용';
COMMENT ON COLUMN items.RECOM_CNT is '추천수';
COMMENT ON COLUMN items.VIEW_CNT is '조회수';
COMMENT ON COLUMN items.COMMENT_CNT is '댓글수';
COMMENT ON COLUMN items.PASSWORD is '패스워드';
COMMENT ON COLUMN items.SEARCH_WORD is '검색어';
COMMENT ON COLUMN items.CDATE is '등록일';
COMMENT ON COLUMN items.file1 is '메인 이미지';
COMMENT ON COLUMN items.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN items.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN items.size1 is ' 메인 이미지 크기';
COMMENT ON COLUMN items.ITEM_PRICE is '정가';
COMMENT ON COLUMN items.DISCOUNT is '할인률';
COMMENT ON COLUMN items.TOTAL_PRICE is '판매가';
COMMENT ON COLUMN items.ITEM_POINT is '포인트';
COMMENT ON COLUMN items.ITEM_CNT is '수량';

DROP SEQUENCE items_seq;

CREATE SEQUENCE items_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO items(itemsno, adminno, category_no, ITEM_NAME, content, RECOM_CNT, VIEW_CNT, COMMENT_CNT, PASSWORD, SEARCH_WORD, CDATE,
                              file1, file1saved, thumb1, size1, ITEM_PRICE, DISCOUNT, TOTAL_PRICE, ITEM_POINT, ITEM_CNT)
VALUES(items_seq.nextval, 1, 1, '런닝머신 X1', '머신', 0, 0, 0, '1234', '런닝', sysdate,
            'run1.jpg', 'run1_1.jpg', 'run1_t.jpg', 1000, 2000, 10, 1800, 100, 500);
            
INSERT INTO items(itemsno, adminno, category_no, ITEM_NAME, content, RECOM_CNT, VIEW_CNT, COMMENT_CNT, PASSWORD, SEARCH_WORD, CDATE,
                              file1, file1saved, thumb1, size1, ITEM_PRICE, DISCOUNT, TOTAL_PRICE, ITEM_POINT, ITEM_CNT)
VALUES(items_seq.nextval, 1, 1, '런닝머신 X2', '머신', 0, 0, 0, '1234', '런닝', sysdate,
            'run1.jpg', 'run1_1.jpg', 'run1_t.jpg', 1000, 2000, 10, 1800, 100, 500);            
            
INSERT INTO items(itemsno, adminno, category_no, ITEM_NAME, content, RECOM_CNT, VIEW_CNT, COMMENT_CNT, PASSWORD, SEARCH_WORD, CDATE,
                              file1, file1saved, thumb1, size1, ITEM_PRICE, DISCOUNT, TOTAL_PRICE, ITEM_POINT, ITEM_CNT)
VALUES(items_seq.nextval, 1, 1, '런닝머신 X3', '머신', 0, 0, 0, '1234', '런닝', sysdate,
            'run1.jpg', 'run1_1.jpg', 'run1_t.jpg', 1000, 2000, 10, 1800, 100, 500);                   
            
-- 조회          
SELECT itemsno, adminno, category_no, ITEM_NAME, content, RECOM_CNT, VIEW_CNT, COMMENT_CNT, PASSWORD, SEARCH_WORD, CDATE,
                              file1, file1saved, thumb1, size1, ITEM_PRICE, DISCOUNT, TOTAL_PRICE, ITEM_POINT, ITEM_CNT
FROM items
WHERE itemsno = 1;

-- 수정
UPDATE items
SET ITEM_NAME='머신', content='런닝 머신',  SEARCH_WORD='달리기, 유산소, 런닝', 
      ITEM_PRICE=10000, DISCOUNT=5, TOTAL_PRICE=9500, ITEM_POINT=500, ITEM_CNT=100
WHERE itemsno = 1;

-- 삭제
DELETE FROM items
WHERE itemsno = 1;
commit;