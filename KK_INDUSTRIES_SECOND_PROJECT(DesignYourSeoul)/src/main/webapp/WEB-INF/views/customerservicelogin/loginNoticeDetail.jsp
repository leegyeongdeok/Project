<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice_detail</title>
<style>

*{
margin: 0;
padding: 0;
}
.notice_detail_top{
   height: 380px;
   width: 1800px;
   margin: 0 auto;
}
.notice_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1800px;
    height: auto;
    margin: 0 auto;
 
}
.notice_tit {
    font-size: 60px;
    font-weight: 500;
}
.notice_desc{
   font-size: 20px;
    font-weight: 400;
    margin-top: 40px;
}
.content_block {
 margin: 0 auto;
    position: relative;
    width: 1800px;
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
.notice_detail_tbl_cell {
    width: 950px;
    height: 80px;
    display: table-cell;
    line-height: 1.4;
    vertical-align: middle;
}
.brd_date {
    position: absolute;
    top: 45px;
    right: 20px;
    font-size: 15px;
}
.editor_area {
    min-height: 300px;
    padding: 40px 20px;
    line-height: 25px;
    border-bottom: 1px solid #222;
}
table.tbl_pren {
	margin: 0 auto;
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
.content{
 margin: 0 auto;
   width: 55%;
}


</style>


</head>
<body>
<%@ include file="../include/loginheader.jsp"%>
                  <div class="notice_detail_top">
      
    
         
            <div class="notice_detail_bok">
            
               <div class="notice_tit overlay">공 지 사 항</div>
               <div class="notice_desc overlay">DYS(Design Your Seoul)의 소식을 신속하고 빠르게 전해 드립니다.</div>
            </div>
    
      </div><!--notice_detail_top-->
      
      	<div class="content_block">
            <div class="content" >
		     <h1 class="brd_title">
		     
		    	<span class="notice_detail_tbl_cell">
		    		(공지) 공지사항 세부보기
		    	</span>
		    
		    	
		    	<span class="brd_date">2019.10.10</span>
		    
		    </h1>
		    <div class="brd_editor">
		        <div class="editor_area">
		            <p></p><p>※ 어쩌구 저쩌구 어쩌구 저쩌구 안내 말씀드립니다.</p>

<p><br>
- 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 .</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 어쩌구 저쩌구 </p>

		        </div>
		        
		    </div>
		    <table class="tbl_pren">
		    	  <colgroup>
		            <col style="width:100px">
		            <col style="*">
		        </colgroup>
		        <tbody>
		        <tr>
		            <th scope="row">이전 글</th>
		            <td>
        		<a href="" class="title_link" onclick="">(공지) 어쩌구 저쩌구 이전글</a>
		            		
		            		
		            	
		            </td>
		        </tr>
		        <tr>
		            <th scope="row">다음 글</th>
		            <td>
		            		
		            		<a href="" class="title_link" onclick="">(공지) 어쩌구 저쩌구 다음글</a>
		            		
		            		
		            	
		            </td>
		        </tr>
		        </tbody>
		    </table>
		    <div class="btn_area">
				<input type="button" class="listgo" value="목록" onclick="location.href='loginNotice'">		        		    
		    </div>
		</div>
		</div>
		<%@ include file="../include/footer.jsp"%>
		</body>
</html>