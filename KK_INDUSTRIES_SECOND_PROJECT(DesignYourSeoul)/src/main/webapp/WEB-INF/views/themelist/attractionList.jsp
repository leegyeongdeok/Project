<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

    <title>Attraction List</title>
    <link href="https://fonts.googleapis.com/css?family=Gugi|Song+Myung&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/theme/themeList.css">
</head>

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/themeList/themeList.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>

<%
    String location;
    String rank;

    if (request.getParameter("location") == null) {
        location = "";
    } else {
        location = request.getParameter("location");
    }

    if (request.getParameter("rank") == null) {
        rank = "first";
    } else {
        rank = request.getParameter("rank");
    }
%>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="totalList">

    <div class="themeTitle">
        <h1 class="main_title">Attraction</h1>
    </div>

    <div class="toplist">
        <div class="title">
            <h1>랭킹 TOP10</h1>
        </div>

        <div class="rankingList">
            <ul>
                <c:forEach varStatus="status" var="attractionRank" items="${attractionRank}">
                    <li id="item${status.count}" onclick="detail(${attractionRank.attractionId})">
                        <span>
                            <img src="/resources/image/attraction/${attractionRank.attractionId}/main.PNG">
                            <p>
                                <strong>상호:&nbsp;&nbsp;${attractionRank.name}</strong><br><br>
                                <strong>주소:&nbsp;&nbsp;${fn:substring(attractionRank.address,0 ,13)}..</strong><br><br>
                                <strong>종류:&nbsp;&nbsp;${attractionRank.attractionType}</strong><br><br>
                                <strong>전화:&nbsp;&nbsp;${attractionRank.callNumber}</strong>
                            </p>
                        </span>
                    </li>
                </c:forEach>

            </ul>
        </div>
        <div class="btn_container">
            <i id="back" class="fa fa-angle-left fa-4x" onclick="back()"></i>
            <i id="next" class="fa fa-angle-right fa-4x" onclick="next()"></i>
        </div>
    </div>


    <!-- 나머지 리스트 -->
    <div class="otherList">
        <div class="title">
            <h1>명소 리스트</h1>
            <div class="list_search">
                <input id="location_search" class="search_text" placeholder="지역을 입력해주세요" type="text">
                <input onclick="locationSearch()" class="search_button" type="button" value="검색">
            </div>
        </div>
        <div class="list">
            <ul>

                <c:forEach varStatus="status" var="attraction" items="${attractionList.content}">
                    <li onclick="detail(${attraction.attractionId})">
                        <span>
                            <img src="/resources/image/attraction/${attraction.attractionId}/main.PNG">
                            <p>
                                <strong>상호:&nbsp;&nbsp;${attraction.name}</strong><br/><br/>
                                <strong>주소:&nbsp;&nbsp;${fn:substring(attraction.address,0 ,13)}..</strong><br/><br/>
                                <strong>종류:&nbsp;&nbsp;${attraction.attractionType}</strong><br/><br/>
                                <strong>전화:&nbsp;&nbsp;${attraction.callNumber}</strong>
                            </p>
                         </span>
                    </li>
                </c:forEach>
            </ul>

            <div class="btn">
                <i class="fa fa-caret-square-o-left fa pageLeftBtn" onclick="pageDown()"></i>
                <c:set var="nowPage" value="${attractionList.number+1}"/>
                <c:set var="finalPage" value="${attractionList.totalPages}"/>
                <c:if test="${(nowPage == 1 || nowPage == 2) && nowPage <= finalPage-4}">

                    <c:forEach var="page" begin="1" end="5">
                        <a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
                    </c:forEach>
                </c:if>

                <c:if test="${nowPage -2 > 0 && nowPage <= finalPage-4}">
                    <c:forEach var="page" begin="${nowPage-2}" end="${nowPage+2}">
                        <a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
                    </c:forEach>
                </c:if>

                <c:if test="${nowPage > (finalPage-4) && finalPage-4 > 0}">
                    <c:forEach var="page" begin="${finalPage-4}" end="${finalPage}">
                        <a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
                    </c:forEach>
                </c:if>


                <c:if test="${finalPage-4 < 0}">
                    <c:forEach var="page" begin="1" end="${finalPage}">
                        <a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
                    </c:forEach>
                </c:if>
                <i class="fa fa-caret-square-o-right fa pageLeftBtn" onclick="pageUp()"></i>
            </div>

        </div>

    </div>
</div>
<%@ include file="../include/footer.jsp" %>


</body>
</html>