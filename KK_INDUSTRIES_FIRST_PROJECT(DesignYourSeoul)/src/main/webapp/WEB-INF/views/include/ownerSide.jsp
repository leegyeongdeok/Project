<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>

        div {
            margin: 0;
            padding: 0;
            display: block;
        }

        .sidemenu_link {
            padding-left: 1%;
        }

        .mysidemenu .myinfo .on .link_myinfo {
            color: #ef4323;
        }

        .myinfo_image {
            width: 20px;
            height: 20px;
            float: left;
            padding-right: 6%;
            padding-left: 10%;
            margin-top: 1%;
        }

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
            padding-top: 6%;
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

        a:hover {
            cursor: pointer;
        }

        .info_tit:hover {
            border-radius: 0 50px 50px 0;
            background-color: #eee;
        }

        #myside{
            z-index: 1;
        }
    </style>
</head>
<body style="overflow: auto;">

<%
    String name = request.getParameter("name");
    String id =request.getParameter("id");
%>
<input type="hidden" id="account" value="<%=id%>">
<input type="hidden" id="name" value="<%=name%>">
<input type="hidden" id="type" value="owner">

<div id="myside">
    <div class="mysidemenu">
        <a class="sidemenu_link" onclick="locHome()" >
            <image class="myinfo_image" src="/resources/image/ownerside/sidehome.png">
                <strong class="info_tit">홈</strong></a>

        <a class="sidemenu_link" onclick="locCompany()">
            <image class="myinfo_image" src="/resources/image/ownerside/sideintroduction.png">
                <strong class="info_tit">회사소개</strong></a>

        <a class="sidemenu_link" onclick="locInfo()">
            <image class="myinfo_image" src="/resources/image/ownerside/sideinfo.png">
                <strong class="info_tit">개인 정보</strong></a>

        <a class="sidemenu_link" onclick="locChoice()">
            <image class="myinfo_image" src="/resources/image/ownerside/sidestoreregister.png">
                <strong class="info_tit">가게 등록</strong></a>

        <a class="sidemenu_link" onclick="locList()">
            <image class="myinfo_image" src="/resources/image/ownerside/sidelist.png">
                <strong class="info_tit">가게 리스트</strong></a>

        <a class="sidemenu_link" onclick="locNotice()">
            <image class="myinfo_image" src="/resources/image/ownerside/sidenotice.png">
                <strong class="info_tit">공지사항</strong></a>

        <a class="sidemenu_link" onclick="locQuestion()">
            <image class="myinfo_image" src="/resources/image/ownerside/sideinquiry.png">
                <strong class="info_tit">문의사항</strong></a>

        <a class="sidemenu_link" onclick="locBoard()">
            <image class="myinfo_image" src="/resources/image/ownerside/sideboard.png">
                <strong class="info_tit">업주게시판</strong></a>

        <a class="sidemenu_link" onclick="locCancel()">
            <image class="myinfo_image" src="/resources/image/ownerside/sidecancel.png">
                <strong class="info_tit">회원탈퇴</strong></a>

        <a class="sidemenu_link" onclick="locLogout()" >
            <image class="myinfo_image" src="/resources/image/logo/headerlogo.png">
                <strong class="info_tit">로그아웃</strong></a>
    </div>

</div>

<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
<script>
    var id = $("#account").val();
    var name = $("#name").val();

    function  locHome(){
        location.href = "/dys/owner/Home?id="+id+"&name="+name;
    }

    function  locCompany(){
        location.href = "/dys/owner/Intro?id="+id+"&name="+name;
    }

    function  locInfo(){
        location.href = "/dys/owner/Info?id="+id+"&name="+name;
    }

    function  locChoice(){
        location.href = "/dys/owner/StoreChoice?id="+id+"&name="+name;
    }

    function  locList(){
        location.href = "/dys/owner/StoreList?id="+id+"&name="+name;
    }

    function  locNotice(){
        location.href = "/dys/Notice?id="+id+"&name="+name+"&type="+$("#type").val()+"&page=1";
    }

    function  locQuestion(){
        location.href = "/dys/Question?id="+id+"&name="+name+"&type="+$("#type").val()+"&page=1";
    }

    function  locBoard(){
        location.href = "/dys/Board?id="+id+"&name="+name+"&type="+$("#type").val()+"&page=1";
    }

    function  locCancel(){
        location.href = "/dys/owner/Cancel?id="+id+"&name="+name;
    }

    function locLogout() {
        var out = confirm("정말 로그아웃 하시겠습니까?");
        if(out){
            location.href = "/dys";
        }
    }
</script>
</body>
</html>