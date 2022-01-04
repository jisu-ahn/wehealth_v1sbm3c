SQL <Q&A게시판>
/**********************************/
/* Table Name: Q&A 게시판 */
/**********************************/
/*
특수기호 출력하고싶을시
SET ESCAPE ON
SHOW ESCAPE, 기호앞에 \붙이기
*/

DROP TABLE qna;
DROP SEQUENCE qna_seq;
------------------------------------------------------------------
CREATE TABLE qna(
qna_no INT NOT NULL PRIMARY KEY,
qna_name VARCHAR(100) NOT NULL,
qna_mkid VARCHAR(100) NOT NULL,
qna_mkdate DATE NOT NULL
);

COMMENT ON TABLE qna is 'Q\&A게시판';
COMMENT ON COLUMN qna.qna_no is '게시판번호 ';
COMMENT ON COLUMN qna.qna_name is '게시판명';
COMMENT ON COLUMN qna.qna_mkid is '게시판생성자ID';
COMMENT ON COLUMN qna.qna_mkdate is '게시판생성일시';

CREATE SEQUENCE qna_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO qna(qna_no, qna_name, qna_mkid, qna_mkdate)
VALUES(qna_seq.nextval, 'Q\&A 게시판', '관리자', sysdate);

-- 조회
SELECT qna_no, qna_name, qna_mkid, qna_mkdate
FROM qna
WHERE qna_no = 1;

-- 삭제
DELETE FROM qna
WHERE qna_no = 1;

-- 수정
UPDATE qna
SET qna_mkid = '관리자2'
WHERE qna_no = 1;
commit;
------------------------------------------------------------------

SQL <Q&A게시글>
/**********************************/
/* Table Name: Q&A 게시글 */
/**********************************/

DROP TABLE qnapost;
DROP SEQUENCE qnapost_seq;
------------------------------------------------------------------
CREATE TABLE qnapost(
qnapost_no INT NOT NULL PRIMARY KEY,
qnapost_name VARCHAR(100) NOT NULL,
qnapost_mkid VARCHAR(100) NOT NULL,
qnapost_mkdate VARCHAR(100) NOT NULL,
qnapost_view INT NOT NULL,
qnapost_content VARCHAR(1000) NOT NULL,
qna_no INT,
FOREIGN KEY(qna_no) REFERENCES qna(qna_no)
);

COMMENT ON TABLE qnapost is 'Q\&A 게시글';
COMMENT ON COLUMN qnapost.qnapost_no is '게시글 번호 ';
COMMENT ON COLUMN qnapost.qnapost_name is '게시글 이름';
COMMENT ON COLUMN qnapost.qnapost_mkid is '게시글 작성자 id';
COMMENT ON COLUMN qnapost.qnapost_mkdate is '게시글 생성일시';
COMMENT ON COLUMN qnapost.qnapost_view is '조회수';
COMMENT ON COLUMN qnapost.qnapost_content is '게시글 내용';

CREATE SEQUENCE qnapost_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO qnapost(qnapost_no, qnapost_name, qnapost_mkid, qnapost_mkdate, qnapost_view, qnapost_content)
VALUES(qnapost_seq.nextval, '배송 문의', '회원1', sysdate, '0', '배송 지연 문의');

INSERT INTO qnapost(qnapost_no, qnapost_name, qnapost_mkid, qnapost_mkdate, qnapost_view, qnapost_content)
VALUES(qnapost_seq.nextval, '환불 문의', '회원2', sysdate, '3', '단순 변심');

INSERT INTO qnapost(qnapost_no, qnapost_name, qnapost_mkid, qnapost_mkdate, qnapost_view, qnapost_content)
VALUES(qnapost_seq.nextval, '재입고 문의', '회원3', sysdate, '2', '재입고 날짜');

-- 조회
(LIST)
SELECT qnapost_no, qnapost_name, qnapost_mkid, qnapost_mkdate, qnapost_view, qnapost_content
FROM qnapost
ORDER BY qnapost_no;

SELECT qnapost_no, qnapost_name, qnapost_mkid, qnapost_mkdate, qnapost_view, qnapost_content
FROM qnapost
WHERE qnapost_no = 1;

-- 수정
UPDATE qnapost
SET qnapost_name='배송 날짜 변경 문의'
WHERE qnapost_no = 1;

-- 삭제
DELETE FROM qnapost
WHERE qnapost_no = 1;

commit;

------------------------------------------------------------------

SQL <댓글>
/**********************************/
/* Table Name: 댓글 */
/**********************************/

