<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>business_notice</title>

<style>
*{
margin: 0;
padding: 0;
}
.business_notice{
width: 1800px;
margin: 0 auto;
}
.business_notice_top{
   height: 300px;
   width: 1800px;
   margin: 0 auto;
}
.business_notice_box {
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

.table_search {
/*     padding-top: 30px; */
    margin: 0 auto;
    max-width: 1280px;
    position: relative;
    text-align: center;
    font-size: 0px;
    padding-bottom: 50px;
}
.selectbox {
    min-width: 120px;
    margin-right: 30px;
}
.searchbox, .selectbox {
    position: relative;
    display: inline-block;
}
.searchbox , .selectbox.black select {
    color: #333;
    border-bottom: 2px solid rgba(0, 0, 0, 0.7);
}
.selectbox select {
    width: 100%;
}
select {
	padding-bottom: 5px;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	height: 32px;
	border: 0px;
	font-size: 15px;
	box-sizing: border-box;
	padding-right: 28px;
	padding-left: 7px;
	background: url(/resources/image/service/select.png) no-repeat;
	background-position: calc(100% - 7px) center;
}
 .searchbox {
    min-width: 250px;
    display: inline-block;
}
.searchbox.black input[type='text'] {
	max-width: 100%;
	border-radius: 0px;
	-moz-appearance: none;
	appearance: none;
	min-height: 32px;
	border: 0px;
	font-size: 15px;
	box-sizing: border-box;
	padding-right: 7px;
	padding-left: 7px;
	padding-top: 6px;
	padding-bottom: 6px;
	background: url(/resources/image/service/search.png) no-repeat;
	background-position: calc(100% - 7px) center;
	font-weight: 300;
}
.w100 {
    width: 100%;
}
.btn_wrap {
    text-align: center;
}
.table_search .btn_wrap input[type="submit"] {
  
  
    margin-left: 30px;
    width: 130px;
    height: 40px;
    border: none;
    border-radius: 0;
    background-color: orange;
    cursor: pointer;
    text-align: center;
    color: #fff; /* 글자색 */
    font-size: 20px;
    -webkit-appearance: none;
}
table{
border-collapse: collapse;
}

table.business_noticetbl_board {
	margin: 0 auto;
    width: 55%;
    border-top: 1px solid black;
}
table.business_noticetbl_board th {
    height: 40px;
    padding: 0 20px;
      color: #222;
      background: #ffa50029;
      border-bottom: 1px solid black;
    text-align: center;
}
table.business_noticetbl_board td {
    height: 60px;
    padding: 0 20px;
    line-height: 25px;
    border-bottom: 1px solid #ddd;
    letter-spacing: -0.02em;
    text-align: center;
    vertical-align: middle;
}
.business_noticetitle_link {
    position: relative;
    display: block;
    padding-right: 20px;
   
    text-overflow: ellipsis;
    overflow: hidden;
    text-align: left;
}
a{
color:black;
    text-decoration: none;
}
.page {
    height: 30px;
    line-height: 30px;
    margin: 30px 0 0 0;
    text-align: center;
}
.page a {
    display: inline-block;
    height: 30px;
    line-height: 30px;
    padding: 0 2px;
    margin: 0 5px;
    box-sizing: border-box;
    
      vertical-align: top;
    text-align: center;
}
.page a span, .page>span span {
    position: absolute;
    width: 1px;
    height: 1px !important;
    padding: 0;
    margin: -1px;
    border: none;
    clip: rect(0 0 0 0);
    overflow: hidden;
}
.btn_page_first {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(/resources/image/service/first.PNG) no-repeat 0 0;
}
.btn_page_prev {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(/resources/image/service/prev.PNG) no-repeat 0 0;
}
.btn_page_next {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(/resources/image/service/next.PNG) no-repeat 0 0;
}
.btn_page_next {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(/resources/image/service/next.PNG) no-repeat 0 0;
}
.btn_page_last {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(/resources/image/service/last.PNG) no-repeat 0 0;
}

.business_noticetbl_board > td,th,a{
font-size: 16px;
}
.page ul {
    list-style:none;
    float:left;
    display:inline;
    margin-left: 750px;
}
.page ul li {
    float:left;
}
.page ul li a {
    float:left;
    padding:4px;
    margin-right:3px;
    width:30px;
    height: 30px;
    color:#000;
    font:bold 12px tahoma;
    text-align:center;
    text-decoration:none;
}

.page ul li .btn_list:hover, .page ul li .btn_list:focus {
    color:#fff;
    border:1px solid orange;
    background-color:orange;
}

</style>


</head>
<title> 공지사항</title>

<body>
<%
    String userName = request.getParameter("name");
    String id = request.getParameter("id");
    String pages = request.getParameter("page");
    String type = request.getParameter("type");
%>
<jsp:include page="../include/ownerSide.jsp" flush="true">
    <jsp:param name="userName" value="<%=userName%>"/>
    <jsp:param name="userAge" value="<%=id%>"/>
</jsp:include>
                  <div class="business_notice_top">
            <div class="business_notice_box">
            
               <div class="business_notice_tit overlay">공 지 사 항</div>
              <div class="business_notice_desc overlay">DYS(Design Your Seoul)의 소식을 신속하고 빠르게 전해 드립니다.</div>
            </div>
   
      </div><!--business_notice_top-->
   
         <div class="business_notice">
      <form action="" method="get">
         <div class="table_search">
            <span class="selectbox black">


               <select id="type_selecter" name="option">
                   <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                 <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
               </select>
            </span>
            <span class="searchbox black mw250">
               <input id="notice_search" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span>
            <span class="btn_wrap"><input id="businessNoticeBtnOk" onclick="searchNotice($('#notice_search').val())" type="button" title="검색" alt="확인" value="검색하기" class="btn_ok" ></span>
         </div>
      </form>
      
      
      <!-- 테이블 -->
       
      <table class="business_noticetbl_board" id="businessNoticeBoard">
             <colgroup>
                  <col style="width:82px">
                  <col>
                  <col style="width:120px">
              </colgroup>
              <thead>
              <tr>
                  <th scope="col">No</th>
                  <th scope="col">제목</th>
                  <th scope="col">등록일</th>
              </tr>
              </thead>
              <tbody id="noticeList"> <%--10개 씩--%>


              <c:forEach var="notice" items="${ownerNotice.content}">
              <tr>
                  <input id="${notice.noticeNo}" type="hidden" value="${notice.noticeNo}">
                  <td id="notice_num">${notice.noticeNo}</td>
                  <td><a onclick="detail(${notice.noticeNo})" id="notice_title" class="business_noticetitle_link" onclick="">${notice.title}</a></td>
                  <td id="notice_date" class="date"> <tf:formatDateTime value="${notice.registeredAt}" pattern="yyyy.MM.dd"/></td>
              </tr>
              </c:forEach>
              </tbody>
          </table>

<div  class="page">





    <ul>
        <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
        <li><a	onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>
    <c:forEach var="page" begin="1" end="${ownerNotice.totalPages}">
        <li><a onclick="pageSelect(${page})" class="btn_list">${page}</a></li>
    </c:forEach>
       <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
        <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
    </ul>
<input id="name" type="hidden" value="<%=userName%>">
        <input id="id" type="hidden" value="<%=id%>">



</div>

</div>
<%@ include file="../include/footer.jsp"%>
<input id="type" type="hidden" value="<%=type%>">
<script>
    var account = $("#id").val();
    var userName = $("#name").val();
    var nowPage = <%=pages%>;
    var totalP = ${ownerNotice.totalPages};
    var type = $("#type").val();


    function detail(num) {
         location.href="NoticeDetail?no="+num+"&id="+account+"&name="+userName+"&type="+type+"&page="+nowPage;
    }

    function pageUp() {
        if(nowPage != totalP){
            nowPage++;
            location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }else{
            alert("마지막 페이지입니다.");
        }

    }

    function pageDown() {
        if(nowPage != 1 ){
            nowPage--;
            location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }else {
            alert("첫번째 페이지입니다");
        }

    }

    function pageFront() {
        if(nowPage == 1){
            alert("첫번째 페이지입니다");
        }else {
            nowPage = 1;
            location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }

    }

    function pageBack() {
        if(nowPage == totalP){
            alert("마지막 페이지입니다");
        }else{
            nowPage = ${ownerNotice.totalPages};
            location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }

    }

    function pageSelect(page) {
        nowPage = page;
        location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&page="+page;
    }

    function searchNotice(search) {
        var selectType = $("#type_selecter option:selected").val();
        location.href="Notice?id="+account+"&name="+userName+"&type=owner"+"&search="+search+"&stype="+selectType;
    }
</script>
</body>
</html>