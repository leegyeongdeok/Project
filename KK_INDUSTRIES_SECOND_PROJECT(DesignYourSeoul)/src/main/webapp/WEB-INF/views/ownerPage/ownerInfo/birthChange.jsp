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
    <link rel="stylesheet" href="/resources/css/mypage/myInfo/birthChange.css">

</head>
<body>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/ownerPage/ownerInfo/birthChange.js"></script>

<div class="info_change">
    <div class="title_box">
        <div class="change_title">
            <h1><span id="info_title">생년월일</span></h1>
        </div>
        <div class="line"></div>
    </div>
    <div class="change_info_box">
        <div class="change_info">
            <div class="change_explan">
                생년월일을 변경하면 DYS 계정 전반에 반영됩니다.
            </div>

            <div class="now_info_box">
                <div class="now_info">
                    <div class="change_box">

                        <select type="text" id="year_sel" class="sel" aria-label="월">
                            <option>년</option>
                            <c:forEach begin="0" end="100" varStatus="status" var="num">
                                <option value="${2020-num}">${2020-num}</option>
                            </c:forEach>
                        </select>

                        <select type="text" id="mon_sel" class="sel" aria-label="월">
                            <option>월</option>
                            <c:forEach begin="1" end="12" varStatus="status" var="num">
                                <option value="${num}">${num}</option>
                            </c:forEach>
                        </select>

                        <select type="text" id="day_sel" class="sel" aria-label="월">
                            <option>일</option>
                            <c:forEach begin="1" end="31" varStatus="status" var="num">
                                <option value="${num}">${num}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button onclick="updateBirth()" type="submit" class="change_button">완료</button>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>