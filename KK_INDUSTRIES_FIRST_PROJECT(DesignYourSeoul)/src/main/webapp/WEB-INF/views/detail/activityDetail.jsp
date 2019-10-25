<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <title>login</title>


    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .headerimage {
            width: 100%;
        }

        .headerimage div {
            float: left;
        }

        .image img {
            margin: 5px;
            width: 300px;
            height: 300px;
        }

        .headerimage {
            overflow:hidden;
            display: inline-block;
            width: 1550px;
            height: 300px;
            margin-top: 70px;
            margin-left: 10%;
            margin-right: 10%;

            padding-bottom:25px;
            border-bottom: 1px solid orange;

        }
        .food-detail, .foodReviewList{
            width: 700px;
            margin-top: 19px;
        }
        .every{
            margin:0 auto;
        }

        .foodtable{
            padding: 20px 0;
            position: relative;
        }
        .foodtable th {
            width: 110px;
            line-height: 1.7;
            text-align: left;
            vertical-align: top;
            padding-right: 10px;
            padding-bottom: 5px;

        }
        .ingo td{
            line-height: 1.7;
            text-align: left;
            vertical-align: middle;
            padding-bottom: 5px;
        }

        ol, ul, ul li {
            list-style: none;
        }



        fieldset{
            border: 0;
        }
        .search_bar {
            display: inline-block;
            width: 550px;
            height: 45px;
            border: 2px solid orange;
            background-color: #fff;
        }
        .input_text {
            margin: 12px 0 0 9px;
            width: 485px;
            height: 23px;
            outline: 0;
            border: 0;
            background-color: transparent;
            color: #000;
            font-weight: 700;
            font-size: 18px;
            line-height: 23px;
            *ime-mode: active;
        }
        .sch_smit {

            overflow: visible;
            width: 80px;
            height: 49px;
            border: 0;
            background: orange;
        }
        .foodReviewItem {
            position: relative;
            border-bottom: 1px solid #DBDBDB;
        }
        .foodReviewItem__User{
            padding: 30px 0 30px 0;
        }
        .foodReviewList__Header{
            padding-top:10px;
            padding-bottom: 10px;
        }
        .inline, .title{
            padding-bottom:10px;
            border-bottom: 1px solid orange;
        }

        .pg-food, .side-wrap {
            position: relative;
            float: right;

        }
        .map_layer {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 5;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }
        .left{
            flex: 1;
            float: left;
            width: 700px;
        }
        .right{
            position: relative;
            float: right;
            width: 700px;
        }
        .foodReviewItem__UserNickName{
            margin-right: 60%;
        }
        .foodReviewItem__ReviewText{
            margin-top: 20px;
        }
        .foodReviewItem__ReviewDate{
            font-size: 14px;
        }
        .map-container{
            margin-top: 20px;
            width: 700px;
            height: 500px;
        }
        .space{
            width: 1550px;
            margin-left: 9.7%;

        }
        .update_date{
            text-align: right;
        }

        .like{
            margin-left:10px;
            width: 30px;
            height: 30px;
            background-image: url(/resources/image/courseranking/likefull.png);
            background-size: cover;
            background-repeat: no-repeat;
            border: 0 ;
            float: right;
        }
        .share{
            margin-left:10px;
            width: 30px;
            height: 30px;
            background-image: url(/resources/image/courseranking/share.png);
            background-size: cover;
            background-repeat: no-repeat;
            border: 0 ;
            float: right;
        }
        .food_name{
            margin-bottom: 15px;

        }
        .likecount{
            float: right;
            padding-top: 5px;
            margin-left:5px ;

        }
        .update_date{
            font-size: 13px;
        }

    </style>

</head>

<body >


<div class="headerimage">
    <div class="image" id="img1">
        <img src="/resources/image/activity/${activity.activityId}/main.PNG">
    </div>
    <div class="image" id="img2">
        <img src="/resources/image/activity/${activity.activityId}/1.PNG">
    </div>
    <div class="image" id="img3">
        <img src="/resources/image/activity/${activity.activityId}/2.PNG">
    </div>
    <div class="image" id="img4">
        <img src="/resources/image/activity/${activity.activityId}/3.PNG">
    </div>
    <div class="image" id="img5">
        <img src="/resources/image/activity/${activity.activityId}/4.PNG">
    </div>
</div>


<div class="every">
    <div class="space">

        <div class="left">
            <div class="inner">

                <section class="food-detail">
                    <header class="title">

                        <div>
                <span class="title">

              <p class="likecount">${activity.recommend}</p>
              <button class="like" ></button>
              <button class="share" ></button>

              <h1  id="names" class="food_name" >${activity.name}</h1>

                                  </span>

                        </div>


                    </header>
                    <!-- 상세 정보 -->
                    <div class="inline">
                        <table class="foodtable ">
                            <tbody>
                            <tr >
                                <th>주소</th>
                                <td id="address">${activity.address}</td>
                            </tr>
                            <tr >
                                <th>전화번호</th>
                                <td>${activity.callNumber}</td>
                            </tr>
                            <tr>
                                <th>종류</th>
                                <td>
                                    <span>${activity.activityType}</span>
                                </td>
                            </tr>
                            <tr>
                                <th>링크</th>
                                <td> ${activity.rink}</td>
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
            <section class="foodReviewList">
                <header class="foodReviewList__Header">
                    <h2 class="foodReviewList__Title">
                        <span class="foodReviewList__foodNameSuffixDesktop">리뷰</span><span class="foodReviewList__foodNameSuffixMobile">
             <span>(<span class="foodReviewList__AllCount"> 1</span> )</span></h2>

                </header>
                <fieldset>

        <span class="search_bar">
            <input id="query" name="query" type="text" title="검색어 입력" maxlength="255" class="input_text" >
        </span>
                    <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" ><span class="blind">리뷰 달기</span></button>
                </fieldset>

                <ul class="foodReviewList__ReviewList">

                    <li class="foodReviewItem foodReviewList__ReviewItem">
                        <div class="foodReviewItem__User">
                            <div class="foodReviewItem__UserPictureWrap">
                                <span class="foodReviewItem__UserNickName">닉네임</span><span  class="foodReviewItem__ReviewDate" >2019-10-15</span>
                            </div>
                            <div class="foodReviewItem__ReviewTextWrap">

                                <p class="foodReviewItem__ReviewText">
                                    아이들이 참 좋아해요 ^^
                                </p>
                            </div>
                        </div>

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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b72196eb1cd84df0c4ddfc3ffcc8407&libraries=services"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
    geocoder.addressSearch($("#address").text() ,function(result, status) {

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
                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ $("#names").text() + '</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
</script>
</body>

</html>