DROP TABLE qnacomment;
DROP SEQUENCE qnacomment_seq;
------------------------------------------------------------------
CREATE TABLE qnacomment(
qnacomment_no INT NOT NULL PRIMARY KEY,
qnacomment_content VARCHAR(500) NOT NULL,
qnacomment_mkid VARCHAR(100) NOT NULL,
qnacomment_mkdate DATE NOT NULL,
qnapost_no INT,
    FOREIGN KEY (qnapost_no) REFERENCES qnapost (qnapost_no)
);

COMMENT ON TABLE qnacomment is '댓글';
COMMENt ON COLUMN qnacomment.qnacomment_no is '댓글 번호';
COMMENT ON COLUMN qnacomment.qnacomment_content is '댓글 내용';
COMMENT ON COLUMN qnacomment.qnacomment_mkid is '댓글 작성자ID';
COMMENT ON COLUMN qnacomment.qnacomment_mkdate is '작성 일시';

CREATE SEQUENCE qnacomment_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO qnacomment(qnacomment_no, qnacomment_content, qnacomment_mkid, qnacomment_mkdate)
VALUES(qnacomment_seq.nextval, '연휴로 인해 배송이 지연되고 있습니다.', '관리자', sysdate);

INSERT INTO qnacomment(qnacomment_no, qnacomment_content, qnacomment_mkid, qnacomment_mkdate)
VALUES(qnacomment_seq.nextval, '환불처리 안내드립니다.', '관리자', sysdate);
            
INSERT INTO qnacomment(qnacomment_no, qnacomment_content, qnacomment_mkid, qnacomment_mkdate)
VALUES(qnacomment_seq.nextval, '재입고 검토중임을 알려드립니다.', '관리자', sysdate);
            
-- 조회          
(LIST)
SELECT qnacomment_no, qnacomment_content, qnacomment_mkid, qnacomment_mkdate
FROM qnacomment
ORDER BY qnacomment_no;

SELECT qnacomment_no, qnacomment_content, qnacomment_mkid, qnacomment_mkdate
FROM qnacomment
WHERE qnacomment_no = 1;

-- 수정
UPDATE qnacomment
SET qnacomment_content='배송 지연 안내드립니다.'
WHERE qnacomment_no = 1;

-- 삭제
DELETE FROM qnacomment
WHERE qnacomment_no = 1;

commit;

------------------------------------------------------------------

SQL <첨부파일>
/**********************************/
/* Table Name: 첨부파일 */
/**********************************/

DROP TABLE qnafile;
DROP SEQUENCE qnafile_seq;
------------------------------------------------------------------
CREATE TABLE qnafile(
qnafile_no INT NOT NULL PRIMARY KEY,
qnafile_name VARCHAR(100) NOT NULL,
qnafile_routename VARCHAR(100) NOT NULL,
qnafile_volume VARCHAR(100) NOT NULL,
qnapost_no INT,
    FOREIGN KEY (qnapost_no) REFERENCES qnapost (qnapost_no)
);

COMMENT ON TABLE qnafile is '첨부파일';
COMMENt ON COLUMN qnafile.qnafile_no is '파일 번호';
COMMENT ON COLUMN qnafile.qnafile_name is '파일명';
COMMENT ON COLUMN qnafile.qnafile_routename is '경로명';
COMMENT ON COLUMN qnafile.qnafile_volume is '용량';

CREATE SEQUENCE qnafile_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO qnafile(qnafile_no, qnafile_name, qnafile_routename, qnafile_volume)
VALUES(qnafile_seq.nextval, '실내자전거.png', 'C:\kd1', '512KB');

INSERT INTO qnafile(qnafile_no, qnafile_name, qnafile_routename, qnafile_volume)
VALUES(qnafile_seq.nextval, '아령.png', 'C:\kd1', '387KB');
            
INSERT INTO qnafile(qnafile_no, qnafile_name, qnafile_routename, qnafile_volume)
VALUES(qnafile_seq.nextval, '러닝머신.png', 'C:\kd1', '416KB');
            
-- 조회          
(LIST)
SELECT qnafile_no, qnafile_name, qnafile_routename, qnafile_volume
FROM qnafile
ORDER BY qnafile_no;

SELECT qnafile_no, qnafile_name, qnafile_routename, qnafile_volume
FROM qnafile
WHERE qnafile_no = 1;

-- 수정
UPDATE qnafile
SET qnafile_name='실내자전거1.png'
WHERE qnafile_no = 1;

-- 삭제
DELETE FROM qnafile
WHERE qnafile_no = 1;

commit;