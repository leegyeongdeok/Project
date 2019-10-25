<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>내 정보관리</title>

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

ul, li {
	list-style: none;
}

/* 첫번쨰 div */
#mypageback {
	min-width: 1180px;
	height: 850px;
}

#mypage {
	width: 1000px;
	margin: 0 auto;
	letter-spacing: -1px;
	height: 800px;
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
	width: 45%;
	height: 200px;
	border: 1px solid #e6e6e6;
    border-radius: 8px;
	float: left;
	margin-left: 3%;
}

.acount_no1 {
    float: left;
    width: 65%;
    padding-left: 2%;
    padding-top: 9%;
}

.acount_no1 h3 {
	font-weight: 100;
	font-size: 20px;
}

.acount_no1 p {
	font-size: 15px;
	font-weight: 100;
}

.mypagehome_acount2 {
	width: 45%;
	height: 200px;
	border: 1px solid #e6e6e6;
    border-radius: 8px;
	margin-left: 52%;
}

.mypagehome_acount3 {
	width: 45%;
	height: 200px;
	border: 1px solid #e6e6e6;
    border-radius: 8px;
	float: left;
	margin-left: 3%;
}

.mypagehome_acount4 {
	width: 45%;
	height: 200px;
	border: 1px solid #e6e6e6;
    border-radius: 8px;
	margin-left: 52%;
}

.acount_image {
    width: 140px;
    height: 140px;
    padding-left: 1%;
    padding-top: 5%
}


</style>


</head>
<body style="overflow: auto;">
	<%
		String userName = request.getParameter("name");
		String id = request.getParameter("id");
	%>

	<jsp:include page="../include/ownerSide.jsp" flush="true">
		<jsp:param name="userName" value="<%=userName%>"/>
		<jsp:param name="userAge" value="<%=id%>"/>
	</jsp:include>
	<div id="mypageback">
		<!-- mypage start -->

		<div id="mypage" class="mypagebox">
			<div id="mypagemain">
				
				<!-- 내정보 칸 -->
				<div id="mybody">
					<div class="mybody_cont">
						<div class="cont_personal">
							<!-- 유저닉네임  -->
							<h3 class="tit_personal"><span id="username">${name}</span>님, 어서오세요.</h3>
							<p class="title_font" id="title_p">DYS에 자신의 가게를 등록,수정 할수있으니 자신의 가게를 소개해 주세요.</p>
							<!-- 정보 시작 -->
						
						</div>
						
						<div class="mypagehome_acount">
							<div class="mypagehome_acount1">
								<div class="acount_no1">
								<h3>개인정보 확인 및 변경</h3><br>
								<p>DYS 계정에 저장된 데이터를 확인하고 DYS 사용 환경을 맞춤설정하기 위해 <br>어떤 활동을 저장할지 선택합니다.
								</p>
								</div>
								<img class="acount_image" src="/resources/image/myinfo/myinfo.png">
							</div>
						
							<div class="mypagehome_acount2">
								<div class="acount_no1">
								<h3>가게 등록</h3><br>
								<p>자신의 가게를 등록하실수 있습니다. <br>가게이름, 종류, 위치등 가게의정보를 알려주세요.
								</p>
								</div>
								<image class="acount_image" src="/resources/image/ownerside/sidestoreregister.png">
							</div>
						</div>
						<div class="mypagehome_acount">
							<div class="mypagehome_acount3">
								<div class="acount_no1">
								<h3>가게 리스트</h3><br>
								<p>내가 등록한 가게를 한눈에 편하게 확인하실수 있습니다. <br>DYS는 업주들도 회원이라 생각하며 불편함을 줄이고자 최선을 다합니다..
								</p>
								</div>
								<image class="acount_image" src="/resources/image/myinfo/list.png">
							</div>
								
							<div class="mypagehome_acount4">
								<div class="acount_no1">
								<h3>저장한 코스 목록</h3><br>
								<p>다른 회원이 다녀온 코스들중 마음에드는 코스를 저장하시고 이곳에서 확인해보세요.
								</p>
								</div>
								<image class="acount_image" src="/resources/image/myinfo/savecourse.png">
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