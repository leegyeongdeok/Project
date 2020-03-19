<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>business_inquiry</title>
<style>
* {
   margin: 0;
   padding: 0;
}
.business_inquiry{
width: 1800px;
margin: 0 auto;
}

.business_inquiry_top {
   height: 380px;
   width: 1800px;
   margin: 0 auto;
}

.business_inquiry_contents_box {
   padding-top: 100px;
   text-align: center;
   width: 1800px;
   height: auto;
   margin: 0 auto;
}

.business_inquiry_tit {
   font-size: 60px;
   font-weight: 500;
}

.business_inquiry_desc {
   font-size: 20px;
   font-weight: 400;
   margin-top: 40px;
}

.business_inquirytable_search {
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

.business_inquirytable_search .btn_wrap input[type="submit"] {
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

table.business_inquirytbl_board {
   margin: 0 auto;
   width: 100%;
   border-top: 1px solid black;
}

table.business_inquirytbl_board th {
   height: 40px;
   padding: 0 20px;
   color: #222;
   background: #ffa50029;
   border-bottom: 1px solid black;
   text-align: center;
}

table.business_inquirytbl_board td {
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

.business_inquiryBtn {
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

.business_inquirytable {
   margin: 0 auto;
   width: 55%;
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


.business_inquirytbl_board > td,th,a{
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

.page ul li a:hover, .page ul li a:focus {
   color:#fff;
   border:1px solid orange;
   background-color:orange;
}

.inquiry_desc>p{
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


   <div class="business_inquiry_top">



         <div class="business_inquiry_contents_box">
            <div class="business_inquiry_tit overlay">문 의 사 항</div>
            <div class="inquiry_desc overlay">
               <p>회원 여러분의 작은 목소리에도 귀 기울이는 DYS가 되겠습니다.</p>
               <p>DYS에 궁금하시거나 건의하고 싶은 사항이 있다면 시스템개선 제안을 받습니다.</p>
               <p>문의사항에 작성된 내용은 본인 외에는 확인 하실 수 없습니다</p>
            </div>

         </div>
     
   </div>
   <!--business_inquiry_top-->

   <div class="business_inquiry">
      <form action="" method="get">
         <div class="business_inquirytable_search">
            <span class="selectbox black"> 
            <select id="type_selecter" name="option">
                  <option value="all" <c:if test="${stype eq 'all'}"> selected</c:if> >전체</option>
                  <option value="title" <c:if test="${stype eq 'title'}"> selected</c:if>>제목</option>
                 <option value="content" <c:if test="${stype eq 'content'}"> selected</c:if> >내용</option>
            </select>
            </span> <span class="searchbox black mw250">
            <input id="question_search" type="text" class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span> <span class="btn_wrap">
            <input onclick="searchNotice($('#question_search').val())" id="businessInquiryBtn" type="button" title="검색" alt="확인" value="검색하기" class="btn_ok">
         </span>
         </div>
      </form>


      <!-- 테이블 -->
      <div class="business_inquirytable">
         <table id="businessInquiryTable" class="business_inquirytbl_board">
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
            <c:forEach varStatus="status" var="question" items="${ownerQuestion.content}">
               <tr>
                  <td>${status.index+1}</td>
                  <td>${question.ownerUser.name}</td>
                  <td>
                     <a class="title_link" onclick="detail(${question.ownerQuestionNo})"> ${question.title}</a>
                  </td>
                  <td class="date">
                     <tf:formatDateTime value="${question.registeredAt}" pattern="yyyy.MM.dd"/>
                  </td>
               </tr>

            </c:forEach>
            </tbody>
         </table>
         <input id="businessInquiryWritingBtn" class="business_inquiryBtn" type="button" value="게시하기" onclick="writing()">
      </div>



      <div id="businessInquiryPaging" class="page">
         <ul>
            <li><a onclick="pageFront()" class="btn_page_first"><span>맨처음</span></a></li>
            <li><a	onclick="pageDown()" class="btn_page_prev"><span>이전</span></a></li>
            <c:forEach var="page" begin="1" end="${ownerQuestion.totalPages}">
               <li><a onclick="pageSelect(${page})" class="btn_list">${page}</a></li>
            </c:forEach>
            <li><a onclick="pageUp()" class="btn_page_next"><span>다음</span></a></li>
            <li><a onclick="pageBack()" class="btn_page_last"><span>마지막</span></a></li>
         </ul>
      </div>
   </div>

<%@ include file="../include/footer.jsp"%>
<input id="type" type="hidden" value="<%=type%>">
<input id="name" type="hidden" value="<%=userName%>">
<input id="id" type="hidden" value="<%=id%>">
<script>
   var account = $("#id").val();
   var userName = $("#name").val();
   var nowPage = <%=pages%>;
   var totalP = ${ownerQuestion.totalPages};
   var type = $("#type").val();

   function detail(num) {
      location.href="QuestionDetail?no="+num+"&id="+account+"&name="+userName+"&type="+type+"&page="+nowPage;
   }

   function pageUp() {
      if(nowPage != totalP){
         nowPage++;
         location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
      }else{
         alert("마지막 페이지입니다.");
      }

   }

   function pageDown() {
      if(nowPage != 1 ){
         nowPage--;
         location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
      }else {
         alert("첫번째 페이지입니다");
      }

   }

   function pageFront() {
      if(nowPage == 1){
         alert("첫번째 페이지입니다");
      }else {
         nowPage = 1;
         location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
      }

   }

   function pageBack() {
      if(nowPage == totalP){
         alert("마지막 페이지입니다");
      }else{
         nowPage = ${ownerQuestion.totalPages};
         location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage;
      }

   }

   function pageSelect(page) {
      nowPage = page;
      location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&page="+page;
   }

   function searchNotice(search) {
      var selectType = $("#type_selecter option:selected").val();
      location.href="Question?id="+account+"&name="+userName+"&type=owner"+"&search="+search+"&stype="+selectType;
   }

   function writing() {
      location.href="QuestionWriting?id="+account+"&name="+userName+"&type=owner";
   }
</script>

</body>
</html>