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

    <title>notice detail</title>

	<link rel="stylesheet" href="/resources/css/adminPage/detailPage.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/adminPage/noticeJs.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>

<div class="top_title">
    <div class="notice_tit overlay">공 지 사 항</div>
</div>


<div class="content">
    <h1 class="brd_title">

		    	<span class="notice_detail_tbl_cell">
                    ${notice.title}
                </span>
        <span class="brd_date"><tf:formatDateTime value="${notice.registeredAt}" pattern="yyyy.MM.dd"/></span>

    </h1>
    <div class="brd_editor">
        <div class="editor_area">
            <p>
                ${notice.content}
            </p>
        </div>

    </div>

    <div class="btn_area">
        <input type="button" class="btn_update" value="수정" onclick="location.href='noticeUpdate?no=${notice.noticeNo}'"/>
        <input type="button" class="btn_del" value="삭제" onclick="deleteNotice()"/>
        <input type="button" class="btn_can" value="취소" onclick="window.close()">

    </div>
</div>


</body>
</html>