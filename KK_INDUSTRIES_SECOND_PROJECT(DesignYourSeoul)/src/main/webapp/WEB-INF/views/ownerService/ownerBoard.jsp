<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="/resources/css/ownerService/ownerBoard.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/ownerService/ownerBoard.js"></script>


<jsp:include page="../include/ownerSide.jsp" flush="true"/>

<div class="contents_top">
    <div class="business_post_list_tit overlay">게 시 판</div>
    <div class="business_post_List_desc overlay">
        <p>다른 회원님들과 자유로운 소통을 해보세요.</p>
        <p> 게시물을 작성하실 시 바른말을 사용해 주세요.</p>
    </div>
</div>
<!--business_post_list_top-->

<div class="business_post_list">
    <form action="" method="get">
        <div class="business_post_listtable_search">
            <span class="selectbox black">
                <select id="type_selectertype_selecter" name="option">
                  <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                    <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
                  <option value="name" <c:if test="${stype eq 'name'}"> selected</c:if> >이름</option>
            </select>
            </span> <span class="searchbox black mw250">
             <input id="businessPostListSearch" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요"
                    value="">
            </span> <span class="btn_wrap">
             <input id="businessPostListBtnOk" type="button" onclick="searchBoard($('#businessPostListSearch').val())"
                    title="검색" alt="확인" value="검색하기" class="btn_ok"></span>
        </div>
    </form>


    <!-- 테이블 -->

    <div class="business_post_listtable">
        <div style="height: 40px;">
            <p class="business_post_listtbl_count">
                총 <strong class="business_post_list_count" id="businessPostListCount">${board.content.size()}</strong>건
            </p>
        </div>

        <table class="business_post_listtbl_board" id="businessPostListBoard">
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
            <c:forEach var="board" items="${board.content}" varStatus="status">
                <tr>
                    <input id="${board.boardNo}" type="hidden" value="${board.boardNo}">
                    <td id="notice_num">${status.count}</td>
                    <td id="notice_name">${board.ownerUser.name}</td>
                    <td><a onclick="detail(${board.boardNo})" id="notice_title" class="business_noticetitle_link"
                           onclick="">${board.title}</a></td>
                    <td id="notice_date" class="date"><tf:formatDateTime value="${board.registeredAt}"
                                                                         pattern="yyyy.MM.dd"/></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
        <input id="businessPostListWritingBtn" class="business_post_listBtn" type="button" value="게시하기"
               onclick="writing();">
    </div>


    <div id="paging" class="page">
        <ul>
            <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
            <li><a onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>
            <input id="totalPages" type="hidden" value="${board.totalPages}">

            <c:forEach var="page" begin="1" end="${board.totalPages}">
                <li><a id="btn${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a></li>
            </c:forEach>

            <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
            <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
        </ul>
    </div>
</div>


</body>
</html>