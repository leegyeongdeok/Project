<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>내 정보관리</title>

    <style>
        div {
            margin: 0;
            padding: 0;
            display: block;
        }

        ul, li {
            list-style: none;
        }

        /* 첫번쨰 div */
        #mypageback {
            min-width: 1180px;
        }

        #mypage {
            width: 1000px;
            margin: 0 auto;
            letter-spacing: -1px;
            height: 1150px;
            margin-left: 24%;
        }

        /* 타이틀 */
        .mypage_tit {
            overflow: hidden;
            width: 1000px;
            height: 60px;
            padding-top: 50px;
            border-bottom: 2px solid #000;
            text-align: left;
        }

        .mypage_tit {
            overflow: hidden;
            width: 1000px;
            height: 60px;
            padding-top: 50px;
            border-bottom: 2px solid #000;
            text-align: left;
        }

        .ptitle {
            width: 190px;
            height: 45px;
            background-position: 0 0;
            font-size: 34px;
        }

        /* 마이페이지 body */
        #mypagemain {
            float: left;
            overflow: hidden;
            width: 1000px;
            padding: 25px 0 72px;
            margin-top: 5%;
        }

        /* 마이페이지 사이드 메뉴바 */
        #myside {
            float: left;
            width: 250px;
            border: 0 none;
            background: 0;
            margin-top: 5%;
            margin-left: 0%;
            position: fixed;
        }

        .mysidemenu {
            overflow: hidden;
            width: 250px;
            padding-top: 4%;
            text-align: left;
        }

        .mysidemenu .info_tit {
            display: block;
            height: 41px;
            font-size: 17px;
            color: #000;
            line-height: 28px;
            padding-bottom: 0px;
            padding-left: 17%;
            padding-top: 10px;
            margin-top: -14%;
            margin-bottom: 5%;
            width: 207px;
        }

        .sidemenu_link {
            padding-left: 1%;
        }

        .mysidemenu .myinfo {
            padding: 6px 0 37px;
        }

        .mysidemenu .myinfo li {
            overflow: hidden;
            font-size: 13px;
            line-height: 24px;
        }

        /* 링크 색 */
        .myinfo .link_myinfo {
            float: left;
            color: #252525;
            text-decoration: none;
        }

        .mysidemenu .myinfo .on .link_myinfo {
            color: #ef4323;
        }

        /* 정보 보여주기 시작 */

        .info_title {
            overflow: hidden;
            width: 795px;
            padding: 27px 0 29px;
            font-size: 15px;
            line-height: 18px;
        }

        .mypagebox #mybody {
            width: 800px;
            overflow: hidden;
            margin: 0 auto;
        }

        .mypagebox .mybody_cont {
            overflow: hidden;
            width: 798px;
            background-color: #fff;
            letter-spacing: 0;
        }

        .cont_personal {
            overflow: hidden;
            text-align: left;
        }

        .cont_personal .tit_personal {
            height: 22px;
            margin-left: 33px;
            padding: 20px 0;
            font-size: 35px;
            color: #000;
            line-height: 0px;
            text-align: center;
            font-weight: 100;
        }

        .cont_personal #title_p {
            text-align: center;
            padding-bottom: 4%;
        }

        .tit_personal .changeinfo {
            margin-left: 75%;
        }

        .cont_personal .basic_info {
            border: 1px solid #e6e6e6;
            border-radius: 8px;
        }

        /* .cont_personal .basic_info .id_basic{
           border-top: 1px solid #eee;
        } */

        .cont_personal .basic_info .area_basic {
            overflow: hidden;
            width: 795px;
            padding: 27px 0 29px;
            font-size: 15px;
            line-height: 18px;
            border-bottom: 1px solid #eee;
        }

        .cont_personal .basic_info .tit_basic {
            float: left;
            width: 134px;
            padding: 0 37px;
            letter-spacing: -1px;
        }

        .cont_personal .basic_info .box_basic {
            float: left;
            width: 450px;
            padding-left: 40px;
        }

        /* 마우스 올려놓을때 */

        .area_basic:hover {
            background-color: #eee;
        }

        #second_info {
            padding-top: 5%;
        }

        #third_info {
            padding-top: 5%;
        }

        .myinfo_explan {
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 25px;
            float: left;
        }

        #explan_image {
            padding-left: 15%;
            width: 270px;
            height: 135px;
        }

        .info_tit:hover {
            border-radius: 0 50px 50px 0;
            background-color: #eee;
        }

        /* 글씨 사이즈 */
        .tit_basic {
            font-size: 12px;
            color: #00000073;
        }

        .box_basic {
            font-size: 17px;
            font-weight: 100;
        }

        .pro_title {
            font-size: 22px;
            font-weight: 100;
        }

        .title_font {
            font-size: 17px;
            color: #000000a3;
        }

        /* 사이드 이미지 */

        .myinfo_image {
            width: 20px;
            height: 20px;
            float: left;
            padding-right: 6%;
            padding-left: 10%;
            margin-top: 1%;
        }

    </style>


