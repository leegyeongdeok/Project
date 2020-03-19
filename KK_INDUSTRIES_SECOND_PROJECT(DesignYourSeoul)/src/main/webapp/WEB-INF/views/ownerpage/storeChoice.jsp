<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>내 정보관리</title>

	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">

	<style>
		body{
			margin: 0;
			padding: 0;
		}

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
			width: 1000px;
			margin: 0 auto;
			letter-spacing: -1px;
			height: 1000px;
			margin-left: 23%;
		}

		/* 마우스 올려놓을때 */

		.info_tit:hover {
			border-radius: 0 50px 50px 0;
			background-color: #eee;
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
			width: 1000px;
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
			width: 1000px;
			padding: 0px 0 72px;
			margin-top: 2%;
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

		/* 정보 보여주기 시작 */

		.info_title{
			overflow: hidden;
			width: 795px;
			padding: 27px 0 29px;
			font-size: 15px;
			line-height: 18px;
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

		/* 마이홈페이지 설명 css */
		.mypagehome_acount{
			width: 100%;
			margin-bottom: 4%;
		}

		.mypagehome_acount1 {
			width: 96%;
			height: 628px;
			border: 1px solid #e6e6e6;
			border-radius: 8px;
			margin-left: 3%;
			padding-bottom: 5%;
			position: relative;
		}

		/* 이미지 안에 글씨 */
		.chtit1 {
			float: left;
			width: 10%;
			position: absolute;
			top: 20%;
			left: 9%;
			color: white;
			cursor: pointer;
		}

		.chtit2{
			float: left;
			width: 10%;
			position: absolute;
			top: 20%;
			left: 45%;
			color: white;
		}

		.chtit3 {
			float: left;
			width: 10%;
			position: absolute;
			top: 20%;
			left: 76%;
			color: white;
		}

		.chtit4 {
			float: left;
			width: 10%;
			position: absolute;
			top: 67%;
			left: 29%;
			color: white;
		}

		.chtit5 {
			float: left;
			width: 10%;
			position: absolute;
			top: 67%;
			left: 63%;
			color: white;
		}

		.choice_tit {
			font-weight: 100;
			font-size: 30px;
			font-weight: 600;
			color: orange;
			font-family: Big Shoulders Display;
		}


		.choice_image {
			width: 270px;
			height: 270px;
			margin-left: 0%;
			margin-top: 14%;
			border-radius: 10px;
		}

		.choice_image2 {
			width: 270px;
			height: 270px;
			margin-top: 14%;
			border-radius: 10px;
		}

		.image_box {
			width: 30%;
			float:left;
			padding-left: 3%;
		}

		.image_box2 {
			width: 30%;
			float: left;
			padding-left: 19%;
		}

		.image_box3 {
			width: 30%;
			float: left;
			padding-left: 5%;
		}


	</style>


</head>
<body style="overflow: auto; overflow-x:hidden;">
<%@ include file="../include/ownerSide.jsp"%>
<div id="mypageback">
	<!-- mypage start -->
	<div id="mypage" class="mypagebox">
		<div id="mypagemain">

			<!-- 내정보 칸 -->
			<div id="mybody">
				<div class="mybody_cont">
					<div class="cont_personal">
						<!-- 유저닉네임  -->
						<h3 class="tit_personal"><span id="username">등록할 가게 종류를 선택해주세요.</span></h3>
						<p class="title_font" id="title_p">자신이 등록할 가게의 종류를 선택후 가게를 등록해주세요.</p>
						<!-- 정보 시작 -->

					</div>

					<div class="mypagehome_acount">
						<div class="mypagehome_acount1">
							<div class="image_box">
								<a href="foodRegister"><image class="choice_image" src="/resources/image/storechoice/choice_food.png"></a>
							</div>


							<div class="image_box">
								<a href="coffeeRegister"><image class="choice_image" src="/resources/image/storechoice/choice_cafe.png"></a>
							</div>

							<div class="image_box">
								<a href="hotelRegister"><image class="choice_image" src="/resources/image/storechoice/choice_hotel.png"></a>
							</div>

							<div class="image_box2">
								<a href="attractionRegister"><image class="choice_image2" src="/resources/image/storechoice/choice_attr.png"></a>
							</div>

							<div class="image_box3">
								<a href="activityRegister"><image class="choice_image2" src="/resources/image/storechoice/choice_acti.png"></a>
							</div>
						</div>

					</div>

				</div>

			</div>



		</div>
	</div>
	<!-- //mypage end -->


</div>

<%@ include file="../include/footer.jsp"%>
</body>
</html>