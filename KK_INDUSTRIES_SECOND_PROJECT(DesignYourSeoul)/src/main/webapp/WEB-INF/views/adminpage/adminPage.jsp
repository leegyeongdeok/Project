
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
* {
   margin: 0;
   padding: 0;
}

#page-wrap {
    width: 100%;
    height: 830px;
}

.adminpage_title> h1 {
margin-left: 30px;
   color: #565656;
}

.tabs {
   position: relative;
   min-height: 100%; /* This part sucks */
   clear: both;
  margin-top: 1%;
}

.tab {
   /*float: left; */
   height: 50px;
}

.tab label {
   padding: 10px;
   margin-left: -1px;
   position: relative;
   left: 1px;
   width: 100px;
   display: block;
   text-align: center;
   color: #000000;
}

.tab [type=radio] {
   display: none;
}

.content {
   padding-top: 15px;
   position: absolute;
   top: 0px;
   left: 121px;
   background: white;
   right: 0;
   bottom: 0;
   height: 1300px;


}

.tab [type=radio]:checked ~ label {
   background: orange;
   z-index: 2;
}

.tab [type=radio]:checked ~ label ~ .content {
   z-index: 1;
}

/* 페이지 위치잡기 */
.adminpage_box {
   padding-top: 1%;
    /* width: 100%; */
    height: 1375px;
}

.content table {
   margin: 30px auto;
   width: 90%;
   height: 45%;
   border-collapse: collapse;
   border-top: 3px solid #ffa500;
}

.member_table {
   border: 1px solid #ccc;
}

.member_tr> th, .member_tr> td {
   border-right: 1px solid #ccc;
}

.member_tr> td {
   text-align: center;
   border-top:1px solid #ccc;
}

.member_tr> td:HOVER{
   cursor: pointer;
}

.search_btn {
   margin-bottom: 1%;
    margin-top: 1%;
    height: 34px;
    overflow: hidden;
}

.content_title {
  float: left;
    margin-left: 10%;
}

thead> tr{
   height: 35px;

    background: #e4e0e0
}

.search_btn> input{
   width: 220px;
   height: 25px;
   margin-top: 3px;
}

.search_btn> button{
   width: 50px;
   height: 30px;
}

/* 페이지 버튼 */
.page_btn {
   margin-top: 2%;
}

.page_btn ul{
   width: 21%;
    margin: 0 auto;
    margin-left: 43%;
}

.page_btn li{
   list-style: none;
}

.page_btn input {
   clear: none;
   border: 0px none;
   float: none;
   background-color: transparent;
   width: 30px;
   height: 25px;
   font-size: 15pt;
}

.page_btn input:HOVER {
   cursor: pointer;
}
 tbody tr:nth-child(2n) {
    background-color:  #e4e0e0
  }
  tbody tr:nth-child(2n+1) {
    background-color: #fde6be73
  }




/* test */
section> ul li {
   list-style: none;
   height: 315px;
}

/* 링크색 변경 */
a:link {
   color: black;
   text-decoration: none;
}

a:visited {
   color: black;
   text-decoration: none;
}

/* 첫번쨰 div */
#mypageback {
   min-width: 1180px;
   margin-top: 1%;
}

#mypage {
   width: 1400px;
   margin: 0 auto;
   letter-spacing: -1px;
   height: 100%;
}

/* 리스트 목록 */

.list_body{
   margin-top: -6%;
}

.list_img {
   float: left;
   width: 240px;
   height: 240px;
   margin-top: 5%;
}

.info_a {
   margin-top:2%;
   margin-left: 35%;
   font-size: 13pt;
}

.store_info_title {
   font-size: 13pt;
    margin-top: 2%;
    width: 60%;
    margin-left: 9%;
    float: left;
}

.store_info {
   width: 60%;
    margin-left: 20%;
}

.store_info_title> a{
   margin-left: 50%;
}

.store_info_title> p{
   margin-bottom: 0%;
}

.info_name {
   float: left;
}

.info_a {
   margin-left: 70%;
    width: 50%;
    margin-bottom: 0%;
    margin-top: 0%;
}

.list_body>li {
    width: 100%;
    margin-bottom: 4%;
}


