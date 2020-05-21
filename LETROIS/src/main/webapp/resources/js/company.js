$(document).ready(function () {
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };

    var filter = "win16|win32|win64|mac|macintel";
    if (navigator.platform) {
        if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
            mobileResizer();
            mobiKey = true;
        } else {
            mobiKey = false;
        }
    }

    var fontSize = $(".content").css('font-size');
    imgResizer(size.width);
    fontManager(fontSize);
    var $menu = $('.menu');
    $menu.css('color', 'white');

    menuResizer();
});



$(window).resize(function () {
    fontSize = $(".content").css('font-size');
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    imgResizer(size.width);
    fontManager(fontSize);
});

function imgResizer(wid) {
    var $picture_wi = $(".picture_wi");
    var $picture_he = $(".picture_he");
    var $company_right = $(".company_right");
    var $company_left = $(".company_left");
    if (wid <= 500) {
        $picture_wi.css('width', '90vw');
        $picture_he.css('width', '90vw');
        $company_right.css('width', 'auto');
        $company_left.css('width', 'auto');
    } else {
        $picture_wi.css('width', '80vw');
        $picture_he.css('width', '47vw');
        $company_right.css('width', '35vw');
        $company_left.css('width', '35vw');

    }
}

function fontManager(size) {
    var $content = $(".content");
    var nowSize = size.substring(0,2);

    if(nowSize <= 15) {
        $content.css('font-size', '15px');

    } else {
        $content.css('font-size', '1.5vw');
    }
}

function mobileResizer() {
    $('#first_sec').css('height', '30vh');
    $('#second_sec').css('top', '30%');
    $('.sec_logo').css('font-size', '55px');
}