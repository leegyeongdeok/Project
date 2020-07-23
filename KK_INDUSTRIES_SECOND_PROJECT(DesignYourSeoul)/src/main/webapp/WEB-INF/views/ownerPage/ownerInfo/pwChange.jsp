<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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

    <title>OwnerPage</title>
    <link rel="stylesheet" href="/resources/css/mypage/myInfo/pwChange.css">

</head>
<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/ownerPage/ownerInfo/pwChange.js"></script>

<div class="info_change">
    <div class="title_box">
        <div class="change_title">
            <h1>비밀번호</h1>
        </div>
        <div class="line"></div>
    </div>

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
                    </div>
                    <p class="error_next_box" id="pwMsg"></p>
                    <button type="submit" onclick="updateUser()" class="change_button">완료</button>
                </div>
            </div>
        </div>
</div>






</body>
</html>