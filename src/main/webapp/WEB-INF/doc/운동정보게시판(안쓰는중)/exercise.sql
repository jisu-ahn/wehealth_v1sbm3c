SQL <운동정보게시판>
/**********************************/
/* Table Name: 운동 정보 게시판 */
/**********************************/

DROP TABLE exercise;
DROP SEQUENCE exercise_seq;
------------------------------------------------------------------
CREATE TABLE exercise(
exercise_no INT NOT NULL PRIMARY KEY,
exercise_name VARCHAR(100) NOT NULL,
exercise_mkid VARCHAR(100) NOT NULL,
exercise_mkdate DATE NOT NULL
);

COMMENT ON TABLE exercise is '운동정보게시판';
COMMENT ON COLUMN exercise.exercise_no is '게시판번호 ';
COMMENT ON COLUMN exercise.exercise_name is '게시판명';
COMMENT ON COLUMN exercise.exercise_mkid is '게시판생성자ID';
COMMENT ON COLUMN exercise.exercise_mkdate is '게시판생성일시';

CREATE SEQUENCE exercise_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO exercise(exercise_no, exercise_name, exercise_mkid, exercise_mkdate)
VALUES(exercise_seq.nextval, '운동 정보 게시판', '관리자', sysdate);

-- 조회
SELECT exercise_no, exercise_name, exercise_mkid, exercise_mkdate
FROM exercise
WHERE exercise_no = 1;

-- 삭제
DELETE FROM exercise
WHERE exercise_no, = 1;

-- 수정
UPDATE exercise
SET exercise_mkid = '관리자2'
WHERE exercise_no = 1;
commit;
------------------------------------------------------------------

SQL <운동게시글>
/**********************************/
/* Table Name: 운동 게시글 */
/**********************************/

DROP TABLE post;
DROP SEQUENCE post_seq;
------------------------------------------------------------------
CREATE TABLE post(
post_no INT NOT NULL PRIMARY KEY,
post_name VARCHAR(100) NOT NULL,
post_mkid VARCHAR(100) NOT NULL,
post_mkdate VARCHAR(100) NOT NULL,
post_view INT NOT NULL,
post_recommend INT NOT NULL,
post_content VARCHAR(1000) NOT NULL,
exercise_no INT,
FOREIGN KEY(exercise_no) REFERENCES exercise(exercise_no)
);

COMMENT ON TABLE post is '운동 게시글';
COMMENT ON COLUMN post.post_no is '게시글 번호 ';
COMMENT ON COLUMN post.post_name is '게시글 이름';
COMMENT ON COLUMN post.post_mkid is '게시글 작성자 id';
COMMENT ON COLUMN post.post_mkdate is '게시글 생성일시';
COMMENT ON COLUMN post.post_view is '조회수';
COMMENT ON COLUMN post.post_recommend is '추천수';
COMMENT ON COLUMN post.post_content is '게시글 내용';

CREATE SEQUENCE post_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO post(post_no, post_name, post_mkid, post_mkdate, post_view, post_recommend, post_content)
VALUES(post_seq.nextval, '하루 10분 코어 운동', '회원1', sysdate, '0', '0', '홈트계의 끝판왕');

INSERT INTO post(post_no, post_name, post_mkid, post_mkdate, post_view, post_recommend, post_content)
VALUES(post_seq.nextval, '칼로리 소모 폭탄 걷기 운동', '회원2', sysdate, '0', '0', '사이드스텝[다리살/등살]');

INSERT INTO post(post_no, post_name, post_mkid, post_mkdate, post_view, post_recommend, post_content)
VALUES(post_seq.nextval, '30일 복근 프로젝트', '회원3', sysdate, '0', '0', '30일로 완성하는 복근');

-- 조회
(LIST)
SELECT post_no, post_name, post_mkid, post_mkdate, post_view, post_recommend, post_content
FROM post
ORDER BY post_no;

SELECT post_no, post_name, post_mkid, post_mkdate, post_view, post_recommend, post_content
FROM post
WHERE post_no = 1;

-- 수정
UPDATE post
SET post_name='하루 15분 복근 운동'
WHERE post_no = 1;

-- 삭제
DELETE FROM post
WHERE post_no = 1;

