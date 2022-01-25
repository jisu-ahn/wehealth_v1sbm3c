<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top'>
    <DIV class='top_menu_label'><A href="/"><img src="/css/images/logo_2.png" /></A></DIV>
        <%-- <div class="flex-shrink-0 dropdown col-lg-offset-8">
              <a href="" class="d-block link-dark text-decoration-none dropdown-toggle" data-toggle="dropdown">
                <img src="/images/me.png" alt="mdo" width="32" height="32" class="rounded-circle"><span style="color: #525252;"> ▼</span>
              </a>
              <ul class="dropdown-menu text-small shadow" style="">
                <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/member/logout.do">로그 아웃</a></li>
              </ul>
        </div>  --%>
  </DIV>
  <HR>
  <DIV class='top_sec'>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='/' >Home</A><span class='top_menu_sep'> </span>
      
      <c:choose>
        <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
           ${sessionScope.id } <A class='menu_link'  href='/member/logout.do' >Logout</A><span class='top_menu_sep'> </span>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/member/login.do' >Login</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>    
      
      <A class='menu_link'  href='/categorygrp/list.do'>카테고리 그룹</A><span class='top_menu_sep'> </span>
      <%-- <A class='menu_link'  href='/category/list_all.do'>카테고리 전체 목록</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/category/list_all_join.do'>카테고리 전체 목록 Join</A><span class='top_menu_sep'> </span> --%>              
      <A class='menu_link'  href='/cart/list_by_memberno.do'>쇼핑카트</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/order_pay/list_by_memberno.do'>주문결제</A><span class='top_menu_sep'> </span> 
      <A class='menu_link'  href='/member/create.do'>회원가입</A><span class='top_menu_sep'> </span>
      <c:choose>
        <c:when test="${sessionScope.id == null || sessionScope.grade >=11}"> <%-- 로그인 한 경우 --%>
        </c:when>
        <c:otherwise>
          <A class='menu_link'  href='/member/list.do'>회원목록</A><span class='top_menu_sep'> </span>
        </c:otherwise>
      </c:choose>
      <A class='menu_link'  href='/notice/list.do'>공지사항</A><span class='top_menu_sep'> </span>    
<%--        <div class="col-lg-offset-3">
            <form class="text-start">
              <input type="search" class="form-control form-control-dark" placeholder="⌕검색..." aria-label="Search">
            </form>
              <c:choose>
                <c:when test="${sessionScope.id != null}"> 로그인 한 경우
                   ${sessionScope.id } <button type="button" class="btn btn-outline-light me-2" onclick="location.href='/member/logout.do'">로그아웃</button>
                </c:when>
                <c:otherwise>
                  <button type="button" class="btn btn-outline-light me-2" onclick="location.href ='/member/login.do'">로그인</button>
                </c:otherwise>
              </c:choose>
              <button type="button" class="btn btn-warning">회원가입</button>
        </div> --%>
    </NAV>
 </DIV>

  
  <%-- 내용 --%> 
  <DIV class='content'>