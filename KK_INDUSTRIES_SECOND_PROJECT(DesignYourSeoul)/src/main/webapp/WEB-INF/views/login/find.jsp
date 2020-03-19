<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <meta charset="utf-8">

    <style>

        .box_inn+.box_inn {
            padding: 20px 0 16px 19px;
            border-top: 1px solid #f4f4f4;
        }
        .box6 {
            position: relative;
            z-index: 100;
            padding: 39px 40px 20px;
            border: 1px solid #e5e5e5;
        }
        .box_inn dl:after {
            display: block;
            clear: both;
            content: '';
        }
        .content_header {
            position: relative;
            margin: 0 auto;
        }
        .box_inn dl {
            padding-top: 14px;
            margin-left: 27%;
            margin-right: 27%;
        }
        dl, dt,dd, fieldset{
            margin: 0px;
            padding: 0px;

        }
        .box_inn dt {
            font-weight: 700;
            float: left;
            width: 110px;
            height: 25px;
            margin-top: 6px;
        }
        element.style {
            width: 217px;
        }
        .box_inn dd {
            position: relative;
            /*   float: left; */
            width: 488px;
            height: 25px;
            margin-top: 6px;
            vertical-align: top;
        }
        .country_code .sel_value+select {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 20;
            opacity: 0;
        }
        .box_inn .input_txt {
            line-height: 23px;
            height: 23px;
            padding-left: 3px;
            vertical-align: top;
            border: 1px solid #ccc;
        }
        .box_inn .phone_txt {
            line-height: 25px;
            color: #333;
        }
        .box6 {
            position: relative;
            z-index: 100;
            padding: 20px 40px 40px;
            border: 1px solid #e5e5e5;

        }
        div {
            display: block;
        }
        fieldset {
            display: block;
            margin-inline-start: 2px;
            margin-inline-end: 2px;
            padding-block-start: 0.35em;
            padding-inline-start: 0.75em;
            padding-inline-end: 0.75em;
            padding-block-end: 0.625em;
            min-inline-size: min-content;
            padding-bottom:20px;
            padding-top:20px;
            border: 0;
        }
        .box_inn dd.ct {
            height: auto;
        }
        dd {
            display: block;
            margin-inline-start: 40px;
        }
        label {
            cursor: default;
        }
        input {
            -webkit-writing-mode: horizontal-tb !important;
            text-rendering: auto;
            color: initial;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            display: inline-block;
            text-align: start;

            background-color: white;
            -webkit-rtl-ordering: logical;
            cursor: text;
            margin: 0em;
            font: 400 13.3333px Arial;
            padding: 1px 0px;

        }

        /* #content, #head{
        margin-left: 25%;
        margin-right: 25%;
        } */
        .btn_ok{
            display: block;
            width: 190px;
            height: 40px;
            margin: 30px 0% 0px;
            padding-top: 1px;
            border: none;
            border-radius: 0;
            background-color: orange;
            cursor: pointer;
            text-align: center;
            color: #fff; /* 글자색 */
            font-size: 20px;
            -webkit-appearance: none;
        }
        .btn1{
            margin-left: 40%;
            margin-right: 25%;

        }
        h2 {
            padding-top: 14px;
            margin-left: 20%;
            margin-right: 25%;
        }
        .box_inn_sub p{
            padding-top: 14px;
            margin-left: 20%;
        }
        .logoimg{
            overflow: hidden;

            width: 300px;
            height: 300px;
            margin-left : 35%;
            padding-top: 100px;
        }

        #wep{
            margin: 0 auto;
            width: 1110px;
        }
        .ph_btn{

            width: 115px;
            height: 27px;


            border: none;
            border-radius: 0;
            background-color: orange;
            cursor: pointer;
            text-align: center;
            color: #fff; /* 글자색 */
            font-size: 14px;
            -webkit-appearance: none;
        }
        h1{
            margin-bottom: 30px;
            margin-left: 29.5%;
            margin-top: -10px;
            font-size: 40px;
        }

        .logoimg img{
            width: 300px;
            height: 300px;
        }
    </style>
</head>

