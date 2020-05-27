<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>business_post_list</title>
<style>
* {
   margin: 0;
   padding: 0;
}
.business_post_list{
width: 1800px;
margin: 0 auto;
}

.business_post_list_top {
   height: 340px;
   width: 1800px;
   margin: 0 auto;
}

.contents_box {
   padding-top: 100px;
   text-align: center;
   width: 100%;
   height: auto;
   margin: 0 auto;
}

.business_post_list_tit {
   font-size: 60px;
   font-weight: 500;
}

.business_post_list_desc {
   font-size: 20px;
   font-weight: 400;
   margin-top: 40px;
}

.business_post_listtable_search {
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

.searchbox, .selectbox.black select {
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

.business_post_listtable_search .btn_wrap input[type="submit"] {
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

table {
   border-collapse: collapse;
}

table.business_post_listtbl_board {
   margin: 0 auto;
   width: 100%;
   border-top: 1px solid black;
}

table.business_post_listtbl_board th {
   height: 40px;
   padding: 0 20px;
   color: #222;
   background: #ffa50029;
   border-bottom: 1px solid black;
   text-align: center;
}

table.business_post_listtbl_board td {
   height: 60px;
   padding: 0 20px;
   line-height: 25px;
   border-bottom: 1px solid #ddd;
   letter-spacing: -0.02em;
   text-align: center;
   vertical-align: middle;
}

.title_link {
   position: relative;
   display: block;
   padding-right: 20px;

   text-overflow: ellipsis;
   overflow: hidden;
   text-align: left;
}

a {
   color: black;
   text-decoration: none;
}

.page {
   height: 30px;
   line-height: 30px;
   margin: 50px 0 0 0;
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

.business_post_listBtn {
   margin-top: 10px;
   float: right;
   width: 90px;
   height: 30px;
   border: none;
   border-radius: 0;
   background-color: orange;
   cursor: pointer;
   text-align: center;
   color: #fff; /* 글자색 */
   font-size: 15px;
   -webkit-appearance: none;
}

.business_post_listtable {
   margin: 0 auto;
   width: 55%;
}
p.business_post_listtbl_count {
    /* line-height: 1; */
    margin-bottom: 10px;
    color: #222;
    float: left;
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
.sub3 {
    float: right;
}
.top_img {
    width: 16px;
    height: 16px;
    margin: 0 3px 3px 0;
    vertical-align: middle;
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

.business_post_listtbl_board > td,th,a{
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

.business_post_List_desc > p{
    margin-top: 10px;
}

</style>


</head>
<body>
<%
   String userName = request.getParameter("name");
   String id = request.getParameter("id");
   String pages = request.getParameter("page");
   String type = request.getParameter("type");
%>

<jsp:include page="../include/ownerSide.jsp" flush="true">
   <jsp:param name="userName" value="<%=userName%>"/>
   <jsp:param name="userAcc" value="<%=id%>"/>
</jsp:include>


   <div class="business_post_list_top">
         <div class="contents_box">

            <div class="business_post_list_tit overlay">게 시 판</div>
             <div class="business_post_List_desc overlay">
                 <p>다른 회원님들과 자유로운 소통을 해보세요.</p>
                 <p> 게시물을 작성하실 시 바른말을 사용해 주세요.</p>
             </div>
         </div>
      </div>
   
   <!--business_post_list_top-->

   <div class="business_post_list">
      <form action="" method="get">
         <div class="business_post_listtable_search">
            <span class="selectbox black">
                <select id="type_selecter" name="option">
                  <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                    <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
                  <option value="name" <c:if test="${stype eq 'name'}"> selected</c:if> >이름</option>
            </select>
            </span> <span class="searchbox black mw250">
             <input id="businessPostListSearch" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span> <span class="btn_wrap">
             <input id="businessPostListBtnOk" type="button" onclick="searchBoard($('#businessPostListSearch').val())" title="검색" alt="확인" value="검색하기" class="btn_ok"></span>
         </div>
      </form>


      <!-- 테이블 -->
      
      <div class="business_post_listtable">
     <div style="height: 40px;">
				<p class="business_post_listtbl_count">
					총 <strong class="business_post_list_count" id="businessPostListCount">${ownerBoard.number}</strong>건
				</p>
			</div>
      
         <table class="business_post_listtbl_board" id="businessPostListBoard">
            <colgroup>
               <col style="width: 82px">
               <col>
               <col style="width: 120px">
            </colgroup>

            <thead>
            <tr>
               <th scope="col" style="width: 5%" >No</th>
               <th scope="col" style="width: 10%">이름</th>
               <th scope="col">제목</th>
               <th scope="col"style="width: 10%">등록일</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="board" items="${ownerBoard.content}">
               <tr>
                  <input id="${board.ownerBoardNo}" type="hidden" value="${board.ownerBoardNo}">
                  <td id="notice_num">${board.ownerBoardNo}</td>
                   <td id="notice_name">${board.ownerUser.name}</td>
                  <td><a onclick="detail(${board.ownerBoardNo})" id="notice_title" class="business_noticetitle_link" onclick="">${board.title}</a></td>
                  <td id="notice_date" class="date"> <tf:formatDateTime value="${board.registeredAt}" pattern="yyyy.MM.dd"/></td>
               </tr>
            </c:forEach>
            </tbody>

         </table>
         <input id="businessPostListWritingBtn" class="business_post_listBtn" type="button" value="게시하기" onclick="writing();">
      </div>



      <div id="paging" class="page">
         <ul>
            <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
            <li><a	onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>
            <c:forEach var="page" begin="1" end="${ownerBoard.totalPages}">
               <li><a onclick="pageSelect(${page})" class="btn_list">${page}</a></li>
            </c:forEach>
            <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
            <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
         </ul>
      </div>
   </div>
 <%@ include file="../include/footer.jsp"%>
<input id="account" type="hidden" value="<%=id%>">
<input id="userName" type="hidden" value="<%=userName%>">
<input id="type" type="hidden" value="<%=type%>">
<script>
    var account = $("#account").val();
    var userName = $("#userName").val();
    var nowPage = <%=pages%>;
    var totalP = ${ownerBoard.totalPages};
    var type = $("#type").val();


    function detail(num) {
        location.href="BoardDetail?no="+num+"&id="+account+"&name="+userName+"&type="+type+"&page="+nowPage;
    }

    function pageUp() {
        if(nowPage != totalP){
            nowPage++;
            location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }else{
            alert("마지막 페이지입니다.");
        }

    }

    function pageDown() {
        if(nowPage != 1 ){
            nowPage--;
            location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }else {
            alert("첫번째 페이지입니다");
        }

    }

    function pageFront() {
        if(nowPage == 1){
            alert("첫번째 페이지입니다");
        }else {
            nowPage = 1;
            location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }

    }

    function pageBack() {
        if(nowPage == totalP){
            alert("마지막 페이지입니다");
        }else{
            nowPage = ${ownerBoard.totalPages};
            location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
        }

    }

    function pageSelect(page) {
        nowPage = page;
        location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&page="+page;
    }

    function searchBoard(search) {
        var selectType = $("#type_selecter option:selected").val();
        location.href="Board?id="+account+"&name="+userName+"&type=owner"+"&search="+search+"&stype="+selectType;
    }

    function writing() {
        location.href="BoardWriting?id="+account+"&name="+userName+"&type=owner";
    }
</script>

</body>
</html>