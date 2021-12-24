<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Wehealth</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../categorygrp/list.do" class='title_link'>카테고리 그룹</A> > 전체 카테고리</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">카테고리<br> 그룹 번호</TH>
      <TH class="th_bs">카테고리<br> 그룹 이름</TH>
      <TH class="th_bs">카테고리<br> 번호</TH>
      <TH class="th_bs">카테고리 이름</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련<br> 자료수</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="categorygrp_CategoryVO" items="${list}">
      <c:set var="r_categorygrp_no" value="${categorygrp_CategoryVO.r_categorygrp_no }" />
      <c:set var="r_categorygrp_name" value="${categorygrp_CategoryVO.r_categorygrp_name }" />
      <c:set var="category_no" value="${categorygrp_CategoryVO.category_no }" />
      <c:set var="category_name" value="${categorygrp_CategoryVO.category_name }" />
      <c:set var="cdate" value="${categorygrp_CategoryVO.cdate.substring(0, 10) }" />
      <c:set var="product_cnt" value="${categorygrp_CategoryVO.product_cnt }" />
      
      <TR>
        <TD class="td_bs">${r_categorygrp_no }</TD>
        <TD class="td_bs">${r_categorygrp_name }</TD>
        <TD class="td_bs">${category_no }</TD>
        <TD class="td_bs_left">${category_name }</TD>
        <TD class="td_bs">${cdate }</TD>
        <TD class="td_bs">${product_cnt }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?category_no=${category_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?category_no=${category_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>