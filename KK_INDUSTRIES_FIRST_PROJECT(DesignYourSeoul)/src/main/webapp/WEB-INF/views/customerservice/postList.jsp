<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>post</title>
<style>
* {
   margin: 0;
   padding: 0;
}
.post{
width: 1800px;
margin: 0 auto;
}

.post_top {
   height: 380px;
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

.post_tit {
   font-size: 60px;
   font-weight: 500;
}

.post_desc {
   font-size: 20px;
   font-weight: 400;
   margin-top: 40px;
}

.posttable_search {
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
	background: url(resources/image/select.png) no-repeat;
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
	background: url(resources/image/search.png) no-repeat;
	background-position: calc(100% - 7px) center;
	font-weight: 300;
}


.w100 {
   width: 100%;
}

.btn_wrap {
   text-align: center;
}

.posttable_search .btn_wrap input[type="submit"] {
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

table.posttbl_board {
   margin: 0 auto;
   width: 100%;
   border-top: 1px solid black;
}

table.posttbl_board th {
   height: 40px;
   padding: 0 20px;
   color: #222;
   background: #ffa50029;
   border-bottom: 1px solid black;
   text-align: center;
}

table.posttbl_board td {
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
   font-size: 20px;
   vertical-align: top;
   text-align: center;
}

.postBtn {
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

.posttable {
   margin: 0 auto;
   width: 55%;
}
p.posttbl_count {
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
    background: url(resources/image/first.PNG) no-repeat 0 0;
}
.btn_page_prev {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(resources/image/prev.PNG) no-repeat 0 0;
}
.btn_page_next {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(resources/image/next.PNG) no-repeat 0 0;
}
.btn_page_next {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(resources/image/next.PNG) no-repeat 0 0;
}
.btn_page_last {
    margin-right: 5px;
    width: 30px;
    height: 30px;
    background: url(resources/image/last.PNG) no-repeat 0 0;
}
.posttbl_board > td,th,a{
font-size: 16px;
}
</style>


</head>
<body>
<%@ include file="../include/header.jsp"%>
   <div class="post_top">

    

         <div class="contents_box">

            <div class="post_tit overlay">게 시 판</div>
            <div class="post_desc overlay"> 다른 회원님들과 자유로운 소통을 해보세요.<br> 게시물을 작성하실 시 바른말을 사용해 주세요.</div>
         </div>
      </div>
   
   <!--post_top-->

   <div class="post">
      <form action="" method="get">
         <div class="posttable_search">
            <span class="selectbox black"> <select name="option">
                  <option value="" selected="">전체</option>
                  <option value="title">제목</option>
                  <option value="content">내용</option>
                  <option value="id">닉네임</option>
            </select>
            </span> <span class="searchbox black mw250"> <input type="text"
               class="w100" name="search" placeholder="검색할 내용을 입력해주세요" value="">
            </span> <span class="btn_wrap"> <input type="submit" title="검색"
               alt="확인" value="검색하기" class="btn_ok"></span>
         </div>
      </form>


      <!-- 테이블 -->
      
      <div class="posttable">
     <div style="height: 40px;">
				<p class="posttbl_count">
					총 <strong class="post_count">1911</strong>건
				</p>
				<div class="sub3">


					<a href="postCard"  class="cardlook"><img class="top_img" src="resources/image/card.png" width="16" height="16" alt="카드형">카드형</a>
					<a href="postList"  class="listlook"><img class="top_img" src="resources/image/list.png" width="16" height="16" alt="게시판형">게시판형</a>
				</div>
			</div>
      
         <table class="posttbl_board">
            <colgroup>
               <col style="width: 82px">
               <col>
               <col style="width: 120px">
            </colgroup>
            <thead>
               <tr>
                  <th scope="col" style="width: 5%" >No</th>
                  <th scope="col" style="width: 10%">닉네임</th>
                  <th scope="col">제목</th>
                  <th scope="col"style="width: 10%">등록일</th>
               </tr>
            </thead>
            <tbody>




               <tr>
                  <td>1909</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [제주항공] 홍콩노선 비운항 안내 </a>
                  </td>
                  <td class="date">2019.10.07</td>
               </tr>

               <tr>
                  <td>1902</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [대한항공] 대한항공 스케줄 변경 및
                        취소 안내 </a></td>
                  <td class="date">2019.10.07</td>
               </tr>

               <tr>
                  <td>1901</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [제주항공] (대구-나리타) 비운항
                        안내 (19.12.01~20.03.28) </a></td>
                  <td class="date">2019.10.07</td>
               </tr>

               <tr>
                  <td>1900</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [공지사항] 2019 고.마.워 당첨자 공지 </a></td>
                  <td class="date">2019.10.02</td>
               </tr>

               <tr>
                  <td>1899</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=")"> [항공권소식] [제주항공]
                        대구-타이페이(TAE/TPE) 태풍 '미탁' 으로 인한 지연운항 안내 </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

               <tr>
                  <td>1898</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [에어뉴질랜드] 뉴질랜드 전자
                        여행증(NZeTA) 시행 공지사항 </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

               <tr>
                  <td>1897</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [제주항공] 무안-타이페이
                        (MWX/TPE) 태풍 '미탁' 으로 인한 지연운항 안내 </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

               <tr>
                  <td>1896</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [항공권소식] [제주항공]
                        부산-타이페이(P/TPE) 태풍 '미탁'으로 인한 지연운항 안내 </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

               <tr>
                  <td>1895</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [공지사항] [공채]2020년 (주)노랑풍선
                        신입사원 공개채용 </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

               <tr>
                  <td>1894</td>
                  <td>아무게</td>
                  <td><a href="" class="title_link"
                     onclick=""> [공지사항] 2019 허니문페스타 경품 당첨자 공지
                  </a></td>
                  <td class="date">2019.09.30</td>
               </tr>

            </tbody>

         </table>
         <input class="postBtn" type="button" value="게시하기" onclick="location.href='postWriting'">
      </div>



      <div class="page">
         <a href="#none" class="btn_page_first"><span>맨처음</span></a>
		 <a	href="#none" class="btn_page_prev"><span>이전</span></a>  <a
            href="#none" class="on">1</a> <a href="#none">2</a> <a href="#none">3</a>
         <a href="#none">4</a> <a href="#none">5</a> <a href="#none">6</a> <a
            href="#none">7</a> <a href="#none">8</a> <a href="#none">9</a> <a
            href="#none">10</a> 
            <a href="#none" class="btn_page_next"><span>다음</span></a>
            <a href="#none" class="btn_page_last"><span>마지막</span></a>
      </div>
   </div>
   <%@ include file="../include/footer.jsp"%>
</body>
</html>