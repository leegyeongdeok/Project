<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inquiry_writing</title>
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
   width: 55%;
}
.post_writing_title{
	font-size:25px;
 	width: 90%;
    height: 28px;
    border: 0;
    font-weight: bolder;
}
</style>


</head>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
<script type="text/javascript">
	$(function(){
	    //전역변수
	    var obj = [];              
	    //스마트에디터 프레임생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: obj,
	        elPlaceHolder: "content",
	        sSkinURI: "/resources/editor/SmartEditor2Skin.html",
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
	    $("#insertQuestion").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        obj.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

	        //폼 submit
			var account = $("#account").val();
			$.ajax({
				url : '/function/find/ownerId/'+account,
				type : "GET",
				dataType:"JSON",
				success : function(data){
					$("#ownerUserId").val(data);
					nextStep();
				},
			});
	    });
	});

	function nextStep() {
		var account = $("#account").val();
		var userName = $("#userName").val();
		var title = $("#titleArea").val();
		$("#title").attr('value', title);

		var form = $("#insertQuestionFrm").serializeObject();
		$.ajax({
			url : '/dys/Question/owner/create',
			type : "POST",
			contentType:'application/json',
			dataType : 'json',
			data : JSON.stringify(form),
			success : function(data){

			},
			error : function (data) {
				alert("문의가 등록되었습니다.");
				location.href="/dys/Question?id="+account+"&name="+userName+"&type=owner"+"&page=1";
			}
		});
	}
</script>
<body>


<%
	String userName = request.getParameter("name");
	String id = request.getParameter("id");
	String pages = request.getParameter("page");
	String type = request.getParameter("type");
%>

         <div class="post_detail_top">

            <div class="post_detail_bok">
               <div class="post_tit overlay">문 의 사 항</div>
             <div class="notice_desc overlay">회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.<br>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.<br>문의사항에 작성된 내용은 본인 외에는 확인 하실 수 없습니다</div>
            </div>
      
      </div>
      <!--post_detail_top-->
      
      	<div class="post_content_block">
            <div class="content" >
		     <h1 class="post_brd_title">
		    	<span class="post_detail_tbl_cell">
		    	 제 목 :
		    	 <input id="titleArea" class="post_writing_title" type="text"   placeholder="제목을 입력하세요">
		    	</span>
		    	<!-- <span class="post_brd_date">2019.10.10</span> -->
			 </h1>
		    <div class="post_brd_editor">
		<!-- <span><p class="post_brd_writer" style="float: left; ">글쓴이:</p> <p class="post_brd_nikname" >아무게</p></span> -->
		   	<form action="./insertBoard.do" method="post" id="insertQuestionFrm" enctype="multipart/form-data">
				<input name="title" id="title" class="post_writing_title" type="hidden">
				<textarea name="content" id="content" style="width: 100%; height: 500px;"></textarea>
				<input name="owner_id" id="ownerUserId" class="post_writing_title" type="hidden">
			</form>
		    </div>

		    <div class="btn_area">
		    <input id="insertQuestion" type="button" class="registration" value="등록" />
		    <input type="button" class="cancel" value="취소" onclick="cancel()">
		    
		    </div>
		</div>
		</div>
		<%@ include file="../include/footer.jsp"%>

<input id="type" type="hidden" value="<%=type%>">
<input id="name" type="hidden" value="<%=userName%>">
<input id="id" type="hidden" value="<%=id%>">

<script>
	var account = $("#id").val();
	var userName = $("#name").val();
	var nowPage = <%=pages%>;
	var type = $("#type").val();

	function cancel() {
		location.href = "/dys/Question?id="+account+"&name="+userName+"&type="+type+"&page="+nowPage;
	}
</script>

		</body>
</html>