</head>
<body style="overflow: auto; ">

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
%>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<jsp:include page="../include/loginHeader.jsp" flush="false">
    <jsp:param name="name" value="<%=name%>"/>
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>

<div id="mypageback">
    <!-- mypage start -->
    <div id="myside">
        <div class="mysidemenu">
            <a class="sidemenu_link" onclick="myPageHome()">
                <image class="myinfo_image" src="/resources/image/myinfo/good.png">
                    <strong class="info_tit">홈</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myInfo()">
                <image class="myinfo_image" src="/resources/image/myinfo/myinfo.png">
                    <strong class="info_tit">개인 정보</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myGoodList()">
                <image class="myinfo_image" src="/resources/image/myinfo/goodlist.png">
                    <strong class="info_tit">좋아요 리스트</strong></image>
            </a>

            <a class="sidemenu_link" onclick="myCourseList()">
                <image class="myinfo_image" src="/resources/image/myinfo/mycourse.png">
                    <strong class="info_tit">내코스 목록</strong></image>
            </a>

            <a class="sidemenu_link" onclick="saveCourseList()">
                <image class="myinfo_image" src="/resources/image/myinfo/savecourse.png">
                    <strong class="info_tit">저장한 코스 목록</strong></image>
            </a>

            <a class="sidemenu_link" onclick="memberCancel()">
                <image class="myinfo_image" src="/resources/image/myinfo/membercancel.png">
                    <strong class="info_tit">회원탈퇴</strong></image>
            </a>
        </div>
    </div>
    <div id="mypage" class="mypagebox">
        <div id="mypagemain">

            <!-- 내정보 칸 -->
            <div id="mybody">
                <div class="mybody_cont">
                    <div class="cont_personal">
                        <h3 class="tit_personal">개인 정보</h3>
                        <p class="title_font" id="title_p">이름, 사진과 같이 DYS 서비스에서 사용하는 기본 정보</p>
                        <!-- 정보 시작 -->
                        <div class="basic_info" style="display: block">
                            <div class="info_title" style="padding-left: 4%;">
                                <h3 class="pro_title">프로필</h3><br>
                                <p class="title_font">일부 정보가 DYS 서비스를 이용하는 다른 사람에게 표시될수 있습니다.</p>
                            </div>

                            <a onclick="idChange()" class="change_info">
                                <div class="area_basic id_basic">
                                    <strong class="tit_basic">아이디</strong>
                                    <div class="box_basic"><%=id%></div>
                                </div>
                            </a>

                            <a onclick="pwChange()" class="change_info">
                                <div class="area_basic nickname_basic">
                                    <strong class="tit_basic">비밀번호</strong>
                                    <div id="info_pswd" class="box_basic"></div>
                                </div>
                            </a>

                            <a onclick="nickNameChange()" class="change_info">
                                <div class="area_basic nickname_basic">
                                    <strong class="tit_basic">닉네임</strong>
                                    <div id="info_nick" class="box_basic"></div>
                                </div>
                            </a>

                            <a onclick="nameChange()" class="change_info">
                                <div class="area_basic name_basic">
                                    <strong class="tit_basic">이름</strong>
                                    <div id="info_name" class="box_basic"></div>
                                </div>
                            </a>

                            <a onclick="birthChange()" class="change_info">
                                <div class="area_basic jumin_basic">
                                    <strong class="tit_basic">생년월일</strong>
                                    <div id="info_birth" class="box_basic"></div>
                                </div>
                            </a>
                        </div>
                        <div id="second_info">
                            <div class="basic_info second">
                                <div class="info_title" style="padding-left: 4%;">
                                    <h3 class="pro_title">연락처 정보</h3>
                                </div>

                                <a onclick="emailChange()" class="change_info">
                                    <div class="area_basic email_basic">
                                        <strong class="tit_basic">이메일</strong>
                                        <div id="info_email" class="box_basic"></div>
                                    </div>
                                </a>

                                <a onclick="phoneChange()" class="change_info">
                                    <div class="area_basic phone_basic">
                                        <strong class="tit_basic">번호</strong>
                                        <div id="info_phone" class="box_basic"></div>
                                    </div>
                                </a>

                            </div>
                        </div>

                        <div id="third_info">
                            <div class="basic_info third">
                                <div class="myinfo_explan">
                                    <h3>몇몇 정보는 다른 사용자가 볼수 있습니다.</h3><br/>
                                    <p>저희 DYS 에서는 다른 무엇보다<br> 회원정보 보호를 가장 신경쓰고 있습니다.</p>
                                </div>
                                <img src="/resources/image/logo.png" id="explan_image">
                            </div>
                        </div>

                    </div>

                </div>


            </div>
        </div>
        <!-- //mypage end -->


    </div>
