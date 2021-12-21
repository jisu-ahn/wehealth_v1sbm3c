SQL <공지사항게시판>
/**********************************/
/* Table Name: 공지사항 게시판 */
/**********************************/

DROP TABLE notice;
DROP SEQUENCE notice_seq;
------------------------------------------------------------------
CREATE TABLE notice(
notice_no INT NOT NULL PRIMARY KEY,
notice_name VARCHAR(100) NOT NULL,
notice_mkid VARCHAR(100) NOT NULL,
notice_mkdate DATE NOT NULL
);

COMMENT ON TABLE notice is '공지사항게시판';
COMMENT ON COLUMN notice.notice_no is '게시판번호 ';
COMMENT ON COLUMN notice.notice_name is '게시판명';
COMMENT ON COLUMN notice.notice_mkid is '게시판생성자ID';
COMMENT ON COLUMN notice.notice_mkdate is '게시판생성일시';

CREATE SEQUENCE notice_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO notice(notice_no, notice_name, notice_mkid, notice_mkdate)
VALUES(notice_seq.nextval, '공지사항 게시판', '관리자', sysdate);

-- 조회
SELECT notice_no, notice_name, notice_mkid, notice_mkdate
FROM notice
WHERE notice_no = 1;

-- 삭제
DELETE FROM notice
WHERE notice_no, = 1;

-- 수정
UPDATE notice
SET notice_mkid = '관리자2'
WHERE notice_no = 1;
commit;
------------------------------------------------------------------

SQL <공지사항게시글>
/**********************************/
/* Table Name: 공지사항 게시글 */
/**********************************/

DROP TABLE ntpost;
DROP SEQUENCE ntpost_seq;
------------------------------------------------------------------
CREATE TABLE ntpost(
ntpost_no INT NOT NULL PRIMARY KEY,
ntpost_name VARCHAR(100) NOT NULL,
ntpost_mkid VARCHAR(100) NOT NULL,
ntpost_mkdate VARCHAR(100) NOT NULL,
ntpost_view INT NOT NULL,
ntpost_content VARCHAR(1000) NOT NULL,
notice_no INT,
FOREIGN KEY(notice_no) REFERENCES notice(notice_no)
);

COMMENT ON TABLE ntpost is '공지사항 게시글';
COMMENT ON COLUMN ntpost.ntpost_no is '게시글 번호 ';
COMMENT ON COLUMN ntpost.ntpost_name is '게시글 이름';
COMMENT ON COLUMN ntpost.ntpost_mkid is '게시글 작성자 id';
COMMENT ON COLUMN ntpost.ntpost_mkdate is '게시글 생성일시';
COMMENT ON COLUMN ntpost.ntpost_view is '조회수';
COMMENT ON COLUMN ntpost.ntpost_content is '게시글 내용';

CREATE SEQUENCE ntpost_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO ntpost(ntpost_no, ntpost_name, ntpost_mkid, ntpost_mkdate, ntpost_view, ntpost_content)
VALUES(ntpost_seq.nextval, '운동 게시판 작성 이벤트!', '관리자', sysdate, '0', '추첨을 통해 실내자전거 증정!');

INSERT INTO ntpost(ntpost_no, ntpost_name, ntpost_mkid, ntpost_mkdate, ntpost_view, ntpost_content)
VALUES(ntpost_seq.nextval, '연말 기념 할인 DAY', '관리자', sysdate, '0', '전제품 10퍼센트 할인');

INSERT INTO ntpost(ntpost_no, ntpost_name, ntpost_mkid, ntpost_mkdate, ntpost_view, ntpost_content)
VALUES(ntpost_seq.nextval, '배송 지연 안내', '관리자', sysdate, '0', '연휴 배송 휴일, 재개일');

-- 조회
(LIST)
SELECT ntpost_no, ntpost_name, ntpost_mkid, ntpost_mkdate, ntpost_view, ntpost_content
FROM ntpost
ORDER BY ntpost_no;

SELECT ntpost_no, ntpost_name, ntpost_mkid, ntpost_mkdate, ntpost_view, ntpost_content
FROM ntpost
WHERE ntpost_no = 1;

-- 수정
UPDATE ntpost
SET ntpost_name='선착순 경품 증정 이벤트!'
WHERE ntpost_no = 1;

-- 삭제
DELETE FROM ntpost
WHERE ntpost_no = 1;

commit;

------------------------------------------------------------------
SQL <첨부파일>
/**********************************/
/* Table Name: 첨부파일 */
/**********************************/

DROP TABLE ntfile;
DROP SEQUENCE ntfile_seq;
------------------------------------------------------------------
CREATE TABLE ntfile(
ntfile_no INT NOT NULL PRIMARY KEY,
ntfile_name VARCHAR(100) NOT NULL,
ntfile_routename VARCHAR(100) NOT NULL,
ntfile_volume VARCHAR(100) NOT NULL,
ntpost_no INT,
    FOREIGN KEY (ntpost_no) REFERENCES ntpost (ntpost_no)
);

COMMENT ON TABLE ntfile is '첨부파일';
COMMENt ON COLUMN ntfile.ntfile_no is '파일 번호';
COMMENT ON COLUMN ntfile.ntfile_name is '파일명';
COMMENT ON COLUMN ntfile.ntfile_routename is '경로명';
COMMENT ON COLUMN ntfile.ntfile_volume is '용량';

CREATE SEQUENCE ntfile_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO ntfile(ntfile_no, ntfile_name, ntfile_routename, ntfile_volume)
VALUES(ntfile_seq.nextval, '이벤트 안내1.png', 'C:\kd1', '512KB');

INSERT INTO ntfile(ntfile_no, ntfile_name, ntfile_routename, ntfile_volume)
VALUES(ntfile_seq.nextval, '이벤트 안내2.png', 'C:\kd1', '318KB');
            
INSERT INTO ntfile(ntfile_no, ntfile_name, ntfile_routename, ntfile_volume)
VALUES(ntfile_seq.nextval, '이벤트 안내3.png', 'C:\kd1', '456KB');
            
-- 조회          
(LIST)
SELECT ntfile_no, ntfile_name, ntfile_routename, ntfile_volume
FROM ntfile
ORDER BY ntfile_no;

SELECT ntfile_no, ntfile_name, ntfile_routename, ntfile_volume
FROM ntfile
WHERE ntfile_no = 1;

-- 수정
UPDATE ntfile
SET ntfile_name='이벤트안내(최종).png'
WHERE ntfile_no = 1;

-- 삭제
DELETE FROM ntfile
WHERE ntfile_no = 1;

commit;