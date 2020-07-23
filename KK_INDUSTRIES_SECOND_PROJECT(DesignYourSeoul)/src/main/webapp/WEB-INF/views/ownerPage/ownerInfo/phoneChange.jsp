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
    <link rel="stylesheet" href="/resources/css/mypage/myInfo/infoChange.css">

</head>
<body>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/ownerPage/ownerInfo/phoneChange.js"></script>


<div class="info_change">
    <div class="title_box">
        <div class="change_title">
            <h1><span id="info_title">번호</span></h1>
        </div>
        <div class="line"></div>
    </div>
    <div class="change_info_box">
        <div class="change_info">
            <div class="change_explan">
                번호를 변경하면 DYS 계정 전반에 반영됩니다.
            </div>

            <div class="now_info_box">
                <div class="now_info">

                    <div class="change_box">
                        <input onblur="enablePhone()" type="text" id="changeVal" value="" placeholder="새 번호" maxlength="11">
                    </div>
                    <p class="error_next_box" id="pwMsg"></p>
                    <button onclick="updatePhoneNum()" type="submit" class="change_button">완료
                    </button>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>