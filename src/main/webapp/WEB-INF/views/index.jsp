<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Wehealth</title>
<!-- /static 기준 -->
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript">
    window.onload = function() {

    }

    function recommend_exercise(){
      var url = '/tensorflow/recommend_exercise/start.do';
      var win = window.open(url, 'AI 서비스', 'width=1600px, height=560px');

      var x = (screen.width - 1600) / 2;
      var y = (screen.height - 560) / 2;

      win.moveTo(x, y); // 화면 중앙으로 이동
    }
</script>
    
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
  
  <DIV style='width: 100%; margin: 30px auto; text-align: center;'>
    <%-- /static/images/resort01.jpg --%>
    <IMG src='/images/wehealth.jpg' style='width: 50%;'>
  </DIV>
  
  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="./menu/bottom.jsp" flush='false' />

<DIV style='width: 100%; margin: 30px auto; text-align: center;'>
<UL style="margin-left: 50px;">
      <OL style="center;">
          <!-- 추천 시스템 프로젝트 -->
          <A href="javascript: recommend_exercise()">🦾맞춤형 운동 추천 시스템🦾</A>
      </OL>
</UL>
<H2 style="text-align: center; font-size:17px;">Tensorflow 2 model + Python + Django + Ajax + JSon 요청 처리</H2>

</DIV>
 
</body>
</html>