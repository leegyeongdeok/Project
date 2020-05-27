<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>MouseWheel</title>

    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">

    <style>
        #menu1:hover {
            opacity: 1;
        }

        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        .box {
            width: 100%;
            height: 100%;
            position: relative;
            color: #ffffff;
            font-size: 24pt;
        }

        .box2 {
            margin: 0;
            padding: 0;
            list-style: none;
            width: 100%;
            height: 100%;
            position: relative;
            color: #ffffff;
            font-size: 24pt;
        }

        /* 1페이지 */
        #content {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        #videobcg {
            position: absolute;
            top: 0px;
            left: 0px;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1000;
            overflow: inherit;
        }

        #menu1, #menu2 {
            position: fixed;
        }

        body, button, dd, dl, dt, fieldset, form, h1, h2, h3, h4, h5, h6, input,
        legend, li, ol, p, select, table, td, textarea, th, ul {
            margin: 0;
            padding: 0
        }

        /* 첫페이지 설명란 css */
        div #polina {
            font-family: Agenda-Light, Agenda\ Light, Agenda, Arial\ Narrow,
            sans-serif;
            font-weight: 100;
            color: #fff;
            width: 360px;
            margin-top: 450px;
            margin-left: 70%;
            font-size: 1.4rem;
        }

        /* 2번째 페이지 */
        .copy{
            position: absolute;
            top: 30vh;
            left: 50vw;
            font-size: 60px;
            font-family: "바탕";
            font-weight: 800;



        }

        .copy2{
            position: absolute;
            top: 30vh;
            left: 10vw;
            font-size: 60px;
            font-family: '바탕';
            font-weight: 800;

        }
        .copy3{
            position: absolute;
            top: 30vh;
            left: 20vw;
            font-size: 60px;
            font-family: "바탕";
            font-weight: 800;

        }



        #slider-wrap {
            width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        #slider-wrap ul#slider {
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            list-style: none;
        }

        #slider-wrap ul#slider li {
            float: left;
            position: relative;
            width: 100%;
            height: 100%;
        }

        /* #slider-wrap ul#slider li>div {
            position: absolute;
            top: 20px;
            left: 35px;
        } */
        #slider-wrap ul#slider li>div h3 {
            font-size: 36px;
            text-transform: uppercase;
        }


        #slider-wrap ul#slider li img {
            display: block;
            width: 100%;
            height: 100%;
        }

        /*btns*/
        .slider-btns {
            position: absolute;
            width: 50px;
            height: 60px;
            top: 50%;
            margin-top: -25px;
            line-height: 57px;
            text-align: center;
            cursor: pointer;
            background: orange;
            z-index: 100;
            transition: all 0.1s ease;
        }

        .slider-btns:hover {
            background: rgba(0, 0, 0, 0.3);
        }

        #next {
            right: -50px;
            border-radius: 7px 0px 0px 7px;
            color: #eee;
        }

        #previous {
            left: -50px;
            border-radius: 0px 7px 7px 7px;
            color: #eee;
        }

        #slider-wrap.active #next {
            right: 0px;
        }

        #slider-wrap.active #previous {
            left: 0px;
        }

        /*bar*/
        #slider-pagination-wrap {
            visibility: hidden;
            min-width: 20px;
            margin-top: 60%;
            margin-bottom: 5px;
            height: 15px;
            text-align: center;
        }

        #slider-pagination-wrap ul {
            width: 100%;
        }

        #slider-pagination-wrap ul li {
            margin: 0 4px;
            display: inline-block;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            background: #fff;
            opacity: 0.5;
            position: relative;
            top: 0;
        }

        #slider-pagination-wrap ul li.active {
            width: 12px;
            height: 12px;
            top: 3px;
            opacity: 1;
            -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
            box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
        }

        /*ANIMATION*/
        #slider-wrap ul, #slider-pagination-wrap ul li {
            -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
            transition: all 0.3s cubic-bezier(1, .01, .32, 1);
        }

        .inimg {
            width: 100%;
            height: 100%;
        }

        li {
            background-size: 100% 100%;
        }

        #img1 {
            position: absolute;
            z-index: -1;
        }

        #back {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        /* 2번스타일 */


        /* 3번째 페이지 */
        .back {
            width: 20%;
            height: 101%;
            float: left;
            border: 0px;
            border-color: #ffffff;
            border-style: solid;
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            counter-increment: bc;
        }

        /* 4번 div  */
        #div4 img {
            width: 85px;
            height: 65px;
            margin-top: -35px;
            margin-left: 15%;
        }

        #div4 .footer_back {
            background-color: #fff2f2;
            width: 100%;
            height: 75px;
            margin-top: 5%;
            font-size: 12pt;
        }

        /* test */
        @import url(https://fonts.googleapis.com/css?family=Raleway:400,500,800)
        ;

        figure.snip1200 {
            font-family: 'Raleway', Arial, sans-serif;
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 100%;
            background: #000000;
            color: #ffffff;
            text-align: center;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
            font-size: 16px;
        }

        figure.snip1200 * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: all 0.45s ease-in-out;
            transition: all 0.45s ease-in-out;
        }

        figure.snip1200 img {
            max-width: 100%;
            height: 100%;
            position: relative;
            opacity: 0.9;
        }

        figure.snip1200 figcaption {
            position: absolute;
            top: 45%;
            left: 7%;
            right: 7%;
            bottom: 45%;
            border: 1px solid white;
            border-width: 1px 1px 0;
        }

        figure.snip1200 .heading {
            overflow: hidden;
            -webkit-transform: translateY(50%);
            transform: translateY(50%);
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        figure.snip1200 h2 {
            font-size: 24pt;
            display: table;
            margin: 0 auto;
            padding: 0 10px;
            position: relative;
            text-align: center;
            width: auto;
            font-weight: 400;
            font-family: Big Shoulders Display;
        }

        figure.snip1200 h2 span {
            font-weight: 800;
        }

        figure.snip1200 h2:before, figure.snip1200 h2:after {
            position: absolute;
            display: block;
            width: 1000%;
            height: 1px;
            content: '';
            background: white;
            top: 50%;
        }

        figure.snip1200 h2:before {
            left: -1000%;
        }

        figure.snip1200 h2:after {
            right: -1000%;
        }

        figure.snip1200 p {
            top: 50%;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            position: absolute;
            width: 100%;
            padding: 0 20px;
            margin: 0;
            opacity: 0;
            line-height: 1.6em;
            font-size: 0.9em;
        }

        figure.snip1200 a {
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            position: absolute;
            z-index: 1;
        }

        figure.snip1200:hover img, figure.snip1200.hover img {
            opacity: 0.25;
            -webkit-transform: scale(1.1);
            transform: scale(1.1);
        }

        figure.snip1200:hover figcaption, figure.snip1200.hover figcaption {
            top: 20%;
            bottom: 20%;
        }

        figure.snip1200:hover p, figure.snip1200.hover p {
            opacity: 1;
            -webkit-transition-delay: 0.35s;
            transition-delay: 0.35s;
        }


    </style>
    <link rel="stylesheet" type="text/css"
          href="resources/css/home/main.css">
    <script type="text/javascript"
            src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var elm = ".box";
            $(elm).each(function(index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function(e) {
                    e.preventDefault();// 기본값 방지
                    var delta = 0;
                    if (!event)
                        event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera)
                            delta = -delta;
                    } else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try {
                                moveTop = $(elmSelecter).next().offset().top;
                            } catch (e) {
                            }
                        }
                        // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try {
                                moveTop = $(elmSelecter).prev().offset().top;
                            } catch (e) {
                            }
                        }
                    }

                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop : moveTop + 'px'
                    }, {
                        duration : 800,
                        complete : function() {
                        }
                    });
                });
            });
        }
    </script>

