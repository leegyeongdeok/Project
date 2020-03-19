<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inquiry_detail</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.inquiry_detail_top {
	height: 380px;
	width: 1800px;
	margin: 0 auto;
}

.inquiry_detail_bok {
	padding-top: 100px;
	text-align: center;
	width: 1800px;
	height: auto;
	margin: 0 auto;
}

.inquiry_tit {
	font-size: 60px;
	font-weight: 500;
}

.inquiry_desc {
	font-size: 20px;
	font-weight: 400;
	margin-top: 40px;
}

.inquiry_content_block {
	margin: 0 auto;
	position: relative;
	width: 1800px;
	min-height: 600px;
}

.inquiry_brd_title {
	position: relative;
	height: 80px;
	padding: 15px;
	font-size: 25px;
	border-top: 2px solid #222;
	border-bottom: 1px solid #222;
}

.inquiry_detail_tbl_cell {
	width: 950px;
	height: 80px;
	display: table-cell;
	line-height: 1.4;
	vertical-align: middle;
}

.inquiry_brd_date {
	position: absolute;
	top: 45px;
	right: 20px;
	font-size: 15px;
}

.inquiry_editor_area {
	min-height: 300px;
	padding: 40px 20px;
	line-height: 25px;
	border-bottom: 1px solid #222;
}

table.inquiry_tbl_pren {
	margin: 0 auto;
	width: 100%;
	margin-top: 50px;
	border-top: 1px solid #ddd;
}

table.inquiry_tbl_pren th {
	height: 60px;
	padding: 0 20px;
	border-bottom: 1px solid #ddd;
	color: #222;
	text-align: left;
}

