<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>





.success_box {
	width: 60%;
	margin: 0 auto;
	margin-top: 10%;
	margin-left: 410px;
	min-height: 727px;
}

body{
	margin: 0;
	padding: 0;
}

.success_title {
	width: 50%;
    margin: 0 auto;
}

.title_img {
	margin-left: 17%;
}

.title {
	margin-left: 11%;
	margin-top: -2%;
}

.success_body {
	width: 55%;
    margin: 0 auto;
    margin-left: 25%;
}

.success_body> p{
	text-align: center;
	margin-right: 17%;
	font-size: 17px;
	
}

.success_button {
	border-radius: 8px;
	width: 15%;
    margin: 0 auto;
    float: left;
    margin-left: 31%;
    background-color: orange;
    text-align: center;
    height: 35px;
    padding-top: 4px;
    margin-top: 2%;
}

.success_button> a{
	text-decoration: none;
	color: black;
}

.button_value {
	font-size: 20px;
}
.title_img {
	width: 300px;
	height: 300px;
}


</style>


</head>
<body>
<div class="success_box">
	<div class="success_title">
		<img class="title_img" src="/resources/image/logo.png">
		<h1 class="title">회원가입이 완료되었습니다.</h1>
	</div>
	
	<div class="success_body">
		<p class="nickNameText", id = nickNameText><span id="user_id" ></span> ${name}님의 회원가입을 축하합니다.<br />
		다양한 컨텐츠와 실속있는 서비스로 찾아뵙겠습니다.</p>
	</div>

	
	<div class="success_button">
		<a href="login"><span class="button_value">로그인</span></a>
	</div>
	<div class="success_button" style="margin-left: 3%">
		<a href="/dys"><span class="button_value">메인홈</span></a>
	</div>
</div>
</body>
</html>