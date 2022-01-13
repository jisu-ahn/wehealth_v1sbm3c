<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>맞춤형 운동 추천 서비스</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script type="text/javascript">
      $(function() { // 자동 실행
        $('#btn_forward').on('click', function() { location.href='/tensorflow/recommend_exercise/form1.do';});
        $('#btn_close').on('click', function() { window.close(); });     // 윈도우 닫기
      });
    </script>
</head>
<body>
<DIV class="container">
    <H1 style="text-align: center; font-size:30px;">관심분야 등록</H1>

    <DIV style="text-align:center; margin: 50px auto;">
        나에게 맞는 운동은 무엇일까?<br><br>
        몇 번의 클릭만으로 받아보는 맞춤형 운동 추천 서비스!
    </DIV>

    <DIV style="text-align:center; margin: 50px auto;">
        <button type='button' id='btn_forward'>관심분야 등록하기</button>
        <button type='button' id='btn_close'>취소</button>
    </DIV>

</DIV>
</body>
</html>