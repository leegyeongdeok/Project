<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>

<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}

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
	.btn_Ok {
		display: block;
		width: 275px;
		height: 57px;
		margin: auto;
		margin-top: 30px;
		padding-top: 1px;
		border: none;
		border-radius: 0;
		background-color: orange;
		cursor: pointer;
		text-align: center;
		color: #fff;
		font-size: 20px;
		font-weight: 700;
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
		width: 45%;
		position: relative;
		height: 29px;
		margin: 0 auto;
		padding: 10px 35px 10px 15px;
		border: solid 1px #dadada;
		background: #fff;
	}

	h4> label {
		margin-left: 24%;
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
		padding-top: 120px;
	}

	.title h1{
		width: 45%;
		border-bottom: 4px solid #989494;
	}

	.title, .account {
		padding-bottom: 3px;
		padding: 2px;
	}

	.account1 {
		margin-top: 4%;
		margin-bottom: 8%;
	}

	.account2 {
		margin-top: 12%;
	}

	/* 에러박스 */
	.error_next_box {
		display: block;
		margin: 5px 0 -2px;
		font-size: 12px;
		line-height: 14px;
		color: red;
		margin-top: 16px;
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
				<h1>새로운 비밀번호 설정</h1>
				</p>
			</div>

			<!-- 비밀번호 변경 설명 -->
			<div class="account1">
				<p>
				<h3>비밀번호를 변경한 후에 다시 로그인 해주세요.</h3>
				</p>
			</div>

			<h4>
				<label for="pswd1">아이디: <span id="user_id">${id}</span></label>
			</h4>

			<div class="pw_area" style="margin-bottom: 4%;">
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" id="userType" value="${userType}">
				<div class="input_row">
                  <span class="input_box">
                 <input type="password" id="pswd1" onblur="enablePswd()" name="pw" placeholder="새로운 비밀번호" class="int" maxlength="16">
                  </span>
					<span class="error_next_box" id="pswdMsg"
						  role="alert"></span>
				</div>

			</div>

			<div class="pw_area">
				<div class="input_row" id="pw_area">
                  <span class="input_box">
                 <input type="password" id="pswd2" onblur="pswdReconfirm()" name="pw2" placeholder="새로운 비밀번호확인" class="int" maxlength="16">
                  </span>
					<span class="error_next_box" id="pswdMsg_check"
						  role="alert"></span>
				</div>
			</div>

			<div class="account2">
				<p>
				<h4>
					1.안전한 비밀번호로 내정보를 보호하세요. <br /><br /> 2.다른 아이디/사이트에서 사용한 적 없는 비밀번호 이전에
					사용한 적 없는 비밀번호가 안전합니다.
				</h4>
				</p>
			</div>

			<div class="btn_area">
				<button onclick="updateUser()" type="button" id="btnOk" class="btn_Ok">
					<span>변경하기</span>
				</button>
			</div>

		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
<script type="text/javascript">

	var enableChckerPswd;
	var reconfirmChecker;
	function enablePswd(){
		var pswd = $("#pswd1").val();

		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pswd)){
			$("#pswdMsg").text("8~20자 영문자, 숫자를 1자리 이상 사용해야 합니다.");
			$('#pswd1').val('');
			enableChckerPswd = false;
		} else{
			$("#pswdMsg").text("");
			enableChckerPswd = true;
		}
	}

	function pswdReconfirm(){
		var pswd = $("#pswd1").val();
		var pswd2 = $("#pswd2").val();
		if(pswd != pswd2){
			$("#pswdMsg_check").text("비밀번호가 일치하지 않습니다.");
			reconfirmChecker = false;
		}else{
			$("#pswdMsg_check").text("");
			reconfirmChecker = true;
		}
	}

	function updateUser(){
		var id = $("#id").val();
		var userType = $("#userType").val();
		var link = "/api/";
		var changePswd = $("#pswd1").val();

		if (!enableChckerPswd){
			alert("새로운 비밀번호를 입력해주세요.");
			return;
		}

		if (!reconfirmChecker){
			alert("새로운 비밀번호 확인이 틀렸습니다.");
			$('#pswd2').val('');
			return;
		}
		if (userType == 'general'){
			link +='generalUser/update/pswd/'+id+'/'+changePswd;
		}else{
			link +='ownerUser/update/pswd/'+id+'/'+changePswd;
		}
		$.ajax({
			url : link,
			type : "PUT",
			contentType:'application/json',
			success : function(data){
				alert('비밀번호가 변경되었습니다.');
				location.href="/dys";
			},
			error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
</script>
</body>
</html>