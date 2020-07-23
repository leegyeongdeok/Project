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
    <link rel="stylesheet" href="/resources/css/ownerService/questionDetail.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/ownerService/questionDetail.js"></script>

<jsp:include page="../include/ownerSide.jsp" flush="false"/>

<div class="business_inquiry_detail_bok">

    <div class="business_inquiry_tit overlay">문 의 사 항</div>
    <div class="business_inquiry_desc overlay">
        <p>회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.</p>
        <p>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.</p>
    </div>
</div>



<div class="content">
    <h1 class="business_inquiry_brd_title">

        <span class="business_inquiry_detail_tbl_cell">${questionDetail.title} </span> <span
            class="business_inquiry_brd_date"><tf:formatDateTime value="${questionDetail.registeredAt}"
                                                                 pattern="yyyy.MM.dd"/></span>

    </h1>
    <div class="business_inquiry_brd_editor">
        <span>
            <p class="business_inquiry_brd_name">글쓴이 : ${questionDetail.ownerUser.name}</p>
        </span>

        <div class="business_inquiry_editor_area">
            ${questionDetail.content}
        </div>

    </div>
    <!-- 답변 -->
    <section class="business_inquiry_ReviewList">
        <header class="business_inquiry_ReviewList__Header">
            <h2 class="business_inquiry_ReviewList__Title">
                <span class="business_inquiry_ReviewList__business_inquiry_NameSuffixDesktop">답변</span>
                <span class="business_inquiry_ReviewList__business_inquiry_NameSuffixMobile">
						</span>
            </h2>

        </header>

        <ul class="business_inquiry_ReviewList__ReviewList">
            <c:forEach var="reply" items="${questionDetail.ownerQuestionReplyList}">
                <li class="business_inquiry_ReviewItem">
                    <div class="business_inquiry_ReviewItem__User">
                        <div class="business_inquiry_ReviewItem__UserPictureWrap">
                                <span class="business_inquiry_ReviewItem__UserName"
                                      id="businessInquiryDetailUserNickName">${reply.admin.account}</span>
                            <span class="business_inquiry_ReviewItem__ReviewDate"
                                  id="businessInquiryDetailReviewDate">
								<tf:formatDateTime value="${reply.registeredAt}" pattern="yyyy.MM.dd"/></span>
                        </div>
                        <div class="inquiry_ReviewItem__ReviewTextWrap">
                            <p class="inquiry_ReviewItem__ReviewText"><br>${reply.reply}</p>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>

    <table class="business_inquiry_tbl_pren" id="businessInquiryDetailTblPren">
        <colgroup>
            <col style="width: 100px">
            <col style="">
        </colgroup>
        <tbody>
        <c:if test="${!empty beforeQuestion}">
            <tr>
                <th scope="row">이전 글</th>
                <td>
                    <a onclick="switchQeustion(${beforeQuestion.questionNo})"
                       class="title_link">${beforeQuestion.title}</a>
                </td>
            </tr>
        </c:if>

        <c:if test="${!empty afterQuestion}">
            <tr>
                <th scope="row">다음 글</th>
                <td>
                    <a onclick="switchQeustion(${afterQuestion.questionNo})"
                       class="title_link">${afterQuestion.title}</a>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>


    <div class="btn_area">
        <input id="businessInquiryDetailListGo" type="button" class="listgo" value="목록" onclick="listQuestion()">
    </div>
</div>


</body>

</html>