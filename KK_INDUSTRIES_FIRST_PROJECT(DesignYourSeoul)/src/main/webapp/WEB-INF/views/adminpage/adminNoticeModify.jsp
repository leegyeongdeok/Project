<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice_writing</title>
<style>

*{
margin: 0;
padding: 0;
}
.post_detail_top{
   height: 300px;
   width: 1000px;

}
.post_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1000px;
    height: auto;

 
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

    position: relative;
    width: 1000px;
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

.btn_area {
margin-top:5px;
  margin-bottom:20px;
    text-align: right;
}
.cancel, .registration {

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

.cancel{
margin-left: 5px;
margin-right: 10px;
}
.content{
 margin: 0 auto;
   width: 90%;
}
.post_writing_title{
	font-size:25px;
 	width: 80%;
    height: 28px;
    border: 0;
    font-weight: bolder;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<script type="text/javascript">
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "editor",
	        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
	        htParams : {
	            // 툴바 사용 여부
	            bUseToolbar : true,            
	            // 입력창 크기 조절바 사용 여부
	            bUseVerticalResizer : false,    
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부
	            bUseModeChanger : false,
	        }
	    });
	    //전송버튼
	    $("#insertBoard").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        //폼 submit
	        $("#insertBoardFrm").submit();
	    });
	});
</script>
<body >

         <div class="post_detail_top">
         
         
            <div class="post_detail_bok">
            
               <div class="post_tit overlay">공 지 사 항</div>
   
            </div>
      
      </div>
      <!--post_detail_top-->
      
      	<div class="post_content_block">
            <div class="content" >
		     <h1 class="post_brd_title">
		     
		    	<span class="post_detail_tbl_cell" id="businessInquiryWritingTblCell">
		    	 제 목 :
		    	 <input id="adminNoticeModifyTitle" class="post_writing_title" type="text"  placeholder="제목을 입력하세요" value="어쩌구저쩌구">
		    		
		    	</span>
		    
		    	
		    	<!-- <span class="post_brd_date">2019.10.10</span> -->
		    </h1>
		    <div class="post_brd_editor">
		<!-- <span><p class="post_brd_writer" style="float: left; ">글쓴이:</p> <p class="post_brd_nikname" >아무게</p></span> -->
		   
		   
		   	<form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
			<textarea id="businessInquiryWritingTextArea" name="editor" id="editor" style="width: 100%; height: 500px;"></textarea>
		
	</form>
		    </div>
		   
		 
		    
		    
		    
		    <div class="btn_area">
		    <input type="button" class="registration" value="수정" id="adminNoticeModifyRegistration" />
		    <input type="button" class="cancel" value="취소" id="businessInquiryWritingCancel" onclick="location.href='adminNoticeDetail'">		        		    
		    
		    
		    </div>
		</div>
		</div>


		</body>
</html>