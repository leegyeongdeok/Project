
var mobiKey;
window.onload = function () {

    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    listResizer(size.width);

    var filter = "win16|win32|win64|mac|macintel";
    if (navigator.platform) {
        if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
            mobileResizer();
            mobiKey = true;
        } else {
            mobiKey = false;
        }
    }

    var secondTop = $("#second_sec").offset().top;
    var $logo_other = $(".logo_other");
    var logo_fontSize = parseFloat($logo_other.css('fontSize'), 10);
    var logo_padding = parseFloat($logo_other.css('paddingTop'), 10);
    var $menu = $('.menu');
    $menu.css('color', 'white');

    $(this).on("mousewheel scroll DOMMouseScroll ", function (e) {

        var moveTop = $(window).scrollTop();
        if(moveTop >= secondTop-logo_fontSize-logo_padding){
            $logo_other.css('color', 'rgb(0,0,0,0)');
            $menu.css('color', 'black');
        }else{
            $logo_other.css('color', 'white');
            $menu.css('color', 'white');
        }

    });

    menuResizer();
};

$(window).resize(function () {
    fontSize = $(".content").css('font-size');
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    if(!mobiKey){
        listResizer(size.width);
    }
});

function listResizer(wid) {
    var $content_p = $(".list_content p").css('width').replace('px','');
    var $list = $('.theme_list li');
    var $list_photo = $('.list_photo');
    var $list_content = $('.list_content p');

    if ($content_p <= 101) {
        $list.css('height', '35vh');
        $list_photo.css('width', ' calc(100% - 110px - 160px)');
        $list_content.css('margin-top', '2vh');

    } else {
        $list.css('height', '75vh');
        $list_photo.css('width', ' calc(100% - 110px - 22vw)');
        $list_content.css('margin-top', '5vh');

    }
}

function mobileResizer() {
    var $list_photo = $('.list_photo');
    var $list_content = $('.list_content');

    $('#first_sec').css('height', '30vh');
    $('#second_sec').css('top', '30%');
    $('.sec_logo').css('font-size', '55px');
    $list_content.css('margin-right', '50px');
    $list_photo.css('width', ' calc(100% - 110px - 70px)');
    $list_photo.css('margin-right', ' 0');

}

function no() {
    alert('준비중입니다. \n 빠른 시일 내에 완성하겠습니다.');
}