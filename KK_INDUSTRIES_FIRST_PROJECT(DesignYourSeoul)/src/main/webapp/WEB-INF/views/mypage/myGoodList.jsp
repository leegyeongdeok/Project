<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>내 정보관리</title>

    <link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
          rel="stylesheet">

    <style>
        div {
            margin: 0;
            padding: 0;
            display: block;
        }

        ul, li {
            list-style: none;
        }

        /* 첫번쨰 div */
        #mypageback {
            min-width: 1180px;
        }

        #mypage {
            width: 1260px;
            margin: 0 auto;
            letter-spacing: -1px;
            height: 2235px;
            margin-left: 368px;
        }

        /* 타이틀 */
        .mypage_tit {
            overflow: hidden;
            width: 1000px;
            height: 60px;
            padding-top: 50px;
            border-bottom: 2px solid #000;
            text-align: left;
        }

        .mypage_tit {
            overflow: hidden;
            width: 100%;
            height: 60px;
            padding-top: 50px;
            border-bottom: 2px solid #000;
            text-align: left;
        }

        .ptitle {
            width: 190px;
            height: 45px;
            background-position: 0 0;
            font-size: 34px;
        }

        /* 마이페이지 body */
        #mypagemain {
            float: left;
            overflow: hidden;
            width: 93%;
            padding: 25px 0 72px;
            margin-top: 1%;
        }

        /* 마이페이지 사이드 메뉴바 */
        #myside {
            float: left;
            width: 250px;
            border: 0 none;
            background: 0;
            margin-top: 5%;
            margin-left: 0%;
            position: fixed;
        }

        .mysidemenu {
            overflow: hidden;
            width: 250px;
            padding-top: 4%;
            text-align: left;
        }

        .mysidemenu .info_tit {
            display: block;
            height: 41px;
            font-size: 17px;
            color: #000;
            line-height: 28px;
            padding-bottom: 0px;
            padding-left: 17%;
            padding-top: 10px;
            margin-top: -14%;
            margin-bottom: 5%;
            width: 207px;
        }

        .mysidemenu .myinfo {
            padding: 6px 0 37px;
        }

        .mysidemenu .myinfo li {
            overflow: hidden;
            font-size: 13px;
            line-height: 24px;
        }

        /* 마우스 올릴때 */
        .info_tit:hover {
            border-radius: 0 50px 50px 0;
            background-color: #eee;
        }


        /* 링크 색 */
        .myinfo .link_myinfo {
            float: left;
            color: #252525;
            text-decoration: none;
        }

        .mysidemenu .myinfo .on .link_myinfo {
            color: #ef4323;
        }

        /* 정보 보여주기 시작 */

        .info_title {
            overflow: hidden;
            width: 795px;
            padding-top: 27px;
            padding-bottom: 0px;
            font-size: 15px;
            line-height: 18px;
            text-align: center;
            margin: 0 auto;
        }

        .mypagebox #mybody {
            width: 100%;
            overflow: hidden;
            margin: 0 auto;
        }

        .mypagebox .mybody_cont {
            overflow: hidden;
            width: 100%;
            background-color: #fff;
            letter-spacing: 0;
            margin: 0 auto;
        }

        .cont_personal {
            overflow: hidden;
            text-align: left;
        }

        .cont_personal .tit_personal {
            height: 22px;
            margin-left: 33px;
            padding: 20px 0;
            font-size: 35px;
            color: #000;
            line-height: 0px;
            text-align: center;
            font-weight: 100;
        }

        .cont_personal #title_p {
            text-align: center;
            padding-bottom: 4%;
        }

        .tit_personal .changeinfo {
            margin-left: 75%;
        }

        .cont_personal .basic_info {
            border: 1px solid #e6e6e6;
            border-radius: 8px;
            height: 2020px;
        }

        .cont_personal .basic_info .tit_basic {
            float: left;
            width: 134px;
            padding: 0 37px;
            letter-spacing: -1px;
        }

        .cont_personal .basic_info .box_basic {
            float: left;
            width: 450px;
            padding-left: 40px;
        }

        /* 마우스 올려놓을때 */

        /* 글씨 사이즈 */
        .tit_basic {
            font-size: 12px;
            color: #00000073;
        }

        .box_basic {
            font-size: 17px;
            font-weight: 100;
        }

        .pro_title {
            font-size: 30px;
            font-weight: 600;
            color: orange;
            font-family: Big Shoulders Display;
        }

        .title_font {
            font-size: 17px;
            color: #000000a3;
        }

        /* 사이드 이미지 */

        .myinfo_image {
            width: 20px;
            height: 20px;
            float: left;
            padding-right: 6%;
            padding-left: 10%;
            margin-top: 1%;
        }

        .sidemenu_link {
            padding-left: 1%;
        }

        /* 좋아요 리스트 이미지 */

        #image_ul1 {
            padding-left: 28px;
        }

        #image_ul2 {
            padding-left: 28px;
        }

        #image_ul3 {
            padding-left: 28px;
        }

        #image_ul4 {
            padding-left: 28px;
        }

        #image_ul5 {
            padding-left: 28px;
        }

        a > img:HOVER {
            opacity: 0.2;
        }

        a > img:HOVER .image_text {
            opacity: 1;
        }

        .image_li {
            width: 200px;
            margin-bottom: 5%;
            margin-right: 1%;
            float: left;
            background-color: black;
            height: 200px;
        }

        .list_image {
            width: 200px;
            height: 200px;
            float: left;
        }

        .good_type {
            width: 23px;
            height: 23px;
            padding-left: 45%;
            padding-top: 7%;
        }

        /* 이전,다음 버튼 위치 */

        #image_back {
            position: relative;
            top: 120px;
            left: 2px;
        }

        #image_next {
            position: relative;
            top: 122px;
            left: 1130px;
        }

        .button_image1 {
            width: 15px;
        }

        .button_image2 {
            width: 13px;
        }

        /* 이미지 텍스트 */
        a > span {
            overflow: hidden;
            background-color: black;
            position: relative;
            z-index: 10;
        }

        span > p {
            position: relative;
            top: -167px;
            text-align: center;
            height: 100px;
            color: orange;
            font-size: 10pt;
            font-weight: 100;
        }

        span > img:HOVER {
            opacity: 0.2;
        }


    </style>

    <script type="text/javascript">
        /* 초기화 initView(ul엘리먼트의 id, 최초 보여지는 li 엘리먼트 갯수, display 값) */
        function initView(el_id, view_item_count, style) {
            var menu = document.getElementById(el_id);
            var menu_list = menu.getElementsByTagName('li');
            var menu_count = menu_list.length;
            style = (typeof (style) != 'undefined') ? style : 'block';

            for (var i = 0; i < menu_count; i++) {
                if (i < view_item_count) menu_list[i].style.display = style;
                else menu_list[i].style.display = 'none';
            }
        }

        /* 목록 이동 moveList(이동시킬방향 prev 또는 next, 이동시킬 ul 엘리먼트의 id, 보여질 목록 갯수, 이동시킬 갯수, display 값) */
        function moveList(direction, el_id, view_item_count, scroll_count, style) {
            var menu = document.getElementById(el_id);
            var menu_list = menu.getElementsByTagName('li');
            var menu_count = menu_list.length;
            var start_no = 0;

            style = (typeof (style) != 'undefined') ? style : 'block';

            // 현재 보여지고 있는 엘리먼트의 시작을 확인
            for (var i = 0; i < menu_count; i++) {
                if (menu_list[i].style.display == style) {
                    start_no = i;
                    break;
                }
            }

            // 방향에 따른 이동
            if (direction == 'next') {
                if (menu_list[menu_count - 1].style.display == style) return false;
                else {
                    for (var i = 0; i < menu_count; i++) {
                        if (i >= start_no + scroll_count && i < start_no + scroll_count + view_item_count) {
                            menu_list[i].style.display = style;
                        } else {
                            menu_list[i].style.display = 'none';
                        }
                    }
                }
            } else if (direction == 'prev') {
                if (menu_list[0].style.display == style) return false;
                else {
                    for (var i = 0; i < menu_count; i++) {
                        if (i >= start_no - scroll_count && i < start_no - scroll_count + view_item_count) {
                            menu_list[i].style.display = style;
                        } else {
                            menu_list[i].style.display = 'none';
                        }
                    }
                }
            }
        }
    </script>


