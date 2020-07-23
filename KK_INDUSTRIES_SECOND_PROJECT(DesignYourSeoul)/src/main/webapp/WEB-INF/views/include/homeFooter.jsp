<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

    <link rel="stylesheet" href="/resources/css/include/footer.css">
    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
          rel="stylesheet">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/footer.js"></script>
<div class="footer_back section fp-auto-height">
    <div class="footer_box">
        <div class="footer_content_top">
            <a class="title_name" href="/dys">Design Your Seoul(DYS)</a>
        </div>

        <div class="footer_content_body">
            <a href="/dys/login">로그인</a>
            <a href="/dys/company/intro">회사소개</a>
            <a href="notice">공지사항</a>
            <a href="/dys/question"> 문의사항</a>
            <a href="/dys/board"> 게시판</a>
        </div>

    </div>
    <div class="footer_corp_box">
        <p>© 2019 KK INDUSTRIES Corp. All rights reserved.</p>
        <img class="footer_image" src="/resources/image/logo/footlogo.png">
    </div>

    <div class="sensor" onclick="moreInfo()">
        <P class="moreInfo">MORE INFO</P>

        <div class="company_info">
            <h3>KK INDUSTRIES information</h3>
            <p class="info_cont">상호명 : (주) 케이케이 인더스트리스</p>
            <p class="info_cont">대표명 : 황규상, 이경덕</p>
            <p class="info_cont">주소 : 경기도 화성시 석우동 55</p>
            <p class="info_cont">사업자 등록번호 : xxx-xx-xxxx</p>
        </div>

        <div class="company_intro">
            <h3>We want to make your life easier</h3>
            <p>more fun, more experience</p>
            <p>In your life</p>
        </div>

        <div class="company_from">
            <p>From KK INDUSTRIES</p>
            <img class="company_image" src="/resources/image/KKLogo.png">
        </div>


       <%-- --%>
    </div>
</div>
</body>
</html>