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
    <link rel="stylesheet" href="/resources/css/ownerService/question.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/ownerService/ownerQuestion.js"></script>
<%
    String pages = request.getParameter("page");
%>
<jsp:include page="../include/ownerSide.jsp" flush="false"/>
<div class="business_inquiry_contents_box">
    <div class="business_inquiry_tit overlay">문 의 사 항</div>
    <div class="inquiry_desc overlay">
        <p>회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.</p>
        <p>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.</p>
        <p>문의사항에 작성된 내용은 본인 외에는 확인 하실 수 없습니다</p>
    </div>

</div>
<!--business_inquiry_top-->

<div class="business_inquiry">
    <form action="" method="get">
        <div class="business_inquirytable_search">
            <span class="selectbox black">
            <select id="type_selecter" name="option">
                  <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                 <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
            </select>
            </span> <span class="searchbox black mw250">
            <input id="question_search" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span> <span class="btn_wrap">
            <input onclick="searchQuestion($('#question_search').val())" id="businessInquiryBtn" type="button" title="검색"
                   alt="확인" value="검색하기" class="btn_ok">
         </span>
        </div>
    </form>


    <!-- 테이블 -->
    <div class="business_inquirytable">
        <table id="businessInquiryTable" class="business_inquirytbl_board">
            <colgroup>
                <col style="width: 82px">
                <col>
                <col style="width: 120px">
            </colgroup>
            <thead>
            <tr>
                <th scope="col" style="width: 5%">No</th>
                <th scope="col" style="width: 10%">이름</th>
                <th scope="col">제목</th>
                <th scope="col" style="width: 10%">등록일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="status" var="question" items="${question.content}">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${question.ownerUser.name}</td>
                    <td>
                        <a class="title_link" onclick="detail(${question.questionNo})"> ${question.title}</a>
                    </td>
                    <td class="date">
                        <tf:formatDateTime value="${question.registeredAt}" pattern="yyyy.MM.dd"/>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
        <input id="businessInquiryWritingBtn" class="business_inquiryBtn" type="button" value="게시하기"
               onclick="writing()">
    </div>


    <div id="businessInquiryPaging" class="page">
        <ul>
            <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
            <li><a onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>
            <c:forEach var="page" begin="1" end="${question.totalPages}">
                <li><a id="btn${page}" onclick="pageSelect(${page}-1)" class="btn_list">${page}</a></li>
            </c:forEach>
            <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
            <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
        </ul>
    </div>
</div>

</body>
</html>