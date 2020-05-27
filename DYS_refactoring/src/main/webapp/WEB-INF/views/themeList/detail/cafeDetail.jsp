<!doctype html>
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
    <link rel="icon" href="resources/image/favicon_black.ico">
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

    <title>Cafe Detail</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/fullpage.css "/>
    <link rel="stylesheet" href="/resources/css/theme/detail/listDetail.css">

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/fullpage.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b72196eb1cd84df0c4ddfc3ffcc8407&libraries=services"></script>

<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/themeList/themeListDetail.js"></script>

<form id="data_form" style="display: none">
    <input type="hidden" class="form_content" name="content">
    <input type="hidden" class="user_id" name="user_id">
    <input type="hidden" class="theme_id" name="cafe_id" value="${cafe.cafeId}">
</form>

<jsp:include page="../../include/header.jsp" flush="false"/>

<div id="fullpage" class="headerimage">

    <div class="section">
        <div class="slide sd1 inputImage" data-anchor="slide1">
            <div class="slide_cotent"
                 style="background-image: url(/resources/image/cafe/${cafe.cafeId}/main.PNG)">
            </div>
        </div>

        <div class="slide sd1 inputImage" data-anchor="slide2">
            <div class="slide_cotent"
                 style="background-image: url(/resources/image/cafe/${cafe.cafeId}/1.PNG)">
            </div>
        </div>

        <div class="slide sd1 inputImage" data-anchor="slide3">
            <div class="slide_cotent"
                 style="background-image: url(/resources/image/cafe/${cafe.cafeId}/2.PNG)">
            </div>
        </div>

        <div class="slide sd1 inputImage" data-anchor="slide4">
            <div class="slide_cotent"
                 style="background-image: url(/resources/image/cafe/${cafe.cafeId}/3.PNG)">
            </div>
        </div>

        <div class="slide sd1 inputImage" data-anchor="slide5">
            <div class="slide_cotent"
                 style="background-image: url(/resources/image/cafe/${cafe.cafeId}/4.PNG)">
            </div>
        </div>

    </div>
</div>


<div class="every" style="overflow: hidden">
    <div class="space" style="overflow: hidden">

        <div class="left">
            <div class="inner">

                <section class="list_detail">
                    <div class="title">
                        <div>
                            <span class="title">
                                 <p class="countLike">${cafe.recommend}</p>
                                 <button class="like" onclick="like()"></button>
                                 <button class="share"></button>
                                <h1 id="names" class="list_name">${cafe.name}</h1>
                            </span>
                        </div>
                    </div>


                    <!-- 상세 정보 -->
                    <div class="inline">
                        <table class="listTable ">
                            <tbody>
                            <tr>
                                <th>주소</th>
                                <td id="address">${cafe.address}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${cafe.callNumber}</td>
                            </tr>
                            <tr>
                                <th>종류</th>
                                <td>
                                    <span>${cafe.cafeTheme}</span>
                                </td>
                            </tr>
                            <tr>
                                <th>링크</th>
                                <td> ${cafe.link}</td>
                            </tr>

                            </tbody>
                        </table>

                        <p class="update_date">
                            업데이트: 2019. 10. 22
                        </p>
                    </div>
                </section>
            </div>
            <!--  리뷰 -->
            <section class="listReviewList">
                <div class="listReviewList__Header">
                    <h2 class="listReviewList__Title">
                        <span class="listReviewList__listNameSuffixDesktop">리뷰</span>
                        <span class="listReviewList__listNameSuffixMobile">
                            <span>( <span class="listReviewList__AllCount">${reviewList.size()}</span> )</span>
                        </span>
                    </h2>
                </div>


                <fieldset>

                    <span class="review_bar">
                        <input id="query" name="query" type="text" placeholder="리뷰를 입력 해주세요." maxlength="255" class="input_text">
                    </span>

                    <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" onclick="createReview('cafe')"><span class="blind">리뷰 달기</span>
                    </button>

                </fieldset>

                <ul class="listReviewList__ReviewList">
                    <li class="listReviewItem listReviewList__ReviewItem">
                        <c:forEach varStatus="status" var="review" items="${reviewList}">
                            <div class="listReviewItem__User">
                                <p class="review_nickName">${review.nickName}</p>
                                <p class="review_content">${review.content}</p>
                                <p class="review_date">
                                    <tf:formatDateTime value="${review.registeredAt}" pattern="yyyy.MM.dd"/>
                                </p>
                            </div>
                        </c:forEach>
                    </li>
                </ul>
            </section>
            <!--리뷰끝 -->
        </div>

        <div class="right">
            <!-- 사이드 -->
            <div class="side-wrap">
                <div class="column-side">
                    <!-- 지도 -->
                    <div class="map-container" id="map"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../include/footer.jsp" flush="false"/>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch($("#address").text(), function (result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + $("#names").text() + '</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>

<script type="text/javascript" language="JavaScript">
    new fullpage('#fullpage', {
        licenseKey: 'D1AF2031-25C74F5F-8F279168-8FF34DAF',
        autoScrolling: true,
        scrollHorizontally: true,
        scrollingSpeed: 900,
        paddingTop: '0px',
        paddingBottom: '0px',
        slidesNavigation: true,
    });
</script>


</body>

</html>