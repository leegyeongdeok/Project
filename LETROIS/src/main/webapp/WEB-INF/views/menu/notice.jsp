
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <html lang="ko">

        <head>
        <meta charset="UTF-8">
        <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
        <link rel=" shortcut icon" href="/resources/image/favicon_black.ico" style="user-select: auto;">
        <link rel="icon" href="/resources/image/favicon_black.ico">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel=" shortcut icon" href="/image/favicon.ico" style="user-select: auto;">
        <link rel="icon" href="/image/favicon.ico">
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
        <link rel="stylesheet" href="/resources/css/notice.css">
        </head>

        <body>

        <%@ include file="../include/sidebar.jsp"%>
        <script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/resources/js/notice.js"></script>
        <a href="/">
        <P class="logo_other">LE TROIS</P>
        </a>

        <section id="first_sec">
        <h2 class="sec_logo">NOTICE</h2>
        </section>

        <section id="second_sec">
        <table id="notice_talbe">

        <colgroup>
        <col style="width: 70vw;">
        <col style="width: 30vw;">
        </colgroup>
        <thead>
        <tr>
        <th id="tb_title" scope="col">TITLE</th>
        <th id="tb_date" scope="col">DATE</th>
        </tr>
        </thead>
        <tbody id="noticeList">

        <tr>
        <td class="notice_title">
        <a class="notice_tag" href="/notice/detail">
            LE TROIS 공지사항
        </a>
        </td>

        <td class="notice_date">2020.02.28</td>
        </tr>


        </tbody>
        </table>
        </section>


        </body>

        </html>
