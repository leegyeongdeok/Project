<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
    <link rel="icon" href="/resources/image/favicon_black.ico">
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
    <link rel="stylesheet" href="/resources/css/customerService/noticeDetail.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/cutomerService/noticeDetail.js"></script>

<jsp:include page="../include/ownerSide.jsp" flush="false"/>

<div class="notice_detail_bok">
    <div class="notice_tit overlay">공 지 사 항</div>
    <div class="notice_desc overlay">DYS(Design Your Seoul)의 소식을 신속하고 빠르게 전해 드립니다.</div>
</div>


<div class="content">
    <h1 class="brd_title">
		     
		    	<span class="notice_detail_tbl_cell">
                    ${noticeDetail.title}
                </span>


        <span class="brd_date"><tf:formatDateTime value="${noticeDetail.registeredAt}" pattern="yyyy.MM.dd"/></span>

    </h1>
    <div class="brd_editor">
        <div class="editor_area">
            <p>
                ${noticeDetail.content}
            </p>
        </div>

    </div>
    <table class="tbl_pren">
        <colgroup>
            <col style="width:100px">
            <col style="*">
        </colgroup>
        <tbody>
        <tr>
            <th scope="row">이전 글</th>
            <td>
                <a class="title_link" onclick="beforeNotice(${beforeNotice.noticeNo})">${beforeNotice.title}</a>
            </td>
        </tr>
        <tr>
            <th scope="row">다음 글</th>
            <td>
                <a class="title_link" onclick="afterNotice(${afterNotice.noticeNo})">${afterNotice.title}</a>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="btn_area">
        <input type="button" class="listgo" value="목록" onclick="location.href='/dys/owner/notice'">
    </div>
</div>
</body>
</html>