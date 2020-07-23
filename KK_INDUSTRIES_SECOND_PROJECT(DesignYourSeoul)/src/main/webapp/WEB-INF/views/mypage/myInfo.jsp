<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>MyPage</title>
    <link rel="stylesheet" href="/resources/css/mypage/myPageInfo.css">

</head>
<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/myPage/myPageInfo.js"></script>

<jsp:include page="../include/generalSide.jsp" flush="false"/>


<div id="pageBack">
    <div id="page">
        <div id="pageMain">

            <!-- 내정보 칸 -->


            <div class="content">
                <h3>개인 정보</h3>
                <p id="title_p">이름과 같이 DYS 서비스에 필요한 기본 정보</p>
                <!-- 정보 시작 -->
                <div class="info_container first">
                    <div class="info_title">
                        <h3>프로필</h3><br>
                        <p class="title_font">일부 정보가 DYS 서비스를 이용하는 다른 사람에게 표시될수 있습니다.</p>
                    </div>

                    <a class="change_info">
                        <div class="area_basic id_basic">
                            <strong class="tit_basic">아이디</strong>
                            <div id="info_id" class="box_basic"></div>
                        </div>
                    </a>

                    <a href="/dys/myPage/myInfo/passWord" class="change_info">
                        <div class="area_basic nickname_basic">
                            <strong class="tit_basic">비밀번호</strong>
                            <div id="info_pswd" class="box_basic"></div>
                        </div>
                    </a>

                    <a href="/dys/myPage/myInfo/nickName" class="change_info">
                        <div class="area_basic nickname_basic">
                            <strong class="tit_basic">닉네임</strong>
                            <div id="info_nick" class="box_basic"></div>
                        </div>
                    </a>

                    <a href="/dys/myPage/myInfo/name" class="change_info">
                        <div class="area_basic name_basic">
                            <strong class="tit_basic">이름</strong>
                            <div id="info_name" class="box_basic"></div>
                        </div>
                    </a>

                    <a href="/dys/myPage/myInfo/birth" class="change_info">
                        <div class="area_basic jumin_basic">
                            <strong class="tit_basic">생년월일</strong>
                            <div id="info_birth" class="box_basic"></div>
                        </div>
                    </a>
                </div>


                <div class="info_container second">
                    <div class="info_title" style="padding-left: 4%;">
                        <h3 class="pro_title">연락처 정보</h3>
                    </div>

                    <a href="/dys/myPage/myInfo/email" class="change_info">
                        <div class="area_basic email_basic">
                            <strong class="tit_basic">이메일</strong>
                            <div id="info_email" class="box_basic"></div>
                        </div>
                    </a>

                    <a href="/dys/myPage/myInfo/phone" class="change_info">
                        <div class="area_basic phone_basic">
                            <strong class="tit_basic">번호</strong>
                            <div id="info_phone" class="box_basic"></div>
                        </div>
                    </a>
                </div>


                <div class="info_container third">
                    <h3>일부 정보는 다른 사용자가 볼 수 있습니다.</h3><br/>
                    <p>저희 DYS 에서는 다른 무엇보다 회원정보 보호를 가장 신경쓰고 있습니다.</p>
                    <img src="/resources/image/logo.png">
                </div>


            </div>
        </div>
    </div>
</div>
</body>
</html>