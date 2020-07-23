<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <title>ownerUser Information</title>
    <link rel="stylesheet" href="/resources/css/adminPage/userInfo.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/adminPage/userInfo.js"></script>
<div class="userInfo_box">
    <div class="userInfo_content">
        <h3 class="head_title">개인 정보</h3>

        <!-- 정보 시작 -->
        <div class="basic_info">
            <div class="info_title">
                <h3 class="pro_title">프로필</h3><br>

            </div>

            <div class="content">
                <strong class="content_tit">아이디</strong>
                <div class="content_val">${ownerUser.account}</div>
            </div>

            <div class="content">
                <strong class="content_tit">비밀번호</strong>
                <div class="content_val">${ownerUser.password.replaceAll(".", "●")}</div>
            </div>

            <div class="content">
                <strong class="content_tit">이름</strong>
                <div class="content_val">${ownerUser.name}</div>
            </div>

            <div class="content">
                <strong class="content_tit">생년월일</strong>
                <div class="content_val">${ownerUser.birth}</div>
            </div>
        </div>
        <div id="second_info">
            <div class="basic_info second">
                <div class="info_title" style="padding-left: 4%;">
                    <h3 class="pro_title">연락처 정보</h3>
                </div>

                <div class="content email_basic">
                    <strong class="content_tit">이메일</strong>
                    <div class="content_val">${ownerUser.email}</div>
                </div>
                <div class="content phone_basic">
                    <strong class="content_tit">번호</strong>
                    <div class="content_val">${ownerUser.phoneNum}</div>
                </div>

            </div>
        </div>


        <div class="btn_area">
            <input type="button" class="delete" value="상태 변경" onclick="ownerUserBanned('${ownerUser.account}')">
            <input type="button" class="cancel" value="취소" onclick="window.close()">
        </div>

    </div>

</div>


</div>
</div>


</body>
</html>