<body>
<div id=wep>
    <header id="head">

        <div>
            <div class="logoimg">
                <a href="" ><img src="/resources/image/logo.png"></a>
            </div>
        </div>
        <div class="content_header">
            <h1>아이디 / 비밀번호 찾기</h1>
        </div>

    </header>
    <!-- CONTENTS -->
    <!-- CONTENTS -->
    <div id="content" class="non_sign inquiry">


        <div class="section section_find">
            <form id="find_id_form" name="fm" method="post">
                <fieldset>
                    <div class="box6">
                        <!--아이디찾기  -->
                        <div id="div_phone" class="box_inn"> <!-- [D] 선택시 selected 클래스 추가 -->

                            <div class="box_inn_sub">
                                <h2>아이디 찾기</h2>
                                <p class="dsc">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을수 있습니다.</p>
                                <dl>
                                    <dt><label for="find_id_name" class="phone_txt">이름</label></dt>
                                    <dd><input type="text" id="find_id_name" maxlength="40" class="input_txt" style="width:217px"></dd>

                                    <dt><label  class="phone_txt">휴대전화</label></dt>
                                    <dd>
                                        <input type="text" id="find_id_phone" name="phone" maxlength="100" class="input_txt" style="width:217px">
                                        <input type="hidden" id="textarea" name="text" maxlength="100" class="input_txt" style="width:217px; margin-top: 5px;">
                                        <input type="button" onclick="enablePhoneId($('#find_id_phone').val())" class="ph_btn" value="인증번호 받기">
                                    </dd>
                                    <dt><label  class="phone_txt">인증번호</label></dt>
                                    <input type="text" id="find_id_check"  maxlength="100" class="input_txt" style="width:217px; margin-top: 5px;">
                                </dl>
                                <div class="btn1">
                                    <input type="button"  onclick="checkNumberId()" title="아이디찾기" alt="확인" value="아이디 찾기" class="btn_ok" >
                                </div>
                            </div>
                        </div>
                        <!-- 아이디찾기 -->

                    </div>

                </fieldset>
            </form>
        </div>
        <hr align="center">
        <div class="section section_find">
            <form id="fm" name="fm" onsubmit="return mainSubmit();">
                <fieldset>
                    <div class="box6">
                        <!--비밀번호  -->
                        <div  class="box_inn selected"> <!-- [D] 선택시 selected 클래스 추가 -->

                            <div class="box_inn_sub">
                                <h2>비밀번호 찾기</h2>
                                <p class="dsc">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을수 있습니다.</p>
                                <dl>
                                    <dt><label for="find_pswd_name" class="phone_txt">이름</label></dt>
                                    <dd><input type="text" id="find_pswd_name" name="find_pswd_name" maxlength="40" class="input_txt" style="width:217px"></dd>
                                    <dt><label for="find_pswd_id" class="phone_txt">아이디</label></dt>
                                    <dd><input type="text" id="find_pswd_id" name="phoneId" maxlength="40" class="input_txt" style="width:217px"></dd>

                                    <dt><label  class="phone_txt">휴대전화</label></dt>
                                    <dd>
                                        <input type="text" id="find_pswd_phone" name="phone" maxlength="100" class="input_txt" style="width:217px">
                                        <input type="button" onclick="enablePhonePswd($('#find_pswd_phone').val())" class="ph_btn" value="인증번호 받기">
                                    </dd>
                                    <dt><label  class="phone_txt">인증번호</label></dt>
                                    <input type="text" id="find_pswd_check" name="find_pswd_check" maxlength="100" class="input_txt" style="width:217px; margin-top: 5px;">
                                </dl>

                                <div class="btn1">
                                    <input type="button" onclick="checkNumberPswd()" title="비밀번호찾기" alt="확인" value="비밀번호 찾기" class="btn_ok">
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>

            <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
            <script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
            <script>
                var result = false;
                var phoneFirst = ['010', '011', '016', '017', '018', '019'];
                var number; // 인증번호
                var name; // 이름
                var id; // 아이디
                var phone; // 휴대전화
                var userType; //회원종류

                function enablePhoneId(phoneNumber) {
                    var check = true;
                    var enableCheckerPhone = true;
                    var first = phoneNumber.substring(0,3);
                    var all = phoneNumber;
                    for(var i = 0; i<phoneFirst.length; i++){
                        if(first == phoneFirst[i]){
                            check = true;
                            enableCheckerPhone = true;
                            break;
                        }else {
                            check = false;
                            enableCheckerPhone = false;
                        }
                    }

                    if(all.length != 11){
                        check = false;
                        enableCheckerPhone = false;
                    }
                    if (isNaN(all)) {
                        enableCheckerPhone = false;
                        check = false;
                    }
                    if(!check){
                        alert("휴대전화 번호를 정확히 입력해주세요.");
                        return;
                    }else{
                        checkUserId();
                    }
                }

                function enablePhonePswd(phoneNumber) {
                    var check = true;
                    var enableCheckerPhone = true;
                    var first = phoneNumber.substring(0,3);
                    var all = phoneNumber;
                    for(var i = 0; i<phoneFirst.length; i++){
                        if(first == phoneFirst[i]){
                            check = true;
                            enableCheckerPhone = true;
                            break;
                        }else {
                            check = false;
                            enableCheckerPhone = false;
                        }
                    }

                    if(all.length != 11){
                        check = false;
                        enableCheckerPhone = false;
                    }
                    if (isNaN(all)) {
                        enableCheckerPhone = false;
                        check = false;
                    }
                    if(!check){
                        alert("휴대전화 번호를 정확히 입력해주세요.");
                        return;
                    }else{
                        checkUserPswd();
                    }
                }

                function checkUserId(){
                    name = $("#find_id_name").val();
                    phone = $("#find_id_phone").val();
                    if(name == ""){
                        alert("이름을 입력해주세요");
                        return;
                    }else{

                    }
                    $.ajax({
                        url : '/function/find/id/'+name+'/'+phone,
                        type : "GET",
                        success : function(data){
                            if (data == "false"){
                                alert("일치하는 회원이 없습니다.");
                            }else{
                                sendMsg();
                            }
                        },
                        error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            alert(request);
                        }
                    });
                }

                function checkUserPswd(){
                    id = $("#find_pswd_id").val();
                    name = $("#find_pswd_name").val();
                    phone = $("#find_pswd_phone").val();
                    if(name == ""){
                        alert("이름을 입력해주세요");
                        return;
                    }
                    if(id == ""){
                        alert("아이디 입력해주세요");
                        return;
                    }
                    $.ajax({
                        url : '/function/find/pswd/'+name+'/'+id+'/'+phone,
                        type : "GET",
                        success : function(data){
                            if (data == "false"){
                                alert("일치하는 회원이 없습니다.");
                            }else{
                                sendMsg('pswd');
                                userType = data;
                            }
                        },
                        error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            alert(request);
                        }
                    });
                }

                function sendMsg(type) {
                    addNum();
                    if(type == 'pswd'){
                        var form = $('#find_pswd_phone').serialize();
                    }else {
                        var form = $('#find_id_phone').serialize();
                    }
                    form = form +'&'+ $('#textarea').serialize();
                    $.ajax({
                        url: '/sendSms',
                        type: "POST",
                        data: form,
                        success: function (data) {
                            alert("인증번호를 보냈습니다.");
                        },
                        error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            alert(request);
                        }
                    });
                }

                function addNum(){
                    number = Math.floor(Math.random()*10000+1000);
                    var text = "본인확인 인증번호[" +number+"]를 화면에 입력해 주세요";
                    $("#textarea").attr('value',text);
                }

                function checkNumberId() {
                    var checkNum = $("#find_id_check").val();
                    var url;
                    if(checkNum == number){
                        location.href='findSuccess'+'?name='+name+'&phone='+phone;
                    }else{
                        alert("인증번호가 일치하지 않습니다.");
                    }
                }

                function checkNumberPswd() {
                    var checkNum = $("#find_pswd_check").val();

                    if(checkNum == number){
                        location.href="findPswdSuccess"+"?id="+id+"&userType="+userType;
                    }else{
                        alert("인증번호가 일치하지 않습니다.");
                    }
                }

            </script>
        </div>
    </div>
</div>
</body>
</html>