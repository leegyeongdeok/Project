<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>business_inquiry_detail</title>
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		.business_inquiry_detail_top {
			height: 380px;
			width: 1800px;
			margin: 0 auto;
		}

		.business_inquiry_detail_bok {
			padding-top: 100px;
			text-align: center;
			width: 1800px;
			height: auto;
			margin: 0 auto;
		}

		.business_inquiry_tit {
			font-size: 60px;
			font-weight: 500;
		}

		.business_inquiry_desc {
			font-size: 20px;
			font-weight: 400;
			margin-top: 40px;
		}

		.business_inquiry_content_block {
			margin: 0 auto;
			position: relative;
			width: 1800px;
			min-height: 600px;
		}

		.business_inquiry_brd_title {
			position: relative;
			height: 80px;
			padding: 15px;
			font-size: 25px;
			border-top: 2px solid #222;
			border-bottom: 1px solid #222;
		}

		.business_inquiry_detail_tbl_cell {
			width: 950px;
			height: 80px;
			display: table-cell;
			line-height: 1.4;
			vertical-align: middle;
		}

		.business_inquiry_brd_date {
			position: absolute;
			top: 45px;
			right: 20px;
			font-size: 15px;
		}

		.business_inquiry_editor_area {
			min-height: 300px;
			padding: 40px 20px;
			line-height: 25px;
			border-bottom: 1px solid #222;
		}

		table.business_inquiry_tbl_pren {
			margin: 0 auto;
			width: 100%;
			margin-top: 50px;
			border-top: 1px solid #ddd;
		}

		table.business_inquiry_tbl_pren th {
			height: 60px;
			padding: 0 20px;
			border-bottom: 1px solid #ddd;
			color: #222;
			text-align: left;
		}

		table.business_inquiry_tbl_pren td {
			position: relative;
			height: 60px;
			padding: 0 20px;
			border-bottom: 1px solid #ddd;
			vertical-align: middle;
			text-align: left;
		}

		.btn_area {
			margin: 40px 0;
			text-align: center;
		}

		.listgo {
			margin-top: 10px;
			width: 120px;
			height: 60px;
			border: none;
			border-radius: 0;
			background-color: orange;
			cursor: pointer;
			text-align: center;
			color: #fff;
			font-size: 25px;
			-webkit-appearance: none;
		}

		a {
			color: black;
			text-decoration: none;
		}

		.business_inquiry_ReviewList {
			width: 100%;
			margin-top: 19px;
		}

		.business_inquiry_ReviewList__Header {
			padding: 10px 20px;
		}

		fieldset {
			border: 0;
		}





		ul, ul li {
			list-style: none;
		}

		.business_inquiry_ReviewItem__User {
			padding: 30px;
		}

		.Review_review_list {
			padding: 0 30px;
		}

		.business_inquiry_ReviewItem__UserName {
			margin-right: 60%;
		}

		.business_inquiry_ReviewItem__ReviewDate, .business_inquiry_ReviewItem__Review_reviewDate
		{
			float: right;
			font-size: 14px;
		}

		.business_inquiry_ReviewItem__ReviewText, .business_inquiry_ReviewItem__Review_reviewText
		{
			margin-top: 20px;
		}

		.business_inquiry_ReviewItem {
			position: relative;
			border-bottom: 1px solid #DBDBDB;
		}

		.business_inquiry_ReviewItem__review, .reviewTextarea_box {
			margin: 30px;
		}

		.business_inquiry_Review_reviewItem {
			position: relative;
			border-top: 1px solid #DBDBDB;
		}

		.business_inquiry_brd_name {
			margin-top: 15px;
			margin-left: 70px;
			font-size: 20px;
			vertical-align: middle;
		}

		.business_inquiry_brd_writer {
			font-size: 20px;
		}

		.reviewTextarea_box {
			position: relative;
			background-color: #fff;
			border: 1px solid #b3b3b3;
		}
		/* 뎃글 */
		.review_textarea {
			overflow: hidden;
			position: relative;
			height: 25px;
			padding: 11px 82px 0 14px;
			background-color: #fff;
			border-bottom:  1px solid #ededed;
		}
		.review_write_area {
			max-width: 100%;
			padding-bottom: 8px;
		}
		.review_Name {
			display: block;
			overflow: hidden;
			position: absolute;
			top: 11px;
			right: 82px;
			bottom: 0;
			left: 15px;
			height: 23px;
			font-size: 12px;
			color: #000;
			font-weight: 700;
			line-height: 2.08;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
		.review__reply_textarea {
			display: block;
			overflow-x: hidden;
			overflow-y: auto;
			position: relative;
			z-index: 1;
			float: left;
			width: 100%;
			height: 56px;
			padding: 6px 0 0;
			margin: 0;
			padding-right: 16px;
			border: none;
			color: #333;
			background-color: rgba(255,255,255,.001);
			font-size: 12px;
			line-height: 18px;
			-webkit-appearance: none;
			vertical-align: top;
			resize: none;
			box-sizing: border-box;
		}

		.review_upload {
			right: 0;
			bottom: 0;
			height: 44px;
			width: 50px;
			background-color: #fff;
			border-top-color: #ededed;
			border-left-color: #ededed;
			border-right-color: transparent;
			border-bottom-color: transparent;
			color: orange;


		}
		.review_upload_box{
			position: relative;
			height: 43px;
			border-top: 1px solid #ededed;
			margin-bottom:1px;
			text-align: right;
		}
		.business_inquiry_Review_reviewTextarea{
			margin:0 30px;
			border-top: 1px solid #b3b3b3
		}

		.reviewicon {
			float:left;
			margin-top:30px;

			left: 0;
			width: 20px;
			height: 20px;

			background-image: url(/resources/image/review.PNG);
			background-repeat: no-repeat;
		}

		.reviewclose{
			width: 100%;
			height: 30px;
			border: 0px;
			background-color: white;
			border-top: 1px solid #b3b3b3;
		}
		.Review_review_btn{
			width: 50px;
			height: 30px

		}
		.business_inquiry_ReviewList__Title{
			padding-bottom:10px;
			border-bottom: 1px solid #b3b3b3;
		}
		.content{
			margin: 0 auto;
			width: 55%;
		}

		.business_inquiry_desc>p{
			margin-top: 10px;
		}
	</style>


</head>
<body>
<%
	String id = request.getParameter("id");
	String userName = request.getParameter("name");
	String pages = request.getParameter("page");
	String type = request.getParameter("type");
%>

<jsp:include page="../include/loginHeader.jsp" flush="true">
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="userAcc" value="<%=id%>"/>
</jsp:include>

<div class="business_inquiry_detail_top">


	<div class="business_inquiry_detail_bok">

		<div class="business_inquiry_tit overlay">문 의 사 항</div>
		<div class="business_inquiry_desc overlay">
			<p>회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.</p>
			<p>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.</p>
		</div>
	</div>

</div>
<!--business_inquiry_detail_top-->

<div class="business_inquiry_content_block">
	<div class="content" >
		<h1 class="business_inquiry_brd_title">

			<span class="business_inquiry_detail_tbl_cell">${questionDetail.title} </span> <span
				class="business_inquiry_brd_date"><tf:formatDateTime value="${questionDetail.registeredAt}" pattern="yyyy.MM.dd"/></span>

		</h1>
		<div class="business_inquiry_brd_editor">
				<span><p class="business_inquiry_brd_writer" id="businessInquiryDetailWriter" style="float: left;">글쓴이:</p>
					<p class="business_inquiry_brd_name" id="businessInquiryDetailName">${questionDetail.generalUser.nickname}</p></span>
			<div class="business_inquiry_editor_area">
				${questionDetail.content}
			</div>

		</div>
		<!-- 답변 -->
		<section class="business_inquiry_ReviewList">
			<header class="business_inquiry_ReviewList__Header">
				<h2 class="business_inquiry_ReviewList__Title">
					<span class="business_inquiry_ReviewList__business_inquiry_NameSuffixDesktop">답변</span>
					<span class="business_inquiry_ReviewList__business_inquiry_NameSuffixMobile">
						</span>
				</h2>

			</header>

			<ul class="business_inquiry_ReviewList__ReviewList">
				<c:forEach var="reply" items="${questionDetail.generalQuestionReplyList}">
					<li class="business_inquiry_ReviewItem">
						<div class="business_inquiry_ReviewItem__User">
							<div class="business_inquiry_ReviewItem__UserPictureWrap">
								<span class="business_inquiry_ReviewItem__UserName" id="businessInquiryDetailUserNickName">${reply.admin.account}</span>
								<span class="business_inquiry_ReviewItem__ReviewDate" id="businessInquiryDetailReviewDate">
								<tf:formatDateTime value="${reply.registeredAt}" pattern="yyyy.MM.dd"/></span>
							</div>
							<div class="inquiry_ReviewItem__ReviewTextWrap">
								<p class="inquiry_ReviewItem__ReviewText"><br>${reply.reply}</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>

		<table class="business_inquiry_tbl_pren" id="businessInquiryDetailTblPren">
			<colgroup>
				<col style="width: 100px">
				<col style="">
			</colgroup>
			<tbody>
			<c:if test="${!empty beforeQuestion}">
				<tr>
					<th scope="row">이전 글</th>
					<td>
						<a onclick="switchNotice(${beforeQuestion.generalQuestionNo})" class="title_link">${beforeQuestion.title}</a>
					</td>
				</tr>
			</c:if>

			<c:if test="${!empty afterQuestion}">
				<tr>
					<th scope="row">다음 글</th>
					<td>
						<a onclick="switchNotice(${afterQuestion.generalQuestionNo})" class="title_link">${afterQuestion.title}</a>
					</td>
				</tr>
			</c:if>
			</tbody>
		</table>



		<div class="btn_area">
			<input id="businessInquiryDetailListGo" type="button" class="listgo" value="목록" onclick="listQuestion()">
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>

<input id="account" type="hidden" value="<%=id%>">
<input id="userName" type="hidden" value="<%=userName%>">
<input id="type" type="hidden" value="<%=type%>">
</body>

<script>
	var account = $("#account").val();
	var name = $("#userName").val();
	var type = $("#type").val();
	var nowPage = <%=pages%>;

	function switchNotice(now) {
		location.href="QuestionDetail?no="+now+"&id="+account+"&name="+name+"&type=general&page="+nowPage;
	}

	function listQuestion() {
		location.href = "/dys/Question?id="+id+"&name="+name+"&type=general&page="+nowPage;
	}

</script>
</html>