<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <link rel="stylesheet" href="/resources/css/findId.css">
</head>

<body>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/findSuccess.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<div class="wrap">
    <!-- container -->
    <div class="container">
        <!-- content -->
        <div class="content">
            <!-- title -->
            <div class="title">
                <h1>아이디 찾기</h1>
            </div>

            <!-- 설명란 -->
            <div class="account1">
                <h3>고객님의 정보와 일치하는 아이디 목록입니다.</h3>
            </div>

            <form id="id_chk_form">
                <div class="id_area">
                    <div class="input_row" id="id_area">
                        <ul class="id_list" id="id_list">

                        </ul>
                    </div>
                </div>
            </form>

            <div class="btn_area">
                <button type="button" onclick="location.href='login'" id="btnOk" class="btn_Ok">
                    <span>로그인 하러가기</span>
                </button>
                <button type="button" onclick="findPswd()" id="btnPw" class="btn_Pw">
                    <span>비밀번호 찾기</span>
                </button>
            </div>

        </div>
    </div>
</div>


</body>
</html>