table.inquiry_tbl_pren td {
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

.inquiry_ReviewList {
	width: 100%;
	margin-top: 19px;
}

.inquiry_ReviewList__Header {
	padding: 10px 20px;
}

fieldset {
	border: 0;
}





ul, ul li {
	list-style: none;
}

.inquiry_ReviewItem__User {
	padding: 30px;
}

.Review_review_list {
	padding: 0 30px;
}

.inquiry_ReviewItem__UserNickName {
	margin-right: 60%;
}

.inquiry_ReviewItem__ReviewDate, .inquiry_ReviewItem__Review_reviewDate
	{
	float: right;
	font-size: 14px;
}

.inquiry_ReviewItem__ReviewText, .inquiry_ReviewItem__Review_reviewText
	{
	margin-top: 20px;
}

.inquiry_ReviewItem {
	position: relative;
	border-bottom: 1px solid #DBDBDB;
}

.inquiry_ReviewItem__review, .reviewTextarea_box {
	margin: 30px;
}

.inquiry_Review_reviewItem {
	position: relative;
	border-top: 1px solid #DBDBDB;
}

.inquiry_brd_nikname {
	margin-top: 15px;
	margin-left: 70px;
	font-size: 20px;
	vertical-align: middle;
}

.inquiry_brd_writer {
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
.review_nickname {
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
   .inquiry_Review_reviewTextarea{
   margin:0 30px;
   border-top: 1px solid #b3b3b3
   }
   
  .reviewicon {
  float:left;
 margin-top:30px;
   
    left: 0;
    width: 20px;
    height: 20px;
  
    background-image: url(resources/image/review.PNG);
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
.inquiry_ReviewList__Title{
padding-bottom:10px;
border-bottom: 1px solid #b3b3b3;
}
.content{
 margin: 0 auto;
   width: 55%;
}
</style>


</head>
<body>
<%@ include file="../include/header.jsp"%>
	<div class="inquiry_detail_top">


		<div class="inquiry_detail_bok">

			<div class="inquiry_tit overlay">문 의 사 항</div>
			<div class="notice_desc overlay">회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.<br>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.<br>문의사항에 작성된 내용은 본인 외에는 확인 하실 수 없습니다</div>
		</div>

	</div>
	<!--inquiry_detail_top-->

	<div class="inquiry_content_block">
		<div class="content" >
			<h1 class="inquiry_brd_title">

				<span class="inquiry_detail_tbl_cell"> (문의) 문의사항 세부보기 </span> <span
					class="inquiry_brd_date">2019.10.10</span>

			</h1>
			<div class="inquiry_brd_editor">
				<span><p class="inquiry_brd_writer" style="float: left;">글쓴이:</p>
					<p class="inquiry_brd_nikname">아무게</p></span>
				<div class="inquiry_editor_area">
					<p></p>
					<p>※ 어쩌구 저쩌구 어쩌구 저쩌구 안내 문의드립니다.</p>

					<p>
						<br> - 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구
						저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 .
					</p>

					<p>&nbsp;</p>

					<p>&nbsp;</p>

					<p>어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구
						저쩌구 어쩌구 저쩌구 어쩌구 저쩌구</p>

				</div>

			</div>
			<!--  뎃글 -->
			<section class="inquiry_ReviewList">
				<header class="inquiry_ReviewList__Header">
					<h2 class="inquiry_ReviewList__Title">
						<span class="inquiry_ReviewList__inquiry_NameSuffixDesktop">뎃글</span><span
							class="inquiry_ReviewList__inquiry_NameSuffixMobile"> <span>(<span
								class="inquiry_ReviewList__AllCount"> 55</span> )
						</span>
					</h2>

				</header>
			
				<ul class="inquiry_ReviewList__ReviewList">

					<li class="inquiry_ReviewItem">
						<div class="inquiry_ReviewItem__User">
							<div class="inquiry_ReviewItem__UserPictureWrap">
								<span class="inquiry_ReviewItem__UserNickName">닉네임</span><span
									class="inquiry_ReviewItem__ReviewDate">2019-09-15</span>
							</div>
							<div class="inquiry_ReviewItem__ReviewTextWrap">

								<p class="inquiry_ReviewItem__ReviewText">어쩌ㄱ 저쩌구 어쩌구!</p>
								<div style="margin-top: 20px;">
									<button class="Review_review_btn" id="Review_review_btn" >
										답글 <span>2</span>
									</button>
								</div>
							</div>
						</div>
						
						<!-- 답글달기 -->
							<div id="Review_review" class="Review_review" style="display:none;">

							<ul class="Review_review_list">

								<li class="inquiry_Review_reviewItem">
									<span class="reviewicon"></span>
									<div class="inquiry_ReviewItem__review">
									
										<div class="inquiry_ReviewItem__reviewPictureWrap">
									
											<span class="inquiry_ReviewItem__reviewNickName">답글러</span><span
												class="inquiry_ReviewItem__Review_reviewDate">2019-09-15</span>
										</div>
										<div class="inquiry_ReviewItem__Review_reviewTextWrap">

											<p class="inquiry_ReviewItem__Review_reviewText">어어얼시구
												들어간다 어절씨구 들어갈까??</p>
										</div>
									</div>
								</li>

								<li class="inquiry_Review_reviewItem">
								
								<span class="reviewicon"></span>
									<div class="inquiry_ReviewItem__review">
									
										<div class="inquiry_ReviewItem__reviewPictureWrap">
									
											<span class="inquiry_ReviewItem__reviewNickName">답글러2</span><span
												class="inquiry_ReviewItem__Review_reviewDate">2019-09-15</span>
										</div>
										<div class="inquiry_ReviewItem__Review_reviewTextWrap">

											<p class="inquiry_ReviewItem__Review_reviewText">어어얼시구
												들어간다 어절씨구 안들어가</p>
										</div>
									</div>
								</li>


							</ul>
							<div class="inquiry_Review_reviewTextarea">
							<span class="reviewicon"></span>
								<div class="reviewTextarea_box">

										<div class="review_textarea">
										
												<div class="review_nickname">
													<p>wnstn949</p>
												</div>
										</div>
										<div class="review_write_area">
											
											<div class="review_inbox" style="height: 56px;">
												<textarea id="review__reply_textarea"
													class="review__reply_textarea" rows="3" cols="30"
													></textarea>
											
											</div>
										</div>
																			
										<div class="review_upload_box">
										
											<button type="button" class="review_upload">
												<span class="review_txt_upload">등록</span>
											</button>
										</div>

								</div>
							</div>
							<input id="reviewclose" class="reviewclose"type="button" value="접기" >
						</div> 
						<!-- 답글달기 끝 -->
					</li>
					
					
					
					<li class="inquiry_ReviewItem">
						<div class="inquiry_ReviewItem__User">
							<div class="inquiry_ReviewItem__UserPictureWrap">
								<span class="inquiry_ReviewItem__UserNickName">닉네임</span><span
									class="inquiry_ReviewItem__ReviewDate">2019-09-15</span>
							</div>
							<div class="inquiry_ReviewItem__ReviewTextWrap">

								<p class="inquiry_ReviewItem__ReviewText">어어얼시구 들어간다 어절씨구
									들어간다!</p>
								<div style="margin-top: 20px;">
									<button class="Review_review_btn" id="Review_review_btn">
										답글 <span>2</span>
									</button>
								</div>
							</div>
						</div> 
						
					</li>
				</ul>
			</section>
			<!--뎃글끝 -->
			<script >
			 window.onload = function(){
				 var review_review = document.getElementById('Review_review');
				 var openbtn = document.getElementById('Review_review_btn');
				 var closebtn = document.getElementById('reviewclose');
				 
				openbtn.onclick = function() {
					review_review.style.display = 'block';
					
				}
				closebtn.onclick = function(){
					review_review.style.display = 'none';
				}
				
				 
			 }
			</script>



			<table class="inquiry_tbl_pren">
				<colgroup>
					<col style="width: 100px">
					<col style="">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">이전 글</th>
						<td><a href="" class="inquiry_title_link" onclick="">(문의)
								어쩌구 저쩌구 이전글</a></td>
					</tr>
					<tr>
						<th scope="row">다음 글</th>
						<td><a href="" class="inquiry_title_link" onclick="">(문의)
								어쩌구 저쩌구 다음글</a></td>
					</tr>
				</tbody>
			</table>



			<div class="btn_area">
				<input type="button" class="listgo" value="목록" onclick="location.href='inquiry'">
			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>