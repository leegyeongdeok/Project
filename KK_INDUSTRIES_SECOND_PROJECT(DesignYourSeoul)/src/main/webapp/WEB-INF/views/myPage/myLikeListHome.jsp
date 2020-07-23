<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

    <title>MyLikeList</title>
    <link rel="stylesheet" href="/resources/css/mypage/myLikeListHome.css">
    <link rel="stylesheet"
          href="//use.fontawesome.com/releases/v5.6.3/css/all.css"
          integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
          crossorigin="anonymous">
</head>
<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/myPage/myLikeListHome.js"></script>

<jsp:include page="../include/generalSide.jsp" flush="false"/>
<div class="list_home_back">
    <div class="theme_container">
        <div class="title_container">
            <h1 class="main_title"> 좋아요 리스트 </h1>
            <p class="title_content">좋아요를 누른 곳을 확인할 수 있습니다.</p>
        </div>

        <div class="box_container">

            <div class="top_box">
                <div id="food" class="theme_box">
                    <i class="fas fa-utensils fa-5x theme_icon"></i>
                    <h2 class="theme_name"> 맛집</h2>
                </div>
                <div id="cafe" class="theme_box">
                    <i class="fas fa-coffee fa-5x theme_icon"></i>
                    <h2 class="theme_name"> 카페</h2>
                </div>
                <div id="accom" class="theme_box">
                    <i class="fas fa-hotel fa-5x theme_icon"></i>
                    <h2 class="theme_name"> 숙소</h2>
                </div>
            </div>

            <div class="bottom_box">
                <div id="activity" class="theme_box">
                    <i class="fas fa-snowboarding fa-5x theme_icon"></i>
                    <h2 class="theme_name"> 액티비티</h2>
                </div>

                <div id="attraction" class="theme_box">
                    <i class="fas fa-landmark fa-5x theme_icon"></i>
                    <h2 class="theme_name"> 명소</h2>
                </div>
            </div>

            <div class="likeList" style="display: none">
                <div id="food_likeList" class="theme_likeList" style="display: none">
                    <c:forEach var="theme" varStatus="status" items="${likeFamousRestaurantList}">
                        <div id="food${status.count}" class="likeList_box" onclick="hrefStore('foodList', ${theme.themeId})">
                            <img class="theme_img" src="/resources/image/food/${theme.themeId}/main.PNG">
                        </div>
                    </c:forEach>
                </div>

                <div id="cafe_likeList" class="theme_likeList" style="display: none">
                    <c:forEach var="theme" varStatus="status" items="${likeCafeList}">
                        <div id="cafe${status.count}" class="likeList_box" onclick="hrefStore('cafeList', ${theme.themeId})">
                            <img class="theme_img" src="/resources/image/cafe/${theme.themeId}/main.PNG">
                        </div>
                    </c:forEach>
                </div>

                <div id="accom_likeList" class="theme_likeList" style="display: none">
                    <c:forEach var="theme" varStatus="status" items="${likeAccommList}">
                        <div id="accomm${status.count}" class="likeList_box" onclick="hrefStore('accomList', ${theme.themeId})">
                            <img class="theme_img" src="/resources/image/accommodation/${theme.themeId}/main.PNG">
                        </div>
                    </c:forEach>
                </div>

                <div id="activity_likeList" class="theme_likeList" style="display: none">
                    <c:forEach var="theme" varStatus="status" items="${likeActivityList}">
                        <div id="activity${status.count}" class="likeList_box" onclick="hrefStore('activityList', ${theme.themeId})">
                            <img class="theme_img" src="/resources/image/activity/${theme.themeId}/main.PNG">
                        </div>
                    </c:forEach>
                </div>

                <div id="attraction_likeList" class="theme_likeList" style="display: none">
                    <c:forEach var="theme" varStatus="status" items="${likeAttractionList}">
                        <div id="attraction${status.count}" class="likeList_box" onclick="hrefStore('attractionList', ${theme.themeId})">
                            <img class="theme_img" src="/resources/image/attraction/${theme.themeId}/main.PNG">
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="btn_container" style="display: none">
                <i id="btn_back" class="fas fa-angle-double-left fa-4x" onclick="pageDown()"></i>
                <h2 class="btn_name">맛집 리스트</h2>
                <i id="btn_up" class="fas fa-angle-double-right fa-4x" onclick="pageUp()"></i>
            </div>
        </div>
    </div>
</div>

</body>
</html>