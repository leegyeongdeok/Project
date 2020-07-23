<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
    <link rel="icon" href="/resources/image/favicon_black.ico">
    <style type="text/css">
        @-ms-viewport {
            width: device-width
        }

        @-o-viewport {
            width: device-width
        }

        @viewport {
            width: device-width
        }
    </style>

    <title>Design Your Seoul</title>
    <link rel="stylesheet" href="/resources/css/find.css">
</head>

<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/find.js"></script>
<div id=wep>
    <div id="head">

        <div>
            <div class="logoimg">
                <a href="/dys"><img src="/resources/image/logo.png"></a>
            </div>
        </div>
        <div class="content_header">
            <h1>아이디 / 비밀번호 찾기</h1>
        </div>

    </div>

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
                                    <dd><input type="text" id="find_id_name" maxlength="40" class="input_txt"
                                               style="width:217px"></dd>

                                    <dt><label class="phone_txt">휴대전화</label></dt>
                                    <dd>
                                        <input type="text" id="find_id_phone" name="phone" maxlength="100"
                                               class="input_txt" style="width:217px">
                                        <input type="hidden" id="textarea" name="text" maxlength="100" class="input_txt"
                                               style="width:217px; margin-top: 5px;">
                                        <input type="button" onclick="enablePhoneId($('#find_id_phone').val())"
                                               class="ph_btn" value="인증번호 받기">
                                    </dd>
                                    <dt><label class="phone_txt">인증번호</label></dt>
                                    <input type="text" id="find_id_check" maxlength="100" class="input_txt"
                                           style="width:217px; margin-top: 5px;">
                                </dl>
                                <div class="btn1">
                                    <input type="button" onclick="checkNumberId()" title="아이디찾기" alt="확인" value="아이디 찾기"
                                           class="btn_ok">
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
            <form id="fm" name="fm">
                <fieldset>
                    <div class="box6">
                        <!--비밀번호  -->
                        <div class="box_inn selected"> <!-- [D] 선택시 selected 클래스 추가 -->

                            <div class="box_inn_sub">
                                <h2>비밀번호 찾기</h2>
                                <p class="dsc">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을수 있습니다.</p>
                                <dl>
                                    <dt><label for="find_pswd_name" class="phone_txt">이름</label></dt>
                                    <dd><input type="text" id="find_pswd_name" name="find_pswd_name" maxlength="40"
                                               class="input_txt" style="width:217px"></dd>
                                    <dt><label for="find_pswd_id" class="phone_txt">아이디</label></dt>
                                    <dd><input type="text" id="find_pswd_id" name="phoneId" maxlength="40"
                                               class="input_txt" style="width:217px"></dd>

                                    <dt><label class="phone_txt">휴대전화</label></dt>
                                    <dd>
                                        <input type="text" id="find_pswd_phone" name="phone" maxlength="11"
                                               class="input_txt" style="width:217px">
                                        <input type="button" onclick="enablePhonePswd($('#find_pswd_phone').val())"
                                               class="ph_btn" value="인증번호 받기">
                                    </dd>
                                    <dt><label class="phone_txt">인증번호</label></dt>
                                    <input type="text" id="find_pswd_check" name="find_pswd_check" maxlength="4"
                                           class="input_txt" style="width:217px; margin-top: 5px;">
                                </dl>

                                <div class="btn1">
                                    <input type="button" onclick="checkNumberPswd()" title="비밀번호찾기" alt="확인"
                                           value="비밀번호 찾기" class="btn_ok">
                                </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>
</body>
</html>