DROP TABLE reply;

CREATE TABLE review(
    rno   NUMBER(10) NOT NULL,
    id    VARCHAR(50) NOT NULL,
    udate VARCHAR(100) NOT NULL,
    con  VARCHAR(100) NOT NULL,
    mno NUMBER(10) NOT NULL,
    PRIMARY KEY (rno)
);

DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999
CACHE 2
NOCYCLE;

INSERT INTO review(rno, id, udate, con, mno)
VALUES(review_seq.nextval, '회원1', sysdate, '좋아요', 1);

INSERT INTO review(rno, id, udate, con, mno)
VALUES(review_seq.nextval, '회원2', sysdate, '보통', 1);

INSERT INTO review(rno, id, udate, con, mno)
VALUES(review_seq.nextval, '회원3', sysdate, '별로', 2);

UPDATE review 
SET con = '최고'
WHERE id = '회원1';

SELECT * FROM review 
WHERE id = 'aaa';

DELETE FROM review WHERE id = '회원2';

COMMIT;