</head>
<body style="overflow: auto; overflow-x:hidden;">

<%
    String userName = request.getParameter("name");
    String id = request.getParameter("id");
%>

<jsp:include page="include/loginHeader.jsp" flush="true">
    <jsp:param name="userName" value="<%=userName%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>

<div class="box" id="content">
    <video id="videobcg" preload="auto" autoplay="true"
           muted="muted" volume="0">
        <source src="resources/mp4/homevideo.mp4" type="video/mp4">
        <source src="movie.webm" type="video/webm">
    </video>

    <div id="polina">
        <h1>DYS<br /> (Design Your Seoul)</h1>
        <div class="main1_text">
            <p>
                우리의수도 서울 잘 알고 계십니까?<br />
                익숙한 듯 낯선 우리의 서울을<br />
                둘러보고 계획해보고 경험해보세요.<br />
                5가지 테마와 지역별로 구분된 서울<br />
                당신의 서울 지금 디자인 해보세요.<br />
            </p>
        </div>
    </div>
</div>

<!-- 두번째 페이지 -->
<div class="box">
    <div id="back" style="margin: auto; width: 100%; height: 100%;">
        <div id="slider-wrap">
            <ul id="slider">

                <li id="li1" style="background-image: url(/resources/image/main2/main2_1.png);">
                    <div class="copy">
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5가지의 테마 맛집,카페,숙소,명소, </span><br>
                        <span>액티비티를  한눈에 쉽게 찾아볼수 있습니다.</span><br>




                    </div> <!--    <div class="inimg" >
                 <img src="resources/image/1.png">
             </div>   -->
                </li>

                <li id="li2" style="background-image: url(/resources/image/main2/main2_2.png);">

                    <div class="copy">
                        <span>원하는 장소, 명소등 자신의 여행계획을 </span><br>

                        <span>&nbsp;&nbsp;&nbsp;&nbsp;보다쉽게 정리,계획할수 있습니다.</span><br>


                    </div>
                    <!--   <div class="inimg" >
                   <img src="resources/image/5.png">
               </div>   -->
                </li>

                <li id="li3" style="background-image: url(/resources/image/main2/main2_3.png);">

                    <div class="copy2">
                        <span>자신의 여행계획을 다른회원들과 </span><br>

                        <span>공유하거나 정보를 교환해보세요.</span><br>


                    </div>
                    <!--  <div class="inimg" >
                   <img src="resources/image/1.jpg">
               </div>   -->
                </li>
                <li id="li4" style="background-image: url(/resources/image/main2/main2_4.png);">

                    <div class="copy3">
                        <span>업주용아이디를 통해 자신의</span><br>

                        <span>가게를 등록하실수 있습니다.</span><br>


                    </div>
                    <!--
                <div class="inimg" >
                   <img src="resources/image/5.jpg">
               </div>   -->
                </li>
                <li id="li5" style="background-image: url(/resources/image/main2/main2_5.png);">
                    <div class="copy">
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;등록한 가게들을 한눈에 보실수있으며 </span><br>

                        <span>다른업주들과 정보교환도 하실수 있습니다.</span><br>


                    </div>
                    <!--   <div class="inimg" >
                   <img src="resources/image/2.jpg">
               </div>  -->
                </li>
            </ul>

            <div class="slider-btns" id="next">
                <span>▶</span>
            </div>
            <div class="slider-btns" id="previous">
                <span>◀</span>
            </div>

            <div id="slider-pagination-wrap">
                <ul>
                </ul>
            </div>
        </div>
    </div>

    <!-- 2번째 페이지 스크립트 -->
    <script>
        // 2번스크립
        //slide-wrap
        var slideWrapper = document.getElementById('slider-wrap');
        //current slideIndexition
        var slideIndex = 0;
        //items
        var slides = document.querySelectorAll('#slider-wrap ul li');
        //number of slides
        var totalSlides = slides.length;
        //get the slide width
        var sliderWidth = slideWrapper.clientWidth;
        //set width of items
        slides.forEach(function (element) {
            element.style.width = sliderWidth + 'px';
        })
        //set width to be 'x' times the number of slides
        var slider = document.querySelector('#slider-wrap ul#slider');
        slider.style.width = sliderWidth * totalSlides + 'px';

        // next, prev
        var nextBtn = document.getElementById('next');
        var prevBtn = document.getElementById('previous');
        nextBtn.addEventListener('click', function () {
            plusSlides(1);
        });
        prevBtn.addEventListener('click', function () {
            plusSlides(-1);
        });

        // hover
        slideWrapper.addEventListener('mouseover', function () {
            this.classList.add('active');
            /*   clearInterval(autoSlider); */
        });
        slideWrapper.addEventListener('mouseleave', function () {
            this.classList.remove('active');
            /*  autoSlider = setInterval(function () {
                plusSlides(1);
            }, 3000); */
        });


        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlides(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            slideIndex = n;
            if (slideIndex == -1) {
                slideIndex = totalSlides - 1;
            } else if (slideIndex === totalSlides) {
                slideIndex = 0;
            }

            slider.style.left = -(sliderWidth * slideIndex) + 'px';
            pagination();
        }

        //pagination
        slides.forEach(function () {
            var li = document.createElement('li');
            document.querySelector('#slider-pagination-wrap ul').appendChild(li);
        })

        function pagination() {
            var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
            dots.forEach(function (element) {
                element.classList.remove('active');
            });
            dots[slideIndex].classList.add('active');
        }

        pagination();
        var autoSlider = setInterval(function () {
            plusSlides(1);
        }, 3000);
        //2번스크립끝
    </script>

