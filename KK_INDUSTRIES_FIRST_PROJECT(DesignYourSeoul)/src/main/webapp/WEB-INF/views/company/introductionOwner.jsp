<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">

	<style>
		body {
			height: 100%;
			margin: 0;
			padding: 0;
		}

		.introduction_box {
			width: 60%;
			margin: 0 auto;
			height: 100%;
			padding-top: 5%;
		}

		.introduction_title{
			width: 90%;
			font-size: 22pt;
			font-weight: 100;
			font-family: Big Shoulders Display;
		}

		.introduction_body{
			margin-top: 3%;
			width: 100%;
			font-size: 20px;
			font-weight: 100;
			font-family: 'Noto Sans KR', sans-serif;

		}

		.introbody_image {
			width: 100%;
		}

		.introbody_image> img{
			width: 100%;
		}

		/* 텍스트 위치 */
		.introbody_title {
			margin-top: 5%;
			width: 200px;
			float: left;
			font-size: 22px;

		}

		.introbody_body {
			width: 770px;
			margin-left: 25%;
			font-size: 16px;
			margin-top: 9%;
		}

		.introbody_body> p {
			font-size: 18px;
		}

		.introbody_body2 {
			width: 770px;
			margin-left: 25%;
			font-size: 16px;
			margin-top: 11%;
		}

		.introbody_body2> p {
			font-size: 18px;
		}


	</style>
</head>
<body>
<%@ include file="../include/ownerSide.jsp"%>
<div class="introduction_box">
	<div class="introduction_title">
		<strong>“Design Your Seoul” 나만의 서울여행 코스짜기, 더 좋은 계획</strong>
	</div>
	<div class="introduction_body">
		<div class="introbody_image">
			<img src="/resources/image/introduction/introduction.png">
		</div>

		<div class="introbody_title">
			<h4>비전</h4>
		</div>

		<div class="introbody_body">
			<p>DYS는 서울에 있는 여러 테마를 보고 계획할 수있는
				시스템을 통해 더 편리하고 즐거운 세상을 꿈꿉니다.<br />
				여행과 계획, 테마와 계획 기술을 한 층 더 가깝게
				구현함으로써 여향계획을 더 나은 계획으로
				만들기 위해 노력하고 있습니다.</p>

		</div>

		<div class="introbody_title">
			<h4>DYS 소개</h4>
		</div>

		<div class="introbody_body2">
			<p>너무나 빠르고 바쁘게 흘러가는 21세기,
				멀리나갈 수 없는 사회구조에작지만 많은 테마를
				가지고 있는  우리나라의 수도 서울여행,
				이제는 나만의 것으로 디자인 하기위해 만들었습니다.
				5가지 테마에 서울의 많은 장소를 디자인하고 다른 코스들과
				비교해 더 나은 코스를 쉽고 빠르게 확인하기 위해 노력하겠습니다.</p>
			<br /><br /><br /><br />

		</div>
	</div>

	<div class="introduction_foot">

	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>

</html>