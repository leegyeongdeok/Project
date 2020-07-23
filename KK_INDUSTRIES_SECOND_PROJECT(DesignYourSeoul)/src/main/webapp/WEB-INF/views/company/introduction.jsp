<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
	<link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
	<link rel="icon" href="/resources/image/favicon_black.ico">
	<style type="text/css">
		@-ms-viewport {
			width: device-width
		}

		@-o-viewport {
			width: device-width
		}

		@viewport {
			width: device-width
		}
	</style>

	<title>Company Intro</title>

	<link href="/resources/css/companyIntro.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">
</head>
<body>

<jsp:include page="../include/header.jsp" flush="false"/>
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
				<p>
					DYS는 서울에 있는 여러 테마를 보고 계획할 수 있는 시스템을 통해 더 편리하고 즐거운 세상을 꿈꿉니다.<br>
					여행과 계획, 테마와 계획 기술을 한 층 더 편리하게 구현함으로써 여행을 좀 더 재미있고 좋은 추억으로 남기실 수 있게
					노력하겠습니다.
				</p>
			
			</div>
			
			<div class="introbody_title">
				<h4>DYS 소개</h4>
			</div>
			
			<div class="introbody_body">
				<p>너무나 빠르고 바쁘게 흘러가는 21세기, 작지만 많은 볼거리, 즐길거리가 있는 우리나리의 수도 서울,<br>
					이제는 직접 고르고 계획하여 다채롭게 즐기실 수 있게 하기 위해 만들었습니다.<br>
					5가지 테마에 서울의 많은 장소를 골라 계획하고 다른 멋진 서울 여행 코스도 보고 즐겨보세요.
				</p>
			
			</div>
		</div>
		
		<div class="introduction_foot">
			
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>

</html>