</div>

<%@ include file="../include/footer.jsp" %>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script>
    var result = false;
    var name;
    var phone;
    var password="";
    var nickname;
    var birth;
    var email;

    var id = $("#account").val();
    var username = $("#name").val();

    $(function () {
        $.ajax({
            url: '/function/MyPage/myInfo/' + id,
            type: "GET",
            success: function (data) {
                name = data.name.toString();
                phoneAll = data.phone_num;
                passwordLength = data.password.toString().length;
                nickname = data.nickname.toString();
                birth = data.birth.toString();
                email = data.email.toString();
                nextStep();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                alert(request);
            }
        });
    });

    function nextStep() {
        for(var i = 0; i<passwordLength; i++){
            password+="●";
        }
        phone = phoneAll.substring(0,3)+"-"+phoneAll.substring(3,7)+"-"+phoneAll.substring(7,11);
        $("#info_name").text(name);
        $("#info_pswd").text(password);
        $("#info_nick").text(nickname);
        $("#info_phone").text(phone);
        $("#info_email").text(email);
        $("#info_birth").text(birth);
    }

    function myPageHome() {

        location.href = "/dys/myPage/Home?id=" + id + "&name=" + username;
    }

    function myInfo() {

        location.href = "/dys/myInfo?id=" + id + "&name=" + username;
    }

    function myGoodList() {

        location.href = "/dys/myGoodList?id=" + id + "&name=" + username;
    }

    function memberCancel() {

        location.href = "/dys/memberCancel?id=" + id + "&name=" + username;
    }

    function myCourseList() {

        location.href = "/dys/myCourseList?id=" + id + "&name=" + username;
    }

    function saveCourseList() {

        location.href = "/dys/saveCourseList?id=" + id + "&name=" + username;
    }

    // view/myinfoChange
    function idChange() {

        location.href = "/dys/myinfochange/idChange?id=" + id + "&name=" + username;
    }

    function pwChange() {

        location.href = "/dys/myinfochange/pwChange?id=" + id + "&name=" + username;
    }

    function nameChange() {

        location.href = "/dys/myinfochange/nameChange?id=" + id + "&name=" + username;
    }

    function nickNameChange() {

        location.href = "/dys/myinfochange/nickNameChange?id=" + id + "&name=" + username;
    }

    function birthChange() {

        location.href = "/dys/myinfochange/birthChange?id=" + id + "&name=" + username;
    }

    function emailChange() {

        location.href = "/dys/myinfochange/emailChange?id=" + id + "&name=" + username;
    }

    function phoneChange() {

        location.href = "/dys/myinfochange/phoneChange?id=" + id + "&name=" + username;
    }

</script>

</body>
</html>