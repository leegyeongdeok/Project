<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>business_notice_detail</title>
<style>

*{
margin: 0;
padding: 0;
}
.business_notice_detail_top{
   height: 300px;
   width: 1800px;
   margin: 0 auto;
}
.business_notice_detail_bok {
    padding-top: 100px;
    text-align: center;
    width: 1800px;
    height: auto;
    margin: 0 auto;
 
}
.business_notice_tit {
    font-size: 60px;
    font-weight: 500;
}
.business_notice_desc{
   font-size: 20px;
    font-weight: 400;
    margin-top: 40px;
}
.content_block {
 	margin: 0 auto;
    position: relative;
    width: 1800px;
    min-height: 600px;
}
.brd_title {
    position: relative;
    height: 80px;
    padding: 15px;
    font-size: 25px;
    border-top: 2px solid #222;
    border-bottom: 1px solid #222;
}
.business_notice_detail_tbl_cell {
    width: 950px;
    height: 80px;
    display: table-cell;
    line-height: 1.4;
    vertical-align: middle;
}
.business_brd_date {
    position: absolute;
    top: 45px;
    right: 20px;
    font-size: 15px;
}
.business_editor_area {
    min-height: 300px;
    padding: 40px 20px;
    line-height: 25px;
    border-bottom: 1px solid #222;
}
table.tbl_pren {
	margin: 0 auto;
    width: 100%;
    margin-top: 50px;
    border-top: 1px solid #ddd;
}
table.tbl_pren th {
    height: 60px;
    padding: 0 20px;
    border-bottom: 1px solid #ddd;
    color: #222;
    text-align: left;
}
table.tbl_pren td {
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
.content{
 margin: 0 auto;
   width: 55%;
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

<jsp:include page="../include/ownerSide.jsp" flush="true">
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="userAcc" value="<%=id%>"/>
</jsp:include>
                  <div class="business_notice_detail_top">
            <div class="business_notice_detail_bok">
            
               <div class="business_notice_tit overlay">공 지 사 항</div>
               <div class="business_notice_desc overlay">DYS(Design Your Seoul)의 소식을 신속하고 빠르게 전해 드립니다.</div>
            </div>
    
      </div><!--business_notice_detail_top-->
      
      	<div class="content_block">
            <div class="content" >
		     <h1 class="brd_title">
		     
		    	<span class="business_notice_detail_tbl_cell">${noticeDetail.title}</span>

		    	<span class="business_brd_date"><tf:formatDateTime value="${noticeDetail.registeredAt}" pattern="yyyy.MM.dd"/></span>
		    
		    </h1>
		    <div class="brd_editor">
		        <div class="business_editor_area">${noticeDetail.content}</div>
		        
		    </div>
		    <table class="tbl_pren" id="businessNoticeDetailTblPren">
		    	  <colgroup>
		            <col style="width:100px">
		            <col style="*">
		        </colgroup>
		        <tbody>
				<c:if test="${!empty beforeNotice}">
					<tr>
						<th scope="row">이전 글</th>
						<td>
							<a onclick="switchNotice(${beforeNotice.noticeNo})" class="title_link">${beforeNotice.title}</a>
						</td>
					</tr>
				</c:if>

				<c:if test="${!empty afterNotice}">
					<tr>
						<th scope="row">다음 글</th>
						<td>
							<a onclick="switchNotice(${afterNotice.noticeNo})" class="title_link">${afterNotice.title}</a>
						</td>
					</tr>
				</c:if>

		        </tbody>
		    </table>
		    <div class="btn_area">
				<input id="businessNoticeDetailListGo" type="button" onclick="listNotice()" class="listgo" value="목록">
		    </div>
		</div>
		</div>
<input id="account" type="hidden" value="<%=id%>">
<input id="userName" type="hidden" value="<%=userName%>">
<input id="type" type="hidden" value="<%=type%>">
		<%@ include file="../include/footer.jsp"%>

		</body>

<script>
	var account = $("#account").val();
	var name = $("#userName").val();
	var type = $("#type").val();
	var nowPage = <%=pages%>;
	function switchNotice(now) {
		location.href="NoticeDetail?no="+now+"&id="+account+"&name="+name+"&type="+type+"&page="+nowPage;
	}

	function listNotice() {
		location.href = "/dys/Notice?id="+id+"&name="+name+"&type="+type+"&page="+nowPage;
	}
</script>

</html>