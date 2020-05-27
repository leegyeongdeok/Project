<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<title>login</title>

	<style type="text/css">
		a:link {
			color: black;
			text-decoration: none;
		}

		a:visited {
			color: black;
			text-decoration: none;
		}
	</style>

	<style>

		*{
			margin: 0 0;
		}
		.find_info {
			line-height: 14px;
			padding-top: 20px;
			text-align: center;
			color: #8e8e8e;
			border-top: 1px solid #e4e4e5;
		}
		/* 로그인버튼 */
		.btn_global {
			display: block;
			width: 100%;
			height: 61px;
			margin: 30px 0 14px;
			padding-top: 1px;
			border: none;
			border-radius: 0;
			background-color: orange;
			cursor: pointer;
			text-align: center;
			color: #fff; /* 글자색 */
			font-size: 20px;
			font-weight: 700;
			line-height: 61px;
			-webkit-appearance: none;
		}

		#container, #header {
			width: 800px;
			margin: 0 auto;
		}

		#header {
			position: relative;
			box-sizing: border-box;
			height: 80px;
			/*  padding: 10px 0 0; /* 로고 위아레 */
			text-align: center;
		}

		#header .blind {
			width: 231px;
			height: 44px;
			margin: 0 auto;
			background-position: -1px -1px;
		}
		/* 버튼 아이디비번 사이즈 */
		fieldset {
			border: 0;
			margin-left: 150px;
			margin-right: 150px;
		}

		.input_row {
			position: relative;
			height: 29px;
			margin: 0 0 14px;
			padding: 10px 35px 10px 15px;
			border: solid 1px #dadada;
			background: #fff;
		}

		.int {
			font-size: 15px;
			line-height: 16px;
			position: relative;
			z-index: 9;
			width: 100%;
			height: 16px;
			padding: 7px 0 6px;
			color: #000;
			border: none;
			background: #fff;
			-webkit-appearance: none;
		}

		.logoimg {
			overflow: hidden;
			width: 300px;
			height: 300px;
			margin-left: 250px;
			padding-top: 55px;
		}

		#container {
			padding-top: 270px;
		}
		.stit_con_title {
			margin-bottom: 20px;
			line-height: 1;
			font-size: 20px;
			font-family: 'Noto_m';
			color: #222;
		}
		.join_norang {
			margin-top: 20px;
			border-top: 1px solid #222;
			border-bottom: 1px solid #ddd;
			padding: 20px 0;
		}
		ul.norang_member {
			display: table;
			table-layout: fixed;
			width: 100%;
		}
		ul.norang_member li {
			position: relative;
			display: table-cell;

			text-align: center;
		}
		ul{
			padding: 0px;

		}
		ul.norang_member li:after {
			position: absolute;
			display: block;
			top: 0;
			right: 0;
			width: 1px;
			height: 100%;
			background: #ddd;
			content: '';
		}
		ul.norang_member li.norang_y4:after {
			display: none;
		}


		.stit_ybm{
			margin-top: 15px;
		}
		#footer{
			margin: 0 auto;
			width: 1110px;

		}

		.logoimg img {
			width: 300px;
			height: 300px;
		}

		.error_next_box {
			display: block;
			font-size: 12px;
			line-height: 14px;
			color: red;
			margin-top: 15px;
			margin-left: -15px;
		}

	</style>

</head>

