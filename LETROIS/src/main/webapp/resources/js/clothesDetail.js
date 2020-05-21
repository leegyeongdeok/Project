
$(document).ready(function () {

    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    detailSectionManager();

    var filter = "win16|win32|win64|mac|macintel";
    if (navigator.platform) {
        if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
            mobileResizer();


        } else {

        }
    }

    clothesSizeManager();
    menuResizer();
});


$(window).resize(function () {
    fontSize = $(".content").css('font-size');
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    clothesSizeManager();
    detailSectionManager();
});

function imgResizer(wid) {
    var $picture_he = $(".picture_he");
    var $clothes_content = $(".clothes_content");

    if (wid <= 500) {
        $picture_he.css('width', '90vw');
        $clothes_content.css('width', 'auto');
    } else {
        $picture_he.css('width', '47vw');
        $clothes_content.css('width', '35vw');
    }
}

function clothesSizeManager() {
    var $picture_he = $(".picture_he");
    var clothes_content_width = $(".clothes_content").css('width');

    $picture_he.css('width', clothes_content_width);
}

function detailSectionManager() {
    var picture_he_height = $(".picture_he").css('height');
    var clothes_content_height = $(".clothes_content").css('height');
    var pic_he = parseInt(picture_he_height.replace('px', ''));
    var clo_he = parseInt(clothes_content_height.replace('px', ''));
    var content;

    if (pic_he >= clo_he) {
        content = picture_he_height;

    } else {
        content = clothes_content_height;
    }


    $('.clothes_content_2').css('margin-top', content);

}

function not() {
    alert('준비중입니다. \n 빠른 시일 내에 오픈하겠습니다.');
}

function wadiz() {
    location.href = 'https://www.wadiz.kr/web/wcomingsoon/rwd/63100';
}

function mobileResizer() {
    $('.wash_icon').css('width', '2.5em');
    $('.clothes_content_2').css('padding-top', '150px');
    $('.themeLogoIntro_wrap').css('margin-bottom', '100px');
    $('.themeLogo_wrap').css('margin-top', '50px');
    $('.themeLogo').css('width', '60vw');
    $('.themeLogoIntro').css('width', '90vw');
    $('.pattern').css('width', '90vw');
    $('.clothes_sizeChart').css('width', '80vw');
    $('.detail_info_wrap').css('margin', '0 0 50px 0');
    $('.detail_info_wrap').css('width', '90vw');
    $('.detailCut').css('width', '75vw');
    $('.exchange_return').css('font-size', '8px');

}

function foldSnap() {
    var fold_unfold = $('.snapShot_more').attr('value');
    if(fold_unfold == '스냅사진 더보기'){
        $('.ss_none').css('display', 'block');
        $('.snapShot_more').attr('value', '스냅사진 접기');
    }else {
        $('.ss_none').css('display', 'none');
        $('.snapShot_more').attr('value', '스냅사진 더보기');
    }

}

function foldInfo() {
    var fold_unfold = $('.pattern_more').attr('value');
    if(fold_unfold == '제품 상세 설명 보기'){
        $('.detail_more_info_wrap').css('display', 'block');
        $('.pattern_more').attr('value', '제품 상세 설명 닫기');
    }else {
        $('.detail_more_info_wrap').css('display', 'none');
        $('.pattern_more').attr('value', '제품 상세 설명 보기');
    }

}

function imgEventOpen() {
    if(type == 'mobile'){
        $('.themeLogo').animate({
            width: '70vw',
        }, 1000, 'swing');

        $('.themeLogoIntro').animate({
            width: '90vw',
        }, 1000, 'swing');
    }else{
        $('.themeLogo').animate({
            width: '70vw',
        }, 1000, 'swing');

        $('.themeLogoIntro').animate({
            width: '70vw',
        }, 1000, 'swing');
    }

    $('.themeLogo').attr('src', '/resources/image/clothesPhoto/2019fw1/event/wi_event.jpg');
    $('.themeLogoIntro').attr('src', '/resources/image/clothesPhoto/2019fw1/event/eventIntro.png');
    $('.left_btn').attr('class', 'fa fa-angle-double-left fa-4x img_eventer_up left_btn');
    $('.right_btn').attr('class', 'fa fa-angle-double-right fa-4x right_btn');

}

function imgEventClose() {
    if(type == 'mobile'){
        $('.themeLogo').animate({
            width: '60vw',
        }, 1000, 'swing');

        $('.themeLogoIntro').animate({
            width: '90vw',
        }, 1000, 'swing');
    }else{
        $('.themeLogo').animate({
            width: '40vw',
        }, 1000, 'swing');

        $('.themeLogoIntro').animate({
            width: '60vw',
        }, 1000, 'swing');
    }


    $('.themeLogo').attr('src', '/resources/image/themeLogo/1st.jpg');
    $('.themeLogoIntro').attr('src', '/resources/image/themeLogo/themeIntro.png');
    $('.left_btn').attr('class', 'fa fa-angle-double-left fa-4x left_btn');
    $('.right_btn').attr('class', 'fa fa-angle-double-right fa-4x img_eventer_up right_btn');
}

