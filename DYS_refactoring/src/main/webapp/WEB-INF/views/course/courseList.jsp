<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>course_ranking</title>

   <style>
      * {
         margin: 0;
         padding: 0;
      }

      .post_detail_top {
         height: 380px;
         width: 1800px;
         margin: 0 auto;
      }

      .post_detail_bok {
         padding-bottom: 100px;
         padding-top: 100px;
         text-align: center;
         width: 1800px;
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

      .contents {
         display: grid;
         width: 1000px;
         margin: 0 auto;
         padding: 0 20px 27px 20px;
      }

      .wrap_contView {
         position: relative;
         width: 100%;
         margin-top: 24px;
      }

      .box_leftType1 {
         float: left;
         width: 800px;
      }

      .total_check {
         position: relative;
         width: 800px;
         padding: 15px 0 13px;
         font-weight: 900;
         border-top: 1px solid #999;
      }

      .list_thumType {
         width: 800px;
      }

      dl, ul, ol, menu, li {
         list-style: none;
      }

      .btn_txt {
         position: absolute;
         top: 15px;
         right: 0;
         color: #999;
      }

      .total_check strong span {
         padding: 0 2px;
         color: orange;
      }

      .list_thumType>li.bdr_nor {
         border-top: 1px solid #e6e6e6;
      }

      .list_thumType>li .photo {
         position: absolute;
         left: 0;
         width: 140px;
         height: 94px;
      }

      .list_thumType>li .area_txt {
         min-height: 94px;
         padding-left: 160px;
         margin-bottom: 50px;
      }

      .list_thumType>li .area_txt .tit {
         margin-top: -5px;
         padding-bottom: 5px;
      }

      .list_thumType>li .area_txt .tit a {
         overflow: hidden;
         display: inline-block;
         width: 100%;
         font-weight: bold;
         font-size: 20px;
         color: #000;
         text-overflow: ellipsis;
         white-space: nowrap;
      }

      .list_thumType>li .area_txt p {
         font-size: 14px;
      }

      .list_thumType>li .area_txt .tag {
         overflow: hidden;
         width: 100%;
         padding-top: 5px;
         text-overflow: ellipsis;
         white-space: nowrap;
      }

      .list_thumType>li .area_txt .tag>span {
         padding-right: 2px;
         font-size: 14px;
      }

      .list_thumType>li .area_txt .ar_tag {
         padding-top: 15px;
      }

      .list_thumType>li .area_txt .ar_tag>span {
         display: inline-block;
         margin: 0 10px 10px 0;
         padding: 2px 10px;
         background: orange;
         color: #fff;
         border-radius: 11px;
      }

      .list_thumType>li {
         position: relative;
         padding-top: 20px;
         border-bottom: 1px solid #e6e6e6;
      }

      .page_box {
         padding-top: 30px;
         text-align: center;
      }

      .box_rightType1 {
         margin-left: 950px;
         width: 300px;
         height: 500px;
         position: fixed;
      }

      .area_tagList {
         width: 100%;
         height: 79%;
         padding: 36px 0 20px;
         background-color: #f7f7f7;
      }

      .area_tagList .tag_list {
         margin: 0 30px;
         padding: 12px 0;
         border-top: 1px solid #e6e6e6;
      }

      .area_tagList .tag_list li {
         position: relative;
         float: left;
         margin: 6px 5px 0 0;
      }

      div {
         box-sizing: border-box;
      }

      .area_tagList .tag_list li button.btn_all_active {
         background-color: orange;
         color: #fff;
      }

      .area_tagList .tag_list li button {
         padding: 5px 10px;
         border-top-left-radius: 35px;
         border-top-right-radius: 35px;
         border-bottom-left-radius: 35px;
         border-bottom-right-radius: 35px;
      }

      button {
         border: 0 none;
         background-color: transparent;
      }

      .tag_list li button span {
         font-size: 16px;
      }

      .rank, .nickname {
         font-size: 20px;
         line-height: 1px;
      }

      .nickname {
         margin-left: 15px;
         margin-bottom: 10px;
      }

      img {
         width: 150px;
         height: 140px;
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

      .page a span, .page>span span {
         position: absolute;
         width: 1px;
         height: 1px !important;
         padding: 0;
         margin: -1px;
         border: none;
         clip: rect(0, 0, 0, 0);
         overflow: hidden;
      }

      .btn_page_first {
         margin-right: 5px;
         width: 30px;
         height: 30px;
         background: url(//resources/image/first.PNG) no-repeat 0 0;
      }

      .btn_page_prev {
         margin-right: 5px;
         width: 30px;
         height: 30px;
         background: url(/resources/image/prev.PNG) no-repeat 0 0;
      }

      .btn_page_next {
         margin-right: 5px;
         width: 30px;
         height: 30px;
         background: url(/resources/image/next.PNG) no-repeat 0 0;
      }

      .btn_page_next {
         margin-right: 5px;
         width: 30px;
         height: 30px;
         background: url(//resources/image/next.PNG) no-repeat 0 0;
      }

      .btn_page_last {
         margin-right: 5px;
         width: 30px;
         height: 30px;
         background: url(//resources/image/last.PNG) no-repeat 0 0;
      }

      a {
         color: black;
         text-decoration: none;
      }

      .share {
         width: 30px;
         height: 30px;
         background-image: url(/resources/image/courseranking/share.png);
         background-size: cover;
         background-color: white;
         border: 0;
         margin-right: 10px;
      }

      .save {
         width: 30px;
         height: 33px;
         background-image: url(/resources/image/courseranking/save1.png);
         background-size: cover;
         background-color: white;
         border: 0;
         margin-right: 10px;
      }

      .likebtn {
         width: 30px;
         height: 30px;
         background-image: url(/resources/image/courseranking/likefull.png);
         background-size: cover;
         background-color: white;
         border: 0;
         margin-right: 10px;
      }
      .likebtnfull{
         width:30px;
         height:30px;
         background-image: url(/resources/image/courseranking/likefull.png);
         background-size: cover;
         background-color: white;
         border: 0;
         margin-right: 10px;
      }

      .look {
         width: 30px;
         height: 30px;
         background-color: white;
         border: 0;
         margin-right: 10px;
         margin-top: 2px;
      }
   </style>
</head>
<body>

<%@ include file="../include/header.jsp"%>

<div class="post_detail_top">


   <div class="post_detail_bok">

      <div class="post_tit overlay">코 스 보 기</div>
      <div class="post_desc overlay">다른 유저가 계획한 서울 여행 코스입니다.</div>
   </div>

</div>

<div class="contents">

   <div class="tit_cont">

      <h2 class="tag">전체</h2>

   </div>


   <div class="wrap_contView clfix">

      <!-- 썸네일 리스트 -->
      <div class="box_leftType1">
         <div class="total_check">
            <strong>총<span>54</span>건
            </strong>
         </div>
         <ul class="list_thumType flnon">

            <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking1">1</span><span class="nickname">규상어</span>
               </div>
               <a href="courseRankingDetail"> <img src="/resources/image/courseranking/courseRank1.png"
                                    alt="플렉스 서울투어">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">2423</h3>
                  <input id="like1" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1950</h3>
                  <input id="save1" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1810</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share1" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="courseRankingDetail">Flex 서울투어</a>
                  </div>

                  <p class="tag">
                     총거리 <span>78</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>마장동 한우촌</span> <span>도선동 비전호텔</span><span>성수동 카페성수</span>
                     <span>성수동 뚝섬미술관</span> <span>행당동 미음치읓VR</span>
                  </p>
               </div></li>

         <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking2">2</span><span class="nickname">바깡용쓰</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank2.png"
                                    alt="서울의 힐링코스">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">2201</h3>
                  <input id="like2" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1842</h3>
                  <input id="save2" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1725</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share2" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">서울의 힐링코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>24</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>마곡동 스즈란테이</span> <span>마곡동 김정래셰프의중화요리</span> <span>마곡동 호텔 루체브릿지</span>
                     <span>마곡동 미스터힐링</span> <span>마곡동 파크볼링장</span>
                  </p>
               </div></li>
               
               
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking3">3</span><span class="nickname">동티모르</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank3.png"
                                    alt="맛있는 녀석들">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1910</h3>
                  <input id="like3" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1765</h3>
                  <input id="save3" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1450</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share3" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">맛있는 녀석들 코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>32</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>방배동 올리브에비뉴</span> <span>잠원동 프로간장게장</span> <span>서초동 서관면옥</span>
                     <span>반포동 도셰프</span> <span>서초동 베트남이랑</span>
                  </p>
               </div></li>
               
               
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking4">4</span><span class="nickname">준수싫어요</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank4.png"
                                    alt="마셔라 부어라 코스">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1750</h3>
                  <input id="like4" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1653</h3>
                  <input id="save4" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1332</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share4" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">마셔라~ 부어라~ 코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>12</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>신사동 한잔의추억</span> <span>대치동 뽕나무쟁이</span> <span>논현동 임피리얼펠리스호텔</span>
                     <span>삼성동 젠제로</span> <span>압구정동 리버시티수상스키장</span>
                  </p>
               </div></li>
               
               
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking5">5</span><span class="nickname">시츄</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank5.png"
                                    alt="시티투어 코스">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1320</h3>
                  <input id="like5" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1587</h3>
                  <input id="save5" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1302</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share5" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">시티투어 코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>71</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>사당동 카라쉬관광호텔</span> <span>사당동 카페브르브르</span> <span>사당동 만화카페휴</span>
                     <span>사당동 낙성곱창</span> <span>노량진동 혼스시</span>
                  </p>
               </div></li>
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking6">6</span><span class="nickname">리틀케이</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank6.png"
                                    alt="서울은 처음이에요">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1125</h3>
                  <input id="like6" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1462</h3>
                  <input id="save6" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1200</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share6" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">서울은 처음이에요</a>
                  </div>

                  <p class="tag">
                     총거리 <span>83</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>암사동 광나루한강공원</span> <span>상일동 강동반상</span> <span>천호동 풀팬</span>
                     <span>천호동 레츠팟</span> <span>길동 아르고호텔</span>
                  </p>
               </div></li>
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px; width: 200px">
                  <span class="rank" id="ranking7">7</span><span class="nickname">혼난단마리에영</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank7.png"
                                    alt="서울 구석구석 코스">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1100</h3>
                  <input id="like7" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1156</h3>
                  <input id="save7" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1008</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share7" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">서울 구석구석 코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>52</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>이태원동 라이너스바베큐</span> <span>한남동 바다식당</span> <span>한남동 그랜드 하얏트</span>
                     <span>용문동 함께늘봄</span> <span>한남동 가나아트 한남</span>
                  </p>
               </div></li>
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px; width: 200px;">
                  <span class="rank" id="ranking8">8</span><span class="nickname">전오래살꺼에여</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank8.png"
                                    alt="서울 맛집투어 코스">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1050</h3>
                  <input id="like8" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">1056</h3>
                  <input id="save8" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">985</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share8" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">서울 맛집투어 코스</a>
                  </div>

                  <p class="tag">
                     총거리 <span>33</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>여의도동 청수우동 메밀냉면</span> <span>양평동 또순이네</span> <span>영등포동 송죽장</span>
                     <span>여의도동 글래드 여의도</span>
                  </p>
               </div></li>
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking9">9</span><span class="nickname">상근이</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank9.png"
                                    alt="가족과 함께하는 서울나들이">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">987</h3>
                  <input id="like9" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">958</h3>
                  <input id="save9" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">867</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share9" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">가족과 함께하는 서울나들이</a>
                  </div>

                  <p class="tag">
                     총거리 <span>64</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>여의도동 콘래드 서울호텔</span> <span>성수동 성수족발</span> <span>성수동 헬로우뮤지움</span>
                     <span>성수동 대성갈비</span> <span>성수동 소소하게</span>
                  </p>
               </div></li>
               <li class="bdr_nor"><div class="photo">
               <div style="margin-bottom: 20px;">
                  <span class="rank" id="ranking10">10</span><span class="nickname">오레오</span>
               </div>
               <a href="javascript:"> <img src="/resources/image/courseranking/courseRank10.png"
                                    alt="나혼자 배낭여행">
               </a>
            </div>
               <div class="area_txt">

                  <h3 class="likecount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">856</h3>
                  <input id="like10" class="likebtn" type="button" style="float: right;">
                  <h3 class="count"
                     style="float: right; margin-top: 5px; margin-right: 5px;">913</h3>
                  <input id="save10" class="save" type="button" style="float: right;">
                  <h3 class="lookcount"
                     style="float: right; margin-top: 5px; margin-right: 5px;">821</h3>
                  <input class="look" type="image" src="/resources/image/courseranking/look.png"
                        style="float: right;"> <input id="share10" class="share"
                                              type="button" style="float: right; margin-bottom: 35px;">

                  <div class="tit">
                     <a href="javascript:">나혼자 배낭여행</a>
                  </div>

                  <p class="tag">
                     총거리 <span>32</span>Km
                  </p>
                  <p class="ar_tag">
                     <span>상계동 수락산</span> <span>공릉동 제일콩집</span> <span>중계동 등나무근린공원</span>
                     <span>공릉동 소문난멸치국수</span> <span>상계동 세피아호텔</span>
                  </p>
               </div></li>

         </ul>
         <!-- paging -->
         <div id="paging" class="page">
            <a href="#none" class="btn_page_first"><span>맨처음</span></a> <a
               href="#none" class="btn_page_prev"><span>이전</span></a> <a
               href="#none" class="on">1</a> <a href="#none">2</a> <a
               href="#none">3</a> <a href="#none">4</a> <a href="#none">5</a> <a
               href="#none">6</a> <a href="#none">7</a> <a href="#none">8</a> <a
               href="#none">9</a> <a href="#none">10</a>

            <a href="#none" class="btn_page_next"><span>다음</span></a>
            <a href="#none" class="btn_page_last"><span>마지막</span></a>
         </div>
         <!-- /paging -->

      </div>
      <!-- /썸네일 리스트 -->



      <div class="box_rightType1">

         <!-- 태그 리스트 -->
         <div class="area_tagList">

            <ul class="tag_list area_view_list js_multi" id="sigungulist"
               style="display: block;">
               <li ><button onclick="click(this.id)" id="All" type="button" class="btn_all_active">
                  <span>전체</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu1" type="button" class="btn">
                  <span>강남구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu2" type="button" class="btn">
                  <span>도봉구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu3" type="button" class="btn">
                  <span>동대문구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu4" type="button" class="btn">
                  <span>동작구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu5" type="button" class="btn">
                  <span>마포구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu6" type="button" class="btn">
                  <span>서대문구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu7" type="button" class="btn">
                  <span>서초구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu8" type="button" class="btn">
                  <span>성동구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu9" type="button" class="btn">
                  <span>성북구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu10" type="button" class="btn">
                  <span>송파구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu11" type="button" class="btn">
                  <span>양천구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu12" type="button" class="btn">
                  <span>강동구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu13" type="button" class="btn">
                  <span>영등포구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu14" type="button" class="btn">
                  <span>용산구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu15" type="button" class="btn">
                  <span>은평구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu16" type="button" class="btn">
                  <span>종로구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu17" type="button" class="btn">
                  <span>중구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu18" type="button" class="btn">
                  <span>중랑구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu19" type="button" class="btn">
                  <span>강북구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu20" type="button" class="btn">
                  <span>강서구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu21" type="button" class="btn">
                  <span>관악구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu22" type="button" class="btn">
                  <span>광진구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu23" type="button" class="btn">
                  <span>구로구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu25" type="button" class="btn">
                  <span>금천구</span>
               </button></li>
               <li ><button onclick="click(this.id)" id="gu26" type="button" class="btn">
                  <span>노원구</span>
               </button></li>
            </ul>
         </div>
         <!-- /태그 리스트 -->
      </div>
   </div>
</div>



<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.serializeObject.js"> </script>
<script type="text/javascript" >

   function click(id){

      if($("#"+id).hasClass("btn_all_active")) {
         $("#"+id).attr('class', "btn");
      } else {
         $("#"+id).attr('class', "btn_all_active");
      }
   }
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>