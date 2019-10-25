<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>내 정보관리</title>

    <style>
        div {
            margin: 0;
            padding: 0;
            display: block;
        }

        .mypage > ul, .mypage > li {
            list-style: none;
        }

        /* 첫번쨰 div */
        #mypageback {
            min-width: 1180px;
        }

        #mypage {
            width: 740px;
            margin: 0 auto;
            letter-spacing: -1px;
            height: 1080px;
            /* margin-left: 24%; */
        }

        .line {
            border-bottom: 1px solid black;
            margin-top: 3%;
        }

        /* 타이틀 */
        .mycourse_title h1 {
            height: 22px;
            margin-left: 33px;
            padding: 20px 0;
            font-size: 35px;
            color: #000;
            line-height: 0px;
            text-align: center;
            font-weight: 100;
        }

        /* 마우스 올려놓을때 */
        .info_tit:hover {
            border-radius: 0 50px 50px 0;
            background-color: #eee;
        }

        /* 마이페이지 body */
        #mypagemain {
            float: left;
            overflow: hidden;
            width: 100%;
            padding: 0px 0 72px;
            margin-top: 5%;
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

        .sidemenu_link {
            padding-left: 1%;
        }

        .mysidemenu .myinfo {
            padding: 6px 0 37px;
        }

        .mysidemenu .myinfo li {
            overflow: hidden;
            font-size: 13px;
            line-height: 24px;
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
            font-size: 22px;
            font-weight: 100;
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

        /* 코스목록 css */

        .photo > a > img {
            margin-top: -10%;
            width: 170px;
            height: 170px;
        }

        .list_thumType {
            width: 700px;
        }

        .list_thumType > li.bdr_nor {
            margin-top: 4%;
            border-bottom: 1px solid #e6e6e6;
            margin-bottom: 0%;
            padding-bottom: 4%;
        }

        .list_thumType > li {
            position: relative;
            padding: 10px 0;
        }

        .list_thumType > li .photo {
            position: absolute;
            left: 0;
            width: 140px;
            height: 94px;
        }

        .list_thumType > li .photo {
            position: absolute;
            left: 0;
            width: 140px;
            height: 94px;
        }

        .list_thumType > li .area_txt {
            min-height: 94px;
            margin-left: 190px;
            padding-right: 10px;
        }

        .list_thumType > li .area_txt .tit {
            margin-top: -5px;
            padding-bottom: 5px;
        }

        .list_thumType > li .area_txt .tit a {
            overflow: hidden;
            display: inline-block;
            width: 100%;
            font-weight: bold;
            font-size: 20px;
            color: #000;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .list_thumType > li .area_txt .tag {
            overflow: hidden;
            width: 100%;
            padding-top: 5px;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .list_thumType > li .area_txt .tag > span {
            padding-right: 2px;
            font-size: 14px;
        }

        .list_thumType > li .area_txt .ar_tag {
            padding-top: 10px;
        }

        .list_thumType > li .area_txt .ar_tag > span {
            display: inline-block;
            margin: 0 10px 10px 0;
            padding: 2px 10px;
            background: orange;
            color: #fff;
            border-radius: 11px;
        }

        /* 좋아요 이미지 */
        .good_image {
            width: 20px;
            height: 20px;
            float: left;
        }

        .good_count {
            margin-left: 2%;
            font-size: 12pt;
            float: left;
            margin-right: 2%;
        }

        .view_image {
            width: 20px;
            height: 20px;
            float: left;
            margin-left: 4%;
        }

        .view_count {
            margin-left: 2%;
            font-size: 12pt;
            float: left;
            margin-right: 2%;
        }

        .save_image {
            width: 20px;
            height: 20px;
            float: left;
            margin-left: 4%;
        }

        .save_count {
            margin-left: 2%;
            font-size: 12pt;
            float: left;
            margin-right: 2%;
        }


        /* 페이지 버튼 */
        .page_btn {
            margin-top: 5%;
        }

        .page_btn ul {
            width: 35%;
            margin: 0 auto;
            margin-left: 43%;
        }

        .page_btn li {
            list-style: none;
        }

        .page_btn input {
            clear: none;
            border: 0px none;
            float: none;
            background-color: transparent;
            width: 30px;
            height: 25px;
            font-size: 15pt;
        }

        .page_btn input:HOVER {
            cursor: pointer;
        }


    </style>


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
            <div class="mycourse_title">
                <h1>내 코스 목록</h1>
            </div>
            <div class="line"></div>
            <div class="box_leftType1">
                <ul class="list_thumType flnon">

                    <li class="bdr_nor"><div class="photo">
                        <a href="javascript:"> <img src="/resources/image/courseranking/courseRank6.png"
                                                    alt="서울은 처음이에요">
                        </a>
                    </div>
                        <div class="area_txt">

                            <div class="tit">
                                <a href="javascript:">서울은 처음이에요 (design By Little_K)</a>
                                <img class="good_image" src="/resources/image/myinfo/good.png">
                                <p class="good_count">11</p>
                                <img class="view_image" src="/resources/image/myinfo/viewcount.png">
                                <p class="view_count">75</p>
                                <img class="save_image" src="/resources/image/myinfo/save.png">
                                <p class="save_count" id="">213</p>
                            </div>

                            <p class="tag">
                                총거리 <span>83</span>Km
                            </p>
                            <p class="ar_tag">
                                <span>암사동 광나루한강공원</span> <span>상일동 강동반상</span> <span>천호동 풀팬</span>
                                <span>천호동 레츠팟</span> <span>길동 아르고호텔</span>
                            </p>
                        </div>
                    </li>





                </ul>
                <div class="page_btn">
                    <ul>
                        <li>
                            <input type="button" value="&lt;">
                            <input type="button" value="1">
                            <input type="button" value="&gt;">
                        </li>

                    </ul>
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

    function detail() {
        location.href ='courseRankingDetail?id='+id+"&name="+name;
    }

</script>

</body>
</html>