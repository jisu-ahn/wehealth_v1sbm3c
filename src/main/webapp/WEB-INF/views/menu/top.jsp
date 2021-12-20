<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>[운동쇼핑몰]Wehealth</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >wehealth</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/categorygrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all.do'>카테고리 전체 목록</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all_join.do'>카테고리 전체 목록 Join</A><span class='top_menu_sep'> </span>                
            
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>