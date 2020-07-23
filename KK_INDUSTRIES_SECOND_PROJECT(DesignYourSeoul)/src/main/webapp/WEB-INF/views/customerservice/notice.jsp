<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="/resources/css/customerService/notice.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/cutomerService/notice.js"></script>


<%
    String pages = request.getParameter("page");
%>

<jsp:include page="../include/header.jsp" flush="false"/>
<div class="business_notice_box">

    <div class="business_notice_tit overlay">공 지 사 항</div>
    <div class="business_notice_desc overlay">DYS(Design Your Seoul)의 소식을 신속하고 빠르게 전해 드립니다.</div>
</div>


<div class="business_notice_content">
    <form action="" method="get">
        <div class="table_search">
            <span class="selectbox black">

               <select id="type_selecter" name="option">
                   <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                 <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
               </select>
            </span>
            <span class="searchbox black mw250">
               <input id="notice_search" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span>
            <span class="btn_wrap"><input id="NoticeBtnOk" onclick="searchNotice($('#notice_search').val())"
                                          type="button" title="검색" alt="확인" value="검색하기" class="btn_ok"></span>
        </div>
    </form>


    <!-- 테이블 -->

    <table class="business_noticetbl_board" id="businessNoticeBoard">
        <colgroup>
            <col style="width:82px">
            <col>
            <col style="width:120px">
        </colgroup>
        <thead>
        <tr>
            <th scope="col">No</th>
            <th scope="col">제목</th>
            <th scope="col">등록일</th>
        </tr>
        </thead>
        <tbody id="noticeList"> <%--10개 씩--%>


        <c:forEach var="notice" items="${generalNotice.content}" varStatus="status">
            <tr>
                <input id="${notice.noticeNo}" type="hidden" value="${notice.noticeNo}">
                <td class="notice_num">${status.count}</td>
                <td><a onclick="detail(${notice.noticeNo})" id="notice_title" class="business_noticetitle_link"
                       onclick="">${notice.title}</a></td>
                <td class="notice_date" class="date"><tf:formatDateTime value="${notice.registeredAt}"
                                                                     pattern="yyyy.MM.dd"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page">
        <ul>
            <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
            <li><a onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>

            <input id="totalPages" type="hidden" value="${generalNotice.totalPages}">
            <c:forEach var="page" begin="1" end="${generalNotice.totalPages}">
                <li><a id="btn${page}" onclick="pageSelect(${page}-1)" class="btn_list">${page}</a></li>
            </c:forEach>

            <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
            <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
        </ul>

    </div>

</div>
<%@ include file="../include/footer.jsp" %>

</body>
</html>