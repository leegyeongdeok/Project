<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>MouseWheel</title>

    <style>

        .info_change {
            min-height: 100%;
            height: auto;
            position: relative;
        }

        .title_box {
            width: 100%;
        }

        .change_title {
            -webkit-box-align: center;
            box-align: center;
            -webkit-align-items: center;
            align-items: center;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            margin: auto;
            max-width: 100%;
            min-width: 0;
            width: 690px;
            padding-left: 2%;
        }

        .change_title h1 {
            width: 90%;
        }

        #info_title {
            padding-left: 3%;
            width: 50%;
        }

        .backinfo {
            -webkit-flex-shrink: 0;
            flex-shrink: 0;
            margin-right: 4px;
            vertical-align: middle;
        }

        /* 라인 */

        .line {
            border-top: 1px solid #dadce0;
        }

        .line {
            height: 10px;
            overflow: hidden;
            width: 100%;
            margin-top: 1%;
            margin-bottom: 0%;
        }

        .change_info {
            margin: auto;
            max-width: 660px;
        }

        .change_explan {
            padding: 24px 0;
            color: rgba(0,0,0,0.65);
        }

        .now_info_box {
            border: 1px solid #dadce0;
            border-radius: 8px;
            overflow: hidden;
            margin: 0 auto;
            max-width: 660px;
            height: 130px;
        }

        .now_info {
            padding-left: 24px;
            padding-right: 24px;
            padding-top: 17px;
        }

        #pw {
            width: 100%;
        }

        #pwChange {
            width: 100%;
        }

        input #ch_button {
            height:30px;
        }

        .change_box {
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-flex: 1;
            box-flex: 1;
            -webkit-flex-grow: 1;
            flex-grow: 1;
            -webkit-flex-shrink: 1;
            flex-shrink: 1;
            font-size: 17px;
            width: 85%;
            height: 30px;
            float: left;
            padding-bottom: 3%;
            padding-top: 1%;
        }

        .change_button {
            -webkit-box-align: center;
            box-align: center;
            -webkit-align-items: center;
            align-items: center;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-flex: 0;
            box-flex: 0;
            -webkit-flex-grow: 0;
            flex-grow: 0;
            -webkit-flex-shrink: 0;
            flex-shrink: 0;
            margin: -15px 0;
            width: 80px;
            height: 48px;
            float: right;
        }

        .change_margin {
            height: 36px;
        }

        .change_button {
            height: 30px;
            margin-top: 0px;
            padding-left: 5%;
            background-color: orange;
            color: white;
            cursor: pointer;
            border: 0;
            outline: 0;
        }

        /* 에러 표시 박스 */
        .error_next_box {
            display: block;
            font-size: 12px;
            line-height: 14px;
            color: red;
            margin-top: 33px;
            margin-left: -520px;
        }

    </style>


</head>
<body>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
%>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<jsp:include page="../include/loginHeader.jsp" flush="false">
    <jsp:param name="userName" value="<%=name%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>

<div class="info_change">
    <div class="title_box">
        <div class="change_title">
            <h1><span id="info_title">비밀번호</span></h1>
        </div>
        <div class="line"></div>
    </div>
    <div class="change_info_box">
        <div class="change_info">
            <div class="change_explan">
                비밀번호를 변경하면 DYS 계정 전반에 반영됩니다.
            </div>

            <div class="now_info_box">
                <div class="now_info">
                    <div class="change_box">
                        <input onblur="enablePswd()" type="password" id="pw" value="" placeholder="새로운 비밀번호">
                    </div>
                    <div class="change_box">
                        <input onblur="pswdCheck()" type="password" id="pwChange" value="" placeholder="새로운 비밀번호 확인">
                        <span class="error_next_box" id="pwMsg" role="alert"></span>
                    </div>
                    <button type="submit" onclick="updateUser()" class="change_button">완료</button>
                </div>
            </div>
        </div>

    </div>
    <div class="change_margin"></div>
</div>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>

<script>

    var password;
    var name = $("#name").val();

    var nullAcc = true;
    var enableAcc = true;
    var confPswd = true;

    var id = $("#account").val();

    function enablePswd(){

        password = $("#pw").val();
        if(password == ""){
            $("#pwMsg").text("새로운 비밀번를 입력해주세요");
            $("#pwMsg").get(0).style.color = "red";
            nullAcc = true;
            return;
        }else{
            nullAcc = false;

            if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)){
                $("#pwMsg").text("8~20자 영문자, 숫자, 특수문자를 1자리 이상 사용해야 합니다.");
                $('#pw').val('');
                enableAcc = true;
                return;
            }else{
                $("#pwMsg").text("");
                enableAcc = false;
            }
        }
    }

    function pswdCheck(){
        var pswd1 = $("#pw").val();
        var pswd2 = $("#pwChange").val();
        if(pswd1 != pswd2){
            $("#pwMsg").text("비밀번호가 일치하지 않습니다.");
            $("#pwChange").val('');
            confPswd = true;
            return;
        }else{
            confPswd = false;
        }
    }

    function updateUser(){
        if(nullAcc){
            return;
        }

        if(confPswd){
            return;
        }

        if(enableAcc){
            return;
        }

        $.ajax({
            url : '/api/generalUser/update/pswd/'+id+'/'+password,
            type : "PUT",
            contentType:'application/json',
            success : function(data){
                alert('비밀번가 변경되었습니다.');
                myInfo();
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }

    function myInfo() {

        location.href = "/dys/myInfo?id=" + id + "&name=" + name;
    }
</script>

</body>
</html>