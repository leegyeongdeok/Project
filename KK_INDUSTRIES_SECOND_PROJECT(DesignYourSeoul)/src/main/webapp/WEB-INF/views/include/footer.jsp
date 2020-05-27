<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link
			href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese"
			rel="stylesheet">

	<style>
		.footer_back {
			background-color: #fff2f2;
			width: 100%;
			height: 68px;
			margin-top: 3%;
		}


		.footer_box {
			margin: 0 auto;
			width: 700px;
			height: 65px;
		}

		.top {
			margin-bottom: 0%;
			padding-top: 1%;
			height: 30px;
			width: 450px;
		}

		.top>a {
			margin-right: 3%;
		}

		.body a {
			margin-right: 1%;
			margin-top: 2%;
		}

		.body {
			margin-bottom: 0%;
			height: 22px;
			width: 450px;
			float: left;
		}

		.foot a {
			margin-right: 1%;
		}

		.foot {
			height: 22px;
		}

		.title_name {
			font-family: Big Shoulders Display;
		}

		.body a, .foot a {
			font-size: 10pt;
			color: #b3a3a3;
		}

		.footer_image {
			position: relative;
			margin-top: -36px;
			margin-left: 130px;
			width: 85px;
			height: 65px;
		}
	</style>


</head>
<body>
<div class="footer_back">
	<div class="footer_box">
		<div class="footer top">
			<a class="title_name" href="#"
			   style="color: orange; font-size: 16pt;">Design Your Seoul</a>&nbsp;<a
				href="#" style="font-size: 12pt; color:#b3a3a3;">공지사항</a>
		</div>
		<div class="footer body">
			<a href="#">회사소개</a><a>·</a> <a href="#">문의사항</a><a>·</a><a href="#">게시판</a><a>·</a>
			<a href="#">이용약관</a><a>·</a><a href="#">마이페이지</a><a>·</a> <a
				href="#">고객센터</a>
		</div>
		<img class="footer_image" src="/resources/image/logo/footlogo.png">

	</div>
</div>
</body>
</html>