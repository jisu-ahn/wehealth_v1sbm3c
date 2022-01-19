<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
  ul li{
    list-style: none;  /* 블렛기호(마커) 삭제 */
  }
</style>

</head>
<div class="top_menu" style="text-align: right; padding-right: 1%; background-color: #E9ECEF; height: 30px;line-height: 30px;">
    <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.id } <A class='menu_link'  href='/member/logout.do' style="color: black;">Logout</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>
          <A class='menu_link'  href='/member/create.do'>회원가입</A><span class='top_menu_sep'> </span>
        </c:otherwise>
    </c:choose> 
    <c:choose>
        <c:when test="${sessionScope.id == null || sessionScope.grade >=11}"> 
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/member/list.do'>회원목록</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>
    <A class='menu_link'  href='/cart/list_by_memberno.do'>쇼핑카트</A><span class='top_menu_sep'> </span>
    <A class='menu_link'  href='/order_pay/list_by_memberno.do'>주문결제</A><span class='top_menu_sep'> </span>  
  </div>
<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top'>
    <DIV class='top_menu_label'><A href="/"><img src="/css/images/logo_2.png" /></A></DIV>
  </DIV>
  <HR>
  <DIV>
      <NAV id="top_sec">
          <ul>
            <li class='link_menu_top'><A href='/' >Home</A>
            </li>
            <li class='link_menu_top'><A class='link_menu_top'  href='/categorygrp/list.do'>카테고리 그룹</A>
                <ul>
                    <li><a href="../category/list_by_categorygrpno.do?categorygrp_no=5" class='link_menu_sub'>유산소 운동2</a><ul><li>아</li><li>아</li></ul></li>
                    <li><a href="javascript: alert('강원도');" class='link_menu_sub'>강원도</a></li>
                    <li><a href="javascript: alert('충청북도');" class='link_menu_sub'>충청북도</a></li>
                    <li><a href="javascript: alert('충청남도');" class='link_menu_sub'>충청남도</a></li>
                </ul>
            </li>
            <li><A class='link_menu_top'  href='/cart/list_by_memberno.do'>쇼핑카트</A>
            </li>
            <li><A class='link_menu_top'  href='/order_pay/list_by_memberno.do'>주문결제</A></li>
            <li><A class='link_menu_top'  href='/notice/list.do'>공지사항</A></li>
        </ul>     
      </NAV>
    </DIV>

 
  
  <%-- 내용 --%> 
  <DIV class='content'>