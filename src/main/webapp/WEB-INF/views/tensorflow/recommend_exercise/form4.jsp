<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관심분야 등록</title>
    <link href="/css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
                 src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

    <script type="text/javascript">
        $(function() {
            $('#img1').on('click', function() { $('#step1').prop('checked', true) });  // 첫번째 이미지를 클릭하면 첫번째 라디오 체크됨.
            $('#img2').on('click', function() { $('#step2').prop('checked', true) });
            $('#img3').on('click', function() { $('#step3').prop('checked', true) });
            $('#img4').on('click', function() { $('#step4').prop('checked', true) });
            $('#img5').on('click', function() { $('#step5').prop('checked', true) });

            $('#btn_previous').on('click', function() { history.back(); });   // 이전
            $('#btn_next').on('click', function() {   // 다음
                // alert($('#step1').prop('checked'));
                if ($('#step1').prop('checked') == true | $('#step2').prop('checked') == true | $('#step3').prop('checked') == true| $('#step4').prop('checked') == true| $('#step5').prop('checked') == true) {
                    // alert('submit 진행');
                    frm.submit();
                } else {
                    alert('관심 분야의 이미지를 선택해주세요.');
                }
            });
            $('#btn_close').on('click', function() { window.close(); });      // 윈도우 닫기
        });
    </script>
    <style>
        *{
            text-align: center;
        }
        .td_image{
            vertical-align: middle;
            padding: 5px;
            cursor: pointer;
        }

        .td_radio{
            vertical-align: middle;
            padding: 5px;
        }
        .td_radio_select {
            cursor: pointer;
        }
    </style>

</head>
<body>
<DIV class="container">
    <H1>4/5 단계입니다. 거의 다 왔습니다.</H1>
    <DIV id='panel' style='display: none; margin: 10px auto; width: 90%;'></DIV>
    <form id='frm' name='frm' action='/tensorflow/recommend_exercise/form5.do' method='GET'>
        <input type='hidden' name='step1' value='${param.step1 }'>
        <input type='hidden' name='step2' value='${param.step2 }'>
        <input type='hidden' name='step3' value='${param.step3 }'>
        <br>
        <TABLE style='margin: 0px auto;'>
            <TR>
                <TD class='td_image'>
                    <img id='img1' src="/recommend_exercise/images/v14.jpg" style='float:left; height: 200px'>
                </TD>
                <TD class='td_image'>
                    <img id='img2' src="/recommend_exercise/images/v24.jpg" style='float:left; height: 200px'>
                </TD>
                <TD class='td_image'>
                    <img id='img3' src="/recommend_exercise/images/v34.jpg" style='float:left; height: 200px'>
                </TD>
                <TD class='td_image'>
                    <img id='img4' src="/recommend_exercise/images/v44.jpg" style='float:left; height: 200px'>
                </TD>
                <TD class='td_image'>
                    <img id='img5' src="/recommend_exercise/images/v54.jpg" style='float:left; height: 200px'>
                </TD>
            </TR>
            <TR>
                <TD class='td_radio'>
                    <input type='radio' name='step4' id='step1' value='1' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='step4' id='step2' value='2' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='step4' id='step3' value='3' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='step4' id='step4' value='4' class='td_radio_select'>
                </TD>
                <TD class='td_radio'>
                    <input type='radio' name='step4' id='step5' value='5' class='td_radio_select'>
                </TD>
            </TR>
        </TABLE>
        <br>
        <DIV style="text-align:center;">
            <button type='button' id='btn_previous' class="btn btn-primary">이전</button>
            <button type='button' id='btn_next' class="btn btn-primary">다음</button>
            <button type='button' id='btn_close' class="btn btn-primary">취소</button>
        </DIV>
    </form>
</DIV>
</body>
</html>
