<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label'>[운동쇼핑몰]Wehealth</DIV>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >wehealth</A><span class='top_menu_sep'> </span>
      
            <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.id } <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    
      
      <A class='menu_link'  href='/categorygrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all.do'>카테고리 전체 목록</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all_join.do'>카테고리 전체 목록 Join</A><span class='top_menu_sep'> </span>              
      <A class='menu_link'  href='/cart/list_by_memberno.do'>쇼핑카트</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/order_pay/list_by_memberno.do'>주문결제</A><span class='top_menu_sep'> </span> 
      <A class='menu_link'  href='/member/create.do'>회원가입</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/member/list.do'>회원목록</A><span class='top_menu_sep'> </span>    
       
    </NAV>
  </DIV>
  
  <%-- 내용 --%> 
  <DIV class='content'>
  
  
  
  
  
  
  
      
      <A class='menu_link'  href='/categorygrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all.do'>카테고리 전체 목록</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all_join.do'>카테고리 전체 목록 Join</A><span class='top_menu_sep'> </span>                
            