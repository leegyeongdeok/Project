<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>

*{
margin: 0;
padding: 0;
}
.business_notice_detail_top{
   height: 300px;
   width: 1000px;

}
.business_notice_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1000px;
    height: auto;

 
}
.business_notice_tit {
    font-size: 60px;
    font-weight: 500;
}
.business_notice_desc{
   font-size: 20px;
    font-weight: 400;
    margin-top: 40px;
}
.content_block {

    position: relative;
    width: 1000px;
    min-height: 600px;
}
.brd_title {
    position: relative;
    height: 80px;
    padding: 15px;
    font-size: 25px;
    border-top: 2px solid #222;
    border-bottom: 1px solid #222;
}
.business_notice_detail_tbl_cell {
    width: 950px;
    height: 80px;
    display: table-cell;
    line-height: 1.4;
    vertical-align: middle;
}
.business_brd_date {
    position: absolute;
    top: 45px;
    right: 20px;
    font-size: 15px;
}
.business_editor_area {
    min-height: 300px;
    padding: 40px 20px;
    line-height: 25px;
    border-bottom: 1px solid #222;
}
table.tbl_pren {

    width: 100%;
    margin-top: 50px;
    border-top: 1px solid #ddd;
}
table.tbl_pren th {
    height: 60px;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    color: #222;
    text-align: left;
}
table.tbl_pren td {
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
.cancel, .registration,.delete {

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
.content{
 margin: 0 auto;
   width: 90%;
}


</style>


</head>
<body>

                  <div class="business_notice_detail_top">
      
    
         
            <div class="business_notice_detail_bok">
            
               <div class="business_notice_tit overlay">공 지 사 항</div>
            </div>
    
      </div><!--business_notice_detail_top-->
      
      	<div class="content_block">
            <div class="content" >
		     <h1 class="brd_title">
		     
		    	<span class="business_notice_detail_tbl_cell">
		    		${notice.title}
		    	</span>
		    
		    	
		    	<span class="business_brd_date">
					<tf:formatDateTime value="${notice.registeredAt}" pattern="yyyy.MM.dd"/>
				</span>
		    
		    </h1>
		    <div class="brd_editor">
		        <div class="business_editor_area">
					${notice.content}
		        </div>
		    </div>
		 
		   <div class="btn_area">
		    <input type="button" class="registration" value="수정" id="adminNoticeModifyRegistration"onclick="location.href='adminNoticeModify'" />
		    <input type="button" class="delete" value="삭제" id="adminNoticeModifyDelete" onclick="" />
		    <input type="button" class="cancel" value="취소" id="adminNoticeWritingCancel" onclick="window.close()">		        		    
		    
		    </div>
		</div>
		</div>

		</body>
</html>