/* 탭 css */

.list_body label {
   display: inline-block;
   margin: 0 0 -1px;
   padding: 15px 25px;
   font-weight: 600;
   text-align: center;
   color: #bbb;
   border: 1px solid transparent;
}

.list_body label:hover {
   color: orange;
   cursor: pointer;
}

.list_body>input {
   display: none;
}

.list_body input:checked + label {
    color: #555;
    border: 1px solid #ddd;
    border-top: 2px solid orange;
    border-bottom: 1px solid #ffffff;
    border-right: 1px solid #ddd;
    margin-top: 5%;
}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4,
#tab5:checked ~ #content5 {
    display: block;
}
            
section {
    display: none;
}

.list_body [type=radio]:checked ~ label {
   background: white;
   z-index: 0;
}

#section_table {
   margin: 30px auto;
    width: 100%;
    height: 500px;
    border-collapse: collapse;
    border-top: 3px solid #ffa500;
}

#section_table2 {
   margin: 30px auto;
    width: 100%;
    height: 500px;
    border-collapse: collapse;
    border-top: 3px solid #ffa500;
}

#section_table3 {
   margin: 30px auto;
    width: 100%;
    height: 500px;
    border-collapse: collapse;
    border-top: 3px solid #ffa500;
}

#section_table4 {
   margin: 30px auto;
    width: 100%;
    height: 500px;
    border-collapse: collapse;
    border-top: 3px solid #ffa500;
}

#section_table5 {
   margin: 30px auto;
    width: 100%;
    height: 500px;
    border-collapse: collapse;
    border-top: 3px solid #ffa500;
}

/* 검색어필드 버튼 크기 */
.search> input {
    width: 220px;
    height: 25px;
    margin-top: 3px;
}

.search> button {
    width: 50px;
    height: 30px;
}
.search {
    float: right;
    margin-right: 10%;
}






</style>

<!-- 클릭시 색변경 -->
<script>
   var orgBColor = '#e4e0e0';
   var orgCColor = '#fde6be73';
   var orgTColor = '#000000';
   function HighLightTR(target, backColor, textColor) {
      var tbody = target.parentNode;
      var trs = tbody.getElementsByTagName('tr');
      for (var i = 0; i < trs.length; i++) {
         if (trs[i] != target && i%2==0) {
            trs[i].style.backgroundColor = orgCColor;
            trs[i].style.color = orgTColor;
         } else if(trs[i] != target && i%2!=0){
            trs[i].style.backgroundColor = orgBColor;
             trs[i].style.color = orgTColor; 
         } else {
            trs[i].style.backgroundColor = backColor;
            trs[i].style.color = textColor;
         }
      } // endfor i
   }
</script>


