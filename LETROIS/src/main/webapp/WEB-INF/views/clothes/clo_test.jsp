<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel=" shortcut icon" href="../image/favicon_black.ico" style="user-select: auto;">
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

    <title>LE TROIS</title>
    <link rel="stylesheet" href="/resources/css/clothesDetail_refactor.css">
</head>

<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/clothesDetail_refactor.js"></script>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/sidebar.jsp" %>

<section id="first_sec">
    <h2 class="sec_logo">Project #1 <br> No.1</h2>
</section>

<section id="second_sec" class="clothes_first_sec">
    <img class="picture_he picture_right" src="/resources/image/clothesPhoto/2019fw1/hoodie1.png" alt="jung">


    <div class="content clothes_content">
        <h1 class="clothes_name">Oriental printing Hoodie</h1>
        <h3 class="clothes_info_head"> PRODUCT INFORMATION</h3>

        <div class="clothes_info_wrap">
            <h3 class="clothes_info"> 제품명 : Oriental printing Hoodie</h3>
            <h3 class="clothes_info"> 시즌 / 성별 : 2019 FW / 공용</h3>
            <h3 class="clothes_info"> 소재 : 겉감 면 100% </h3>
            <h3 class="clothes_info"> 사이즈 : Free size</h3>

            <h2 class="clothes_price">PRICE : 58,000</h2>
            <h3 class="clothes_info"> 배송비 3000원(100,000원 이상 구매 시 무료)</h3>
            <input id="buy_clothes" type="button" onclick="not()" value="구매하기">
        </div>
    </div>


    <div class="clothes_content_2">
        <div class="detail_explain">제품 상세설명</div>

        <%--theme Logo--%>
        <div class="clothes_themeLogo">
            <div class="themeLogo_wrap"><img class="themeLogo" src="/resources/image/themeLogo/1st.jpg"></div>
            <div class="themeLogoIntro_wrap"><img class="themeLogoIntro"
                                                  src="/resources/image/themeLogo/themeIntro.png"></div>
        </div>

        <%--제품 상세정보--%>
        <div class="clothes_pattern">
            <div class="pattern_wrap" style="float: left"><img class="pattern pt_left"
                                                               src="/resources/image/clothesPhoto/2019fw1/clothes_front.jpg">
            </div>

            <div class="pattern_wrap" style="float: right"><img class="pattern pt_right"
                                                                src="/resources/image/clothesPhoto/2019fw1/clothes_back.jpg">
            </div>

            <div class="clothes_sizeChart_wrap"><img class="clothes_sizeChart"
                                                     src="/resources/image/clothesPhoto/2019fw1/sizeChart.png"></div>

            <div class="detail_info_wrap">
                <h3 class="clothes_detail_info"> Fabric : 3단 쭈리 덤블 텐타 가공 </h3>
                <h3 class="clothes_detail_info"> 겉감 : C 100% , 안감 : CVC(C 60 / P 40)</h3>
                <h3 class="clothes_detail_info ">세탁 시 주의사항</h3>
                <h3 class="clothes_detail_info washing_waring">찬물로 일반 중성화세제 세탁하는게 가장 좋은 방법이며,<br>
                    온수로 세탁하거나 비틀어 짜면 프린트물이 손상될 가능성이 있기에 주의 바랍니다.
                </h3>
                <h3 class="clothes_detail_info ">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash1.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash2.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash3.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash4.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash5.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash6.png">
                    <img class="wash_icon" src="/resources/image/clothesPhoto/2019fw1/washingIcon/wash7.png">
                </h3>

            </div>

            <div class="detail_more_info_wrap" style="display: none">
                <h2 class="clothes_more_detail_info_tit"> 1. 덤블워싱 </h2>
                <h3 class="clothes_more_detail_info"> 원단에 스프레이 기계로 수분을 공급한 후, </h3>
                <h3 class="clothes_more_detail_info"> 덤블 기기로 원단을 건조하는 작업으로 진행됩니다.</h3><br>
                <h3 class="clothes_more_detail_info ">덤블 워싱의 가장 큰 장점이자 특징은 </h3>
                <h3 class="clothes_more_detail_info">옷이 만들어지기 전 원단 단계에서 미리 열과 수분을 가해 줌으로써, <br>
                    옷이 완성된 이후에 가해지는 열과 수분에 대해서,<br>
                    일종의 내성을 갖게끔 해주는 효과(수축 방지)를 가져옵니다.<br>
                    뿐만 아니라 차분한 색감과 부드러운 촉감 또한 동시에 느끼실 수 있습니다.
                </h3>

                <br>
                <h2 class="clothes_more_detail_info_tit"> 2. 텐타가공 </h2>
                <h3 class="clothes_more_detail_info"> 단의 폭을 이미 원하거나 정해진 가고 폭으로 일정하게 고정시킨 후,  </h3>
                <h3 class="clothes_more_detail_info"> 140~200도의 고온으로 건조하여 원단의 형태를 단단하게 잡아주는 작업으로 진행됩니다.</h3><br>
                <h3 class="clothes_more_detail_info "> 텐타 가공의 가장 큰 장점이자 특징은 </h3>
                <h3 class="clothes_more_detail_info">옷이 이미 만들어지기 전 원단 자체를 단단하게 고정시켜 놓기 때문에, <br>
                    세탁 후 허리선이 돌아가는 등 옷이 뒤틀리는 현상을 방지할 수 있습니다.
                </h3>

                <br>
                <h2 class="clothes_more_detail_info_tit"> 3. 디지털 프린팅</h2>
                <h3 class="clothes_more_detail_info"> 필름위에 친환경 잉크로 프린트 한 후,<br>
                    아웃라인을 컷팅하여 열처리하여 프린팅하는 기법을 사용했습니다.</h3>
                <h3 class="clothes_more_detail_info"> 친환경 잉크는 광택이 나는 것이 특징입니다. </h3>
                <h3 class="clothes_more_detail_info "> 내구성이 뛰어나서 세탁해도 변형이 없거나 벗겨짐, 물빠짐 현상이 매우 적습니다.</h3>
            </div>
            <input class="pattern_more btn_more" onclick="foldInfo()" type="button" value="제품 상세 설명 보기">
        </div>


            <%--스냅사진--%>
            <div class="clothes_snapShot_wrap">
                <div class="snap_explain">제품 스냅사진</div>
                <div class="clothes_snapShot_box">

                    <div class="clothes_snapShot">
                        <img class="snapShot ss_left" src="/resources/image/clothesPhoto/2019fw1/snapShot/chan1.JPG">
                        <img class="snapShot ss_right" src="/resources/image/clothesPhoto/2019fw1/snapShot/gyeong1.JPG">
                    </div>

                    <div class="clothes_snapShot">
                        <img class="snapShot ss_left"
                             src="/resources/image/clothesPhoto/2019fw1/snapShotAnother/sister.JPG">
                        <img class="snapShot ss_right"
                             src="/resources/image/clothesPhoto/2019fw1/snapShotAnother/min.JPG">
                    </div>


                    <div class="clothes_snapShot ss_none">
                        <img class="snapShot ss_left" src="/resources/image/clothesPhoto/2019fw1/snapShot/ja1.JPG">
                        <img class="snapShot ss_right"
                             src="/resources/image/clothesPhoto/2019fw1/snapShotAnother/sang1.JPG">
                    </div>

                    <div class="clothes_snapShot ss_none">
                        <img class="snapShot ss_left" src="/resources/image/clothesPhoto/2019fw1/snapShot/chan2.JPG">
                        <img class="snapShot ss_right" src="/resources/image/clothesPhoto/2019fw1/snapShot/gyeong2.JPG">
                    </div>

                    <div class="clothes_snapShot ss_none">
                        <img class="snapShot ss_left"
                             src="/resources/image/clothesPhoto/2019fw1/snapShotAnother/kim.JPG">
                        <img class="snapShot ss_right"
                             src="/resources/image/clothesPhoto/2019fw1/snapShotAnother/sister2.JPG">
                    </div>

                    <div class="clothes_snapShot ss_none">
                        <img class="snapShot ss_left" src="/resources/image/clothesPhoto/2019fw1/snapShot/chan1.JPG">
                        <img class="snapShot ss_right" src="/resources/image/clothesPhoto/2019fw1/snapShot/gyeong1.JPG">
                    </div>

                    <input class="snapShot_more btn_more" onclick="foldSnap()" type="button" value="스냅사진 더보기">
                </div>
            </div>

            <%--디테일 컷 4장--%>
            <div class="clothes_detailCut_wrap">
                <div class="detailCut_explain">제품 디테일 컷</div>
                <div class="clothes_detailCut_box">
                    <div class="clothes_detailCut dc_left">
                        <img class="detailCut" src="/resources/image/clothesPhoto/2019fw1/detailPhoto/detail1.jpg">
                    </div>

                    <div class="clothes_detailCut dc_right"><img class="detailCut"
                                                                 src="/resources/image/clothesPhoto/2019fw1/detailPhoto/detail2.jpg">
                    </div>

                    <div class="clothes_detailCut dc_left"><img class="detailCut"
                                                                src="/resources/image/clothesPhoto/2019fw1/detailPhoto/detail3.jpg">
                    </div>

                    <div class="clothes_detailCut dc_right"><img class="detailCut"
                                                                 src="/resources/image/clothesPhoto/2019fw1/detailPhoto/detail4.jpg">
                    </div>

                    <div class="clothes_detailCut dc_right"><img class="detailCut"
                                                                 src="/resources/image/clothesPhoto/2019fw1/detailPhoto/detail5.jpg">
                    </div>
                </div>
            </div>

            <%--교환 및 반품 설명--%>
            <div class="exchange_return">
                <h4 class="exchange_return_tit">교환 및 반품</h4>
                <p class="exchange_return_content">-“LE TROIS” 은 자체제작 상품으로 1:1 오더베이스 상품을 제작합니다.</p>
                <p class="exchange_return_content">-제품 상품 특성상 상품에 이상이 있는 경우를 제외하고는 교환 및 반품이 되지 않습니다. <br>
                    -본 내용은 공정거래위원회 표준약관에 따릅니다.구매 시는 동의한 것으로 간주되어 청약철회(환불요청)가 제한됩니다.</p>
                <p class="exchange_return_content">-이미 발송된 주문 건은 변경 및 취소가 불가능 하므로, 신중한 주문 부탁드립니다.</p>
                <p class="exchange_return_content">-상품 반품 및 교환을 원하실 경우, 상품을 수령하신 뒤 24시간 이내에 게시판을 통해 의사를 남겨주신 경우에만
                    가능합니다.</p>
                <p class="exchange_return_content">-반품시 최초 포장된 상태 그대로의 제품을 보내주셔야 하며, 착용 흔적이 없어 냄새가 베이지 않은 경우에만
                    가능합니다.</p>
                <p class="exchange_return_content">-반품 접수는 직접 편하신 택배사를 이용하여 선불로 요금을 지불해주시면 감사하겠습니다.</p>
                <p class="exchange_return_content">-수령하신 날로부터 주말을 포함하여 7일 이내에 저희 쪽으로 제품이 도착해야만 교환 및 환불이 가능합니다.</p>
            </div>

        </div>
</section>
</body>

</html>




