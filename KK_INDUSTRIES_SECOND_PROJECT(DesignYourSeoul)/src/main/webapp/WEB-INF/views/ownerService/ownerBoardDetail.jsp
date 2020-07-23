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
    <link rel="stylesheet" href="/resources/css/ownerService/ownerBoardDetail.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/ownerService/ownerBoardDetail.js"></script>

<jsp:include page="../include/ownerSide.jsp" flush="false"/>

<form id="data_form" style="display: none">
    <input type="hidden" class="form_reply" name="reply">
    <input type="hidden" class="user_id" name="user_id">
    <input type="hidden" class="board_no" name="board_no" value="${boardDetail.boardNo}">
</form>

<div class="board_header">
    <div class="board_header_tit">게 시 판</div>
    <div class="board_header_content">
        <p>다른 회원님들과 자유로운 소통을 해보세요.</p>
        <p> 게시물을 작성하실 시 바른말을 사용해 주세요.</p>
    </div>
</div>


<div class="content">
    <h1 class="board_tit">
        <span class="board_tit_content">${boardDetail.title}</span>
        <span class="board_tit_date"><tf:formatDateTime value="${boardDetail.registeredAt}"
                                                        pattern="yyyy.MM.dd"/></span>
    </h1>

    <div class="board_content">
        <div class="board_content_area">
            <p>
                ${boardDetail.content}
            </p>
        </div>
    </div>

    <section class="listReviewList">
        <div class="listReviewList__Header">
            <h2 class="listReviewList__Title">댓글 ( ${replyList.size()} )</h2>
        </div>

        <fieldset>
                    <span class="review_bar">
                        <input id="query" name="query" type="text" placeholder="댓글을 입력 해주세요." maxlength="255"
                               class="input_text">
                    </span>

            <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit"
                    onclick="createReply()"><span class="blind">댓글 달기</span>
            </button>
        </fieldset>

        <ul>
            <li class="listReviewItem">
                <c:forEach varStatus="status" var="reply" items="${replyList}">
                    <div class="listReviewItem__User">
                        <div class="reply_container">
                            <p class="review_nickName">${reply.name}</p>
                            <p class="review_date">
                                <tf:formatDateTime value="${reply.registeredAt}" pattern="yyyy.MM.dd. HH:mm:ss"/>
                            </p>
                            <p class="review_content">${reply.reply}</p>
                        </div>
                    </div>
                </c:forEach>
            </li>
        </ul>
    </section>

    <table class="board_list">
        <colgroup>
            <col style="width:100px">
            <col style="*">
        </colgroup>
        <tbody>
        <tr>
            <th scope="row">이전 글</th>
            <td>
                <a class="title_link" onclick="beforeNotice(${beforeBoard.boardNo})">${beforeBoard.title}</a>
            </td>
        </tr>
        <tr>
            <th scope="row">다음 글</th>
            <td>
                <a class="title_link" onclick="afterNotice(${afterBoard.boardNo})">${afterBoard.title}</a>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="btn_area">
        <input type="button" class="btn_back_list" value="목록" onclick="location.href='/dys/owner/board'">
    </div>
</div>

</body>
</html>