</head>
<body>
   <div class="adminpage_box">
      <div class="adminpage_title">
         <h1>Adminpage</h1>
      </div>
   
      <div id="page-wrap">
         <div class="tabs">
            <div class="tab">
               <input type="radio" id="tab-1" name="tab-group-1" checked> <label
                  for="tab-1">일반회원</label>
               <div class="content">
                  <div class="search_btn">
                  <h2 class="content_title">일반 회원관리</h2>
                  
                  <div class="search" >
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                 </div>
                 
               </div>
               
                <table class="member_table">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">ID</th>
                        <th style="width: 8%;">닉네임</th>
                        <th style="width: 8%;">이름</th>
                        <th style="width: 7%;">상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="general" items="${generalUser.content}">
                         <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');
                            window.open('generalUserInfo?no=${general.generalId}','window_name','width=850,height=900,location=no,status=no,scrollbars=yes')">
                             <td>${general.account}</td>
                             <td><a href="#" >${general.nickname}</a></td>
                             <td><a href="#">${general.name}</a></td>
                             <td>${general.status}</td>
                         </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                         <c:forEach var="page" begin="1" end="${generalUser.totalPages}">
                             <input onclick="${generalUser.nextPageable()}" type="button" value="${page}">
                         </c:forEach>
                     <input type="button" value="&gt;">
                     </li>
                     </ul>
                  </div>
               </div>
            </div>
            
            
            
            <div class="tab">
               <input type="radio" id="tab-2" name="tab-group-1"> <label
                  for="tab-2">업주회원</label>
               <div class="content">
                  <div class="search_btn">
                  <h2 class="content_title">업주 회원관리</h2>
                     <div class="search"  >
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                  </div>
               </div>
               
                 <table class="member_table">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">ID</th>
                        <th style="width: 8%;">이름</th>
                        <th style="width: 10%;">가입일</th>
                        <th style="width: 7%;">상태</th>
                        </tr>
                     </thead>
                     <tbody>

                     <c:forEach var="owner" items="${ownerUser.content}">
                         <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');
                            window.open('ownerUserInfo?no=${owner.ownerId}','window_name','width=850,height=900,location=no,status=no,scrollbars=yes')">
                             <td>${owner.account}</td>
                             <td><a href="#" >${owner.name}</a></td>
                             <td><a href="#" > <tf:formatDateTime value="${owner.registeredAt}" pattern="yyyy.MM.dd"/></a></td>
                             <td>${owner.status}</td>
                         </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                         <c:forEach var="page" begin="1" end="${ownerUser.totalPages}">
                             <input onclick="${ownerUser.nextPageable()}" type="button" value="${page}">
                         </c:forEach>
                     <input type="button" value="&gt;">
                     </li>
                     </ul>
                  </div>
               </div>
            </div>
            
            
            
            <div class="tab">
               <input type="radio" id="tab-3" name="tab-group-1"> <label
                  for="tab-3">가게관리</label>
               <div class="content">
                  <div id="mypageback">
      <!-- mypage start -->
      <div id="mypage" class="mypagebox">
         <div class="store_list">
            <div class="list_body">
            <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
               <label for="tab1">숙소관리</label>

              <input id="tab2" type="radio" name="tabs">
               <label for="tab2">맛집관리</label>

               <input id="tab3" type="radio" name="tabs">
             <label for="tab3">카페관리</label>

              <input id="tab4" type="radio" name="tabs">
              <label for="tab4">명소관리</label>
              
              <input id="tab5" type="radio" name="tabs">
              <label for="tab5">액티비티관리</label>
              
              
          <section id="content1">



  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {

      var data = google.visualization.arrayToDataTable([
        ["Element", "개수", { role: "style" } ],
        ["강남구", 15, "#FF0000"],
        ["강동구", 10, "#00FF00"],
        ["강서구", 19, "#0000FF"],
        ["강북구", 17, "color: #FFFF00"],
        ["관악구", 8, "#00FFFF"],
        ["광진구", 10, "FF00FF"],
        ["구로구", 19, "C0C0C0"],
        ["금천구", 13, "color: #8A2BE2"],
        ["노원구", 8, "#A52A2A"],
        ["동대문구", 10, "DEB887"],
        ["도봉구", 19, "7FFF00"],
        ["동작구", 5, "color: #FF7F50"],
        ["마포구", 8, "#6495ED"],
        ["서대문구", 11, "00008B"],
        ["성동구", 15, "006400"],
        ["성북구", 14, "color: #BDB76B"],
        ["서초구", 9, "#8B008B"],
        ["송파구", 10, "FF8C00"],
        ["영등포구", 12, "8FBC8F"],
        ["용산구", 11, "color: #2F4F4F"],
        ["양천구", 7, "#00CED1"],
        ["은평구", 19, "9400D3"],
        ["종로구", 10, "FF1493"],
        ["중구", 20, "color: #00BFFF"],
        ["중랑구", 13, "color: #1E90FF"]
      ]);

      var view = new google.visualization.DataView(data);
      /* 바차트에 수치 표시하기 */
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);  */

      var options = {
        title: "DYS store",
        width: 1200,
        height: 500,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>
          <div id="columnchart_values" style="width: 1200px; height: 500px; margin: 0 auto;"></div>
          
          
             <div class="search_btn">
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                   </div>
               <table class="member_table" id="section_table">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">등급</th>
                        <th style="width: 8%;">상호</th>
                        <th style="width: 11%;">전화</th>
                        <th style="width: 24%;">주소</th>
                        <th style="width: 23%;">링크</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="hotel" items="${hotelList.content}">
                        <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                        <td>${hotel.grade}성급</td>
                        <td>${hotel.name}</td>
                        <td>${hotel.callNumber}</td>
                        <td>${hotel.address}</td>
                        <td>${hotel.rink}</td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>

              <div class="page_btn">
                  <ul>
                      <li>
                          <input type="button" value="&lt;">
                          <input type="button" value="1">
                          <input type="button" value="2">
                          <input type="button" value="3">
                          <input type="button" value="4">
                          <input type="button" value="5">
                          <input type="button" value="&gt;">
                      </li>

                  </ul>
              </div>
            </section>
            
            
            <section id="content2">
            <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data2 = google.visualization.arrayToDataTable([
        ["Element2", "개수", { role: "style" } ],
        ["강남구", 15, "#FF0000"],
        ["강동구", 10, "#00FF00"],
        ["강서구", 19, "#0000FF"],
        ["강북구", 17, "color: #FFFF00"],
        ["관악구", 8, "#00FFFF"],
        ["광진구", 10, "FF00FF"],
        ["구로구", 19, "C0C0C0"],
        ["금천구", 13, "color: #8A2BE2"],
        ["노원구", 8, "#A52A2A"],
        ["동대문구", 10, "DEB887"],
        ["도봉구", 19, "7FFF00"],
        ["동작구", 5, "color: #FF7F50"],
        ["마포구", 8, "#6495ED"],
        ["서대문구", 11, "00008B"],
        ["성동구", 15, "006400"],
        ["성북구", 14, "color: #BDB76B"],
        ["서초구", 9, "#8B008B"],
        ["송파구", 10, "FF8C00"],
        ["영등포구", 12, "8FBC8F"],
        ["용산구", 11, "color: #2F4F4F"],
        ["양천구", 7, "#00CED1"],
        ["은평구", 19, "9400D3"],
        ["종로구", 1, "FF1493"],
        ["중구", 2, "color: #00BFFF"],
        ["중랑구", 3, "color: #1E90FF"]
      ]);

      var view2 = new google.visualization.DataView(data2);
      /* 바차트에 수치 표시하기 */
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);  */

      var options2 = {
        title: "DYS store",
        width: 1200,
        height: 500,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart2 = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
      chart2.draw(view2, options2);
  }
  </script>
          <div id="columnchart_values2" style="width: 1200px; height: 500px; margin: 0 auto;"></div>
            
            
            
            <div class="search_btn">
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                   </div>
                    <table class="member_table" id="section_table2">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">종류</th>
                        <th style="width: 8%;">상호</th>
                        <th style="width: 11%;">전화</th>
                        <th style="width: 24%;">주소</th>
                        <th style="width: 23%;">링크</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="food" items="${foodList.content}">
                        <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                              <td>${food.foodKind}</td>
                              <td>${food.name}</td>
                              <td>${food.callNumber}</td>
                              <td>${food.address}</td>
                              <td>${food.rink}</td>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                <div class="page_btn">
                    <ul>
                        <li>
                            <input type="button" value="&lt;">
                            <input type="button" value="1">
                            <input type="button" value="2">
                            <input type="button" value="3">
                            <input type="button" value="4">
                            <input type="button" value="5">
                            <input type="button" value="&gt;">
                        </li>

                    </ul>
                </div>
                  
               </section>
               
               
               
               <section id="content3">
               <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data3 = google.visualization.arrayToDataTable([
        ["Element", "개수", { role: "style" } ],
        ["강남구", 15, "#FF0000"],
        ["강동구", 10, "#00FF00"],
        ["강서구", 19, "#0000FF"],
        ["강북구", 17, "color: #FFFF00"],
        ["관악구", 8, "#00FFFF"],
        ["광진구", 10, "FF00FF"],
        ["구로구", 1, "C0C0C0"],
        ["금천구", 2, "color: #8A2BE2"],
        ["노원구", 3, "#A52A2A"],
        ["동대문구", 10, "DEB887"],
        ["도봉구", 19, "7FFF00"],
        ["동작구", 5, "color: #FF7F50"],
        ["마포구", 8, "#6495ED"],
        ["서대문구", 11, "00008B"],
        ["성동구", 15, "006400"],
        ["성북구", 14, "color: #BDB76B"],
        ["서초구", 9, "#8B008B"],
        ["송파구", 10, "FF8C00"],
        ["영등포구", 12, "8FBC8F"],
        ["용산구", 11, "color: #2F4F4F"],
        ["양천구", 7, "#00CED1"],
        ["은평구", 19, "9400D3"],
        ["종로구", 10, "FF1493"],
        ["중구", 20, "color: #00BFFF"],
        ["중랑구", 13, "color: #1E90FF"]
      ]);

      var view3 = new google.visualization.DataView(data3);
      /* 바차트에 수치 표시하기 */
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);  */

      var options3 = {
        title: "DYS store",
        width: 1200,
        height: 500,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart3 = new google.visualization.ColumnChart(document.getElementById("columnchart_values3"));
      chart3.draw(view3, options3);
  }
  </script>
          <div id="columnchart_values3" style="width: 1200px; height: 500px; margin: 0 auto;"></div>
               
               
               
               <div class="search_btn">
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                   </div>
                    <table class="member_table" id="section_table3">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">종류</th>
                        <th style="width: 8%;">상호</th>
                        <th style="width: 11%;">전화</th>
                        <th style="width: 24%;">주소</th>
                        <th style="width: 23%;">링크</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="cafe" items="${cafeList.content}">
                         <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                             <td>${cafe.cafeTheme}</td>
                             <td>${cafe.name}</td>
                             <td>${cafe.callNumber}</td>
                             <td>${cafe.address}</td>
                             <td>${cafe.rink}</td>
                         </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                     <input type="button" value="1">
                     <input type="button" value="2">
                     <input type="button" value="3">
                     <input type="button" value="4">
                     <input type="button" value="5">
                     <input type="button" value="&gt;">
                     </li>
                     
                     </ul>
                  </div>
               </section>
               
               <section id="content4">
               <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data4 = google.visualization.arrayToDataTable([
        ["Element", "개수", { role: "style" } ],
        ["강남구", 15, "#FF0000"],
        ["강동구", 10, "#00FF00"],
        ["강서구", 19, "#0000FF"],
        ["강북구", 1, "color: #FFFF00"],
        ["관악구", 2, "#00FFFF"],
        ["광진구", 3, "FF00FF"],
        ["구로구", 19, "C0C0C0"],
        ["금천구", 13, "color: #8A2BE2"],
        ["노원구", 8, "#A52A2A"],
        ["동대문구", 10, "DEB887"],
        ["도봉구", 19, "7FFF00"],
        ["동작구", 5, "color: #FF7F50"],
        ["마포구", 8, "#6495ED"],
        ["서대문구", 11, "00008B"],
        ["성동구", 15, "006400"],
        ["성북구", 14, "color: #BDB76B"],
        ["서초구", 9, "#8B008B"],
        ["송파구", 10, "FF8C00"],
        ["영등포구", 12, "8FBC8F"],
        ["용산구", 11, "color: #2F4F4F"],
        ["양천구", 7, "#00CED1"],
        ["은평구", 19, "9400D3"],
        ["종로구", 10, "FF1493"],
        ["중구", 20, "color: #00BFFF"],
        ["중랑구", 13, "color: #1E90FF"]
      ]);

      var view4 = new google.visualization.DataView(data4);
      /* 바차트에 수치 표시하기 */
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);  */

      var options4 = {
        title: "DYS store",
        width: 1200,
        height: 500,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart4 = new google.visualization.ColumnChart(document.getElementById("columnchart_values4"));
      chart4.draw(view4, options4);
  }
  </script>
          <div id="columnchart_values4" style="width: 1200px; height: 500px; margin: 0 auto;"></div>
               
               
               
               <div class="search_btn">
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                   </div>
                    <table class="member_table" id="section_table4">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">종류</th>
                        <th style="width: 8%;">상호</th>
                        <th style="width: 11%;">전화</th>
                        <th style="width: 24%;">주소</th>
                        <th style="width: 23%;">링크</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="attraction" items="${attraction.content}">
                         <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                             <td>${attraction.attractionType}</td>
                             <td>${attraction.name}</td>
                             <td>${attraction.callNumber}</td>
                             <td>${attraction.address}</td>
                             <td>${attraction.rink}</td>
                         </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                     <input type="button" value="1">
                     <input type="button" value="2">
                     <input type="button" value="3">
                     <input type="button" value="4">
                     <input type="button" value="5">
                     <input type="button" value="&gt;">
                     </li>
                     
                     </ul>
                  </div>
               </section>
               
               <section id="content5">
               <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data5 = google.visualization.arrayToDataTable([
        ["Element", "개수", { role: "style" } ],
        ["강남구", 1, "#FF0000"],
        ["강동구", 2, "#00FF00"],
        ["강서구", 3, "#0000FF"],
        ["강북구", 17, "color: #FFFF00"],
        ["관악구", 8, "#00FFFF"],
        ["광진구", 10, "FF00FF"],
        ["구로구", 19, "C0C0C0"],
        ["금천구", 13, "color: #8A2BE2"],
        ["노원구", 8, "#A52A2A"],
        ["동대문구", 10, "DEB887"],
        ["도봉구", 19, "7FFF00"],
        ["동작구", 5, "color: #FF7F50"],
        ["마포구", 8, "#6495ED"],
        ["서대문구", 11, "00008B"],
        ["성동구", 15, "006400"],
        ["성북구", 14, "color: #BDB76B"],
        ["서초구", 9, "#8B008B"],
        ["송파구", 10, "FF8C00"],
        ["영등포구", 12, "8FBC8F"],
        ["용산구", 11, "color: #2F4F4F"],
        ["양천구", 7, "#00CED1"],
        ["은평구", 19, "9400D3"],
        ["종로구", 10, "FF1493"],
        ["중구", 20, "color: #00BFFF"],
        ["중랑구", 13, "color: #1E90FF"]
      ]);

      var view5 = new google.visualization.DataView(data5);
      /* 바차트에 수치 표시하기 */
      /* view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);  */

      var options5 = {
        title: "DYS store",
        width: 1200,
        height: 500,
        bar: {groupWidth: "70%"},
        legend: { position: "none" },
      };
      var chart5 = new google.visualization.ColumnChart(document.getElementById("columnchart_values5"));
      chart5.draw(view5, options5);
  }
  </script>
          <div id="columnchart_values5" style="width: 1200px; height: 500px; margin: 0 auto;"></div>
               
               
               
               <div class="search_btn">
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
                   </div>
                    <table class="member_table" id="section_table5">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">종류</th>
                        <th style="width: 8%;">상호</th>
                        <th style="width: 11%;">전화</th>
                        <th style="width: 24%;">주소</th>
                        <th style="width: 23%;">링크</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="activity" items="${activity.content}">
                         <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                             <td>${activity.activityType}</td>
                             <td>${activity.name}</td>
                             <td>${activity.callNumber}</td>
                             <td>${activity.address}</td>
                             <td>${activity.rink}</td>
                         </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                     <input type="button" value="1">
                     <input type="button" value="2">
                     <input type="button" value="3">
                     <input type="button" value="4">
                     <input type="button" value="5">
                     <input type="button" value="&gt;">
                     </li>
                     
                     </ul>
                  </div>
               </section>
               
            
            </div>
         </div>
      </div>
   </div>
               </div>
            </div>
            
            
            
            
            
            
            
            <div class="tab">
               <input type="radio" id="tab-4" name="tab-group-1"> <label
                  for="tab-4">공지사항</label>
               <div class="content">
                  <div class="search_btn">
                  <h2 class="content_title">공지사항 관리</h2>
                     <div class="search"  >
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="등록" onclick="window.open('adminNoticeWriting','window_name','width=750,height=750,location=no,status=no,scrollbars=yes');">등록</button>
              </div>
               </div>
               
                 <table class="member_table">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">번호</th>
                        <th style="width: 12%;">제목</th>
                        <th style="width: 24%;">내용</th>
                        <th style="width: 10%;">등록일</th>
                        <th style="width: 10%;">수정일</th>
                        </tr>
                     </thead>
                     <tbody>
                     <c:forEach var="n" items="${notice.content}">
                       <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                        <td><a>${n.noticeNo}</a></td>
                        <td><a href="#" onclick="window.open('adminNoticeDetail?no=${n.noticeNo}','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');">
                                ${n.title}</a></td>
                        <td><a href="#" onclick="window.open('adminNoticeDetail','window_name','width=1000,height=900,location=no,status=no,scrollbars=yes');">
                                ${fn:substring(n.content, 0, 20)}...</a></td>
                        <td><a><tf:formatDateTime value="${n.registeredAt}" pattern="yyyy.MM.dd"/></a></td>
                        <td><a><tf:formatDateTime value="${n.updatedAt}" pattern="yyyy.MM.dd"/></a></td>
                        </tr>
                     </c:forEach>
                     </tbody>
                  </table>
                  <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                     <input type="button" value="1">
                     <input type="button" value="2">
                     <input type="button" value="3">
                     <input type="button" value="4">
                     <input type="button" value="5">
                     <input type="button" value="&gt;">
                     </li>
                     
                     </ul>
                  </div>
               </div>
            </div>
            
            
            <div class="tab">
               <input type="radio" id="tab-5" name="tab-group-1"> <label
                  for="tab-5">문의사항</label>
               <div class="content">
                  <div class="search_btn">
                  <h2 class="content_title">문의사항</h2>
                     <div class="search"  >
                  <input type="text" value="검색어">
                  <button value="검색">검색</button>
                  <button value="삭제">삭제</button>
              </div>
              
               </div>
               
                 <table class="member_table">
                     <thead>
                        <tr class="member_tr">
                        <th style="width: 8%;">번호</th>
                        <th style="width: 8%;">작성자</th>
                        <th style="width: 12%;">제목</th>
                        <th style="width: 21%;">내용</th>
                        <th style="width: 10%;">등록일</th>
                        </tr>
                     </thead>
                     <tbody>

                         <c:forEach var="owner" items="${ownerOuest.content}">
                             <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                                 <td><a>O.${owner.ownerQuestionNo}</a></td>
                                 <td><a>${owner.ownerUser.name}</a></td>
                                 <td><a href="#" onclick="window.open('adminQuestionDetail?no=${owner.ownerQuestionNo}&type=owner','window_name','width=1000,height=1000,location=no,status=no,scrollbars=yes');">
                                         ${owner.title}
                                 </a></td>
                                 <td><a href="#" onclick="window.open('adminInquiryDetail','window_name','width=1000,height=1000,location=no,status=no,scrollbars=yes');">
                                         ${fn:substring(owner.content.toString(), 0, 20)}...
                                 </a></td>
                                 <td><a><tf:formatDateTime value="${owner.registeredAt}" pattern="yyyy.MM.dd"/></a></td>
                             </tr>
                         </c:forEach>

                         <c:forEach var="general" items="${generalOuest.content}">
                             <tr class="member_tr" onClick="HighLightTR(this, 'orange','cc3333');">
                                 <td><a>G.${general.generalQuestionNo}</a></td>
                                 <td><a>${general.generalUser.nickname}</a></td>
                                 <td><a href="#" onclick="window.open('adminQuestionDetail?no=${general.generalQuestionNo}&type=general','window_name','width=1000,height=1000,location=no,status=no,scrollbars=yes');">
                                         ${general.title}
                                 </a></td>
                                 <td><a href="#" onclick="window.open('adminInquiryDetail','window_name','width=1000,height=1000,location=no,status=no,scrollbars=yes');">
                                         ${fn:substring(general.content.toString(), 0, 20)}...
                                 </a></td>
                                 <td><a><tf:formatDateTime value="${general.registeredAt}" pattern="yyyy.MM.dd"/></a></td>
                             </tr>
                         </c:forEach>

                     </tbody>
                 </table>
                 <div class="page_btn">
                     <ul>
                     <li>
                     <input type="button" value="&lt;">
                     <input type="button" value="1">
                     <input type="button" value="2">
                     <input type="button" value="3">
                     <input type="button" value="4">
                     <input type="button" value="5">
                     <input type="button" value="&gt;">
                     </li>
                     
                     </ul>
                  </div>
                </div>
            </div>
          </div>
       </div>
    </div>
  </body>
</html>