<body class="chrome">
<%@ include file="../include/header.jsp"%>
<div id="wrap">


	<!-- header -->
	<div id="header">
		<div class="logoimg">
			<h1>
				<a href=""><img src="/resources/image/logo.png"></a>
			</h1>
		</div>
	</div>
	<!-- //header -->

	<!-- container -->
	<div id="container">
		<!-- content -->
		<div id="content">

			<!-- 아이디비밀번호 -->
			<fieldset class="login_form">

				<div class="id_area">
					<!-- 아이디 -->
					<div class="input_row" id="id_area">
                     <span class="input_box"> <!-- <label for="id" id="label_id_area" class="lbl" style="display: block;">아이디</label> -->
                        <input type="text" id="id" name="id" accesskey="L"
							   placeholder="아이디" class="int" maxlength="41" value="">

                     </span>
					</div>
				</div>
				<!-- 비밀번호 -->
				<div class="pw_area">
					<div class="input_row" id="pw_area">
                     <span class="input_box"> <!-- <label for="pw" id="label_pw_area" class="lbl" style="display: block;">비밀번호</label> -->
                        <input type="password" id="pswd" name="pw" placeholder="비밀번호"
							   class="int" maxlength="16">
						 <span class="error_next_box" id="idMsg"
							   role="alert"></span>
                     </span>
					</div>
				</div>

				<!-- 로그인버튼 -->
				<input type="button" onclick="userType()" title="로그인" alt="로그인" value="로그인"
					   class="btn_global">
				<div class="check_info"></div>
			</fieldset>

			<div class="position_a">
				<div class="find_info">
					<a target="_self" id="idinquiry" href="find">ID/PW찾기</a> <span
						class="bar" aria-hidden="true">|</span> <a target="_self"
																   id="pwinquiry" href="signUp">회원가입</a> <span
						class="bar" aria-hidden="true">|</span> <a target="_self"
																   id="join" href="">비회원로그인</a>
				</div>
			</div>

		</div>
		<!-- //content -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer">
		<div cla>
			<h4 class="stit_con_title">DYS 회원 혜택</h4>
			<div class="join_norang">
				<ul class="norang_member">

					<li class="norang_y1">
						<div><img src="/resources/image/login/login1.png"></div>
						<div class="stit_ybm">
							<h3>자신만의 서울 여행,</h3>
							<h2>Design Your Seoul</h2>
							<!--            <p>다양한 맛집,카페,숙소,액티비티,<br>랜드마크 자신이 원하는 대로 <br>추가하고 계획해보실 수 있습니다. </p> -->
						</div></li>

					<li class="norang_y2">
						<div><img src="/resources/image/login/login2.png"></div>
						<div class="stit_ybm">
							<h3>서울 여행 계획</h3>
							<h2>수많은 유저들과 공유!</h2>
							<!--    <p>수많은 유저들이 올린 색다른 여행<br> 계획과 자신의 계획에 대한<br> 다른 유저의 생각을 들어보세요.</p> -->
						</div></li>

					<li class="norang_y3">
						<div><img src="/resources/image/login/login3.png"></div>
						<div class="stit_ybm">
							<h3>또 다른 유저들과</h3>
							<h2>여행 계획에 대한 소통!</h2>
							<!--    <p>다른 유저들이 올린 장소에 대한 <br>생각과 자신의 생각에 대해 <br>실시간으로 쉽게 소통해보세요.</p> -->
						</div></li>

					<li class="norang_y4">
						<div><img src="/resources/image/login/login4.png"></div>
						<div class="stit_ybm">
							<h3>사장님의 가게와 숙소</h3>
							<h2>쉽게 등록하고 쉽게 관리!</h2>
							<!--     <p>다양한 유저가 있는 이곳에<br> 사장님의 가게와 숙소를 <br>쉽게 등록하고 관리해 보세요.</p> -->
						</div></li>
				</ul>
			</div>
		</div>
		<!-- //footer -->
	</div>

	<%@ include file="../include/footer.jsp"%>

	<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
	<script>
		var type;
		var id;
		var pswd;
		function userType() {
			id = $("#id").val();
			pswd = $("#pswd").val();

			if(id =="" || pswd ==""){
				$("#idMsg").text("아이디와 비밀번호를 입력해주세요");
				return;
			}

			$.ajax({
				url : '/function/login/'+id+'/'+pswd,
				type : "GET",
				success : function(data){
					if (data == "false"){
						$("#idMsg").text("아이디와 비밀번호를 확인해주세요");
					}else{
						type = data;
						nextStep();
					}
				},
				error:function(request,status,error){
					alert(request);
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}

		function nextStep() {
			var link = "/api/";
			var loc = "/dys";

			if(type == "general"){
				link +='generalUser/get/'+id;
				loc += '?id='+id+"&name=";
			}
			if(type == "owner"){
				link +='ownerUser/get/'+id;
				loc += '/owner/Home'+'?id='+id+"&name=";
			}if(type == "admin"){
				link +='admin/get/'+id;
				loc += '/admin/Home'+'?id='+id+"&name=";
			}


			$.ajax({
				url : link,
				type : "GET",
				success : function(data){
					if(type == "general"){
						var nickName = data.nickname;
						location.href=loc+nickName;
					}
					if(type == "owner"){
						var name = data.name;
						location.href=loc+name;
					}if(type == "admin"){
						location.href=loc;
					}

				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}


	</script>
</body>

</html>

