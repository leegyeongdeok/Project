<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Mansalva&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Big+Shoulders+Display:100,300,400,500,600,700,800,900&display=swap&subset=latin-ext,vietnamese" rel="stylesheet">


<style>

	/* 검색 */
	.list_search {
		margin-left: 70%;
		margin-top: -25px;
	}

	.search_text {
		height: 22px;
	}

	.search_button {
		height: 25px;
		width: 35px;
		font-weight: 100;
		margin-left: 15px;
		border: 0;
		outline: 0;
		cursor: pointer;
		background-color: orange;
		color: white;
	}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	min-height: 100%;
}

body {
	position: relative;
	line-height: 1em;
}


.listtotal {
	margin: 0;
	padding: 0;
	height: 140%;
	min-height: 100%;
	/* background-color: red; */
	width: 86%;
	margin-left: 7%;
}

/* 넘기기버튼 */
#back {
	position: relative;
	top: 170px;
	cursor: pointer;
	z-index: 1;
	left: 7%;
	overflow: visible;
}

#next {
	position: relative;
	top: -170px;
	cursor: pointer;
	z-index: 1;
	left: 91%;
	overflow: visible;
}

/* top10 */
.toplist {
	padding-top: 3%;
}

.lanklist {
	/* padding-top: 2%; */
	overflow: hidden;
	width: 1236px;
	height: 300px;
	position: relative;
	margin: auto;
}

.lanklist ul {
	width: 5000px;
	padding-top: 3%;
}

.lankul li {
	list-style: none;
	float: left;
	margin-left: 1px;
	padding-right: 5px;
	display: inline-block;
}

.lanklist a {
	padding-right: 22px;
}

li img {
	width: 225px;
	height: 225px;
}

/* 나머지 리스트 */
.otherlist {
	margin-top: 4%;
}

.otherlist .title {
    margin-bottom: 4%;
}

.list {
	/* padding-top: 2%; */
	padding-left: 0px;
	width: 1236px;
	height: 100%;
	position: relative;
	margin: auto;
}


.list ul {
	width: 1298px;
}
.list li {
	list-style: none;
	padding-bottom: 22px;
	overflow: hidden;
	height: 225px;
}

.list li a {
	padding-right: 22px;
}

/* 리스트 버튼 */
#buttonli {
	margin-left: 10px;
	padding-left: 5px;
}

#buttonli button, #buttonli a {
	padding-left: 10px;
}

/* 이미지위에 마우스 올릴때 css */

.listtotal span {
	display: inline-block;
}

span>p{
	opacity: 0;
	position: relative;
    bottom: 165px;
    text-align: center;
}

a> span {
	z-index: 10; 
    background-color: black;
    height: 225px;
}

span:hover p{
	opacity:1;
}

span:hover img {
	opacity: 0.2;
}

p> strong {
	color: orange;
}

/* btn div */
.btn {
	margin-top: 15px;
	margin-left: 45%
}

/* 타이틀 위치 수정 */
.title h1 {
	padding-left: 13%;
	font-family: Big Shoulders Display;
	font-weight: 400; 
	font-size: 25pt;
}

.tematitle{
    margin-top: 60px;
    margin-bottom: 60px;
    text-align: center;
    color: orange;
    font-family: Big Shoulders Display;
    font-size: 20pt;
}


</style>

</head>
<body>

<%
	String userName = request.getParameter("name");
	String id = request.getParameter("id");
	String pages = request.getParameter("page");
	String type = request.getParameter("type");
	String location;

	if(request.getParameter("location") == null){
		location ="";
	}else{
		location = request.getParameter("location");
	}
