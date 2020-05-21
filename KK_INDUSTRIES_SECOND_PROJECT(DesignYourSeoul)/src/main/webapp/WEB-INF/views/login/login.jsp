<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
</head>

<body class="chrome">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>

<div id="wrap">


    <!-- header -->
    <div id="header">
        <div class="logoImg_contain">
            <a href="/dys"><img class="logoImg" src="/resources/image/logo.png"/></a>
        </div>
    </div>
    <!-- //header -->

    <!-- container -->
    <div id="container">
        <!-- content -->
        <div id="content">

            <!-- 아이디비밀번호 -->
            <fieldset class="login_form">

                <div class="id_area">
                    <!-- 아이디 -->
                    <div class="input_row" id="id_area">
                     <span class="input_box"> <!-- <label for="id" id="label_id_area" class="lbl" style="display: block;">아이디</label> -->
                        <input type="text" id="id" name="id" accesskey="L"
                               placeholder="아이디" class="int" maxlength="41" value="">

                     </span>
                    </div>
                </div>
                <!-- 비밀번호 -->
                <div class="pw_area">
                    <div class="input_row" id="pw_area">
                     <span class="input_box"> <!-- <label for="pw" id="label_pw_area" class="lbl" style="display: block;">비밀번호</label> -->
                        <input type="password" id="pswd" name="pw" placeholder="비밀번호"
                               class="int" maxlength="16">
						 <span class="error_next_box" id="idMsg"
                               role="alert"></span>
                     </span>
                    </div>
                </div>

                <!-- 로그인버튼 -->
                <input type="button" onclick="userType()" title="로그인" alt="로그인" value="로그인"
                       class="btn_global">
                <div class="check_info"></div>
            </fieldset>

            <div class="position_a">
                <div class="find_info">
                    <a target="_self" id="idinquiry" href="find">ID/PW찾기</a> <span
                        class="bar" aria-hidden="true">|</span> <a target="_self"
                                                                   id="pwinquiry" href="signUp">회원가입</a> <span
                        class="bar" aria-hidden="true">|</span> <a target="_self"
                                                                   id="join" href="">비회원로그인</a>
                </div>
            </div>

        </div>
        <!-- //content -->
    </div>
    <!-- //container -->
    <!-- footer -->
    <div id="footer">
        <div cla>
            <h4 class="stit_con_title">DYS 회원 혜택</h4>
            <div class="join_norang">
                <ul class="norang_member">

                    <li class="norang_y1">
                        <div><img src="/resources/image/login/login1.png"></div>
                        <div class="stit_ybm">
                            <h3>자신만의 서울 여행,</h3>
                            <p>Design Your Seoul</p>
                            <!--            <p>다양한 맛집,카페,숙소,액티비티,<br>랜드마크 자신이 원하는 대로 <br>추가하고 계획해보실 수 있습니다. </p> -->
                        </div>
                    </li>

                    <li class="norang_y2">
                        <div><img src="/resources/image/login/login2.png"></div>
                        <div class="stit_ybm">
                            <h3>서울 여행 계획</h3>
                            <p>수많은 유저들과 공유!</p>
                            <!--    <p>수많은 유저들이 올린 색다른 여행<br> 계획과 자신의 계획에 대한<br> 다른 유저의 생각을 들어보세요.</p> -->
                        </div>
                    </li>

                    <li class="norang_y3">
                        <div><img src="/resources/image/login/login3.png"></div>
                        <div class="stit_ybm">
                            <h3>또 다른 유저들과</h3>
                            <p>여행 계획에 대한 소통!</p>
                            <!--    <p>다른 유저들이 올린 장소에 대한 <br>생각과 자신의 생각에 대해 <br>실시간으로 쉽게 소통해보세요.</p> -->
                        </div>
                    </li>

                    <li class="norang_y4">
                        <div><img src="/resources/image/login/login4.png"></div>
                        <div class="stit_ybm">
                            <h3>사장님의 가게와 숙소</h3>
                            <p>쉽게 등록하고 쉽게 관리!</p>
                            <!--     <p>다양한 유저가 있는 이곳에<br> 사장님의 가게와 숙소를 <br>쉽게 등록하고 관리해 보세요.</p> -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- //footer -->
    </div>

    <%@ include file="../include/footer.jsp" %>
</body>

</html>

