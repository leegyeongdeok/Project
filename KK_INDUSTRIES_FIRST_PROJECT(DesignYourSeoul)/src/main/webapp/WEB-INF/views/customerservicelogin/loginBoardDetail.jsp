<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>business_post_detail</title>
    <style>

        *{
            margin: 0;
            padding: 0;
        }
        .business_post_detail_top{
            height: 340px;
            width: 1800px;
            margin: 0 auto;
        }
        .business_post_detail_bok {
            padding-top: 100px;
            text-align: center;
            width: 1800px;
            height: auto;
            margin: 0 auto;

        }
        .business_post_tit {
            font-size: 60px;
            font-weight: 500;
        }
        .business_post_desc{
            font-size: 20px;
            font-weight: 400;
            margin-top: 40px;
        }
        .business_post_content_block {
            margin: 0 auto;
            position: relative;
            width: 1800px;
            min-height: 600px;
        }
        .business_post_brd_title {
            position: relative;
            height: 80px;
            padding: 15px;
            font-size: 25px;
            border-top: 2px solid #222;
            border-bottom: 1px solid #222;
        }
        .business_post_detail_tbl_cell {
            width: 950px;
            height: 80px;
            display: table-cell;
            line-height: 1.4;
            vertical-align: middle;
        }
        .business_post_brd_date {
            position: absolute;
            top: 45px;
            right: 20px;
            font-size: 15px;
        }
        .business_post_editor_area {
            min-height: 300px;
            padding: 40px 20px;
            line-height: 25px;
            border-bottom: 1px solid #222;
        }
        table.business_post_tbl_pren {
            margin: 0 auto;
            width: 100%;
            margin-top: 50px;
            border-top: 1px solid #ddd;
        }
        table.business_post_tbl_pren th {
            height: 60px;
            padding: 0 20px;
            border-bottom: 1px solid #ddd;
            color: #222;
            text-align: left;
        }
        table.business_post_tbl_pren td {
            position: relative;
            height: 60px;
            padding: 0 20px;
            border-bottom: 1px solid #ddd;
            vertical-align: middle;
            text-align: left;
        }
        .btn_area {
            margin: 40px 0;
            text-align: center;
        }
        .listgo {
            margin-top: 10px;
            width: 120px;
            height: 60px;
            border: none;
            border-radius: 0;
            background-color: orange;
            cursor: pointer;
            text-align: center;
            color: #fff;
            font-size: 25px;
            -webkit-appearance: none;
        }
        a {
            color: black;
            text-decoration: none;
        }
        .business_post_ReviewList {
            width: 100%;
            margin-top: 19px;
        }
        .business_post_ReviewList__Header {
            padding: 10px 20px;
        }
        fieldset {
            border: 0;
        }
        .search_bar {
            display: inline-block;
            width: 92%;
            height: 45px;
            border: 2px solid orange;
            background-color: #fff;
        }
        .input_text {
            margin: 12px 0 0 9px;
            width: 86%;
            height: 23px;
            outline: 0;
            border: 0;
            background-color: transparent;
            color: #000;
            font-weight: 700;
            font-size: 18px;
            line-height: 23px;

        }
        .sch_smit {
            overflow: visible;
            width: 7%;
            height: 50px;
            border: 0;
            background: orange;
            color: #fff;
            font-size: 15px;
        }
        ul, ul li {
            list-style: none;
        }
        .business_post_ReviewItem__business {
            padding: 30px ;
        }
        .business_post_ReviewItem__businessname {
            margin-right: 60%;
        }
        .business_post_ReviewItem__ReviewDate {
            float:right;
            font-size: 14px;
        }
        .business_post_ReviewItem__ReviewText {
            margin-top: 20px;
        }
        .business_post_ReviewItem {
            position: relative;
            border-bottom: 1px solid #DBDBDB;
        }
        .business_post_brd_nik{
            margin-top: 15px;
            margin-left: 70px;
            font-size: 20px;
            vertical-align: middle;
        }
        .business_post_brd_writer{
            font-size: 20px;
        }
        .content{
            margin: 0 auto;
            width: 55%;
        }

        .business_post_card_desc>p{
            margin-top: 10px;
        }
    </style>


</head>
<body>
<%
    String id = request.getParameter("id");
    String userName = request.getParameter("name");
    String pages = request.getParameter("page");
    String type = request.getParameter("type");
%>

<jsp:include page="../include/loginHeader.jsp" flush="true">
    <jsp:param name="userName" value="<%=userName%>"/>
    <jsp:param name="userAcc" value="<%=id%>"/>
</jsp:include>

<div class="business_post_detail_top">
    <div class="business_post_detail_bok">

        <div class="business_post_tit overlay">게 시 판</div>
        <div class="business_post_card_desc overlay">
            <p>다른 회원님들과 자유로운 소통을 해보세요.</p>
            <p> 게시물을 작성하실 시 바른말을 사용해 주세요.</p>
        </div>
    </div>

</div>
<!--business_post_detail_top-->

