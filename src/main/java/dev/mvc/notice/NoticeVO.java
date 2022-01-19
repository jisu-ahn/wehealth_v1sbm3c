package dev.mvc.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*        
        noticeno NUMBER(10) NOT NULL PRIMARY KEY,
        seqno NUMBER(7) NOT NULL,
        id           VARCHAR2(20)     NOT NULL,
        name      VARCHAR2(30)    NOT NULL,
        title VARCHAR(100) NOT NULL,
        content VARCHAR2(4000) NOT NULL,
        cnt NUMBER(10) DEFAULT 0 NOT NULL,
        reply NUMBER(10) DEFAULT 0 NOT NULL,
        password VARCHAR(20) NOT NULL,
        word VARCHAR(300) NULL,
        rdate DATE NOT NULL,
        FOREIGN KEY (id) REFERENCES member (id)
*/

public class NoticeVO {
    /** 공지사항 번호 */
    private int noticeno;
    /** 출력순서 */
    private int seqno;
    /** 관리자 아이디 */
    private String id;
    /** 글쓴이 */
    private String name;
    /** 제목 */
    private String title="";
    /** 내용 */
    private String content="";
    /** 클릭수 */
    private int cnt=0;
    /** 댓글수 */
    private int reply=0;
    /** 패스워드 */
    private String password="";
    /** 검색어 */
    private String word="";
    /** 날짜 */
    private String rdate;
    /** 이전글의 글번호를 담을 필드 */
    private int prevNum;
    /** 다음글의 글번호를 담을 필드 */
    private int nextNum; 
    /** 이전글의 글제목를 담을 필드 */
    private String prevTit;
    /** 다음글의 글제목를 담을 필드 */
    private String nextTit; 
    
    public NoticeVO() {
        
    }

    public int getNoticeno() {
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public int getSeqno() {
        return seqno;
    }

    public void setSeqno(int seqno) {
        this.seqno = seqno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getReply() {
        return reply;
    }

    public void setReply(int reply) {
        this.reply = reply;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public int getPrevNum() {
        return prevNum;
    }

    public void setPrevNum(int prevNum) {
        this.prevNum = prevNum;
    }

    public int getNextNum() {
        return nextNum;
    }

    public void setNextNum(int nextNum) {
        this.nextNum = nextNum;
    }

    public String getPrevTit() {
        return prevTit;
    }

    public void setPrevTit(String prevTit) {
        this.prevTit = prevTit;
    }

    public String getNextTit() {
        return nextTit;
    }

    public void setNextTit(String nextTit) {
        this.nextTit = nextTit;
    }

    @Override
    public String toString() {
        return "NoticeVO [noticeno=" + noticeno + ", seqno=" + seqno + ", id=" + id + ", name=" + name + ", title="
                + title + ", content=" + content + ", cnt=" + cnt + ", reply=" + reply + ", password=" + password
                + ", word=" + word + ", rdate=" + rdate + ", prevNum=" + prevNum + ", nextNum=" + nextNum + ", prevTit="
                + prevTit + ", nextTit=" + nextTit + "]";
    }


}
