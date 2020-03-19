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
            height: 900px;
            margin-left: 24%;
        }

        /* 마우스 올려놓을때 */

        .info_tit:hover {
            border-radius: 0 50px 50px 0;
            background-color: #eee;
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
            padding: 0px 0 72px;
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

        .mypagebox #mybody {
            width: 75%;
            overflow: hidden;
            margin: 0 auto;
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

        /* 회원탈퇴 박스 */
        .leave_info {
            border: 1px solid #e6e6e6;
            border-radius: 8px;
        }

        .desc_leave {
            padding-top: 6%;
            padding-left: 3%;
            margin-bottom: 6%;
        }

        .wrap_notice {
            padding-top: 5%;
            width: 94%;
            margin: auto;
        }

        .list_leave {
            padding-top: 1%;
        }

        .list_leave > li {
            padding-top: 5%;
        }

        .wrap_notice {
            border: 1px solid #e6e6e6;
            border-radius: 8px;
            padding-bottom: 4%;
            margin-bottom: 4%;
            padding-left: 1%;
        }

        .btn_leave {
            background-color: orange;
            display: block;
            cursor: pointer;
            color: white;
            font-size: 15px;
            margin-bottom: 4%;
            margin-top: 4%;
            margin-left: 40%;
            width: 20%;
            height: 40px;
            border: none;
        }

        .wrap_inp {
            text-align: center;
        }

    </style>


</head>
<body style="overflow: auto;">

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
%>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<jsp:include page="../include/loginHeader.jsp" flush="false">
    <jsp:param name="userName" value="<%=name%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
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
                        <h3 class="tit_personal tit_leave">회원탈퇴</h3>
                        <div class="leave_info">
                            <p class="desc_leave">
                                회원 탈퇴 시 반드시 주의사항을 확인후 진행해야 합니다.<br>
                                회원탈퇴 후 48시간 동안 DYS에 재가입할 수 없으며 재가입 후 탈퇴 전 서비스는 이용할 수 없으니<br> 아래 내용을
                                반드시 확인 후 진행하시기 바랍니다.
                            </p>

                            <div class="wrap_notice">
                                <h4 class="tit_notice"> DYS 회원탈퇴 주의사항</h4>
                                <ul class="list_leave">
                                    <li><strong class="tit_desc">1. DYS 로그인/서비스이용 불가</strong>
                                        <ul class="list_desc">
                                            <li><span class="txt_ico">-
													</span>탈퇴 후 DYS에서 제공하는 모든 서비스의 이용동의가 모두 철회됩니다.</em></li>
                                            <li><span class="txt_ico">-
													</span>탈퇴 진행 , 서비스 이용동의 철회 후 DYS ID 이용한 모든 서비스 서비스를 이용할 수 없습니다.</em>
                                            </li>
                                            <li><span class="txt_ico">-
													</span>서비스 내 이용 중 상품, 서비스가 있다면 모두 소진, 환불 후 탈퇴해주시기 바랍니다.</em>

                                                <p class="desc_extend">
                                                    * 일부 서비스의 데이터는 삭제되지 않을 수 있습니다.<br> 삭제를 원하시면
                                                    이용한 각 서비스 서비스 해지 진행 후 탈퇴를 진행하시기 바랍니다.
                                                </p></li>
                                            <li><span class="txt_ico">- </span>
                                                DYS는 탈퇴 후 2일 간(48시간) 재가입할 수 없습니다.</em>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><strong class="tit_desc">2. 수집된 개인정보 삭제</strong>
                                        <ul class="list_desc">
                                            <li><span class="txt_ico">- </span>탈퇴 후 사용자의 개인정보가 모두
                                                삭제됩니다.
                                            </li>
                                            <li><span class="txt_ico">- </span>단, 관계법령에 따라 필요 정보는
                                                별도 보관 될 수 있습니다. <br>자세한 내용은 개인정보취급방침을 통해 확인하실 수 있습니다.
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <p class="desc_leavegame">
                                    <span class="txt_ico">※</span> DYS 회원탈퇴가 아닌 개별 서비스 이용 해지를 원한다면
                                    각 서비스 사이트 하단 서비스 해지에서 해지하실 수 있습니다.
                                </p>

                            </div>
                            <div class="wrap_inp on">
                                <!-- on 클래스 추가시 체크마크 -->
                                <input type="checkbox" id="chk_agree" class="inp_check">
                                <label for="chk_agree" class="lab_agree"><span
                                        class="ico_leave ico_check" id="span_check"></span> 위 주의사항을 모두
                                    확인하고 회원탈퇴를 진행합니다.</label>
                            </div>
                            <button type="submit" class="btn_leave"
                                    onclick="check_withdrawal_msg()">
                                <span onclick="userSignOut()" class="txt_btn">계속</span>
                            </button>
                        </div>
                    </div>
                </div>


            </div>

        </div>


    </div>
</div>
<!-- //mypage end -->


</div>

<%@ include file="../include/footer.jsp" %>

<input id="account" type="hidden" value="<%=id%>">
<input id="name" type="hidden" value="<%=name%>">

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">

    var id = $("#account").val();
    var name = $("#name").val();

    function myPageHome() {

        location.href = "/dys/myPage/Home?id=" + id+"&name="+name;
    }

    function myInfo() {

        location.href = "/dys/myInfo?id=" + id+"&name="+name;
    }

    function myGoodList() {

        location.href = "/dys/myGoodList?id=" + id+"&name="+name;
    }

    function memberCancel() {

        location.href = "/dys/memberCancel?id=" + id+"&name="+name;
    }

    function myCourseList() {

        location.href = "/dys/myCourseList?id=" + id+"&name="+name;
    }

    function saveCourseList() {

        location.href = "/dys/saveCourseList?id=" + id+"&name="+name;
    }

    function userSignOut() {
        if(!$("#chk_agree").prop('checked')){
            alert("약관에 동의해주세요");
            return;
        }
        var account = $("#account").val();
        $.ajax({
            url : '/api/generalUser/delete/'+account,
            type : 'DELETE',
            success : function(data){
                alert("회원탈퇴가 완료 되었습니다.");
                location.href = "/dys";
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                alert(request);
            }
        });
    }

</script>

</body>
</html>