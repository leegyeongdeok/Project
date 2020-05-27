<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>내 정보관리</title>


	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">

	<style>
		body {
			margin: 0;
			padding: 0;
		}

		div {
			margin: 0;
			padding: 0;
			display: block;
		}

		section> ul li {
			list-style: none;
			height: 315px;
		}

		/* 첫번쨰 div */
		#mypageback {
			min-width: 1180px;
			margin-top: 1%;
		}

		#mypage {
			width: 1000px;
			margin: 0 auto;
			letter-spacing: -1px;
			height: 100%;
			/* margin-left: 23%; */
			margin-left: 27%;
		}

		/* 타이틀 텍스트 */
		.list_title {
			padding-top: 25px;
		}

		.list_title h1 {
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

		/* 사이드 이미지 */

		.myinfo_image {
			width: 20px;
			height: 20px;
			float: left;
			padding-right: 6%;
			padding-left: 10%;
			margin-top: 1%;
		}


		/* 리스트 목록 */

		.list_body{
			margin-top: -3%;
		}

		.list_img {
			float: left;
			width: 240px;
			height: 240px;
			margin-top: 5%;
		}

		.info_a {
			margin-top:2%;
			margin-left: 35%;
			font-size: 13pt;
		}

		.store_info_title {
			font-size: 13pt;
			margin-top: 2%;
			width: 60%;
			margin-left: 9%;
			float: left;
		}

		.store_info {
			width: 60%;
			margin-left: 20%;
		}

		.store_info_title> a{
			margin-left: 50%;
		}

		.store_info_title> p{
			margin-bottom: 0%;
		}

		.info_name {
			float: left;
		}

		.info_a {
			margin-left: 70%;
			width: 50%;
			margin-bottom: 0%;
			margin-top: 0%;
		}

		.list_body>li {
			width: 100%;
			margin-bottom: 4%;
		}


		/* 탭 css */

		label {
			display: inline-block;
			margin: 0 0 -1px;
			padding: 15px 25px;
			font-weight: 600;
			text-align: center;
			color: #bbb;
			border: 1px solid transparent;
		}

		label:hover {
			color: orange;
			cursor: pointer;
		}

		.list_body>input {
			display: none;
		}

		input:checked + label {
			color: #555;
			border: 1px solid #ddd;
			border-top: 2px solid orange;
			border-bottom: 1px solid #ffffff;
			margin-top: 8%;
		}

		#tab1:checked ~ #content1,
		#tab2:checked ~ #content2,
		#tab3:checked ~ #content3,
		#tab4:checked ~ #content4,
		#tab5:checked ~ #content5 {
			display: block;
		}

		section {
			display: none;
		}

	</style>



</head>
<body style="overflow: auto; overflow-x:hidden;">
<%@ include file="../include/ownerSide.jsp"%>
<div id="mypageback">
	<!-- mypage start -->
	<div id="mypage" class="mypagebox">
		<div class="store_list">
			<div class="list_title">
				<h1>내 가게 리스트</h1>
			</div>

			<div class="list_body">
				<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
				<label for="tab1">Accommodations</label>

				<input id="tab2" type="radio" name="tabs">
				<label for="tab2">Restaurant</label>

				<input id="tab3" type="radio" name="tabs">
				<label for="tab3">Coffee&Dessert</label>

				<input id="tab4" type="radio" name="tabs">
				<label for="tab4">Activity</label>


				<section id="content1">
					<ul>
						<li>
							<img class="list_img" src="/resources/image/storeList/exaple.png">
							<div class="store_info_title">
								<p class="info_a"><a href="">리뷰보러가기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="hotelchange">수정하러가기</a> </p>
								<p class="info_name"> 등급 : </p> <p class="store_info" id="hotelRank1"> ★★★★★ </p>
								<p class="info_name"> 종류 : </p> <p class="store_info" id="hotelType1"> 호텔 </p>
								<p class="info_name"> 상호명 : </p> <p class="store_info" id="hotelName1"> 예시 호텔 </p>
								<p class="info_name"> 대표자 : </p> <p class="store_info" id="hotelOwner1"> 이경덕</p>
								<p class="info_name"> 전화번호 : </p> <p class="store_info" id="hotelPhone1"> 010-8900-3309 </p>
								<p class="info_name"> 주소 : </p> <p class="store_info" id="hotelAddr1"> 서울시 은평구 </p>
							</div>
						</li>
					</ul>
				</section>


				<section id="content2">
					<ul>
						<li>
							<img class="list_img" src="/resources/image/storeList/exaple.png">
							<div class="store_info_title">
								<p class="info_a"><a href="">리뷰보러가기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="foodchange">수정하러가기</a> </p>
								<p class="info_name"> 종류 : </p> <p class="store_info" id="foodType1"> 한식 </p>
								<p class="info_name"> 상호명 : </p> <p class="store_info" id="foodName1"> 예시 음식점 </p>
								<p class="info_name"> 대표자 : </p> <p class="store_info" id="foodOwner1"> 이경덕</p>
								<p class="info_name"> 전화번호 : </p> <p class="store_info" id="foodPhone1"> 010-8900-3309 </p>
								<p class="info_name"> 주소 : </p> <p class="store_info" id="foodAddr1"> 서울시 은평구 </p>
							</div>
						</li>
					</ul>
				</section>

				<section id="content3">
					<ul>
						<li>
							<img class="list_img" src="/resources/image/storeList/exaple.png">
							<div class="store_info_title">
								<p class="info_a"><a href="">리뷰보러가기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="coffeechange">수정하러가기</a> </p>
								<p class="info_name"> 종류 : </p> <p class="store_info" id="coffeeType1"> 애견카페 </p>
								<p class="info_name"> 상호명 : </p> <p class="store_info" id="coffeeName1"> 예시 카페 </p>
								<p class="info_name"> 대표자 : </p> <p class="store_info" id="coffeeOwner1"> 이경덕</p>
								<p class="info_name"> 전화번호 : </p> <p class="store_info" id="coffeePhone1"> 010-8900-3309 </p>
								<p class="info_name"> 주소 : </p> <p class="store_info" id="coffeeAddr1"> 서울시 은평구 </p>
							</div>
						</li>
					</ul>
				</section>

				<section id="content4">
					<ul>
						<li>
							<img class="list_img" src="/resources/image/storeList/exaple.png">
							<div class="store_info_title">
								<p class="info_a"><a href="">리뷰보러가기</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="activitychange">수정하러가기</a> </p>
								<p class="info_name"> 종류 : </p> <p class="store_info" id="actiType1"> 방탈출카페 </p>
								<p class="info_name"> 상호명 : </p> <p class="store_info" id="actiName1"> 예시 액티비티 </p>
								<p class="info_name"> 대표자 : </p> <p class="store_info" id="actiOwner1"> 이경덕</p>
								<p class="info_name"> 전화번호 : </p> <p class="store_info" id="actiPhone1"> 010-8900-3309 </p>
								<p class="info_name"> 주소 : </p> <p class="store_info" id="actiAddr1"> 서울시 은평구 </p>
							</div>
						</li>

					</ul>
				</section>


			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>

</body>
</html>