</head>
<body style="overflow: auto;">

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
%>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">


<jsp:include page="../include/loginHeader.jsp" flush="false">
    <jsp:param name="userName" value="<%=name%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>

<div id="mypageback">
    <!-- mypage start -->
    <div id="myside">
        <div class="mysidemenu">
            <a class="sidemenu_link" onclick="myPageHome()">
                <image class="myinfo_image" src="/resources/image/myinfo/good.png">
                    <strong class="info_tit">홈</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myInfo()">
                <image class="myinfo_image" src="/resources/image/myinfo/myinfo.png">
                    <strong class="info_tit">개인 정보</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myGoodList()">
                <image class="myinfo_image" src="/resources/image/myinfo/goodlist.png">
                    <strong class="info_tit">좋아요 리스트</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myCourseList()">
                <image class="myinfo_image" src="/resources/image/myinfo/mycourse.png">
                    <strong class="info_tit">내코스 목록</strong></image>
            </a>

            <a class="sidemenu_link" onclick="saveCourseList()">
                <image class="myinfo_image" src="/resources/image/myinfo/savecourse.png">
                    <strong class="info_tit">저장한 코스 목록</strong></image>
            </a>

            <a class="sidemenu_link" onclick="memberCancel()">
                <image class="myinfo_image" src="/resources/image/myinfo/membercancel.png">
                    <strong class="info_tit">회원탈퇴</strong></image>
            </a>
        </div>
    </div>
    <div id="mypage" class="mypagebox">
        <div id="mypagemain">

            <!-- 좋아요 리스트 칸 -->
            <div id="mybody">
                <div class="mybody_cont">
                    <div class="cont_personal">
                        <h3 class="tit_personal">좋아요 리스트</h3>
                        <p class="title_font" id="title_p">맘에 들었던 가게와 장소들을 한눈에 보실수 있습니다.</p>

                        <!-- 숙소 리스트 시작 -->
                        <div class="basic_info" style="display: block">
                            <!-- 맛집 리스트 시작 -->
                            <div class="info_title">
                                <h3 class="pro_title">Restaurant</h3><br>
                            </div>

                            <a id="image_back" href="#"
                               onclick="moveList('prev', 'image_ul2', 5, 5, 'inline');return false;"><img
                                    class="button_image1" src="/resources/image/slider/left.png"></a>
                            <a id="image_next" href="#"
                               onclick="moveList('next', 'image_ul2', 5, 5, 'inline');return false;"><img
                                    class="button_image2" src="/resources/image/slider/right.png"></a>

                            <!-- 이미지 시작 -->
                            <ul id="image_ul2">
                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage1" class="list_image" src="/resources/image/list-2food/1.png">
                           <p>
                           <strong id="foodName1">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd1">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType1">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone1">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood1" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage2" class="list_image" src="/resources/image/list-2food/2.png">
                           <p>
                           <strong id="foodName2">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd2">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType2">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone2">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood2" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage3" class="list_image" src="/resources/image/list-2food/3.png">
                           <p>
                           <strong id="foodName3">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd3">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType3">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone3">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood3" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage4" class="list_image" src="/resources/image/list-2food/4.png">
                           <p>
                           <strong id="foodName4">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd4">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType4">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone4">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood4" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage5" class="list_image" src="/resources/image/list-2food/5.png">
                           <p>
                           <strong id="foodName5">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd5">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType5">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone5">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood5" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage6" class="list_image" src="/resources/image/list-2food/6.png">
                           <p>
                           <strong id="foodName6">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd6">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType6">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone6">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood6" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage7" class="list_image" src="/resources/image/list-2food/7.png">
                           <p>
                           <strong id="foodName7">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd7">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType7">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone7">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood7" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage8" class="list_image" src="/resources/image/list-2food/8.png">
                           <p>
                           <strong id="foodName8">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd8">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType8">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone8">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood8" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage9" class="list_image" src="/resources/image/list-2food/9.png">
                           <p>
                           <strong id="foodName9">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd9">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType9">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone9">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood9" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="foodImage10" class="list_image" src="/resources/image/list-2food/10.png">
                           <p>
                           <strong id="foodName10">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="foodAdd10">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="foodType10">종류: 일식</strong>
                           <br/><br/>
                           <strong id="foodPhone10">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="foodGood10" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>
                            </ul>
                            <script type="text/javascript">
                                initView('image_ul2', 5, 'inline');
                            </script>


                            <!-- 카페 리스트 시작 -->
                            <div class="info_title">
                                <h3 class="pro_title">Coffee&Dessert</h3><br>
                            </div>

                            <a id="image_back" href="#"
                               onclick="moveList('prev', 'image_ul3', 5, 5, 'inline');return false;"><img
                                    class="button_image1" src="/resources/image/slider/left.png"></a>
                            <a id="image_next" href="#"
                               onclick="moveList('next', 'image_ul3', 5, 5, 'inline');return false;"><img
                                    class="button_image2" src="/resources/image/slider/right.png"></a>

                            <!-- 이미지 시작 -->
                            <ul id="image_ul3">
                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage1" class="list_image" src="/resources/image/list-3cafe/1.png">
                           <p>
                           <strong id="coffeeName1">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd1">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType1">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone1">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood1" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage2" class="list_image" src="/resources/image/list-3cafe/2.png">
                           <p>
                           <strong id="coffeeName2">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd2">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType2">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone2">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood2" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage3" class="list_image" src="/resources/image/list-3cafe/3.png">
                           <p>
                           <strong id="coffeeName3">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd3">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType3">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone3">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood3" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage4" class="list_image" src="/resources/image/list-3cafe/4.png">
                           <p>
                           <strong id="coffeeName4">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd4">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType4">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone4">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood4" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage5" class="list_image" src="/resources/image/list-3cafe/5.png">
                           <p>
                           <strong id="coffeeName5">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd5">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType5">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone5">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood5" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage6" class="list_image" src="/resources/image/list-3cafe/6.png">
                           <p>
                           <strong id="coffeeName6">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd6">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType6">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone6">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood6" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage7" class="list_image" src="/resources/image/list-3cafe/7.png">
                           <p>
                           <strong id="coffeeName7">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd7">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType7">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone7">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood7" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage8" class="list_image" src="/resources/image/list-3cafe/8.png">
                           <p>
                           <strong id="coffeeName8">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd8">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType8">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone8">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood8" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage9" class="list_image" src="/resources/image/list-3cafe/9.png">
                           <p>
                           <strong id="coffeeName9">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd9">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType9">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone9">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood9" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="coffeeImage10" class="list_image" src="/resources/image/list-3cafe/10.png">
                           <p>
                           <strong id="coffeeName10">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="coffeeAdd10">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="coffeeType10">종류: 일식</strong>
                           <br/><br/>
                           <strong id="coffeePhone10">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="coffeeGood10" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>
                            </ul>
                            <script type="text/javascript">
                                initView('image_ul3', 5, 'inline');
                            </script>

                            <!-- 숙소 리스트 시작 -->
                            <div class="info_title">
                                <h3 class="pro_title">Accommodations</h3><br>
                            </div>

                            <a id="image_back" href="#"
                               onclick="moveList('prev', 'image_ul1', 5, 5, 'inline');return false;"><img
                                    class="button_image1" src="/resources/image/slider/left.png"></a>
                            <a id="image_next" href="#"
                               onclick="moveList('next', 'image_ul1', 5, 5, 'inline');return false;"><img
                                    class="button_image2" src="/resources/image/slider/right.png"></a>

                            <!-- 이미지 시작 -->
                            <ul id="image_ul1">

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage1" class="list_image" src="/resources/image/list-1hotel/1.png">
                           <p>
                           <strong id="hotelName1">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd1">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType1">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone1">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood1" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage2" class="list_image" src="/resources/image/list-1hotel/2.png">
                           <p>
                           <strong id="hotelName2">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd2">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType2">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone2">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood2" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage3" class="list_image" src="/resources/image/list-1hotel/3.png">
                           <p>
                           <strong id="hotelName3">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd3">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType3">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone3">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood3" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage4" class="list_image" src="/resources/image/list-1hotel/4.png">
                           <p>
                           <strong id="hotelName4">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd4">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType4">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone4">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood4" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage5" class="list_image" src="/resources/image/list-1hotel/5.png">
                           <p>
                           <strong id="hotelName5">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd5">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType5">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone5">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood5" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage6" class="list_image" src="/resources/image/list-1hotel/6.png">
                           <p>
                           <strong id="hotelName6">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd6">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType6">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone6">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood6" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage7" class="list_image" src="/resources/image/list-1hotel/7.png">
                           <p>
                           <strong id="hotelName7">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd7">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType7">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone7">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood7" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage8" class="list_image" src="/resources/image/list-1hotel/8.png">
                           <p>
                           <strong id="hotelName8">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd8">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType8">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone8">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood8" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage9" class="list_image" src="/resources/image/list-1hotel/9.png">
                           <p>
                           <strong id="hotelName9">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd9">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType9">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone9">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood9" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="hotelImage10" class="list_image" src="/resources/image/list-1hotel/10.png">
                           <p>
                           <strong id="hotelName10">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="hotelAdd10">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="hotelType10">종류: 호텔</strong>
                           <br/><br/>
                           <strong id="hotelPhone10">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="hotelGood10" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>
                            </ul>
                            <script type="text/javascript">
                                initView('image_ul1', 5, 'inline');
                            </script>


                            <!-- 명소 리스트 시작 -->
                            <div class="info_title">
                                <h3 class="pro_title">Attraction</h3><br>
                            </div>

                            <a id="image_back" href="#"
                               onclick="moveList('prev', 'image_ul4', 5, 5, 'inline');return false;"><img
                                    class="button_image1" src="/resources/image/slider/left.png"></a>
                            <a id="image_next" href="#"
                               onclick="moveList('next', 'image_ul4', 5, 5, 'inline');return false;"><img
                                    class="button_image2" src="/resources/image/slider/right.png"></a>

                            <!-- 이미지 시작 -->
                            <ul id="image_ul4">
                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage1" class="list_image" src="/resources/image/list-4attraction/1.png">
                           <p>
                           <strong id="attrName1">상호: 여의도 한강공원</strong>
                           <br/><br/>
                           <strong id="attrAdd1">주소: 영등포구 여의동로 330</strong>
                           <br/><br/>
                           <strong id="attrType1">종류: 시민공원</strong>
                           <br/><br/>
                           <strong id="attrPhone1">전화: 02-3780-0561</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood1" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage2" class="list_image" src="/resources/image/list-4attraction/2.png">
                           <p>
                           <strong id="attrName2">상호: 아쿠아플라넷63</strong>
                           <br/><br/>
                           <strong id="attrAdd2">주소: 영등포구 63로 50</strong>
                           <br/><br/>
                           <strong id="attrType2">종류: 아쿠아리움</strong>
                           <br/><br/>
                           <strong id="attrPhone2">전화: 1833-7001</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood2" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage3" class="list_image" src="/resources/image/list-4attraction/3.png">
                           <p>
                           <strong id="attrName3">상호: 여의도공원</strong>
                           <br/><br/>
                           <strong id="attrAdd3">주소: 영등포구 여의공원로 120</strong>
                           <br/><br/>
                           <strong id="attrType3">종류: 근린공원</strong>
                           <br/><br/>
                           <strong id="attrPhone3">전화: 02-761-4079</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood3" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage4" class="list_image" src="/resources/image/list-4attraction/4.png">
                           <p>
                           <strong id="attrName4">상호: 여의도물빛광장</strong>
                           <br/><br/>
                           <strong id="attrAdd4">주소: 영등포구 여의도동 84-9</strong>
                           <br/><br/>
                           <strong id="attrType4">종류: 광장</strong>
                           <br/><br/>
                           <strong id="attrPhone4">전화: X</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood4" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage5" class="list_image" src="/resources/image/list-4attraction/5.png">
                           <p>
                           <strong id="attrName5">상호: 문래창작존</strong>
                           <br/><br/>
                           <strong id="attrAdd5">주소: 영등포구 도림로128가길 13-8</strong>
                           <br/><br/>
                           <strong id="attrType5">종류: 문화거리</strong>
                           <br/><br/>
                           <strong id="attrPhone5">전화: X</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood5" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage6" class="list_image" src="/resources/image/list-4attraction/6.png">
                           <p>
                           <strong id="attrName6">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="attrAdd6">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="attrType6">종류: 일식</strong>
                           <br/><br/>
                           <strong id="attrPhone6">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood6" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage7" class="list_image" src="/resources/image/list-4attraction/7.png">
                           <p>
                           <strong id="attrName7">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="attrAdd7">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="attrType7">종류: 일식</strong>
                           <br/><br/>
                           <strong id="attrPhone7">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood7" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage8" class="list_image" src="/resources/image/list-4attraction/8.png">
                           <p>
                           <strong id="attrName8">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="attrAdd8">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="attrType8">종류: 일식</strong>
                           <br/><br/>
                           <strong id="attrPhone8">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood8" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage9" class="list_image" src="/resources/image/list-4attraction/9.png">
                           <p>
                           <strong id="attrName9">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="attrAdd9">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="attrType9">종류: 일식</strong>
                           <br/><br/>
                           <strong id="attrPhone9">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood9" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="attrImage10" class="list_image" src="/resources/image/list-4attraction/10.png">
                           <p>
                           <strong id="attrName10">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="attrAdd10">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="attrType10">종류: 일식</strong>
                           <br/><br/>
                           <strong id="attrPhone10">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="attrGood10" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>
                            </ul>
                            <script type="text/javascript">
                                initView('image_ul4', 5, 'inline');
                            </script>


                            <!-- 놀거리 리스트 시작 -->
                            <div class="info_title">
                                <h3 class="pro_title">Activity</h3><br>
                            </div>

                            <a id="image_back" href="#"
                               onclick="moveList('prev', 'image_ul5', 5, 5, 'inline');return false;"><img
                                    class="button_image1" src="/resources/image/slider/left.png"></a>
                            <a id="image_next" href="#"
                               onclick="moveList('next', 'image_ul5', 5, 5, 'inline');return false;"><img
                                    class="button_image2" src="/resources/image/slider/right.png"></a>

                            <!-- 이미지 시작 -->
                            <ul id="image_ul5">
                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage1" class="list_image" src="/resources/image/list-5acti/1.png">
                           <p>
                           <strong id="actiName1">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd1">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType1">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone1">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood1" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage2" class="list_image" src="/resources/image/list-5acti/2.png">
                           <p>
                           <strong id="actiName2">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd2">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType2">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone2">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood2" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage3" class="list_image" src="/resources/image/list-5acti/3.png">
                           <p>
                           <strong id="actiName3">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd3">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType3">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone3">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood3" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage4" class="list_image" src="/resources/image/list-5acti/4.png">
                           <p>
                           <strong id="actiName4">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd4">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType4">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone4">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood4" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage5" class="list_image" src="/resources/image/list-5acti/5.png">
                           <p>
                           <strong id="actiName5">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd5">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType5">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone5">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood5" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage6" class="list_image" src="/resources/image/list-5acti/6.png">
                           <p>
                           <strong id="actiName6">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd6">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType6">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone6">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood6" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage7" class="list_image" src="/resources/image/list-5acti/7.png">
                           <p>
                           <strong id="actiName7">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd7">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType7">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone7">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood7" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage8" class="list_image" src="/resources/image/list-5acti/8.png">
                           <p>
                           <strong id="actiName8">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd8">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType8">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone8">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood8" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage9" class="list_image" src="/resources/image/list-5acti/9.png">
                           <p>
                           <strong id="actiName9">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd9">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType9">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone9">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood9" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>

                                <li class="image_li">
                                    <a href="#" class="">
                           <span>
                           <img id="actiImage10" class="list_image" src="/resources/image/list-5acti/10.png">
                           <p>
                           <strong id="actiName10">상호: 쿠우쿠우</strong>
                           <br/><br/>
                           <strong id="actiAdd10">주소: 독산동</strong>
                           <br/><br/>
                           <strong id="actiType10">종류: 일식</strong>
                           <br/><br/>
                           <strong id="actiPhone10">전화: 010-1234-1234</strong>
                           </p>
                           </span>
                                    </a>
                                    <img id="actiGood10" class="good_type" src="/resources/image/myinfo/good.png">
                                </li>
                            </ul>
                            <script type="text/javascript">
                                initView('image_ul5', 5, 'inline');
                            </script>


                        </div>
                        <!-- 좋아요 리스트 종료 -->
                    </div>

                </div>

            </div>


        </div>
    </div>
    <!-- //mypage end -->


</div>

<%@ include file="../include/footer.jsp" %>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">

    var id = $("#account").val();
    var name = $("#name").val();

    function myPageHome() {

        location.href = "/dys/myPage/Home?id=" + id+"&name="+name;
    }

    function myInfo() {

        location.href = "/dys/myInfo?id=" + id+"&name="+name;
    }

    function myGoodList() {

        location.href = "/dys/myGoodList?id=" + id+"&name="+name;
    }

    function memberCancel() {

        location.href = "/dys/memberCancel?id=" + id+"&name="+name;
    }

    function myCourseList() {

        location.href = "/dys/myCourseList?id=" + id+"&name="+name;
    }

    function saveCourseList() {

        location.href = "/dys/saveCourseList?id=" + id+"&name="+name;
    }

</script>

</body>
</html>