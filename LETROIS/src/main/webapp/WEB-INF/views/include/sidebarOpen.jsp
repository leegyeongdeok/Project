
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

    <title>Prototype</title>
    <link rel="stylesheet" href="/resources/css/sidebar_open.css">
    <link rel="stylesheet" href="/resources/css/sidebar_footer_open.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/sidebar.js"></script>
<script type="text/javascript" src="/resources/js/menu.js"></script>
<div class="sidebar">
    <p id="menu" class="menu" onclick="sidebar();">MENU</p>
    <p class="menu_item" onclick="home();">HOME</p>
    <p class="menu_item" onclick="company();">COMPANY</p>
    <p class="menu_item" onclick="about();">PROJECT</p>
    <p class="menu_item" onclick="notice();">NOTICE</p>
    <p class="menu_item" onclick="lookBook();">LOOK BOOK</p>

    <ul class="ft_information ">
        <li class="info_tit">LE TROIS information</li>
        <li class="info_cont">상호명 : 르트와</li>
        <li class="info_cont">대표명 : 이경덕</li>
        <li class="info_cont">주소 : 경기도 화성시 태안로 385-33</li>
        <li class="info_cont">사업자 등록번호 : 620-17-38007</li>
        <li class="info_cont">통신판매업 신고 : 제..........</li>

        <li class="info_cont">© 2020 LE TROIS Co. All rights reserved.</li>
    </ul>

    <ul class="ft_information">
        <a href="https://www.instagram.com/letrois_official/">
            <li class="ft_instagram">
                <p class="fa fa-instagram ft14"></p>
            </li>
        </a>
    </ul>


</div>
</body>
</html>
