package dev.mvc.items;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.category.CategoryProcInter;
import dev.mvc.category.CategoryVO;
import dev.mvc.categorygrp.CategorygrpProcInter;
import dev.mvc.categorygrp.CategorygrpVO;
//import dev.mvc.member.MemberProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ItemsCont {
    @Autowired
    @Qualifier("dev.mvc.categorygrp.CategorygrpProc")
    private CategorygrpProcInter categorygrpProc;

    @Autowired
    @Qualifier("dev.mvc.category.CategoryProc")
    private CategoryProcInter categoryProc;

    @Autowired
    @Qualifier("dev.mvc.items.ItemsProc")
    private ItemsProcInter itemsProc;
    
    /** 업로드 파일 절대 경로 */
    private String uploadDir = Items.getUploadDir();

    public ItemsCont() {
        System.out.println("-> ItemsCont created.");
    }

    /**
     * 새로고침 방지
     * 
     * @return
     */
    @RequestMapping(value = "/items/msg.do", method = RequestMethod.GET)
    public ModelAndView msg(String url) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName(url); // forward

        return mav; // forward
    }

    /**
     * 등록폼 사전 준비된 레코드: 관리자 1번, category_no 1번, categrpgory_no 1번을 사용하는 경우 테스트 URL
     * http://localhost:9091/items/create.do?category_no=1
     * 
     * @return
     */
    @RequestMapping(value = "/items/create.do", method = RequestMethod.GET)
    public ModelAndView create(int category_no) {
        ModelAndView mav = new ModelAndView();

        CategoryVO categoryVO = this.categoryProc.read(category_no);
        CategorygrpVO categorygrpVO = this.categorygrpProc.read(categoryVO.getCategorygrp_no());

        mav.addObject("categoryVO", categoryVO);
        mav.addObject("categorygrpVO", categorygrpVO);

        mav.setViewName("/items/create"); // /webapp/WEB-INF/views/items/create.jsp
        // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
        // mav.addObject("content", content);

        return mav; // forward
    }

    /**
     * 등록 처리 http://localhost:9091/items/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/items/create.do", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, ItemsVO itemsVO) {
        ModelAndView mav = new ModelAndView();

        // ------------------------------------------------------------------------------
        // 파일 전송 코드 시작
        // ------------------------------------------------------------------------------
        String file1 = ""; // 원본 파일명 image
        String file1saved = ""; // 저장된 파일명, image
        String thumb1 = ""; // preview image
        String uploadDir = this.uploadDir; // 파일 업로드 경로
        
        // 전송 파일이 없어도 file1MF 객체가 생성됨.
        // <input type='file' class="form-control" name='file1MF' id='file1MF'
        // value='' placeholder="파일 선택">
        MultipartFile mf = itemsVO.getFile1MF();

        file1 = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
        // System.out.println("-> file1: " + file1);

        long size1 = mf.getSize(); // 파일 크기

        if (size1 > 0) { // 파일 크기 체크
            // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
            file1saved = Upload.saveFileSpring(mf, uploadDir);

            if (Tool.isImage(file1saved)) { // 이미지인지 검사
                // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
                thumb1 = Tool.preview(uploadDir, file1saved, 200, 150);
            }

        }

        itemsVO.setFile1(file1);
        itemsVO.setFile1saved(file1saved);
        itemsVO.setThumb1(thumb1);
        itemsVO.setSize1(size1);
        // ------------------------------------------------------------------------------
        // 파일 전송 코드 종료
        // ------------------------------------------------------------------------------

        // Call By Reference: 메모리 공유, Hashcode 전달
        int cnt = this.itemsProc.create(itemsVO);

        // ------------------------------------------------------------------------------
        // 연속 입력을위한 PK의 return
        // ------------------------------------------------------------------------------
        System.out.println("-> itemsno: " + itemsVO.getItemsno());
        mav.addObject("itemsno", itemsVO.getItemsno()); // redirect parameter 적용
        // ------------------------------------------------------------------------------

        if (cnt == 1) {
            mav.addObject("code", "create_success");
            // categoryProc.increaseCnt(itemsVO.getCategory_no()); // 글수 증가
        } else {
            mav.addObject("code", "create_fail");
        }
        mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

        // System.out.println("--> category_no: " + itemsVO.getCategory_no());
        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
        mav.addObject("category_no", itemsVO.getCategory_no()); // redirect parameter 적용
        // mav.addObject("url", "/items/msg"); // msg.jsp, redirect parameter 적용

        // 추가적인 상품 정보 입력 유도
        mav.addObject("url", "/items/msg"); // msg.jsp, redirect parameter 적용

        mav.setViewName("redirect:/items/msg.do");

        return mav; // forward
    }

}



