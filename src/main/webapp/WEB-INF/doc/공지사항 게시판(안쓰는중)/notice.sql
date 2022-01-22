SQL <공지사항게시판>
/**********************************/
/* Table Name: 공지사항 게시판 */
/**********************************/

DROP TABLE notice;
DROP SEQUENCE notice_seq;

CREATE TABLE notice(
    NOTICENO	    NUMBER(10) PRIMARY KEY,
    ID	                VARCHAR2(20) NOT NULL,
    NAME	        VARCHAR2(30) NOT NULL,
    TITLE	            VARCHAR2(100) NOT NULL,
    CONTENT	    VARCHAR2(4000) NOT NULL,
    CNT	            NUMBER(10) DEFAULT 0,
    REPLY           	NUMBER(10) DEFAULT 0,
    PASSWORD	VARCHAR2(20) NOT NULL,
    WORD	        VARCHAR2(300),
    RDATE	        DATE NOT NULL,
    FOREIGN KEY (id) REFERENCES member (id)
);

COMMENT ON TABLE notice is '공지사항 게시판';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.id is '관리자 아이디';
COMMENT ON COLUMN notice.name is '글쓴이';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.cnt is '클릭수';
COMMENT ON COLUMN notice.reply is '댓글수';
COMMENT ON COLUMN notice.password is '패스워드';
COMMENT ON COLUMN notice.word is '검색어';
COMMENT ON COLUMN notice.rdate is '날짜';


CREATE SEQUENCE notice_seq
  START WITH 1                -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 9999999999    -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                      -- 다시 1부터 생성되는 것을 방지

-- 등록
INSERT INTO notice(noticeno, id, name, title, content, cnt, reply, password, word, rdate)
VALUES(notice_seq.nextval,  'qnaadmin', '김관리', '공지사항1', '공지사항이 있습니다.', 0, 0, '1234', '', sysdate);
    

-- 조회
SELECT noticeno, name, title, content, cnt, reply, word, rdate
FROM notice
WHERE noticeno = 1;

-- 삭제
DELETE FROM notice WHERE noticeno = 7;

-- 수정
UPDATE notice
SET name='나관리', 
     title = '???', content= '???', word=''
WHERE noticeno = 9;

commit;
------------------------------------------------------------------