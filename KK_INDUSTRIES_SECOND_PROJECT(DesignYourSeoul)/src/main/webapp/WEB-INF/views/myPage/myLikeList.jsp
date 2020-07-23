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

    <title>MyPage</title>
    <link rel="stylesheet" href="/resources/css/mypage/myLikeList.css">


</head>
<body style="overflow: auto;">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/myPage/myPageLikeList.js"></script>

<jsp:include page="../include/generalSide.jsp" flush="false"/>


<div id="myPage" class="mypagebox">
    <div id="myPage_main">

        <div class="cont_personal">
            <h3 class="tit_personal">좋아요 리스트</h3>
            <p class="title_font" id="title_p">맘에 들었던 가게와 장소들을 한눈에 보실수 있습니다.</p>

            <div class="basic_info" style="display: block">
                <!-- 맛집 리스트 시작 -->
                <div class="info_title">
                    <h3 class="pro_title">Restaurant</h3><br>
                </div>


                <!-- 이미지 시작 -->
                <ul id="image_ul">
                    <i class="back fa fa-angle-left fa-4x" onclick="back()"></i>
                    <c:forEach varStatus="status" var="like" items="${LikeFamousRestaurantList}">
                        <li class="image_li famous_li">
                            <span class="li_span">
                                <img class="list_image" src="/resources/image/food/${like.themeId}/main.PNG">
                                <p>
                                    <strong>상호: ${famousRestaurantList.get(like.themeId - 1).name}</strong><br/><br/>
                                    <strong>주소: ${fn:substring(famousRestaurantList.get(like.themeId - 1).address,0 ,8)}..</strong><br/><br/>
                                    <strong>종류: ${famousRestaurantList.get(like.themeId - 1).foodKind}</strong><br/><br/>
                                    <strong>전화: ${famousRestaurantList.get(like.themeId - 1).callNumber}</strong><br/><br/>
                                </p>
                            </span>
                            <img class="good_type" src="/resources/image/myinfo/good.png">

                        </li>
                    </c:forEach>
                    <i class="next fa fa-angle-right fa-4x" onclick="next()"></i>
                    <c:if test="${LikeFamousRestaurantList.size() == 0}">
                        <li class="image_none_li"></li>
                    </c:if>
                </ul>
                <script type="text/javascript">
                    initView('image_ul', 5, 'inline');
                </script>


                <!-- 카페 리스트 시작 -->
                <div class="info_title">
                    <h3 class="pro_title">Coffee&Dessert</h3><br>
                </div>

                <a class="image_back" href="#"
                   onclick="moveList('prev', 'image_ul3', 5, 5, 'inline');return false;"><img
                        class="button_image1" src="/resources/image/slider/left.png"></a>
                <a class="image_next" href="#"
                   onclick="moveList('next', 'image_ul3', 5, 5, 'inline');return false;"><img
                        class="button_image2" src="/resources/image/slider/right.png"></a>

                <!-- 이미지 시작 -->
                <ul id="image_ul3">
                    <c:forEach varStatus="status" var="like" items="${LikeCafeList}">
                        <li class="image_li famous_li">
                            <span class="li_span">
                                <img class="list_image" src="/resources/image/cafe/${like.themeId}/main.PNG">
                                <p>
                                    <strong>상호: ${cafeList.get(like.themeId - 1).name}</strong><br/><br/>
                                    <strong>주소: ${fn:substring(cafeList.get(like.themeId - 1).address,0 ,8)}..</strong><br/><br/>
                                    <strong>종류: ${cafeList.get(like.themeId - 1).cafeTheme}</strong><br/><br/>
                                    <strong>전화: ${cafeList.get(like.themeId - 1).callNumber}</strong><br/><br/>
                                </p>
                            </span>
                            <img class="good_type" src="/resources/image/myinfo/good.png">
                        </li>
                    </c:forEach>

                    <c:if test="${LikeCafeList.size() == 0}">
                        <li class="image_none_li"></li>
                    </c:if>
                </ul>


                <!-- 숙소 리스트 시작 -->
                <div class="info_title">
                    <h3 class="pro_title">Accommodations</h3><br>
                </div>

                <!-- 이미지 시작 -->
                <ul id="image_ul1">

                    <c:forEach varStatus="status" var="like" items="${LikeAccommList}">
                        <li class="image_li famous_li">
                            <span class="li_span">
                                <img class="list_image" src="/resources/image/accommodation/${like.themeId}/main.PNG">
                                <p>
                                    <strong>상호: ${accommodationList.get(like.themeId - 1).name}</strong><br/><br/>
                                    <strong>주소: ${fn:substring(accommodationList.get(like.themeId - 1).address,0 ,8)}..</strong><br/><br/>
                                    <strong>등급: ${accommodationList.get(like.themeId - 1).grade}</strong><br/><br/>
                                    <strong>전화: ${accommodationList.get(like.themeId - 1).callNumber}</strong><br/><br/>
                                </p>
                            </span>
                            <img class="good_type" src="/resources/image/myinfo/good.png">
                        </li>
                    </c:forEach>

                    <c:if test="${LikeAccommList.size() == 0}">
                        <li class="image_none_li"></li>
                    </c:if>
                </ul>
                <!-- 명소 리스트 시작 -->
                <div class="info_title">
                    <h3 class="pro_title">Attraction</h3><br>
                </div>

                <!-- 이미지 시작 -->
                <ul id="image_ul4">
                    <c:forEach varStatus="status" var="like" items="${LikeAttractionList}">
                        <li class="image_li famous_li">
                            <span class="li_span">
                                <img class="list_image" src="/resources/image/attraction/${like.themeId}/main.PNG">
                                <p>
                                    <strong>상호: ${attractionList.get(like.themeId - 1).name}</strong><br/><br/>
                                    <strong>주소: ${fn:substring(attractionList.get(like.themeId - 1).address,0 ,8)}..</strong><br/><br/>
                                    <strong>등급: ${attractionList.get(like.themeId - 1).attractionType}</strong><br/><br/>
                                    <strong>전화: ${attractionList.get(like.themeId - 1).callNumber}</strong><br/><br/>
                                </p>
                            </span>
                            <img class="good_type" src="/resources/image/myinfo/good.png">
                        </li>
                    </c:forEach>

                    <c:if test="${LikeAttractionList.size() == 0}">
                        <li class="image_none_li"></li>
                    </c:if>
                </ul>
                <!-- 놀거리 리스트 시작 -->
                <div class="info_title">
                    <h3 class="pro_title">Activity</h3><br>
                </div>

                <!-- 이미지 시작 -->
                <ul id="image_ul5">
                    <c:forEach varStatus="status" var="like" items="${LikeActivityList}">
                        <li class="image_li famous_li">
                            <span class="li_span">
                                <img class="list_image" src="/resources/image/activity/${like.themeId}/main.PNG">
                                <p>
                                    <strong>상호: ${activityList.get(like.themeId - 1).name}</strong><br/><br/>
                                    <strong>주소: ${fn:substring(activityList.get(like.themeId - 1).address,0 ,8)}..</strong><br/><br/>
                                    <strong>등급: ${activityList.get(like.themeId - 1).activityType}</strong><br/><br/>
                                    <strong>전화: ${activityList.get(like.themeId - 1).callNumber}</strong><br/><br/>
                                </p>
                            </span>
                            <img class="good_type" src="/resources/image/myinfo/good.png">
                        </li>
                    </c:forEach>

                    <c:if test="${LikeActivityList.size() == 0}">
                        <li class="image_none_li"></li>
                    </c:if>
                </ul>
            </div>
            <!-- 좋아요 리스트 종료 -->
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>


</body>
</html>