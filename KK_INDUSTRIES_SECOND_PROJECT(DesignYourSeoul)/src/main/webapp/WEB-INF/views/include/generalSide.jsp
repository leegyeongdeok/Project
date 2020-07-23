<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>MyPage</title>
    <link rel="stylesheet" href="/resources/css/include/generalSide.css">
    <link rel="stylesheet"
          href="//use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
          crossorigin="anonymous">

</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/include/generalSide.js"></script>
<div id="generalSide">
    <div class="sideMenu">

        <div class="menuLink" onclick="main()">
            <i class="fas fa-home mainHome" style="color: orange"></i>
            <p class="info_tit">메인화면</p>
        </div>

        <div class="menuLink" onclick="myPageHome()">
            <img src="/resources/image/myinfo/good.png">
            <p class="info_tit">홈</p>
        </div>

        <div class="menuLink" onclick="myInfo()">
            <img src="/resources/image/myinfo/myinfo.png">
            <p class="info_tit">개인 정보</p>
        </div>

        <div class="menuLink" onclick="myLikeList()">
            <img src="/resources/image/myinfo/goodlist.png">
            <p class="info_tit">좋아요 리스트</p>
        </div>

        <div class="menuLink" onclick="myCourseList()">
            <img src="/resources/image/myinfo/mycourse.png">
            <p class="info_tit">내코스 목록</p>
        </div>

        <div class="menuLink" onclick="saveCourseList()">
            <img src="/resources/image/myinfo/savecourse.png">
            <p class="info_tit">저장한 코스 목록</p>
        </div>

        <div class="menuLink" onclick="signOut()">
            <img src="/resources/image/myinfo/membercancel.png">
            <p class="info_tit">회원탈퇴</p>
        </div>
    </div>
</div>

</body>
</html>