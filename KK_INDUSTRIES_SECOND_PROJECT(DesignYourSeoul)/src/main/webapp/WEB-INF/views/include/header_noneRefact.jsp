<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
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

    <title>Design Your Seoul</title>
    <link
            href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
            rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/include/header.css">
</head>

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/include/header.js"></script>


<header id="totalMenu">
    <div id="menu2">
        <ul class="login">
            <li>
                <img src="/resources/image/logo/headerlogo.png"
                     style="width: 60px; height: auto; margin-left: -30px; cursor:pointer" onclick="mainHome()">
            </li>

            <li id="user_box">
                <p id="login" onclick="loginJudge()">로그인</p>
                <div id="user_info" style="display: none">
                    <p class="user_info_txt" style="cursor:pointer;" onclick="userInformation()">회원정보 보기</p>
                    <p class="user_info_txt" style="cursor:pointer;" onclick="logout()">로그아웃</p>
                </div>
            </li>
        </ul>
    </div>

    <div id="menu1">
        <ul class="main" id="menulist">
            <li>
                <p class="totalMenu_text">회사</p>

                <ul class="sub">
                    <li>
                        <p class="totalMenu_text" onclick="company()">회사소개</p>
                    </li>
                </ul>
            </li>

            <li><a href="#">
                <p class="totalMenu_text">코스</p>
            </a>
                <ul class="sub">
                    <li>
                        <p class="totalMenu_text" onclick="courseRanking()">코스보기</p>
                    </li>
                    <li>
                        <p class="totalMenu_text">코스짜기</p>
                    </li>
                </ul>
            </li>
            <li>
                <p class="totalMenu_text">테마</p>

                <ul class="sub">
                    <li>
                        <p class="totalMenu_text" onclick="food()">맛집</p>
                    </li>
                    <li>
                        <p class="totalMenu_text" onclick="cafe()">카페</p>
                    </li>
                    <li>
                        <p class="totalMenu_text" onclick="accommodation()">숙소</p>
                    </li>
                    <li>
                        <p class="totalMenu_text" onclick="attraction()">명소</p>
                    </li>
                    <li>
                        <p class="totalMenu_text" onclick="activity()">액티비티</p>
                    </li>
                </ul>
            </li>
            <li>
                <p class="totalMenu_text">고객센터</p>

                <ul class="sub">
                    <li>
                        <p class="totalMenu_text" onclick="notice()">공지사항</p>
                    </li>
                    <li>
                        <p class="totalMenu_text" onclick="question()">문의사항</p>

                    <li>
                        <p class="totalMenu_text" onclick="board()">게시판</p>
                </ul>
            </li>
        </ul>
    </div>
</header>


</body>

</html>