$(document).ready(function () {
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };

    var filter = "win16|win32|win64|mac|macintel";
    var webType = "";
    if (navigator.platform) {
        if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
            mobileResizer();
        } else {

        }
    }

    resizer(size.width, size.height);
    clothesSizer(size.width, size.height);
    logoSizeManager_onloading(size.width);

    $(this).resize(function () {
        size = {
            width: window.innerWidth || document.body.clientWidth,
            height: window.innerHeight || document.body.clientHeight
        };
        resizer(size.width, size.height);
        clothesSizer(size.width, size.height);
        logoSizeManager_onResize(size.width);
    });

    menuResizer();
});

$(document).ready(function () {
    $('#more_info_theme').on('click', function (e) {
        moreInfo();
    });

    $('#go_theme_category').on('click', function (e) {
        projectHistory();
    });

    $('#shutter_closer').on('click', function (e) {
        closeShutter();
    });
});


function resizer(width, height) {

    if (width + 150 < height) {
        $('.clothes_wd').attr('class', 'clothes');
        $('.menu').css('font-size', '2vh');
    } else {
        $('.clothes').attr('class', 'clothes_wd');
        $('.menu').css('font-size', '2vw');
    }
}

function clothesSizer(width, height) {
    var nowClothes = $('#main_clothes');
    var nowClothesClass = nowClothes.attr('class');
    var inputHeight;
    var inputWidth;
    if (nowClothesClass == 'clothes_wd') {
        inputHeight = height - 118;
        inputWidth = inputHeight * 1.3;
        nowClothes.css('height', inputHeight + 'px');
        nowClothes.css('width', inputWidth + 'px');
    } else {
        nowClothes.css('height', '110vw');
        nowClothes.css('width', '70vw');
    }
}

var pageIndex = 0;

function logoColorManager(index) {
    var $logo = $('.logo');
    pageIndex = index;
    var settingFontSize = logoSizeManager(window.innerWidth || document.body.clientWidth);

    if (index == 0) {
        $logo.animate({
            color: "white",
            'font-size': settingFontSize
        }, 500);
    } else {
        $logo.animate({
            color: "black",
            'font-size': settingFontSize
        }, 500);
    }
}

function logoSizeManager(width) {
    var $logo = $('.logo');
    var returnVal = '';
    if (pageIndex == 0) {
        if (width >= 1080) {
            returnVal = '64px'

        } else {
            returnVal = '6vw'
        }
    } else {
        if (width >= 1080) {
            returnVal = '42px'

        } else {
            returnVal = '4vw'
        }
    }
    return returnVal;
}

function logoSizeManager_onResize(width) {
    var $logo = $('.logo');
    if (pageIndex == 0) {
        if (width >= 1080) {
            $logo.css('font-size', '64px');

        } else {
            $logo.css('font-size', '6vw');
        }
    } else {
        if (width >= 1080) {
            $logo.css('font-size', '42px');

        } else {
            $logo.css('font-size', '4vwpx');
        }
    }
}

function logoSizeManager_onloading(width) {
    var $logo = $('.logo');
    if (pageIndex == 0) {
        if (width >= 1080) {
            $logo.animate({
                'font-size': "64px"
            }, 500);

        } else {
            $logo.animate({
                'font-size': "6vw"
            }, 500);
        }
    }
}

function clothesContentManager_onloading(width) {
    var $main_clothes_name = $('#main_clothes_name');

    if (width <= 1050) {
        $main_clothes_name.css('color', 'white')

    } else {
        $main_clothes_name.css('color', 'black')
    }
}

function clothesContentManager_resize(width) {
    var $main_clothes_name = $('#main_clothes_name');

    if (width <= 1050) {
        $main_clothes_name.animate({
            color : "white"
        }, 300);

    } else {
        $main_clothes_name.animate({
            color : "black"
        }, 300);
    }
}

function mobileResizer() {
    var $explain =  $('.explain');
    var $clothes_content =  $('.clothes_content');
    $('#more_info').css('bottom', '-30vh');
    $clothes_content.css('font-size', '8vw');
    $clothes_content.css('line-height', '20px');
    $('.clothes').css('height', '70vh');
    $('.tag').css('background-image', 'url("/resources/image/mo_home.jpeg")');
    $('.main_theme').css('background-image', 'url("/resources/image/mo_theme.jpg")');
    $('.sd1').css('background-image', 'url("/resources/image/mainSlider/mo_slider_1.png")');
    $('.sd2').css('background-image', 'url("/resources/image/mainSlider/mo_slider_2.png")');
    $('.sd3').css('background-image', 'url("/resources/image/mainSlider/mo_slider_3.png")');
    $explain.css('top', '18%');
    $explain.css('left', '5%');
}