%>
<jsp:include page="../include/loginHeader.jsp" flush="true">
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>

	<div class="tematitle">
		<h1>Restaurant</h1>
	</div>
	<div class="listtotal">
		<div class="toplist">
			<div class="title">
				<h1>랭킹 TOP10</h1>
			</div>

			<img id="back" src="/resources/image/slider/left.png">
			<div class="lanklist">
				<ul class="lankul">
					<li>
						<a href="#"><span><img src="../resources/image/thematop/food/food_1.png">
                     <p>
                     <strong id="foodNameTop1">상호:&nbsp;&nbsp;또순이네</strong>
                     <br /><br />
                     <strong id="foodAddTop1">주소:&nbsp;&nbsp;영등포구 양평동</strong>
                     <br /><br />
                     <strong id="foodTypeTop1">종류:&nbsp;&nbsp;한식</strong>
                     <br /><br />
                     <strong id="foodPhoneTop1">전화:&nbsp;&nbsp;02-2672-2255</strong>
                     </p>
                     </span></a>

						<a href="#"><span><img src="../resources/image/thematop/food/food_2.png">
                     <p>
                     <strong id="foodName1Top2">상호:&nbsp;&nbsp;육성회비</strong>
                     <br /><br />
                     <strong id="foodAddTop2">주소:&nbsp;&nbsp;광진구 화양동</strong>
                     <br /><br />
                     <strong id="foodTypeTop2">종류:&nbsp;&nbsp;한식</strong>
                     <br /><br />
                     <strong id="foodPhoneTop2">전화:&nbsp;&nbsp;02-468-8096</strong>
                     </p>
                  </span></a>

						<a href="#"><span><img src="../resources/image/thematop/food/food_3.png">
                     <p>
                     <strong id="foodName1Top3">상호:&nbsp;&nbsp;강촌숯불닭갈비</strong>
                     <br /><br />
                     <strong id="foodAddTop3">주소:&nbsp;&nbsp;구로구 구로동</strong>
                     <br /><br />
                     <strong id="foodTypeTop3">종류:&nbsp;&nbsp;한식</strong>
                     <br /><br />
                     <strong id="foodPhoneTop3">전화:&nbsp;&nbsp;02-851-2194</strong>
                     </p>
                  </span></a>

						<a href="#"><span><img src="../resources/image/thematop/food/food_4.png">
                     <p>
                     <strong id="foodName1Top4">상호:&nbsp;&nbsp;순댕이네 얼큰수제비</strong>
                     <br /><br />
                     <strong id="foodAddTop4">주소:&nbsp;&nbsp;금천구 독산동</strong>
                     <br /><br />
                     <strong id="foodTypeTop4">종류:&nbsp;&nbsp;한식</strong>
                     <br /><br />
                     <strong id="foodPhoneTop4">전화:&nbsp;&nbsp;02-852-3670</strong>
                     </p>
                  </span></a>

						<a href="#"><span><img src="../resources/image/thematop/food/food_5.png">
                     <p>
                     <strong id="foodName1Top5">상호:&nbsp;&nbsp;스시혼</strong>
                     <br /><br />
                     <strong id="foodAddTop5">주소:&nbsp;&nbsp;도봉구 창동</strong>
                     <br /><br />
                     <strong id="foodTypeTop5">종류:&nbsp;&nbsp;일식</strong>
                     <br /><br />
                     <strong id="foodPhoneTop5">전화:&nbsp;&nbsp;02-993-3290</strong>
                     </p>
                  </span></a>
					</li>

				</ul>
			</div>
			<img id="next" src="/resources/image/slider/right.png">
			<script type="text/javascript">
				$(document).ready(function() {
					var imgs;
					var img_count;
					var img_position = 1;

					imgs = $(".lanklist ul");
					img_count = imgs.children().length;

					//버튼을 클릭했을 때 함수 실행
					$('#back').click(function() {
						back();
					});
					$('#next').click(function() {
						next();
					});

					function back() {
						if (1 < img_position) {
							imgs.animate({
								left : '+=1274px'
							});
							img_position--;
						}
					}
					function next() {
						if (img_count > img_position) {
							imgs.animate({
								left : '-=1274px'
							});
							img_position++;
						}
					}
				});
			</script>
		</div>


		<!-- 나머지 리스트 -->
		<div class="otherlist">
			<div class="title">
				<h1>맛집 리스트</h1>
				<div class="list_search">
					<input id="location_search" class="search_text" placeholder="지역을 입력해주세요" type="text" value="<%=location%>">
					<input onclick="locationSearch()" class="search_button" type="button" value="검색">
				</div>
			</div>
			<div class="list">
				<input type="hidden" id="index">
				<ul>
					<li>
						<c:forEach varStatus="status" var="food" items="${foodList.content}">
							<a onclick="detail(${food.famousRestaurantId})"><span><img src="/resources/image/food/${food.famousRestaurantId}/main.PNG">
							<p>
							<strong >상호:&nbsp;&nbsp;${food.name}</strong>
							<br /><br />
							<strong >주소:&nbsp;&nbsp;${fn:substring(food.address,0 ,13)}..</strong>
							<br /><br />
							<strong >종류:&nbsp;&nbsp;${food.foodKind}</strong>
							<br /><br />
							<strong >전화:&nbsp;&nbsp;${food.callNumber}</strong>
							</p>
						</span></a>

						</c:forEach>
					</li>

					<li>
						<c:forEach varStatus="status" begin="5" var="food" items="${foodList.content}">
							<a onclick="detail(${food.famousRestaurantId})"><span><img src="/resources/image/food/${food.famousRestaurantId}/main.PNG">
							<p>
							<strong >상호:&nbsp;&nbsp;${food.name}</strong>
							<br /><br />
							<strong >주소:&nbsp;&nbsp;${fn:substring(food.address,0 ,13)}..</strong>
							<br /><br />
							<strong >종류:&nbsp;&nbsp;${food.foodKind}</strong>
							<br /><br />
							<strong >전화:&nbsp;&nbsp;${food.callNumber}</strong>
							</p>
						</span></a>
						</c:forEach>
					</li>
				</ul>
				<div class="btn">
						<button onclick="pageDown()">이전</button>
					<c:set var="nowPage" value="${foodList.number+1}"/>
					<c:set var="finalPage" value="${foodList.totalPages}"/>
					<c:if test="${(nowPage == 1 || nowPage == 2) && nowPage <= finalPage-4}">
						<%--firstIndex button--%>
					<c:forEach var="page" begin="1" end="5">
							<a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
					</c:forEach>
					</c:if>

					<c:if test="${nowPage -2 > 0 && nowPage <= finalPage-4}">
						<c:forEach var="page" begin="${nowPage-2}" end="${nowPage+2}">
							<a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
						</c:forEach>
					</c:if>

					<%--finalIndex button--%>
					<c:if test="${nowPage > (finalPage-4) && finalPage-4 > 0}">
						<c:forEach var="page" begin="${finalPage-4}" end="${finalPage}">
							<a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
						</c:forEach>
					</c:if>

					<%--location button--%>
					<c:if test="${finalPage-4 < 0}">
						<c:forEach var="page" begin="1" end="${finalPage}">
							<a id="${page}" onclick="pageSelect(${page})" class="btn_list">${page}</a>
						</c:forEach>
					</c:if>

						<button onclick="pageUp()">다음</button>
				</div>

			</div>

		</div>
	</div>
