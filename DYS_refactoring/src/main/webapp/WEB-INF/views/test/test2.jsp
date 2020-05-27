<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

ul, li {
	list-style: none;
}

/* 첫번쨰 div */
#mypageback {
	min-width: 1180px;
	padding-bottom: 100px;
}

#mypage {
	width: 1000px;
	margin: 0 auto;
	letter-spacing: -1px;
	height: 800px;
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
	padding: 25px 0 72px;
	margin-top: 5%;
}

/* 마이페이지 사이드 메뉴바 */
#myside {
	float: left;
	width: 150px;
	margin-right: 50px;
	border: 0 none;
	background: 0;
	margin-top: 5%;
}

.mysidemenu {
	overflow: hidden;
	width: 150px;
	text-align: left;
}

.mysidemenu .info_tit {
	display: block;
	height: 35px;
	font-size: 17px;
	color: #000;
	line-height: 30px;
	padding-bottom: 1px;
	padding-left: 15%
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
	width: 800px;
	overflow: hidden;
	margin: 0 auto;
}

.mypagebox .mybody_cont {
	overflow: hidden;
    width: 798px;
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
    font-size: 30px;
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

/* .cont_personal .basic_info .id_basic{
	border-top: 1px solid #eee;
} */

.cont_personal .basic_info .area_basic {
	overflow: hidden;
    width: 795px;
    padding: 27px 0 29px;
    font-size: 15px;
    line-height: 18px;
    border-bottom: 1px solid #eee;
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

.area_basic:hover {
	background-color: #eee;
}

#second_info{
	padding-top: 5%;
}

.info_tit:hover {
	border-radius: 0 50px 50px 0;
    background-color: #eee;
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

</style>



</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<div id="mypageback">
		<!-- mypage start -->
				<div id="myside">
					<div class="mysidemenu">
						<a class="sidemenu_link" href="login"><strong class="info_tit">홈</strong></a>
						<a class="sidemenu_link" href="test2"><strong class="info_tit">개인 정보</strong></a>
						<a class="sidemenu_link" href="#"><strong class="info_tit">좋아요</strong></a>
						<a class="sidemenu_link" href="#"><strong class="info_tit">코스목록</strong></a>
						<a class="sidemenu_link" href="#"><strong class="info_tit">회원탈퇴</strong></a>
					</div>
					
				</div>
		<div id="mypage" class="mypagebox">
			<div id="mypagemain">
				
				<!-- 내정보 칸 -->
				<div id="mybody">
					<div class="mybody_cont">
						<div class="cont_personal">
							<h3 class="tit_personal">개인 정보</h3>
							<p class="title_font" id="title_p">이름, 사진과 같이 DYS 서비스에서 사용하는 기본 정보</p>
							<!-- 정보 시작 -->
							<div class="basic_info" style="display: block">
								<div class="info_title" style="padding-left: 4%;">
									<h3 class="pro_title">프로필</h3><br>
									<p class="title_font">일부 정보가 DYS 서비스를 이용하는 다른 사람에게 표시될수 있습니다.</p>
								</div>
								
								<a href="#" class="change_info"><div class="area_basic id_basic">
									<strong class="tit_basic">아이디</strong>
									<div class="box_basic">aaaa</div>
									>
								</div></a> 
								
								<a href="#" class="change_info"><div class="area_basic nickname_basic">
									<strong class="tit_basic">닉네임</strong>
									<div class="box_basic">백구</div>
								</div></a>
								
								<a href="#" class="change_info"><div class="area_basic name_basic">
									<strong class="tit_basic">이름</strong>
									<div class="box_basic">홍길동</div>
								</div></a>
								
								<a href="#" class="change_info"><div class="area_basic jumin_basic">
									<strong class="tit_basic">생년월일</strong>
									<div class="box_basic">1990년 10월 8일</div>
								</div></a> 
						</div>
						<div id="second_info" >
							<div class="basic_info second">
							<div class="info_title" style="padding-left: 4%;">
									<h3 class="pro_title">연락처 정보</h3>
								</div>
								
								<a href="#" class="change_info"><div class="area_basic email_basic">
									<strong class="tit_basic">이메일</strong>
									<div class="box_basic">123@naver.com</div>
								</div></a> 
							
								<a href="#" class="change_info"><div class="area_basic phone_basic">
									<strong class="tit_basic">번호</strong>
									<div class="box_basic">010-1111-1111</div>
								</div></a> 
						
							</div>
						</div>
					</div>
				
				</div>
				
				
				
			</div>
		</div>
	<!-- //mypage end -->


	</div>


</body>
</html>