<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
    <link rel="icon" href="resources/image/favicon_black.ico">
    <style type="text/css">
        @-ms-viewport {
            width: device-width
        }

        @-o-viewport {
            width: device-width
        }

        @viewport {
            width: device-width
        }
    </style>

    <title>LE TROIS</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/fullpage.css "/>
    <link href="https://fonts.googleapis.com/css?family=Gugi|Song+Myung&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
<%@ include file="include/sidebar.jsp" %>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/fullpage.js"></script>
<script type="text/javascript" src="/resources/js/home.js"></script>
<script type="text/javascript" src="/resources/js/thirth_page.js"></script>

<a href="/"><P class="logo">LE TROIS</P></a>
<div id="fullpage">

    <div class="section tag">
        <div class="explain">
            <h2>사흗 날, 인연</h2>
            <p class="explain_p">&ensp;사흗 날 시작된 소중한 인연</p>
        </div>
    </div>

    <div class="section">
        <div class="clothes_container">
            <div id="main_clothes" class="clothes"></div>
            <!-- <input class="buy_btn" type="button" value="BUY NOW"> -->
        </div>
        <a href="/clothes/2019Fw_1"><p id="more_info">더 알아보기</p></a>

        <div class="clothes_content">
            <p class="main_clothes_name"> Oriental Printing</p>
            <p class="main_clothes_name"> Hoodie</p>
        </div>
    </div>

    <div class="section">
        <div class="slide sd1 inputImage" data-anchor="slide1"></div>
        <div class="slide sd2 inputImage" data-anchor="slide2"></div>
        <div class="slide sd3 inputImage" data-anchor="slide3"></div>
    </div>

    <div class="section main_theme">
        <div id="shutter">
            <div class="shutter_content">
                <p class="shutter_content_head">첫 번째 프로젝트. 조선의 동양화</p>
                <p class="shutter_content_p">김홍도 화백의 금강사군첩(金剛四君帖) </p>
                <p class="shutter_content_p">정조의 어명으로 1788년 그린 화첩이다. </p>
                <p class="shutter_content_p">김홍도가 금강산 및 관동8경 지역을 그린 것으로<br>
                    조선 후기 진경산수화(眞景山水畵)의 발전에 있어서 정점을 이루어냈다.
                </p>
                <br>
                <p class="shutter_content_p">그중 명경대 작품에서 영감을 받아 제작했다. </p>
            </div>
            <p id="shutter_closer" class="shutter_closer">close</p>
        </div>

        <div class="more_info_wrap">
            <p id="more_info_theme" class="more_info_theme">MORE INFO ></p>
            <p id="go_theme_category" class="go_theme_category">PROJECT HISTORY ></p>
        </div>
    </div>

</div>

<script type="text/javascript" language="JavaScript">
    new fullpage('#fullpage', {
        licenseKey: 'D1AF2031-25C74F5F-8F279168-8FF34DAF',
        autoScrolling: true,
        scrollHorizontally: true,
        navigation: true,
        navigationPosition: 'left',
        scrollingSpeed: 900,
        paddingTop: '0px',
        paddingBottom: '0px',
        slidesNavigation: true,
        slidesNavPosition: 'bottom'
    });
</script>
</body>

</html>




