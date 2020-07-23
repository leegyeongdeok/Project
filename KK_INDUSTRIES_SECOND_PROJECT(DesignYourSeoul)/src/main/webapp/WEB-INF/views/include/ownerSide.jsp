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

    <link rel="stylesheet" href="/resources/css/include/ownerSide.css">
    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
          rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/include/ownerSide.js"></script>


<div id="myside">
    <div class="mysidemenu">
        <a class="sidemenu_link" href="/dys/owner/home">
            <img class="myinfo_image" src="/resources/image/ownerside/sidehome.png">
            <strong class="info_tit">홈</strong></a>

        <a class="sidemenu_link" href="/dys/owner/Intro">
            <img class="myinfo_image" src="/resources/image/ownerside/sideintroduction.png">
            <strong class="info_tit">회사소개</strong></a>

        <a class="sidemenu_link" href="/dys/owner/Info">
            <img class="myinfo_image" src="/resources/image/ownerside/sideinfo.png">
            <strong class="info_tit">개인 정보</strong></a>

        <a class="sidemenu_link" href="/dys/owner/StoreChoice">
            <img class="myinfo_image" src="/resources/image/ownerside/sidestoreregister.png">
            <strong class="info_tit">가게 등록</strong></a>

        <a class="sidemenu_link" href="/dys/owner/StoreList">
            <img class="myinfo_image" src="/resources/image/ownerside/sidelist.png">
            <strong class="info_tit">가게 리스트</strong></a>

        <a class="sidemenu_link" href="/dys/owner/notice">
            <img class="myinfo_image" src="/resources/image/ownerside/sidenotice.png">
            <strong class="info_tit">공지사항</strong></a>

        <a class="sidemenu_link" href="/dys/owner/question">
            <img class="myinfo_image" src="/resources/image/ownerside/sideinquiry.png">
            <strong class="info_tit">문의사항</strong></a>

        <a class="sidemenu_link" href="/dys/owner/board">
            <img class="myinfo_image" src="/resources/image/ownerside/sideboard.png">
            <strong class="info_tit">업주게시판</strong></a>

        <a class="sidemenu_link" href="/dys/owner/signOut">
            <img class="myinfo_image" src="/resources/image/ownerside/sidecancel.png">
            <strong class="info_tit">회원탈퇴</strong></a>

        <a class="sidemenu_link" onclick="locLogout()">
            <img class="myinfo_image" src="/resources/image/logo/headerlogo.png">
            <strong class="info_tit">로그아웃</strong></a>
    </div>

</div>
</body>
</html>