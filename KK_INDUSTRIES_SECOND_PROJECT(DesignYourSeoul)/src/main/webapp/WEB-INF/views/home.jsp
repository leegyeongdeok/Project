<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" type="text/css" href="/resources/css/fullpage.css "/>
    <link href="https://fonts.googleapis.com/css?family=Gugi|Song+Myung&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/fullpage.js"></script>
<script type="text/javascript" src="/resources/js/home.js"></script>

<jsp:include page="include/header.jsp" flush="false"/>
<div id="fullpage">
    <div class="section mainFirst">

        <video id="mainVideo" autoplay muted>
            <source src="resources/mp4/homevideo.mp4" type="video/mp4">
        </video>

        <div id="intro">

      <%--      <p>
                우리의수도 서울 잘 알고 계십니까?<br/>
                익숙한 듯 낯선 우리의 서울을<br/>
                둘러보고 계획해보고 경험해보세요.<br/>
                5가지 테마와 지역별로 구분된 서울<br/>
                당신의 서울 지금 디자인 해보세요.<br/>
            </p>--%>
        </div>
    </div>

    <div class="section">

        <div class="slide sd1 inputImage" data-anchor="slide1">
            <div class="slide_cotent">
                <p>5가지의 테마 맛집, 카페, 숙소, 명소, 액티비티를 <br> 한눈에 쉽게 찾아볼수 있습니다.</p>
            </div>
        </div>

        <div class="slide sd2 inputImage" data-anchor="slide2">
            <div class="slide_cotent">
                <p>원하는 장소, 명소등 자신의 여행계획을 <br> 보다 쉽게 정리,계획할수 있습니다.</p>
            </div>
        </div>

        <div class="slide sd3 inputImage" data-anchor="slide3">
            <div class="slide_cotent">
                <p>자신의 여행계획을 다른회원들과 <br> 공유하거나 정보를 교환해보세요.</p>
            </div>
        </div>

        <div class="slide sd4 inputImage" data-anchor="slide4">
            <div class="slide_cotent">
                <p>업주용아이디를 통해 자신의 <br> 가게를 등록하실수 있습니다.</p>
            </div>
        </div>

        <div class="slide sd5 inputImage" data-anchor="slide5">
            <div class="slide_cotent">
                <p>등록한 가게들을 한눈에 보실수있으며 <br> 다른업주들과 정보교환도 하실수 있습니다.</p>
            </div>
        </div>

    </div>

    <div class="section">

        <div class="back">
            <figure class="snip1200">
                <img src="/resources/image/main3/main3_food.png" alt="sq-sample27"/>
                <figcaption>
                    <p>서울시에 숨어있는 맛집들<br/><br> 수많은 숨은 맛집들을 <br> 소개해드립니다.</p>
                    <div class="heading">
                        <h2>Restaurant</h2>
                    </div>
                </figcaption>
                <a href="/dys/theme/foodList"></a>
            </figure>
        </div>

        <div class="back">
            <figure class="snip1200">
                <img src="/resources/image/main3/main3_cafe.png" alt="sq-sample27"/>
                <figcaption>
                    <p>조금만 걸어가면 보이는 프렌차이즈카페<br/><br> 저희들은 색다른 카페를<br/> 소개해드립니다.</p>
                    <div class="heading">
                        <h2>Coffee&Dessert</h2>
                    </div>
                </figcaption>
                <a href="/dys/theme/cafeList"></a>
            </figure>
        </div>

        <div class="back">
            <figure class="snip1200">
                <img src="/resources/image/main3/main3_hotel2.png" alt="sq-sample27"/>
                <figcaption>
                    <p>여행중 지치신 회원님들께 <br><br> 편안한 잠자리와 쉼터를 <br> 소개합니다.</p>
                    <div class="heading">
                        <h2>Accommodations</h2>
                    </div>
                </figcaption>
                <a href="/dys/theme/accomList"></a>
            </figure>
        </div>

        <div class="back">
            <figure class="snip1200">
                <img src="/resources/image/main3/main3_attr.png" alt="sq-sample27"/>
                <figcaption>
                    <p>어디로 놀러 갈지 <br> 정하지 못하셨다면<br/><br> 서울이 처음이더라도 <br> 어디가 좋을지 <br> 어디로 놀러갈지 <br><br>회원님들 입맛에
                        맞춰<br/>한눈에 보여드립니다.</p>
                    <div class="heading">
                        <h2>Attraction</h2>
                    </div>
                </figcaption>
                <a href="/dys/theme/attractionList"></a>
            </figure>
        </div>

        <div class="back">
            <figure class="snip1200">
                <img src="/resources/image/main3/main3_acti.png" alt="sq-sample27"/>
                <figcaption>
                    <p>서울에서 즐길수있는 <br>다양한 놀거리<br/><br> 다양한 액티비티 활동을 <br/> 소개해드리고 있습니다.</p>
                    <div class="heading">
                        <h2>Activity</h2>
                    </div>
                </figcaption>
                <a href="/dys/theme/activityList"></a>
            </figure>
        </div>

    </div>

    <jsp:include page="include/homeFooter.jsp" flush="false"/>
</div>


<script type="text/javascript" language="JavaScript">
    new fullpage('#fullpage', {
        licenseKey: 'D1AF2031-25C74F5F-8F279168-8FF34DAF',
        autoScrolling: true,
        scrollHorizontally: true,
        scrollingSpeed: 900,
        paddingTop: '0px',
        paddingBottom: '0px',
    });
</script>

</body>

</html>