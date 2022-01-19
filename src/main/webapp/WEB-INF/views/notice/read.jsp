<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="noticeno" value="${noticeVO.noticeno }" />
<c:set var="title" value="${noticeVO.title }" />
<c:set var="name" value="${noticeVO.name }" />
<c:set var="content" value="${noticeVO.content }" />
<c:set var="reply" value="${noticeVO.reply }" />
<c:set var="word" value="${noticeVO.word }" />
<c:set var="rdate" value="${noticeVO.rdate.substring(0, 10) }" />
<c:set var="cnt" value="${noticeVO.cnt }" />
<c:set var="prevTit" value="${noticeVO.prevTit }" />
<c:set var="nextTit" value="${noticeVO.nextTit }" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Wehealth</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'><A href="../notice/list.do" class='title_link'>공지사항</A> > 조회</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_search_paging.do?cateno=${cateVO.cateno }&now_page=${param.now_page}&word=${param.word }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_cateno_grid.do?cateno=${cateVO.cateno }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page}">파일 수정</A>  
    <span class='menu_divide' >│</span>
    <A href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&cateno=${cateno}">삭제</A>  
  </ASIDE> 
  
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; height: 100px; margin-right: 10px; margin-bottom: 30px;">
          <div style="font-size: 1.5em; text-align: center; font-weight: bold;">${title }</div><br>
          <p style="font-size:1em; text-align: right;">작성자: ${name } <span class='menu_divide' >│</span> 등록일: ${rdate }</p>
          <hr style="height: 2px; background: #000000;">
        </DIV> 
        <DIV><br>${content }<br><hr style="height: 1.5px; background: #444444;"></DIV>
        <DIV>
<!--         이전글<span class='menu_divide' >│</span>
        <hr style="height: 0.5px; background: #444444;">
        다음글<span class='menu_divide' >│</span>
        <hr style="height: 0.5px; background: #444444;"> -->
        <div class="content_body_bottom" style="padding-right: 50%;">
            <button type="button" onclick="location.href='./list.do'">목록</button>
        </div>
      </li> 
    </ul>
  </fieldset>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