commit;
------------------------------------------------------------------

SQL <댓글>
/**********************************/
/* Table Name: 댓글 */
/**********************************/

DROP TABLE excomment;
DROP SEQUENCE excomment_seq;
------------------------------------------------------------------
CREATE TABLE excomment(
excomment_no INT NOT NULL PRIMARY KEY,
excomment_content VARCHAR(500) NOT NULL,
excomment_mkid VARCHAR(100) NOT NULL,
excomment_mkdate DATE NOT NULL,
post_no INT,
    FOREIGN KEY (post_no) REFERENCES post (post_no)
);

COMMENT ON TABLE excomment is '댓글';
COMMENt ON COLUMN excomment.excomment_no is '댓글 번호';
COMMENT ON COLUMN excomment.excomment_content is '댓글 내용';
COMMENT ON COLUMN excomment.excomment_mkid is '댓글 작성자ID';
COMMENT ON COLUMN excomment.excomment_mkdate is '작성 일시';

CREATE SEQUENCE excomment_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO excomment(excomment_no, excomment_content, excomment_mkid, excomment_mkdate)
VALUES(excomment_seq.nextval, '좋은 정보 감사합니다', '회원1', sysdate);

INSERT INTO excomment(excomment_no, excomment_content, excomment_mkid, excomment_mkdate)
VALUES(excomment_seq.nextval, '유용한 내용이네요', '회원2', sysdate);
            
INSERT INTO excomment(excomment_no, excomment_content, excomment_mkid, excomment_mkdate)
VALUES(excomment_seq.nextval, '집에서 따라하기 좋네요', '회원3', sysdate);
            
-- 조회          
(LIST)
SELECT excomment_no, excomment_content, excomment_mkid, excomment_mkdate
FROM excomment
ORDER BY excomment_no;

SELECT excomment_no, excomment_content, excomment_mkid, excomment_mkdate
FROM excomment
WHERE excomment_no = 1;

-- 수정
UPDATE excomment
SET excomment_content='좋은 정보 고맙습니다!'
WHERE excomment_no = 1;

-- 삭제
DELETE FROM excomment
WHERE excomment_no = 1;

commit;
------------------------------------------------------------------
SQL <첨부파일>
/**********************************/
/* Table Name: 첨부파일 */
/**********************************/

DROP TABLE exfile;
DROP SEQUENCE exfile_seq;
------------------------------------------------------------------
CREATE TABLE exfile(
exfile_no INT NOT NULL PRIMARY KEY,
exfile_name VARCHAR(100) NOT NULL,
exfile_routename VARCHAR(100) NOT NULL,
exfile_volume VARCHAR(100) NOT NULL,
post_no INT,
    FOREIGN KEY (post_no) REFERENCES post (post_no)
);

COMMENT ON TABLE exfile is '첨부파일';
COMMENt ON COLUMN exfile.exfile_no is '파일 번호';
COMMENT ON COLUMN exfile.exfile_name is '파일명';
COMMENT ON COLUMN exfile.exfile_routename is '경로명';
COMMENT ON COLUMN exfile.exfile_volume is '용량';

CREATE SEQUENCE exfile_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                        -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO exfile(exfile_no, exfile_name, exfile_routename, exfile_volume)
VALUES(exfile_seq.nextval, '실내자전거.png', 'C:\kd1', '512KB');

INSERT INTO exfile(exfile_no, exfile_name, exfile_routename, exfile_volume)
VALUES(exfile_seq.nextval, '런닝머신.png', 'C:\kd1\images', '389KB');
            
INSERT INTO exfile(exfile_no, exfile_name, exfile_routename, exfile_volume)
VALUES(exfile_seq.nextval, '단백질쉐이크.png', 'C:\kd1', '687KB');
            
-- 조회          
(LIST)
SELECT exfile_no, exfile_name, exfile_routename, exfile_volume
FROM exfile
ORDER BY exfile_no;

SELECT exfile_no, exfile_name, exfile_routename, exfile_volume
FROM exfile
WHERE exfile_no = 1;

-- 수정
UPDATE exfile
SET exfile_name='실내자전거2'
WHERE exfile_no = 1;

-- 삭제
DELETE FROM exfile
WHERE exfile_no = 1;

commit;