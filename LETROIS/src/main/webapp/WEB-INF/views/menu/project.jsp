    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="ko">
        <head>
        <meta charset="UTF-8">
        <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel=" shortcut icon" href="/resources/image/favicon_black.ico" style="user-select: auto;">
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

        <title>LE TROIS</title>
        <link rel="stylesheet" href="/resources/css/project.css">
        </head>
        <body>
        <%@ include file="../include/sidebar.jsp" %>
            <%@ include file="../include/header.jsp" %>

        <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/resources/js/project.js"></script>


        <section id="first_sec">
        <h2 class="sec_logo">LETROIS<br>PROJECT</h2>
        </section>

        <section id="second_sec">
        <ul class="theme_list">
        <li>
        <a onclick="no()">
        <div class="list_content">
        <h3>조선의 동양화</h3>
        <p> "2020 Spring season" </p>
        <p> 김홍도 화백 - 금강사군첩</p>


        </div>
        <div class="list_photo" style="background-image: url('/resources/image/themePhoto/first.jpg');"></div>
        </a>
        </li>

        <li>
        <div class="list_content_coming">
        <h3>COMING SOON</h3>
        <p>
        "2020 S/S season"
        </p>
        <p>
        우리들의 다음 이야기가 곧 시작됩니다.
        </p>
        </div>
        </li>


        </ul>
        </section>

        </body>

        </html>


