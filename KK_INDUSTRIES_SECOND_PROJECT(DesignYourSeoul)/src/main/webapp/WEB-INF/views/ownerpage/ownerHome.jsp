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

    <title>owner page</title>
    <link rel="stylesheet" href="/resources/css/ownerPage/ownerHome.css">

</head>

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/ownerPage/ownerHome.js"></script>

<jsp:include page="../include/ownerSide.jsp" flush="false"/>
<div id="pageBack">
    <!-- mypage start -->

    <div id="page">
        <div id="pageMain">

            <!-- 내정보 칸 -->

            <div class="content">
                <div class="head_content">
                    <!-- 유저닉네임  -->
                    <h3><span id="username"></span>님, 어서오세요.</h3>
                    <p class="title_font" id="title_p">DYS에 자신의 가게를 등록, 수정 할 수 있습니다.<br/>
                        오너님의 가게를 다른 사용자에게 소개 해주세요.
                    </p>
                    <!-- 정보 시작 -->
                </div>

                <div class="page_box_container">
                    <div class="box_left">
                        <div class="box_content">
                            <h3>개인정보 확인 및 변경</h3>
							<img class="box_img" src="/resources/image/myinfo/myinfo.png">
                            <p>
								DYS 계정에 저장된 데이터를 확인하고
								DYS 사용 환경을 맞춤설정하기 위해
								어떤 활동을 저장할지 선택합니다.
                            </p>
                        </div>

                    </div>

                    <div class="box_right">
                        <div class="box_content">
                            <h3>가게 등록</h3>
							<img class="box_img" src="/resources/image/ownerside/sidestoreregister.png">
                            <p>
								자신의 가게를 등록하실수 있습니다.
								가게이름, 종류, 위치등 가게의정보를 알려주세요.
                            </p>

                        </div>

                    </div>

                    <div class="box_left">
                        <div class="box_content">
                            <h3>가게 리스트</h3>
							<img class="box_img" src="/resources/image/myinfo/list.png">
                            <p>내가 등록한 가게를 한눈에 편하게 확인하실수 있습니다. <br>DYS는 업주들도 회원이라 생각하며 불편함을 줄이고자 최선을 다합니다..
                            </p>
                        </div>

                    </div>

                    <div class="box_right">
                        <div class="box_content">
                            <h3>저장한 코스 목록</h3>
							<img class="box_img" src="/resources/image/myinfo/savecourse.png">
                            <p>다른 회원이 다녀온 코스들중 마음에드는 코스를 저장하시고 이곳에서 확인해보세요.
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp" %>

</body>
</html>