<%@ include file="../include/footer.jsp"%>
<input id="account" type="hidden" value="<%=id%>">
<input id="userName" type="hidden" value="<%=userName%>">
<input id="type" type="hidden" value="<%=type%>">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var account = $("#account").val();
	var userName = $("#userName").val();
	var nowPage = <%=pages%>;
	var totalP = ${foodList.totalPages};
	var type = $("#type").val();

	$(function () {
		$("#"+nowPage).get(0).style.color="orange";
	});

	function detail(num) {
		location.href="foodDetail?no="+num+"&id="+account+"&name="+userName+"&type="+type+"&page="+nowPage+"&location="+$("#location_search").val();
	}

	function pageUp() {
		if(nowPage != totalP){
			nowPage++;
			location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
		}else{
			alert("마지막 페이지입니다.");
		}

	}

	function pageDown() {
		if(nowPage != 1 ){
			nowPage--;
			location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
		}else {
			alert("첫번째 페이지입니다");
		}

	}

	function pageFront() {
		if(nowPage == 1){
			alert("첫번째 페이지입니다");
		}else {
			nowPage = 1;
			location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
		}

	}

	function pageBack() {
		if(nowPage == totalP){
			alert("마지막 페이지입니다");
		}else{
			nowPage = ${foodList.totalPages};
			location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
		}

	}

	function pageSelect(page) {
		nowPage = page;
		location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+page+"&location="+$("#location_search").val();
	}

	function locationSearch() {
		location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
	}
</script>
</body>
</html>