<div class="business_post_content_block">
    <div class="content" >
        <h1 class="business_post_brd_title">

		    	<span class="business_post_detail_tbl_cell" id="businessPostDetailTitle">
                    ${generalBoardDetail.title}
                </span>


            <span class="business_post_brd_date"><tf:formatDateTime value="${generalBoardDetail.registeredAt}" pattern="yyyy.MM.dd"/></span>
        </h1>
        <div class="business_post_brd_editor">
            <span><p class="business_post_brd_writer" style="float: left; " id="businessPostDetailWriter">작성자: ${generalBoardDetail.generalUser.nickname}</p> <p class="business_post_brd_nik" id="businessPostDetailNikname"></p></span>
            <div class="business_post_editor_area">
                ${generalBoardDetail.content}
            </div>

        </div>
        <!--  뎃글 -->
        <section class="business_post_ReviewList">
            <header class="business_post_ReviewList__Header">
                <h2 class="business_post_ReviewList__Title">
                    <span class="business_post_ReviewList__business_post_SuffixDesktop">댓글</span>
                    <span class="business_post_ReviewList__business_post_SuffixMobile">
                                <span>(
                                     <span class="business_post_ReviewList__AllCount" id="businessPostDetailAllCount">
                                         ${generalBoardDetail.generalBoardReplyList.size()}
                                     </span>
                                )</span>
                </h2>
            </header>
            <fieldset>
                         <span class="search_bar">
                             <form id="insertBoardFrm">
                                 <input name="reply" id="businessPostDetailText" type="text" title="검색어 입력" maxlength="255" class="input_text" >
                                 <input name="general_board_no" id="ownerBoardNo" type="hidden" value="${generalBoardDetail.generalBoardNo}" >
                                 <input name="general_id" id="ownerId" type="hidden">
                             </form>
                         </span>
                <button onclick="replyAdd()" id="businessPostDetailSearchBtn" type="button" title="검색" tabindex="3" class="sch_smit" >
                    <span class="blind">댓글 달기</span>
                </button>
            </fieldset>

            <ul class="business_post_ReviewList__ReviewList">
                <c:forEach var="reply" items="${generalBoardDetail.generalBoardReplyList}">
                    <li class="business_post_ReviewItem business_post_ReviewList__ReviewItem">
                        <div class="business_post_ReviewItem__business">
                            <div class="business_post_ReviewItem__businessPictureWrap">
                                <span class="business_post_ReviewItem__businessname" id="businessInquiryDetailUserNickName">${reply.generalUser.nickname}</span>
                                <span class="business_post_ReviewItem__ReviewDate" id="businessInquiryDetailReviewDate">
								<tf:formatDateTime value="${reply.registeredAt}" pattern="yyyy.MM.dd"/></span>
                            </div>
                            <div class="business_post_ReviewItem__ReviewTextWrap">
                                <p class="business_post_ReviewItem__ReviewText">${reply.reply}</p>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </section>

        <!--  뎃글 끝-->

        <table class="business_post_tbl_pren">
            <colgroup>
                <col style="width:100px">
                <col style="*">
            </colgroup>
            <tbody>
            <c:if test="${!empty beforeGeneralBoard}">
                <tr>
                    <th scope="row">이전 글</th>
                    <td>
                        <a onclick="switchBoard(${beforeGeneralBoard.generalBoardNo})" class="title_link">${beforeGeneralBoard.title}</a>
                    </td>
                </tr>
            </c:if>

            <c:if test="${!empty afterGeneralBoard}">
                <tr>
                    <th scope="row">다음 글</th>
                    <td>
                        <a onclick="switchBoard(${afterGeneralBoard.generalBoardNo})" class="title_link">${afterGeneralBoard.title}</a>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>

        <div class="btn_area">
            <input id="businessPostDetailListGo" type="button" class="listgo" value="목록" onclick="listBoard()">
        </div>
    </div>
</div>
<%@ include file="../include/footer.jsp"%>
<input id="account" type="hidden" value="<%=id%>">
<input id="userName" type="hidden" value="<%=userName%>">
<input id="type" type="hidden" value="<%=type%>">
</body>

<script>
    var account = $("#account").val();
    var name = $("#userName").val();
    var type = $("#type").val();
    var nowPage = <%=pages%>;
    function switchBoard(now) {
        location.href="BoardDetail?no="+now+"&id="+account+"&name="+name+"&type="+type+"&page="+nowPage;
    }

    function listBoard() {
        location.href = "/dys/Board?id="+id+"&name="+name+"&type="+type+"&page="+nowPage;
    }

    function replyAdd() {

        $.ajax({
            url : '/function/find/generalId/'+account,
            type : "GET",
            dataType:"JSON",
            success : function(data){
                $("#ownerId").val(data);
                nextStep();
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }

    function nextStep() {
        var form = $("#insertBoardFrm").serializeObject();
        $.ajax({
            url : '/function/reply/generalBoard',
            type : "POST",
            contentType:'application/json',
            dataType : 'json',
            data : JSON.stringify(form),
            success : function(data){
                alert("등록");
                location.reload();
            }
        });
    }
</script>
</html>