</div>
<!-- 세번째 페이지 -->
<div class="box" id="div3">
    <div class="back">
        <figure class="snip1200">
            <img src="/resources/image/main3/main3_food.png" alt="sq-sample27" />
            <figcaption>
                <p>서울시에 숨어있는 맛집들<br /> 회원님들도 보지못한<br /> 숨은맛집들을 알려드리겠습니다.</p>
                <div class="heading">
                    <h2>Restaurant</h2>
                </div>
            </figcaption>
            <a href="foodList"></a>
        </figure>
    </div>
    <div class="back">
        <figure class="snip1200">
            <img src="/resources/image/main3/main3_cafe.png" alt="sq-sample27" />
            <figcaption>
                <p>조금만 걸어가면 보이는 프렌차이즈카페<br /> 저희 DYS는 색다른 카페들을<br /> 소개해드립니다.</p>
                <div class="heading">
                    <h2>Coffee&Dessert</h2>
                </div>
            </figcaption>
            <a href="cafeList"></a>
        </figure>
    </div>
    <div class="back">
        <figure class="snip1200">
            <img src="/resources/image/main3/main3_hotel2.png" alt="sq-sample27" />
            <figcaption>
                <p>여행중 지치신 회원님들에게 편안한<br /> 잠자리와 쉼터를 제공합니다.</p>
                <div class="heading">
                    <h2>Accommodations</h2>
                </div>
            </figcaption>
            <a href="hotelList"></a>
        </figure>
    </div>
    <div class="back">
        <figure class="snip1200">
            <img src="/resources/image/main3/main3_attr.png" alt="sq-sample27" />
            <figcaption>
                <p>목적지를 정하지 못하신 회원님들<br /> 서울이 처음이더라도 어디가 가장 유명한지 <br />한눈에 보여드립니다.</p>
                <div class="heading">
                    <h2>Attraction</h2>
                </div>
            </figcaption>
            <a href="attractionList"></a>
        </figure>
    </div>
    <div class="back">
        <figure class="snip1200">
            <img src="/resources/image/main3/main3_acti.png" alt="sq-sample27" />
            <figcaption>
                <p>서울에서 즐길수있는 다양한 놀거리<br /> 다양한 테마를 회원님들께<br /> 소개해드리고 있습니다.</p>
                <div class="heading">
                    <h2>Activity</h2>
                </div>
            </figcaption>
            <a href="actiList"></a>
        </figure>
    </div>
</div>


<div class="box" id="div4" style=" height: 65px;
    margin-top: -5%;">
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>




