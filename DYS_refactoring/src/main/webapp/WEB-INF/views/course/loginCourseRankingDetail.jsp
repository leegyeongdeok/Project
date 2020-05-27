<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>course_ranking_detail</title>

    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .post_detail_top {
            height: 380px;
            width: 1800px;
            margin: 0 auto;
        }

        .post_detail_bok {
            padding-bottom: 100px;
            padding-top: 100px;
            text-align: center;
            width: 1800px;
            height: auto;
            margin: 0 auto;
        }

        .post_tit {
            font-size: 60px;
            font-weight: 500;
        }

        .post_desc {
            font-size: 20px;
            font-weight: 400;
            margin-top: 40px;
        }

        .contents {
            width: 1180px;
            margin: 0 auto;
            padding: 0 20px 27px 20px;
        }

        .area_tag {
            padding-bottom: 10px;
        }

        .tit_cont h2 {
            font-weight: 800;
            color: #333;
            font-size:25px;
        }

        .area_address {
            position: relative;
            padding-top: 10px;
        }

        .area_address>span {

            padding-left: 5px;
            font-size: 16px;
        }

        .cosMt {
            margin-top: 15px;
        }

        .wrap_contView {
            position: relative;
            width: 100%;
        }

        .list_thumType {
            float: left;
            width: 600px;
            margin-bottom: 20px;
        }

        ul, li {
            list-style: none;
        }

        .list_thumType>li:first-child {
            border-top: 1px solid #999;
        }

        .list_thumType>li {
            position: relative;
            padding: 20px 0;
            border-bottom: 1px solid #e6e6e6;
        }

        .list_thumType>li .photo {
            position: absolute;
            left: 0;
            top: 20px;
            width: 140px;
            height: 94px;
        }
        .list_thumType > li .area_txt {
            min-height: 94px;
            padding-left: 160px;
            padding-right: 20px;
        }

        .list_thumType > li .area_txt .tit {
            margin-top: -5px;
            padding-bottom: 10px;
        }
        .list_thumType > li .area_txt .tit a {

            width: 100%;

            font-size: 20px;

        }
        .list_thumType > li .area_txt .tag {

            width: 100%;
            padding-top: 5px;

        }
        .list_thumType > li .photo img {
            width: 140px;
            height: 94px;
        }
        .map-container {
            float: right;
            width: 560px;
            height: 651px;
            margin-bottom: 20px;
        }
        .review{
            width: 1180px;
            margin: 0 auto;
            margin-top: 10px;
        }
        a {
            color: black;
            text-decoration: none;
        }
        .attractionReviewList__Header {
            padding-top: 10px;
            padding-bottom: 10px;
        }
        fieldset {
            border: 0;
        }
        .search_bar {
            display: inline-block;
            width: 92%;
            height: 45px;
            border: 2px solid orange;
            background-color: #fff;
        }
        .input_text {
            margin: 12px 0 0 9px;
            width: 90%;
            height: 23px;
            outline: 0;
            border: 0;
            background-color: transparent;
            color: #000;
            font-weight: 700;
            font-size: 18px;
            line-height: 23px;
            resize: none
        }
        .sch_smit {
            overflow: visible;
            width: 80px;
            height: 49px;
            border: 0;
            background: orange;
        }
        .attractionReviewItem {
            position: relative;
            border-bottom: 1px solid #DBDBDB;
        }
        .attractionReviewItem__User {
            padding: 30px 0 30px 0;
        }
        .attractionReviewItem__UserNickName {
            margin-right: 82%;
        }
        .attractionReviewItem__ReviewDate {
            font-size: 14px;
        }
        .attractionReviewItem__ReviewText {
            margin-top: 20px;
        }
        .share{
            width:30px;
            height:30px;
            background-image: url(/resources/image/courseranking/share.png);
            background-size: cover;
            background-color: white;
            border: 0;
            margin-right: 15px;
        }
        .save{
            width:30px;
            height:36px;
            background-image: url(/resources/image/courseranking/save1.png);
            background-size: cover;
            background-color: white;
            border: 0;
            margin-right: 5px;
            margin-top: -3px;
        }
        .like{
            width:30px;
            height:30px;
            background-image: url(/resources/image/courseranking/likefull.png);
            background-size: cover;
            background-color: white;
            border: 0;
            margin-right: 5px;
        }
        .look{
            width:30px;
            height:30px;
            margin-top:2px;
            background-size: cover;
            background-color: white;
            border: 0;
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%@ include file="../include/loginHeader.jsp"%>
<div class="post_detail_top">


    <div class="post_detail_bok">

        <div class="post_tit overlay">코 스 랭 킹</div>
        <div class="post_desc overlay">우리가 짠 코스에 랭킹을 주세요</div>
    </div>

</div>

<div class="contents">
    <div class="tit_cont">
        <div class="area_tag">

            <h3>
            <span class="nickname">
            <span class="no">1.</span>규상어</span></h3>

        </div>

        <h3 class="likecount" style="float: right; margin-top: 5px; margin-right: 5px;" >2423</h3>
        <input id="likebtn1" class="like" type="button" style="float: right;" >
        <h3 class="count" style="float: right; margin-top: 5px; margin-right: 5px;" >1950</h3>
        <input id="savebtn1" class="save" type="button" style="float: right;" >
        <h3 class="lookcount" style="float: right; margin-top: 5px; margin-right: 5px;" >1810</h3>
        <input class="look" type="image" src="/resources/image/courseranking/look.png" style="float: right;">
        <input id="sharebtn1" class="share" type="button" style="float: right;">


        <h2>Flex 서울투어</h2>

        <div class="area_address">
            총 :   <span id="dist">78</span>km
        </div>

    </div>



    <!-- 하단 썸네일, 지도 -->
    <div class="wrap_contView cosMt clfix">
        <ul class="list_thumType">
            <li><div class="photo">
                <img
                        src="/resources/image/CourseRankingDetail/loginCourseRankingDetail1.PNG"
                        alt="서울 약현성당">
            </div>
                <div class="area_txt">
                    <div class="tit">
                        <a
                                href="">마장동
                            한우촌</a>
                    </div>
                    <span style="float: left; margin-right: 10px; ">전화 :</span>
                    <P class="ranl_tell" style="padding-top: 1px; margin-bottom: 10px;">02-2281-9292</P>
                    <span style="float: left; margin-right: 10px;">지역 :</span>
                    <P class="rank_area" style="padding-top: 1px;">성동구 마장동</P>

                </div>
            </li>

            <li><div class="photo">
                <img
                        src="/resources/image//CourseRankingDetail/loginCourseRankingDetail2.png"
                        alt="서울 약현성당">
            </div>
                <div class="area_txt">
                    <div class="tit">
                        <a
                                href="/resources/image/food2.png">도선동 비전호텔</a>
                    </div>
                    <span style="float: left; margin-right: 10px; ">전화 :</span>
                    <P class="ranl_tell" style="padding-top: 1px; margin-bottom: 10px;">02-2296-2244 </P>
                    <span style="float: left; margin-right: 10px;">지역 :</span>
                    <P class="rank_area" style="padding-top: 1px;">성동구 도선동</P>

                </div>
            </li>

            <li><div class="photo">
                <img
                        src="/resources/image/CourseRankingDetail/loginCourseRankingDetail3.PNG"
                        alt="서울 약현성당">
            </div>
                <div class="area_txt">
                    <div class="tit">
                        <a
                                href="/resources/image/food2.png">성수동 카페성수</a>
                    </div>
                    <span style="float: left; margin-right: 10px; ">전화 :</span>
                    <P class="ranl_tell" style="padding-top: 1px; margin-bottom: 10px;">02-465-1077</P>
                    <span style="float: left; margin-right: 10px;">지역 :</span>
                    <P class="rank_area" style="padding-top: 1px;">성동구 성수동</P>

                </div>
            </li>

            <li><div class="photo">
                <img
                        src="/resources/image/CourseRankingDetail/loginCourseRankingDetail4.PNG"
                        alt="서울 약현성당">
            </div>
                <div class="area_txt">
                    <div class="tit">
                        <a
                                href="/resources/image/food2.png">성수동 뚝섬미술관</a>
                    </div>
                    <span style="float: left; margin-right: 10px; ">전화 :</span>
                    <P class="ranl_tell" style="padding-top: 1px; margin-bottom: 10px;">02-555-5035</P>
                    <span style="float: left; margin-right: 10px;">지역 :</span>
                    <P class="rank_area" style="padding-top: 1px;">성동구 성수동</P>

                </div>
            </li>

            <li><div class="photo">
                <img
                        src="/resources/image/CourseRankingDetail/loginCourseRankingDetail5.PNG"
                        alt="서울 약현성당">
            </div>
                <div class="area_txt">
                    <div class="tit">
                        <a
                                href="/resources/image/food2.png">행당동 미음치읒VR</a>
                    </div>
                    <span style="float: left; margin-right: 10px; ">전화 :</span>
                    <P class="ranl_tell" style="padding-top: 1px; margin-bottom: 10px;">02-1577-6401 </P>
                    <span style="float: left; margin-right: 10px;">지역 :</span>
                    <P class="rank_area" style="padding-top: 1px;">성동구 행당동</P>

                </div>
            </li>




        </ul>

        <!-- 지도 -->
        <div class="map-container" id="map"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b72196eb1cd84df0c4ddfc3ffcc8407"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.5555670 , 127.043562), // 지도의 중심좌표
                    level: 6// 지도의 확대 레벨
                };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            //마커를 표시할 위치와 title 객체 배열입니다
            var positions = [
                {
                    title: '마장동 한우촌',
                    latlng: new kakao.maps.LatLng(37.5706414 , 127.041250)
                },
                {
                    title: '도선동 비전호텔',
                    latlng: new kakao.maps.LatLng(37.5644353 , 127.035995)
                },
                {
                    title: '성수동 카페성수',
                    latlng: new kakao.maps.LatLng(37.5475306 , 127.042449)
                },
                {
                    title: '성수동 뚝섬미술관',
                    latlng: new kakao.maps.LatLng(37.5473391 , 127.048423)
                },
                {
                    title: '행당동 미음치읒VR',
                    latlng: new kakao.maps.LatLng(37.5610558 , 127.038416)
                }
            ];

            //마커 이미지의 이미지 주소입니다
            var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

            for (var i = 0; i < positions.length; i ++) {

                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image : markerImage // 마커 이미지
                });
            };


        </script>



    </div>
    <!-- //하단 썸네일, 지도 -->




