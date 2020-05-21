window.onload = function () {

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

    var secontTop = $("#second_sec").offset().top;
    var $logo_other = $(".logo_other");
    var logo_fontSize = parseFloat($logo_other.css('fontSize'), 10);
    var logo_padding = parseFloat($logo_other.css('paddingTop'), 10);
    var $menu = $('.menu');
    $menu.css('color', 'white');

    $(this).on("mousewheel scroll DOMMouseScroll ", function (e) {
        var moveTop = $(window).scrollTop();
        if (moveTop >= secontTop - logo_fontSize - logo_padding) {
            $logo_other.css('color', 'rgb(0,0,0,0)');
            $menu.css('color', 'black');
        } else {
            $logo_other.css('color', 'white');
            $menu.css('color', 'white');
        }

    });
    menuResizer();
}

$(window).resize(function () {
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    }

});

function mobileResizer() {
    $('#first_sec').css('height', '30vh');
    $('#second_sec').css('top', '30%');
    $('.sec_logo').css('font-size', '55px');
}
