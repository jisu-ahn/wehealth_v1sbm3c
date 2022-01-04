package dev.mvc.items;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ItemsDAOInter {
    /**
     * 등록
     * 
     * @param itemsVO
     * @return
     */
    public int create(ItemsVO itemsVO);

    /**
     * 조회
     * @param itemsno
     * @return
     */
    public ItemsVO read(int itemsno);
    
    /**
     * 상품 정보 수정 처리
     * 
     * @param itemsVO
     * @return
     */
    public int product_update(ItemsVO itemsVO);
    
    /**
     * 특정 카테고리의 등록된 글목록
     * @return
     */
    public List<ItemsVO> list_by_category_no(int category_no);
    
    /**
     * 카테고리별 검색 목록
     * @param hashMap
     * @return
     */
    public List<ItemsVO> list_by_categoryno_search(HashMap<String, Object> hashMap);

    /**
     * 검색 + 페이징 목록
     * @param map
     * @return
     */
    public List<ItemsVO> list_by_categoryno_search_paging(HashMap<String, Object> map);
    
    /**
     * 카테고리별 검색 레코드 갯수
     * @param hashMap
     * @return
     */
    public int search_count(HashMap<String, Object> hashMap);
    
    
    /**
     * 텍스트 정보 수정
     * @param itemsVO
     * @return
     */
    public int update_text(ItemsVO itemsVO);
    
    /**
     * 패스워드 체크
     * @param map
     * @return
     */
    public int password_check(HashMap<String, Object> map);
    
    /**
     * 파일 정보 수정
     * @param itemsVO
     * @return
     */
    public int update_file(ItemsVO itemsVO);
    
    /**
     * 삭제
     * @param itemsno
     * @return
     */
    public int delete(int itemsno);
    
    /**
     * 추천수 증가
     * @param itemsno
     * @return
     */
    public int update_recom(int itemsno);
    
    /**
     * 다수의 categoryno를 전달하여 관련 items 레코드 개수 산출
     * @param categorynos
     * @return
     */
    public int count_by_all_category_no(Map<String, Object> category_nos);
}





