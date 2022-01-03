<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV>
    <nav class="p-3 mb-3 border-bottom">
       <div class="container">
         <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                <DIV style="font-size: 1.3em; font-weight: bold ;">
                    [운동쇼핑몰]Wehealth
                </DIV>
                <img src="/images/nike.png" class="bi me-2" width="50" height="40"></img>
            </a>
            <div class="flex-shrink-0 dropdown col-lg-offset-8">
              <a href="" class="d-block link-dark text-decoration-none dropdown-toggle" data-toggle="dropdown">
                <img src="/images/me.png" alt="mdo" width="32" height="32" class="rounded-circle">
              </a>
              <ul class="dropdown-menu text-small shadow" style="">
                <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/member/logout.do">로그 아웃</a></li>
              </ul>
            </div> 
        </div>
      </div>
    </nav>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
              <li><a href='/' class="nav-link px-2 text-secondary">Home</a></li>
              <li><a href='/categorygrp/list.do' class="nav-link px-2 text-white">카테고리</a></li>
              <li><a href='/category/list_all_join.do' class="nav-link px-2 text-white">카테고리 전체 목록</a></li>
              <li><a href="#" class="nav-link px-2 text-white">운동게시판</a></li>
              <li><a href="#" class="nav-link px-2 text-white">공지사항</a></li>
              <li><a href="#" class="nav-link px-2 text-white">Q&A</a></li>
            </ul>                         
          </div>
          <div class="col-lg-offset-3">
            <form class="text-start">
              <input type="search" class="form-control form-control-dark" placeholder="⌕검색..." aria-label="Search">
            </form>
          </div>
          <div class="right-box">
              <c:choose>
                <c:when test="${sessionScope.id != null}"> <%-- 로그인 한 경우 --%>
                   ${sessionScope.id } <button type="button" class="btn btn-outline-light me-2" onclick="location.href='/member/logout.do'">로그아웃</button>
                </c:when>
                <c:otherwise>
                  <button type="button" class="btn btn-outline-light me-2" onclick="location.href ='/member/login.do'">로그인</button>
                </c:otherwise>
              </c:choose>
              <button type="button" class="btn btn-warning">회원가입</button>
        </div>
        
       </div>
     </nav>
  </DIV>

  <%-- 내용 --%> 
  <DIV class='content'>