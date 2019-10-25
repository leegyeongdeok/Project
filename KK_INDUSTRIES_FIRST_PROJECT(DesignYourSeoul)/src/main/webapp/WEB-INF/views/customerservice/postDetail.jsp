<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>post_detail</title>
<style>

*{
margin: 0;
padding: 0;
}
.post_detail_top{
   height: 380px;
   width: 1800px;
   margin: 0 auto;
}
.post_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1800px;
    height: auto;
    margin: 0 auto;
 
}
.post_tit {
    font-size: 60px;
    font-weight: 500;
}
.post_desc{
   font-size: 20px;
    font-weight: 400;
    margin-top: 40px;
}
.post_content_block {
 margin: 0 auto;
    position: relative;
    width: 1800px;
    min-height: 600px;
}
.post_brd_title {
    position: relative;
    height: 80px;
    padding: 15px;
    font-size: 25px;
    border-top: 2px solid #222;
    border-bottom: 1px solid #222;
}
.post_detail_tbl_cell {
    width: 950px;
    height: 80px;
    display: table-cell;
    line-height: 1.4;
    vertical-align: middle;
}
.post_brd_date {
    position: absolute;
    top: 45px;
    right: 20px;
    font-size: 15px;
}
.post_editor_area {
    min-height: 300px;
    padding: 40px 20px;
    line-height: 25px;
    border-bottom: 1px solid #222;
}
table.post_tbl_pren {
	margin: 0 auto;
    width: 100%;
    margin-top: 50px;
    border-top: 1px solid #ddd;
}
table.post_tbl_pren th {
    height: 60px;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    color: #222;
    text-align: left;
}
table.post_tbl_pren td {
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
.post_ReviewList {
    width: 100%;
    margin-top: 19px;
}
.post_ReviewList__Header {
 padding: 10px 20px;
}
fieldset {
    border: 0;
}
.search_bar {
    display: inline-block;
    width: 92%;
    height: 45px;
    border: 2px solid orange;
    background-color: #fff;
}
.input_text {
    margin: 12px 0 0 9px;
    width: 86%;
    height: 23px;
    outline: 0;
    border: 0;
    background-color: transparent;
    color: #000;
    font-weight: 700;
    font-size: 18px;
    line-height: 23px;
  
}
.sch_smit {
    overflow: visible;
    width: 7%;
    height: 50px;
    border: 0;
    background: orange;
	color: #fff;
	font-size: 15px;
}
ul, ul li {
    list-style: none;
}
.post_ReviewItem__User {
    padding: 30px ;
}
.post_ReviewItem__UserNickName {
    margin-right: 60%;
}
.post_ReviewItem__ReviewDate {
float:right;
    font-size: 14px;
}
.post_ReviewItem__ReviewText {
    margin-top: 20px;
}
.post_ReviewItem {
    position: relative;
    border-bottom: 1px solid #DBDBDB;
}
.post_brd_nikname{
margin-top: 15px;
margin-left: 70px;
font-size: 20px;
vertical-align: middle;
}
.post_brd_writer{
font-size: 20px; 
}
.content{
 margin: 0 auto;
   width: 55%;
}
</style>


</head>
<body>
   <%@ include file="../include/header.jsp"%>
         <div class="post_detail_top">
         
         
            <div class="post_detail_bok">
            
               <div class="post_tit overlay">게 시 판</div>
            <div class="post_desc overlay"> 다른 회원님들과 자유로운 소통을 해보세요.<br> 게시물을 작성하실 시 바른말을 사용해 주세요.</div>
            </div>
      
      </div>
      <!--post_detail_top-->
      
      	<div class="post_content_block">
            <div class="content" id="content">
		     <h1 class="post_brd_title">
		     
		    	<span class="post_detail_tbl_cell">
		    		(제목) 게시물 세부보기ssssssssssssssssssssssssssss
		    		
		    	</span>
		    
		    	
		    	<span class="post_brd_date">2019.10.10</span>
		    </h1>
		    <div class="post_brd_editor">
		<span><p class="post_brd_writer" style="float: left; ">글쓴이:</p> <p class="post_brd_nikname" >아무게</p></span>
		        <div class="post_editor_area">
		            <p></p><p>※ 어쩌구 저쩌구 어쩌구 저쩌구 게시물입 니다.</p>

<p><br>
- 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 .</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 </p>

		        </div>
		        
		    </div>
		       <!--  뎃글 -->
          <section class="post_ReviewList">
          <header class="post_ReviewList__Header">
              <h2 class="post_ReviewList__Title">
             <span class="post_ReviewList__post_NameSuffixDesktop">뎃글</span><span class="post_ReviewList__post_NameSuffixMobile">
             <span>(<span class="post_ReviewList__AllCount"> 55</span> )</span></h2>

            </header>
		<fieldset>

        <span class="search_bar">
            <input id="query" name="query" type="text" title="검색어 입력" maxlength="255" class="input_text" >
        </span>
              <button id="search_btn" type="submit" title="검색" tabindex="3" class="sch_smit" ><span class="blind">뎃글 달기</span></button>
    </fieldset>
    
<ul class="post_ReviewList__ReviewList">

     <li class="post_ReviewItem post_ReviewList__ReviewItem">
    <div class="post_ReviewItem__User">
      <div class="post_ReviewItem__UserPictureWrap">
      <span class="post_ReviewItem__UserNickName">닉네임</span><span  class="post_ReviewItem__ReviewDate" >2019-09-15</span>
      </div>
      <div class="post_ReviewItem__ReviewTextWrap">

        <p class="post_ReviewItem__ReviewText">
                   어쩌ㄱ   저쩌구 어쩌구!
        </p>
      </div>
    </div>
</li>
 <li class="post_ReviewItem post_ReviewList__ReviewItem">
    <div class="post_ReviewItem__User">
      <div class="post_ReviewItem__UserPictureWrap">
      <span class="post_ReviewItem__UserNickName">닉네임</span><span  class="post_ReviewItem__ReviewDate" >2019-09-15</span>
      </div>
      <div class="post_ReviewItem__ReviewTextWrap">

        <p class="post_ReviewItem__ReviewText">
                   어어얼시구 들어간다 어절씨구 들어간다!
        </p>
      </div>
    </div>
</li>
</ul>
          </section>
          <!--뎃글끝 -->
		   
		    
		    
		    <table class="post_tbl_pren">
		    	  <colgroup>
		            <col style="width:100px">
		            <col style="*">
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row">이전 글</th>
		            <td>
        		<a href="" class="post_title_link" onclick="">(문의) 어쩌구 저쩌구 이전글</a>
		            </td>
		        </tr>
		        <tr>
		            <th scope="row">다음 글</th>
		            <td>
		            		<a href="" class="post_title_link" onclick="">(문의) 어쩌구 저쩌구 다음글</a>
		            </td>
		        </tr>
		        </tbody>
		    </table>
		    
		    
		    
		    <div class="btn_area">
				<input type="button" class="listgo" value="목록" onclick="location.href='postCard'">		        		    
		    </div>
		</div>
		</div>
		<%@ include file="../include/footer.jsp"%>
		
		</body>
</html>