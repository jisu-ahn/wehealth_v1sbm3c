package dev.mvc.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// cartno                        NUMBER(10) NOT NULL PRIMARY KEY,
// itemsno                 NUMBER(10) NULL ,
// memberno                 NUMBER(10) NOT NULL,
// cnt                            NUMBER(10) DEFAULT 0 NOT NULL,
// rdate                          DATE NOT NULL,
// FOREIGN KEY (itemsno) REFERENCES items (itemsno),
// FOREIGN KEY (memberno) REFERENCES member (memberno)

// SELECT t.cartno, c.itemsno, c.item_name, c.thumb1, c.item_price, c.discount, c.total_price, c.item_point, t.memberno, t.cnt, t.rdate 

@Getter @Setter @ToString
public class CartVO {
    /** 쇼핑 카트 번호 */
    private int cartno;
    /** 아이템 번호 */
    private int itemsno;
    /** 상품명 */
    private String item_name = "";
    /** 메인 이미지 Preview */
    private String thumb1="";
    /** 정가 */
    private int item_price;
    /** 할인율 */
    private int discount;
    /** 판매가 */
    private int total_price;
    /** 포인트 */
    private int item_point;
    /** 회원 번호 */
    private int memberno;
    /** 수량 */
    private int cnt;
    /** 날짜 */
    private String rdate;
    /** 금액 = 판매가 x 수량 */
    private int tot;
    
    
}

