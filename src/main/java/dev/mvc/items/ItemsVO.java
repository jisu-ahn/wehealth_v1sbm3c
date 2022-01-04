package dev.mvc.items;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
        itemsno                            NUMBER(10)         NOT NULL         PRIMARY KEY,
        adminno                              NUMBER(10)     NOT NULL ,
        category_no                                NUMBER(10)         NOT NULL ,
        item_name                                 VARCHAR2(300)         NOT NULL,
        content                               CLOB                  NOT NULL,
        recom_cnt                                 NUMBER(7)         DEFAULT 0         NOT NULL,
        view_cnt                                   NUMBER(7)         DEFAULT 0         NOT NULL,
        comment_cnt                              NUMBER(7)         DEFAULT 0         NOT NULL,
        password                                VARCHAR2(15)         NOT NULL,
        search_word                                  VARCHAR2(300)         NULL ,
        cdate                                 DATE               NOT NULL,
        file1                                   VARCHAR(100)          NULL,
        file1saved                            VARCHAR(100)          NULL,
        thumb1                              VARCHAR(100)          NULL,
        size1                                 NUMBER(10)      DEFAULT 0 NULL,  
        item_price                                 NUMBER(10)      DEFAULT 0 NULL,  
        discount                                    NUMBER(10)      DEFAULT 0 NULL,  
        total_price                            NUMBER(10)      DEFAULT 0 NULL,  
        item_point                                 NUMBER(10)      DEFAULT 0 NULL,  
        item_cnt                               NUMBER(10)      DEFAULT 0 NULL,  
 */

@Getter @Setter @ToString
public class ItemsVO {
  /** 컨텐츠 번호 */
  private int itemsno;
  /** 관리자 번호 */
  private int adminno;
  /** 카테고리 번호*/
  private int category_no;
  /** 제목 */
  private String item_name = "";
  /** 내용 */
  private String content = "";
  /** 추천수 */
  private int recom_cnt;
  /** 조회수 */
  private int view_cnt = 0;
  /** 댓글수 */
  private int comment_cnt = 0;
  /** 패스워드 */
  private String password = "";
  /** 검색어 */
  private String search_word = "";
  /** 등록 날짜 */
  private String cdate = "";
  
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";  
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;

  /** 정가 */
  private int item_price;
  /** 할인률 */
  private int discount;
  /** 판매가 */
  private int total_price;
  /** 포인트 */
  private int item_point;
  /** 재고 수량 */
  private int item_cnt;
  
  /** 
  이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
                   value='' placeholder="파일 선택">
  */
  private MultipartFile file1MF;

  /**
   * 파일 크기 단위 출력
   */
  private String size1_label;
}






