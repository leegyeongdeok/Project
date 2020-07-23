<%@ page import="java.time.LocalDateTime" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="/resources/css/signUp.css">

</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/createUser/generalUser.js"></script>
<div id="wrap">

    <!-- header -->
    <div id="header" class="join_membership" role="banner">
        <a href="/dys" class="h_logo"><span class="blind">DYS</span></a>

    </div>
    <!-- // header -->

    <form id="join_form">

        <!-- container -->
        <div id="container" role="main">
            <div id="content">

                <!-- tg-text=title -->
                <h2 class="blind">DYS회원가입</h2>
                <div class="join_content">

                    <!-- 아이디, 비밀번호 입력 -->
                    <div class="row_group">

                        <!-- 아이디 -->
                        <div class="join_row">
                            <h3 class="join_title">
                                <label for="general_id">아이디</label>
                            </h3>
                            <span class="ps_box int_id">
								
								<!-- 아이디 입력란 --> 
								<input onblur="duplieId()" type="text" id="general_id" name="account" class="int"
                                       title="ID"
                                       maxlength="20">
									<span class="error_next_box" id="idMsg" style="color: green" role="alert"></span>
								</span>
                        </div>

                        <!-- 비밀번호 -->
                        <div class="join_row">
                            <h3 class="join_title">
                                <label for="password">비밀번호</label>
                            </h3>
                            <span class="ps_box int_pass" id="pswd1Img">
								
								<!-- 비밀번호 입력란 -->
								<input onblur="pswdRank()" type="password" id="password" name="password" class="int"
                                       title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
									<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
								</span>
                            <span class="error_next_box" id="pswd1Msg"
                                  role="alert"></span>

                            <h3 class="join_title">
                                <label for="pswd2">비밀번호 재확인</label>
                            </h3>
                            <span class="ps_box" id="pswd2Img">

								<!-- 비밀번호확인 입력란 -->
								<input onblur="pswdCheck()" type="password" id="pswd2" class="int"
                                       title="비밀번호 재확인 입력" aria-describedby="pswd2Blind"
                                       maxlength="20">
									<span id="pswd2Blind" class="wa_blind">설정하려는
										비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
								</span> <span class="error_next_box" id="pswd2Msg"
                                              style="display: none" role="alert"></span>
                            </span>
                        </div>
                    </div>

                    <!-- 이름, 생년월일 입력 -->
                    <div class="row_group">

                        <div class="join_row">
                            <h3 class="join_title">
                                <label for="nickname">닉네임</label>
                            </h3>
                            <span class="ps_box box_right_space">
								
								<!-- 닉네임 입력란 --> 
								<input onblur="duplieNick()" type="text" id="nickname" name="nickname" title="닉네임"
                                       class="int"
                                       maxlength="40">
								</span>
                            <span class="error_next_box" id="nicknameMsg" role="alert"></span>
                        </div>

                        <div class="join_row">
                            <h3 class="join_title">
                                <label for="name">이름</label>
                            </h3>
                            <span class="ps_box box_right_space">
								
								<!-- 이름 입력란 --> 
								<input type="text" id="name" name="name" title="이름" class="int"
                                       maxlength="40">
								</span> <span class="error_next_box" id="nameMsg" style="display: none"
                                              role="alert"></span>
                        </div>


                        <div class="join_row join_birthday">
                            <h3 class="join_title">
                                <label for="yy">생년월일</label>
                            </h3>
                            <div class="bir_wrap" name="birth">
                                <div class="bir_yy">
										<span class="ps_box">
										<!-- 생년월일(년) 입력란 --> 
										<input type="text" id="yy" placeholder="년(4자)" aria-label="년(4자)"
                                               class="int" maxlength="4" value=>
										</span>
                                </div>
                                <div class="bir_mm">
										<span class="ps_box"> 
										
										<!-- 생년월일(월) 선택란 --> 
										<select type="text" id="mm" class="sel" aria-label="월">
												<option>월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
										</span>
                                </div>
                                <div class=" bir_dd">
										<span class="ps_box"> 
										<!-- 생년월일(일) 입력란 --> 
										<input type="text" id="dd" placeholder="일" aria-label="일"
                                               class="int" maxlength="2"> <label for="dd"
                                                                                 class="lbl"></label>
										</span>
                                </div>
                            </div>
                            <span class="error_next_box" id="birthdayMsg"
                                  style="display: none" role="alert"></span>

                            <input type="hidden" id="birthSum" name="birth">

                        </div>

                        <div class="join_row join_email">
                            <h3 class="join_title">
                                <label for="email">본인 확인 이메일</label>
                            </h3>
                            <span class="ps_box int_email box_right_space">
								
								<!-- 이메일 입력란 -->
									<input onblur="enableEmail()" type="text" id="email" name="email" maxlength="100"
                                           placeholder="" aria-label="선택입력" class="int" maxlength="100">
								</span>
                        </div>
                        <span class="error_next_box" id="emailMsg" style="display: none"
                              role="alert">이메일을 정확히 입력해주세요.</span>
                    </div>


                    <!-- 휴대전화 번호, 인증번호 입력 -->
                    <div class="join_row join_mobile" id="mobDiv">
                        <h3 class="join_title">
                            <label for="phoneNo">휴대전화</label>
                        </h3>
                        <div class="int_mobile_area">
								<span class="ps_box int_mobile"> 
								
								<!-- 전화 번호 입력란 --> 
								<input class="int" onblur="enablePhone()" type="tel" id="phoneNo" name="phone_num"
                                       placeholder="전화번호 입력" aria-label="전화번호 입력" maxlength="11">
                                    <label for="phoneNo" class="lbl"></label>
								</span>
                        </div>

                        <span class="error_next_box" id="phoneNoMsg"
                              style="display: none" role="alert">휴대전화 번호를 정확히 입력해주세요.(- 제외, 11자)</span> <span
                            class="error_next_box" id="authNoMsg" style="display: none"
                            role="alert"></span> <span class="error_next_box" id="joinMsg"
                                                       style="display: none" role="alert"></span>
                    </div>
                    <div class="btn_area">
                    </div>
                </div>
            </div>
        </div>
        <!-- // container -->
        <input type="hidden" name="status" value="REGISTERED">
    </form>
    <button type="submit" onclick="createUser();" id="btnJoin" class="btn_type btn_member"
            style="width: 460px; margin: 0 auto; margin-bottom: 3%;">
        <span>가입하기</span>
    </button>

</div>
</body>
</html>