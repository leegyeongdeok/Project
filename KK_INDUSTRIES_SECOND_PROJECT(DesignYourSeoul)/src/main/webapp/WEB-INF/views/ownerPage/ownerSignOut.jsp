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
    <link rel="stylesheet" href="/resources/css/mypage/signOut.css">

</head>
<body>
<jsp:include page="../include/ownerSide.jsp" flush="false"/>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript" src="/resources/js/ownerPage/ownerSignOut.js"></script>

<div id="pageBack">
    <div id="myPage">
        <div id="pageMain">

            <!-- 내정보 칸 -->
            <div id="content_box">

                <div class="content">
                    <h3 class="content_tit">회원탈퇴</h3>
                    <div class="content_info">
                        <p class="desc_leave">
                            회원 탈퇴 시 반드시 주의사항을 확인후 진행해야 합니다.<br>
                            재가입 후 탈퇴 전 이용하셨던 정보는 삭제됩니다.<br>
                            아래 내용을 반드시 확인 후 진행하시기 바랍니다.
                        </p>

                        <div class="wrap_notice">
                            <h4 class="tit_notice"> DYS 회원탈퇴 주의사항</h4>
                            <ul class="list_leave">
                                <li><strong class="tit_desc">1. DYS 로그인/서비스이용 불가</strong>
                                    <ul class="list_desc">
                                        <li>-탈퇴 후 DYS에서 제공하는 모든 서비스의 이용동의가 모두 철회됩니다.</li>

                                        <li>-탈퇴 진행 , 서비스 이용동의 철회 후 DYS ID 이용한 모든 서비스 서비스를 이용할 수 없습니다.</li>
                                        <li>-서비스 내 이용 중 상품, 서비스가 있다면 모두 소진, 환불 후 탈퇴해주시기 바랍니다.
                                            <p class="desc_em">
                                                * 일부 서비스의 데이터는 삭제되지 않을 수 있습니다.<br>
                                                삭제를 원하시면 이용한 각 서비스 데이터를 삭제 후 탈퇴를 진행하시기 바랍니다.
                                            </p>
                                        </li>
                                    </ul>
                                </li>
                                <li><strong class="tit_desc">2. 수집된 개인정보 삭제</strong>
                                    <ul class="list_desc">
                                        <li>-탈퇴 후 사용자의 개인정보가 모두 삭제됩니다.</li>
                                        <li>-단, 관계법령에 따라 필요 정보는 별도 보관 될 수 있습니다. <br>
                                            자세한 내용은 개인정보취급방침을 통해 확인하실 수 있습니다.
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="wrap_inp on">
                            <!-- on 클래스 추가시 체크마크 -->
                            <input type="checkbox" id="chk_agree" class="inp_check">
                            <label for="chk_agree" class="lab_agree"><span
                                    class="ico_leave ico_check" id="span_check"></span> 위 주의사항을 모두
                                확인하고 회원탈퇴를 진행합니다.</label>
                        </div>
                        <button onclick="userSignOut()" type="submit" class="btn_leave">
                            <span class="txt_btn">계속</span>
                        </button>
                    </div>
                </div>
            </div>

        </div>


    </div>
</div>
<!-- //mypage end -->

</body>
</html>