<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
</head>

<style type="text/css">
   a:link {
      color: orange;
      text-decoration: none;
   }

   a:visited {
      color: black;
      text-decoration: none;
   }

   .wrap {
      min-height: 830px;
   }
</style>

<style>
   .find_info {
      line-height: 14px;
      padding-top: 20px;
      text-align: center;
      color: #8e8e8e;
      border-top: 1px solid #e4e4e5;
   }
   /* 로그인버튼 */
   .btn_area {
      margin-top: 20px;
   }

   .btn_Ok {
      display: block;
      width: 18%;
      height: 42px;
      margin-left: 27%;
      margin-right: 10%;
      border: none;
      border-radius: 0;
      background-color: orange;
      cursor: pointer;
      text-align: center;
      color: #fff;
      font-size: 16px;
      -webkit-appearance: none;
      float: left;
   }

   .btn_Pw {
      display: block;
      width: 18%;
      height: 42px;
      border: none;
      border-radius: 0;
      background-color: orange;
      cursor: pointer;
      text-align: center;
      color: #fff;
      font-size: 16px;
      -webkit-appearance: none;
   }

   .container, #header {
      width: 715px;
      margin: 0 auto;
   }

   /* 버튼 아이디비번 사이즈 */
   fieldset {
      border: 0;
      margin-left: 150px;
      margin-right: 150px;
   }

   .input_row {
      width: 69%;
      position: relative;
      height: 100%;
      margin: 0 auto;
      padding: 10px 10px 10px 10px;
      border: solid 1px #dadada;
      background: #fff;
   }

   h4>label {
      margin-left: 14%;
   }

   .int {
      font-size: 15px;
      line-height: 16px;
      position: relative;
      z-index: 9;
      width: 100%;
      height: 16px;
      padding: 7px 0 6px;
      color: #000;
      border: none;
      background: #fff;
      -webkit-appearance: none;
   }

   .logoimg {
      overflow: hidden;
      width: 300px;
      height: 300px;
      margin-left: 230px;
      padding-top: 0px;
   }

   .container {
      padding-top: 12%;
   }

   .title h1 {
      width: 35%;
      border-bottom: 4px solid #989494;
   }

   .title, .account {
      padding-bottom: 3px;
      padding: 2px;
      width: 71%;
      margin: auto;
   }

   .account1 {
      margin-top: 4%;
      margin-bottom: 8%;
      width: 72%;
      margin: auto;
   }

   .id_p {
      float: left;
      margin-left: 5%;
      margin-top: 0;
      width: 150px;
   }

   .type_p {
      margin-left: 5%;
      margin-top: 0;
      margin-right: 0%;
      float: left;
      width: 100px;
   }

   .idbirth_p{
      margin-left: 70%;
      width: 165px;
   }

   .id_list {
      padding-left: 0;
   }

   .id_list li {
      list-style: none;
   }

   .id_list li> strong {
      float: left;
      margin-right: 40%;
      margin-left: 10%;
   }

   .id_list li> strong {
      font-weight: 100;
   }

   li p> strong {
      font-weight: 100;
   }

   .id_check {
      float: left;
      margin-top: 7px;
   }



</style>

<body>
<div class="wrap">
   <!-- container -->
   <div class="container">
      <!-- content -->
      <div class="content">
         <!-- title -->
         <div class="title">
            <p>
            <h1>아이디 찾기</h1>
            </p>
         </div>

         <!-- 설명란 -->
         <div class="account1">
            <p>
            <h3>고객님의 정보와 일치하는 아이디 목록입니다.</h3>
            </p>
         </div>

         <form id="id_chk_form">
         <div class="id_area">
            <div class="input_row" id="id_area">
               <ul class="id_list" id="id_list">
                  <input type="hidden" id="phone" value="${phone}">
                  <input type="hidden" id="name" value="${name}">
               </ul>
            </div>
         </div>
         </form>

         <div class="btn_area">
            <button type="button" onclick="location.href='login'" id="btnOk" class="btn_Ok">
               <span>로그인 하러가기</span>
            </button>
            <button type="button" onclick="findPswd()" id="btnPw" class="btn_Pw">
               <span>비밀번호 찾기</span>
            </button>
         </div>

      </div>
   </div>
</div>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
<script type="text/javascript">
   var name = $("#name").val();
   var phone = $("#phone").val();
   var length;
   var index = 0;
   var runChk;
   function run(id){
      runChk = id.substring(3,4);
      if($("#"+id).prop('checked') == true){
         for(var i = 1; i<=index; i++){
            if(i != runChk){
               $("#chk"+i).prop('checked', false);
            }
         }
      }
   }

   $(function(){

      $.ajax({
         url : '/api/generalUser/get/findUser/'+name+'/'+phone,
         type : "GET",
         dataType:"JSON",
         success : function(data){
            for(var i = 0; i<data.length; i++){
               index++;
               var account = data[i].account.toString();
               var regiseredAt = data[i].registered_at.toString();
               var userType = "일반고객";
               var date = "가입 :";
               length = data.length;
               date += regiseredAt.substring(0,4)+".";
               date += regiseredAt.substring(5,7)+".";
               date += regiseredAt.substring(8,10);

               $("#id_list").append("<li>"+"<input onclick='run(this.id)' class=\"id_check\" type=\"checkbox\" id=\"chk\">"
                       +"<p class=\"id_p\"><strong id=\"user_id\">"+account+"</strong></p>"+
                       "<p class=\"type_p\"><strong id=\"user_type\">"+userType+"</strong></p>"+
                       "<p class=\"idbirth_p\"><strong>"+date+"</strong></p></li>");
               $("#chk").attr('id',"chk"+index);
               $("#user_type").attr('id',"user_type"+index);
               $("#user_id").attr('id',"user_id"+index);
            }
         },
         error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(request);
         }

      });

      $.ajax({
         url : '/api/ownerUser/get/findUser/'+name+'/'+phone,
         type : "GET",
         dataType:"JSON",
         success : function(data){
            for(var i = 0; i<data.length; i++){
               index++;
               var account = data[i].account.toString();
               var regiseredAt = data[i].registered_at.toString();
               var userType = "업주고객";
               var date = "가입 :";
               date += regiseredAt.substring(0,4)+".";
               date += regiseredAt.substring(5,7)+".";
               date += regiseredAt.substring(8,10);


               $("#id_list").append("<li>"+"<input onclick='run(this.id)' class=\"id_check\" type=\"checkbox\" id=\"chk\">"
                       +"<p class=\"id_p\"><strong id=\"user_id\">"+account+"</strong></p>"+
                       "<p class=\"type_p\"><strong id=\"user_type\">"+userType+"</strong></p>"+
                       "<p class=\"idbirth_p\"><strong>"+date+"</strong></p></li>");

               $("#chk").attr('id',"chk"+index);
               $("#user_type").attr('id',"user_type"+index);
               $("#user_id").attr('id',"user_id"+index);
            }
         },
         error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(request);
         }
      });
   });

   function findPswd(){
      var id = $("#user_id" + runChk).text();
      var userType;
      var nullChecker;

      if($("#user_type"+runChk).text() == '일반고객'){
         userType = "general";
      }else{
         userType = "owner";
      }

      for(var i = 1; i<=index; i++){
         if(!$("#chk"+i).prop('checked')){
            nullChecker = true;
         }else {
           nullChecker = false;
           break;
         }
      }
      if(nullChecker){
         alert("비밀번호를 찾으려는 아이디를 선택해주세요.")
      }else{
         location.href="findPswdSuccess"+"?id="+id+"&userType="+userType;
      }
   }
</script>

</body>
</html>

