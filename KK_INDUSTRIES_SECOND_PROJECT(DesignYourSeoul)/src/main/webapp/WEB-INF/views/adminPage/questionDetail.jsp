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
    <link rel="stylesheet" href="/resources/css/adminPage/questionDetail.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/adminPage/questionWriting.js"></script>

<div class="business_inquiry_detail_bok">
    <div class="business_inquiry_tit overlay">문 의 사 항</div>
</div>

<div class="content">
    <h1 class="business_inquiry_brd_title">
        <span class="business_inquiry_detail_tbl_cell">${questionDetail.title} </span> <span
            class="business_inquiry_brd_date"><tf:formatDateTime value="${questionDetail.registeredAt}"
                                                                 pattern="yyyy.MM.dd"/></span>
    </h1>
    <div class="business_inquiry_brd_editor">
        <span>
            <p class="business_inquiry_brd_name">글쓴이 :

                <c:set var="type" value="${param.type}"/>
                 <c:if test="${type eq 'general'}">
                    ${questionDetail.generalUser.nickname}
                 </c:if>
                 <c:if test="${type eq 'owner'}">
                     ${questionDetail.ownerUser.name}
                 </c:if>
            </p>
        </span>

        <div class="business_inquiry_editor_area">
            ${questionDetail.content}
        </div>

    </div>
    <!-- 답변 -->
    <section class="business_inquiry_ReviewList">
        <div class="review_header">
            <h2 style="height: 35px">답변</h2>
        </div>


        <div id="questionAnswer" class="questionAnswer">
            <div class="business_inquiry_ReviewItem__UserPictureWrap">
                <div class="reply_userName">${questionReply.admin}</div>
                <div class="reply_date"><tf:formatDateTime value="${questionReply.registeredAt}"
                                                           pattern="yyyy.MM.dd"/></div>
            </div>
            <div class="inquiry_ReviewItem__ReviewTextWrap">
                <p class="inquiry_ReviewItem__ReviewText"><br>${questionReply.reply}</p>
            </div>
        </div>

        <textarea id="questionWriting" style="display: none">

        </textarea>

    </section>

    <div class="btn_area btn_answer">
        <input type="button" class="cancel" value="답변" id="btn_update" onclick="answerWriting()">
        <input type="button" class="cancel" value="취소" id="btn_cancel" onclick="window.close()">
    </div>

    <div class="btn_area btn_writing" style="display: none">
        <input type="button" class="cancel" value="답변 달기" onclick="createAnswer()">
        <input type="button" class="cancel" value="취소" onclick="writingCancel()">
    </div>
</div>

</body>
</html>