</div>

<div class="review" >
    <section class="attractionReviewList">
        <header class="attractionReviewList__Header">
            <h2 class="attractionReviewList__Title">
                <span class="attractionReviewList__attractionNameSuffixDesktop">리뷰</span><span class="attractionReviewList__attractionNameSuffixMobile">
             <span>(<span class="attractionReviewList__AllCount"> 1</span> )</span></h2>

        </header>
        <fieldset>

        <span class="search_bar">
            <textarea id="" name="query"  title="검색어 입력" maxlength="255" class="input_text" ></textarea>
        </span>
            <div style="float: right;">
                <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" ><span class="blind">리뷰 달기</span></button>
            </div>
        </fieldset>

        <ul class="attractionReviewList__ReviewList">

            <li class="attractionReviewItem attractionReviewList__ReviewItem">
                <div class="attractionReviewItem__User">
                    <div class="attractionReviewItem__UserPictureWrap">
                        <span class="attractionReviewItem__UserNickName">동티모르</span><span  class="attractionReviewItem__ReviewDate" >2019-09-15</span>
                    </div>
                    <div class="attractionReviewItem__ReviewTextWrap">

                        <p class="attractionReviewItem__ReviewText">
                            마장동 너무 느끼해요 느끼해서 못먹은건 살면서 처음이네요
                        </p>


                    </div>


                </div>


            </li>


        </ul>
    </section>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>