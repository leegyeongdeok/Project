<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>business_post_detail</title>
<style>

*{
margin: 0;
padding: 0;
}
.business_post_detail_top{
   height: 300px;
   width: 1000px;
   margin: 0 auto;
}
.business_post_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1000px;
    height: auto;
    margin: 0 auto;
 
}
.business_post_tit {
    font-size: 60px;
    font-weight: 500;
}
.business_post_desc{
   font-size: 20px;
    font-weight: 400;
    margin-top: 40px;
}
.business_post_content_block {
 margin: 0 auto;
    position: relative;
    width: 1000px;
    min-height: 600px;
}
.business_post_brd_title {
    position: relative;
    height: 80px;
    padding: 15px;
    font-size: 25px;
    border-top: 2px solid #222;
    border-bottom: 1px solid #222;
}
.business_post_detail_tbl_cell {
    width: 950px;
    height: 80px;
    display: table-cell;
    line-height: 1.4;
    vertical-align: middle;
}
.business_post_brd_date {
    position: absolute;
    top: 45px;
    right: 20px;
    font-size: 15px;
}
.business_post_editor_area {
    min-height: 300px;
    padding: 40px 20px;
    line-height: 25px;
    border-bottom: 1px solid #222;
}
table.business_post_tbl_pren {
	margin: 0 auto;
    width: 100%;
    margin-top: 50px;
    border-top: 1px solid #ddd;
}
table.business_post_tbl_pren th {
    height: 60px;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    color: #222;
    text-align: left;
}
table.business_post_tbl_pren td {
    position: relative;
    height: 60px;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    vertical-align: middle;
    text-align: left;
}
.btn_area {
margin-top:5px;
  margin-bottom:20px;
    text-align: right;
}
.cancel {

    width: 50px;
    height: 30px;
    border: none;
    border-radius: 0;
    background-color: orange;
    cursor: pointer;
    text-align: center;
    color: #fff;
    font-size: 15px;

}
a {
    color: black;
    text-decoration: none;
}
.business_post_ReviewList {
    width: 100%;
    margin-top: 19px;
}
.business_post_ReviewList__Header {
 padding: 10px 20px;
}
fieldset {
    border: 0;
}
.search_bar {
    display: inline-block;
    width: 90%;
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
    width: 8%;
    height: 50px;
    border: 0;
    background: orange;
	color: #fff;
	font-size: 15px;
}
ul, ul li {
    list-style: none;
}
.business_post_ReviewItem__business {
    padding: 30px ;
}
.business_post_ReviewItem__businessname {
    margin-right: 60%;
}
.business_post_ReviewItem__ReviewDate {
float:right;
    font-size: 14px;
}
.business_post_ReviewItem__ReviewText {
    margin-top: 20px;
}
.business_post_ReviewItem {
    position: relative;
    border-bottom: 1px solid #DBDBDB;
}
.business_post_brd_nik{
margin-top: 15px;
margin-left: 70px;
font-size: 20px;
vertical-align: middle;
}
.business_post_brd_writer{
font-size: 20px; 
}
.content{
 margin: 0 auto;
   width: 90%;
}
</style>


</head>
<body>

         <div class="business_post_detail_top">
         
         
            <div class="business_post_detail_bok">
            
               <div class="business_post_tit overlay">문 의 사 항</div>
            </div>
      
      </div>
      <!--business_post_detail_top-->
      
      	<div class="business_post_content_block">
            <div class="content" >
		     <h1 class="business_post_brd_title">
		     
		    	<span class="business_post_detail_tbl_cell" id="businessPostDetailTitle">
		    		${generalQuest.title}
		    	</span>
		    
		    	
		    	<span class="business_post_brd_date">
                    <tf:formatDateTime value="${generalQuest.registeredAt}" pattern="yyyy.MM.dd"/>
                </span>

		    </h1>
		    <div class="business_post_brd_editor">
		<span><p class="business_post_brd_writer" style="float: left; " id="businessPostDetailWriter">글쓴이:</p>
            <p class="business_post_brd_nik" id="businessPostDetailNikname">${generalQuest.generalUser.nickname}</p></span>
		        <div class="business_post_editor_area">
                    ${generalQuest.content}
		        </div>
		        
		    </div>

		    <div class="btn_area">
     <input type="button" class="cancel" value="취소" id="adminNoticeWritingCancel" onclick="window.close()">		
		    </div>
		</div>
		</div>

		</body>
</html>