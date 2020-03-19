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
            color: rgba(0, 0, 0, 0.65);
        }

        .now_info_box {
            border: 1px solid #dadce0;
            border-radius: 8px;
            overflow: hidden;
            margin: 0 auto;
            max-width: 660px;
            height: 65px;
        }

        .now_info {
            padding-left: 24px;
            padding-right: 24px;
            padding-top: 17px;
        }

        #birthYyChange{
            width: 27%;
            margin-right: 18px;
            margin-left: 10px;
        }

        #birthMmChange {
            width: 27%;
            margin-right: 18px;
            margin-left: 10px;
        }

        #birthDdChange {
            width: 27%;
            margin-right: 18px;
            margin-left: 10px;
        }

        input #ch_button {
            height: 30px;
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
    String birth = request.getParameter("birth");
%>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">
<input id="birth" type="hidden" value="<%=birth%>">

<jsp:include page="../include/loginHeader.jsp" flush="false">
    <jsp:param name="userName" value="<%=name%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>

<div class="info_change">
    <div class="title_box">
        <div class="change_title">
            <h1><span id="info_title">생년월일</span></h1>
        </div>
        <div class="line"></div>
    </div>
    <div class="change_info_box">
        <div class="change_info">
            <div class="change_explan">
                생년월일을 변경하면 DYS 계정 전반에 반영됩니다.
            </div>

            <div class="now_info_box">
                <div class="now_info">
                    <div class="change_box">
                        <input type="text" id="birthYyChange" value="" placeholder="년">
                        <input type="text" id="birthMmChange" value="" placeholder="월">
                        <input type="text" id="birthDdChange" value="" placeholder="일">
                        <input type="hidden" class="error_next_box" id="birthSum" role="alert">
                    </div>
                    <button onclick="updateBirth()" type="submit" class="change_button">완료</button>
                </div>
            </div>
        </div>

    </div>
    <div class="change_margin"></div>
</div>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">
<input id="birth" type="hidden" value="<%=birth%>">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>

<script>

    var id = $("#account").val();
    var name = $("#name").val();
    var birth;
    var nullBirth = true;

    function sum(){
        var bir = $("#birthYyChange").val()+"년 ";
        bir+=$("#birthMmChange").val()+"월 ";
        bir+=$("#birthDdChange").val()+"일";
        $("#birthSum").attr('value',bir);
    }


    function enableBirth(){
        sum();
        birth = $("#birthSum").val();
        var birthYyChange = $("#birthYyChange").val();
        var birthMmChange = $("#birthMmChange").val();
        var birthDdChange = $("#birthDdChange").val();

        if(birthYyChange == ""){
            nullBirth = true;
            return;
        }else if(birthMmChange == ""){
            nullBirth = true;
            return;
        }else if(birthDdChange == ""){
            nullBirth = true;
            return;
        }else{
            nullBirth = false;
        }
    }

    function updateBirth(){
        enableBirth();

        if(nullBirth){
            alert("변경할 생년월일을 입력해주세요.");
            return;
        }

        $.ajax({
            url : '/api/generalUser/update/birth/'+id+'/'+birth,
            type : "PUT",
            contentType:'application/json',
            success : function(data){
                alert('생년월일이 변경되었습니다.');
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