package dev.mvc.categorygrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategorygrpCont {
    @Autowired
    @Qualifier("dev.mvc.categorygrp.CategorygrpProc")
    private CategorygrpProcInter categorygrpProc;

    public CategorygrpCont() {
        System.out.println("-> CategorygrpCont created.");
    }
    
 // http://localhost:9091/categorygrp/create.do
    /**
     * 등록 폼
     * 
     * @return
     */
    @RequestMapping(value = "/categorygrp/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/categorygrp/create"); // webapp/WEB-INF/views/categorygrp/create.jsp

        return mav; // forward
    }

    // http://localhost:9091/categorygrp/create.do
    /**
     * 등록 처리
     * 
     * @param categorygrpVO
     * @return
     */
    @RequestMapping(value = "/categorygrp/create.do", method = RequestMethod.POST)
    public ModelAndView create(CategorygrpVO categorygrpVO) { // categorygrpVO 자동 생성, Form -> VO
        // CategorygrpVO categorygrpVO <FORM> 태그의 값으로 자동 생성됨.
        // request.setAttribute("categorygrpVO", categorygrpVO); 자동 실행
//        System.out.println("->"+categorygrpVO.getCategorygrp_name());
        ModelAndView mav = new ModelAndView();
        
        int cnt = this.categorygrpProc.create(categorygrpVO); // 등록 처리
        // cnt = 0; // error test
                
        mav.addObject("cnt", cnt);
        
               
        if (cnt == 1) {
            // System.out.println("등록 성공");
            
            // mav.addObject("code", "create_success"); // request에 저장, request.setAttribute("code", "create_success")
            // mav.setViewName("/categorygrp/msg"); // /WEB-INF/views/categorygrp/msg.jsp
            
            // response.sendRedirect("/categorygrp/list.do");
            mav.setViewName("redirect:/categorygrp/list.do");
        } else {
            mav.addObject("code", "create_fail"); // request에 저장, request.setAttribute("code", "create_fail")
            mav.setViewName("/categorygrp/msg"); // /WEB-INF/views/categorygrp/msg.jsp
        }

        return mav; // forward
    }
    
    // http://localhost:9091/categorygrp/list.do
    /**
     * 목록
     * @return
     */
    @RequestMapping(value="/categorygrp/list.do", method=RequestMethod.GET )
    public ModelAndView list() {
      ModelAndView mav = new ModelAndView();

      // 등록 순서별 출력    
      // List<CategorygrpVO> list = this.categorygrpProc.list_seqno_asc();

      // 출력 순서별 출력
      List<CategorygrpVO> list = this.categorygrpProc.list_seqno_asc();

      mav.addObject("list", list); // request.setAttribute("list", list);

      mav.setViewName("/categorygrp/list"); // /webapp/WEB-INF/views/categorygrp/list.jsp
      return mav;
    }


    // http://localhost:9091/categorygrp/read_update.do?categorygrpno=1
    /**
     * 조회 + 수정폼
     * @param categorygrp_no 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categorygrp/read_update.do", method=RequestMethod.GET )
    public ModelAndView read_update(int categorygrp_no) {
      // request.setAttribute("categorygrp_no", int categorygrp_no) 작동 안됨.
      
      ModelAndView mav = new ModelAndView();
      
      CategorygrpVO categorygrpVO = this.categorygrpProc.read(categorygrp_no);
      mav.addObject("categorygrpVO", categorygrpVO);  // request 객체에 저장
      
      List<CategorygrpVO> list = this.categorygrpProc.list_categorygrpno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/categorygrp/read_update"); // /WEB-INF/views/categorygrp/read_update.jsp 
      return mav; // forward
    }
    
    // http://localhost:9091/categorygrp/update.do
    /**
     * 수정 처리
     * @param categorygrpVO
     * @return
     */
    @RequestMapping(value="/categorygrp/update.do", method=RequestMethod.POST )
    public ModelAndView update(CategorygrpVO categorygrpVO) {
      // CategorygrpVO categorygrpVO <FORM> 태그의 값으로 자동 생성됨.
      // request.setAttribute("categorygrpVO", categorygrpVO); 자동 실행
//      System.out.println("->"+categorygrpVO.getPrint_mode());        
        
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.categorygrpProc.update(categorygrpVO);
      mav.addObject("cnt", cnt); // request에 저장
      
      // cnt = 0; // error test
      if (cnt == 1) {
          /// System.out.println("수정 성공");
          // response.sendRedirect("/categorygrp/list.do");
          mav.setViewName("redirect:/categorygrp/list.do");
      } else {
          mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")
          mav.setViewName("/categorygrp/msg"); // /WEB-INF/views/categorygrp/msg.jsp
      }
      
      return mav;
    }
    
    // http://localhost:9091/categorygrp/read_delete.do
    /**
     * 조회 + 삭제폼
     * @param categorygrpno 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categorygrp/read_delete.do", method=RequestMethod.GET )
    public ModelAndView read_delete(int categorygrp_no) {
      ModelAndView mav = new ModelAndView();
      
      CategorygrpVO categorygrpVO = this.categorygrpProc.read(categorygrp_no); // 삭제할 자료 읽기
      mav.addObject("categorygrpVO", categorygrpVO);  // request 객체에 저장
      
      List<CategorygrpVO> list = this.categorygrpProc.list_seqno_asc();
      mav.addObject("list", list);  // request 객체에 저장

      mav.setViewName("/categorygrp/read_delete"); // read_delete.jsp
      return mav;
    }
    
   // http://localhost:9091/categorygrp/delete.do
    /**
     * 삭제
     * @param categorygrp_no 조회할 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categorygrp/delete.do", method=RequestMethod.POST )
    public ModelAndView delete(int categorygrp_no) {
      ModelAndView mav = new ModelAndView();
      
      CategorygrpVO categorygrpVO = this.categorygrpProc.read(categorygrp_no); // 삭제 정보
      mav.addObject("categorygrpVO", categorygrpVO);  // request 객체에 저장
      
      int cnt = this.categorygrpProc.delete(categorygrp_no); // 삭제 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장
      
      mav.setViewName("/categorygrp/delete_msg"); // delete_msg.jsp

      return mav;
    }
    
    // http://localhost:9091/categorygrp/update_seqno_up.do?categorygrp_no=1
    // http://localhost:9091/categorygrp/update_seqno_up.do?categorygrp_no=1000
    /**
     * 우선순위 상향 up 10 ▷ 1
     * @param categorygrp_no 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categorygrp/update_seqno_up.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_up(int categorygrp_no) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.categorygrpProc.update_seqno_up(categorygrp_no);  // 우선 순위 상향 처리
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/categorygrp/list.do"); 
      return mav;
    }  
    
    // http://localhost:9091/categorygrp/update_seqno_down.do?categorygrp_no=1
    // http://localhost:9091/categorygrp/update_seqno_down.do?categorygrp_no=1000
    /**
     * 우선순위 하향 up 1 ▷ 10
     * @param categorygrp_no 카테고리 번호
     * @return
     */
    @RequestMapping(value="/categorygrp/update_seqno_down.do", 
                                method=RequestMethod.GET )
    public ModelAndView update_seqno_down(int categorygrp_no) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.categorygrpProc.update_seqno_down(categorygrp_no);
      mav.addObject("cnt", cnt);  // request 객체에 저장

      mav.setViewName("redirect:/categorygrp/list.do");

      return mav;
    }  
    
    /**
     * 출력 모드의 변경
     * @param categorygrpVO
     * @return
     */
    @RequestMapping(value="/categorygrp/update_visible.do", 
        method=RequestMethod.GET )
    public ModelAndView update_visible(CategorygrpVO categorygrpVO) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.categorygrpProc.update_visible(categorygrpVO);
      
      mav.setViewName("redirect:/categorygrp/list.do"); // request 객체 전달 안됨. 
      
      return mav;
    }  

    

}
