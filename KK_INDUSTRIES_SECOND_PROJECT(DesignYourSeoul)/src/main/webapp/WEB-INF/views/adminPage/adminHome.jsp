<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
    <link rel="icon" href="/resources/image/favicon_black.ico">
    <style type="text/css">
        @-ms-viewport {
            width: device-width
        }

        @-o-viewport {
            width: device-width
        }

        @viewport {
            width: device-width
        }
    </style>

    <title>Design Your Seoul</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/fullpage.css "/>
    <link rel="stylesheet" href="/resources/css/adminPage/adminHome.css">
</head>
<body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/adminPage/adminHome.js"></script>
<div class="adminpage_box">
    <div class="head_tit">
        <h1>Admin page</h1>
    </div>

    <div id="page-wrap">
        <div class="tabs">
            <div class="tab">
                <input type="radio" id="tab-1" name="tab-group-1" checked> <label
                    for="tab-1">일반회원</label>
                <div class="content firstTap">
                    <div class="search_btn">
                        <h2 class="content_title">일반 회원관리</h2>

                        <div class="search">
                            <input type="text" value="">
                            <button value="검색">검색</button>
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
                            <tr class="member_tr" onClick="detailInfo(${general.generalId})">
                                <td>${general.account}</td>
                                <td><a href="#">${general.nickname}</a></td>
                                <td><a href="#">${general.name}</a></td>
                                <td>${general.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>


            <div class="tab">
                <input type="radio" id="tab-2" name="tab-group-1"> <label
                    for="tab-2">업주회원</label>
                <div class="content">
                    <div class="search_btn">
                        <h2 class="content_title">업주 회원관리</h2>
                        <div class="search">
                            <input type="text" value="">
                            <button value="검색">검색</button>
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
                            <tr class="member_tr" onClick="detailInfoOwner(${owner.ownerId})">
                                <td>${owner.account}</td>
                                <td><a href="#">${owner.name}</a></td>
                                <td><a href="#"> <tf:formatDateTime value="${owner.registeredAt}"
                                                                    pattern="yyyy.MM.dd"/></a></td>
                                <td>${owner.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="tab">
                <input type="radio" id="tab-3" name="tab-group-1"> <label
                    for="tab-3">가게관리</label>
                <div class="content">
                    <div id="mypageback">`
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
                                        <div id="chart_area1" class="chart_area"></div>
                                        <div class="search_btn">
                                            <input type="text" value="">
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
                                                <tr class="member_tr">
                                                    <td>${hotel.grade}성급</td>
                                                    <td>${hotel.name}</td>
                                                    <td>${hotel.callNumber}</td>
                                                    <td>${hotel.address}</td>
                                                    <td>${hotel.link}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </section>


                                    <section id="content2">

                                        <div id="chart_area2" class="chart_area"></div>


                                        <div class="search_btn">
                                            <input type="text" value="">
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
                                                <tr class="member_tr">
                                                    <td>${food.foodKind}</td>
                                                    <td>${food.name}</td>
                                                    <td>${food.callNumber}</td>
                                                    <td>${food.address}</td>
                                                    <td>${food.link}</td>
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

                                        <div id="chart_area3" class="chart_area"></div>


                                        <div class="search_btn">
                                            <input type="text" value="">
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
                                                <tr class="member_tr">
                                                    <td>${cafe.cafeTheme}</td>
                                                    <td>${cafe.name}</td>
                                                    <td>${cafe.callNumber}</td>
                                                    <td>${cafe.address}</td>
                                                    <td>${cafe.link}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </section>

                                    <section id="content4">

                                        <div id="chart_area4" class="chart_area"></div>


                                        <div class="search_btn">
                                            <input type="text" value="">
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
                                                    <td>${attraction.link}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </section>

                                    <section id="content5">
                                        <div id="chart_area5" class="chart_area"></div>


                                        <div class="search_btn">
                                            <input type="text" value="">
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
                                                <tr class="member_tr">
                                                    <td>${activity.activityType}</td>
                                                    <td>${activity.name}</td>
                                                    <td>${activity.callNumber}</td>
                                                    <td>${activity.address}</td>
                                                    <td>${activity.link}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
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
                        <div class="search">
                            <input type="text" value="">
                            <button value="검색">검색</button>
                            <button value="등록" onclick="noticeWriting()">등록</button>
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
                        <c:forEach var="n" items="${notice}">
                            <tr class="member_tr" onclick="detailNotice(${n.noticeNo})">
                                <td>${n.noticeNo}</td>
                                <td>${n.title}</td>
                                <td>${fn:substring(n.content, 0, 20)}...</td>
                                <td><tf:formatDateTime value="${n.registeredAt}" pattern="yyyy.MM.dd"/></td>
                                <td><tf:formatDateTime value="${n.updatedAt}" pattern="yyyy.MM.dd"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="tab">
                <input type="radio" id="tab-5" name="tab-group-1"> <label
                    for="tab-5">문의사항</label>
                <div class="content">
                    <div class="search_btn">
                        <h2 class="content_title">문의사항</h2>
                        <div class="search">
                            <input type="text" value="">
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
                            <tr class="member_tr" onclick="detailQuestion(${owner.questionNo}, 'owner')">
                                <td><a>O.${owner.questionNo}</a></td>
                                <td><a>${owner.ownerUser.name}</a></td>
                                <td>${owner.title}</td>
                                <td>${fn:substring(owner.content.toString(), 0, 20)}...</td>
                                <td><tf:formatDateTime value="${owner.registeredAt}" pattern="yyyy.MM.dd"/></td>
                            </tr>
                        </c:forEach>

                        <c:forEach var="general" items="${generalOuest.content}">
                            <tr class="member_tr" onclick="detailQuestion(${general.questionNo}, 'general')">
                                <td>G.${general.questionNo}</td>
                                <td>${general.generalUser.nickname}</td>
                                <td>${general.title}</td>
                                <td>${fn:substring(general.content.toString(), 0, 20)}...</td>
                                <td><tf:formatDateTime value="${general.registeredAt}" pattern="yyyy.MM.dd"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>