<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
		  rel="stylesheet">

	<style>
		* {
			margin: 0;
			padding: 0;
		}

		.totalmenu_text {
			color: #ff9900;
			font-size: 14pt;
			font-family: Big Shoulders Display;
		}

		a:link {
			color: black;
			text-decoration: none;
		}

		a:visited {
			color: black;
			text-decoration: none;
		}

		#menu2 {
			float: left;
			margin-left: 2%;
			height: 50px;
			width: 50%;
			z-index: 9900;
			padding-top: 1%;
		}

		#menu2 .login > li {
			display: inline;
			float: left;
			width: 15%;
			height: 50px;
			line-height: 50px;
			text-align: center;
			position: relative;
			margin: 0;
			padding: 0;
		}

		#menu2 ul {
			width: 100%;
			margin: 0 auto;
		}

		#menu1 {
			margin-left: 67%;
			height: 50px;
			width: 10%;
			z-index: 9900;
			padding-top: 1%;
		}

		#menu1 ul li {
			display: block;
			z-index: 9999;
		}

		#menu1 ul {
			width: 560px;
			margin: 0 auto;
			padding-right: 0%;
		}

		#menu1 .main {
			margin-left: 10%;
		}

		#menu1 .main .sub {
			position: absolute;
			top: 50px;
			left: 0%;
			width: 100%;
			display: none;
		}

		#menu1 .main > li {
			display: inline;
			float: left;
			width: 140px;
			height: 50px;
			line-height: 50px;
			text-align: center;
			position: relative;
			margin: 0;
		}

		#menu1 .main > li:hover .sub {
			display: block;
		}

		#menu1 .main > li a {
			display: block;
		}

		/* #menu1 .main .sub {
            position: absolute;
            top: 50px;
            left: 0%;
            width: 100%;
            display: none;
        } */
		#menu1 .main .sub li {
			position: relative;
			padding: 0px 0px;
			background: linear-gradient(to right, #f9ff00, #ffa500ba);
		}

		.sub li a > p {
			color: #ff00004f;
		}

		#menu1 .main .sub li a:hover {
			background: #36FF96;
		}

		/* 메뉴 타이틀 마우스 오버시 색변경 */
		.main li:hover {
			background-color: #848CB5;
		}

		/* 로그아웃버튼 */
		.logout_button {
			cursor: pointer;
			color: orange;
			font-size: 12px;
		}

	</style>

</head>
<body id="LoginMenuBody">

<%
	String account = request.getParameter("id");
	String name = request.getParameter("name");
%>

<input id="account" type="hidden" value="<%=account%>">
<input id="name" type="hidden" value="<%=name%>">

<div id="totalmenu">
	<div id="menu2">
		<ul class="login">
			<li><a onclick="goHome()">
				<image src="/resources/image/logo/headerlogo.png" style="width: 60px; height: auto;
		margin-left: -30px"></image>
			</a>
			<li style="width: 200px;"><a onclick="myPageHome()"><p class="totalmenu_text" style="font-size: 13pt;"><span
					id="user_nickname"><%=name%></span> 님 환영합니다.</p></a></li>
			<li style="width: 60px;"><a onclick="locLogout()" class="logout_button">로그아웃</a></li>
		</ul>
	</div>

	<div id="menu1">
		<ul class="main">
			<li><a href="#"><p class="totalmenu_text">회사</p></a>
				<ul class="sub">
					<li><a onclick="companyInfo()"><p class="totalmenu_text">회사소개</p></a></li>
				</ul>
			</li>

			<li><a href="#"><p class="totalmenu_text">코스</p></a>
				<ul class="sub">
					<li><a onclick="courseRanking()"><p class="totalmenu_text">코스랭킹</p></a></li>
					<li><a href="#"><p class="totalmenu_text">코스짜기</p></a></li>
				</ul>
			</li>
			<li><a href="#"><p class="totalmenu_text">테마</p></a>
				<ul class="sub">
					<li><a onclick="foodList()"><p class="totalmenu_text">맛집</p></a></li>
					<li><a onclick="cafeList()"><p class="totalmenu_text">카페</p></a></li>
					<li><a onclick="AccommodationList()"><p class="totalmenu_text">숙소</p></a></li>
					<li><a onclick="attractionList()"><p class="totalmenu_text">명소</p></a></li>
					<li><a onclick="activityList()"><p class="totalmenu_text">액티비티</p></a></li>
				</ul>
			</li>
			<li><a href="#"><p class="totalmenu_text">고객센터</p></a>
				<ul class="sub">
					<li><a onclick="noticePage()"><p class="totalmenu_text">공지사항</p></a></li>
					<li><a onclick="questionPage()"><p class="totalmenu_text">문의사항</p></a>
					<li><a onclick="boardPage()"><p class="totalmenu_text">게시판</p></a>
				</ul>
			</li>
		</ul>
	</div>
</div>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">

	var id = $("#account").val();
	var name = $("#name").val();


	function goHome() {

		location.href = "/dys?id=" + id + "&name=" + name;
	}

	function myPageHome() {

		location.href = "/dys/myPage/Home?id=" + id + "&name=" + name;
	}

	function companyInfo() {
		location.href = "/dys/Intro?id=" + id +"&name=" + name;
	}

	function activityList() {

		location.href = "/dys/activityList?id=" + id+ "&name=" + name+"&type=general";
	}

	function attractionList() {

		location.href = "/dys/attractionList?id=" + id+ "&name=" + name+"&type=general";
	}

	function cafeList() {

		location.href = "/dys/cafeList?id=" + id+ "&name=" + name+"&type=general";
	}

	function foodList() {

		location.href = "/dys/foodList?id=" + id+ "&name=" + name+"&type=general";
	}

	function AccommodationList() {

		location.href = "/dys/hotelList?id=" + id+ "&name=" + name+"&type=general";
	}
	
	function noticePage() {
		location.href = "/dys/Notice?id="+id+"&name="+name+"&type=general&page=1"
	}

	function questionPage() {
		location.href = "/dys/Question?id="+id+"&name="+name+"&type=general&page=1";
	}

	function boardPage() {
		location.href = "/dys/Board?id="+id+"&name="+name+"&type=general&page=1";
	}

	function locLogout() {
		var out = confirm("정말 로그아웃 하시겠습니까?");

		if(out){
			location.href = "/dys";
		}
	}
	function courseRanking() {
		location.href = "/dys/courseRanking?id="+id+"&name="+name+"&type=general";
	}


</script>

</body>
</html>