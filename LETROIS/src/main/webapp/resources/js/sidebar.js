$(document).ready(function () {
    menuResizer();
    $('#menu').on('click', function (e) {
        sidebar();
    });
});

$(window).on("mousewheel scroll DOMMouseScroll ", function (e) {
    try {
        var secondTop = $("#second_sec").offset().top;
    } catch (e) {
        var x = 1;
    }

    if (x != 1) {
        var moveTop = $(window).scrollTop();
        var $logo_other = $(".logo_other");
        var $menu = $('.menu');
        var logo_fontSize = parseFloat($logo_other.css('fontSize'), 10);
        var logo_padding = parseFloat($logo_other.css('paddingTop'), 10);

        if (moveTop >= secondTop - logo_fontSize - logo_padding) {
            $menu.css('color', 'black');
        } else {
            $menu.css('color', 'white');
        }
    }
});


var width;

$(window).resize(function () {
    menuResizer();
});

function menuResizer() {
    var $menu_item = $(".menu_item");
    var $menu = $("#menu");
    var $side_footer = $('.ft_information');
    width = window.innerWidth || document.body.clientWidth;
    var menuClass = $menu.attr('class');

    if (width >= 1500) {
        $menu_item.css('margin-top', '4vh')
    } else {
        $menu_item.css('margin-top', '5vh')
    }


    if (menuClass != "menu") {
        sidebar();
    }

}


function menuBtnPosition() {
    var $sidebar = $(".sidebar").width();
    var $menu = $("#menu");
    var menuClass = $menu.attr('class');

    if (menuClass == 'menu') {
        $menu.css('margin-left', $sidebar / 2);
    }

}

var type = '';

function mobileSidebar() {
    var $sidebar = $(".sidebar");
    var $menu_item = $(".menu_item");
    var $menu = $("#menu");
    var $info_tit = $('.info_tit');
    var $info_cont = $('.info_cont');

    type = 'mobile';

    $sidebar.css('width', '15vw');
    $sidebar.css('color', 'black');
    $menu.css('font-size', '16px');
    $menu_item.css('margin-top', '4vh');
    $menu_item.css('font-size', '18px');
    $info_tit.css('font-size', '13px');
    $info_cont.css('font-size', '9px');
}

function sidebar() {
    var $menu = $("#menu");
    var className = $menu.attr('class');
    var $sidebar = $(".sidebar");
    var $menu_item = $(".menu_item");
    var $side_footer = $('.ft_information');
    width = window.innerWidth || document.body.clientWidth;

    if (type == 'mobile') {
        if (className == 'menu') {
            $menu_item.css('display', 'block');
            $side_footer.css('display', 'block');
            $sidebar.animate({
                width: '45vw',
                'background-color': 'black'
            }, 500, 'swing');

            $menu.animate({
                'color': 'white'
            }, 500, 'swing');

            $menu_item.animate({
                'color': 'white'
            }, 500, 'swing');

            $('#menu').attr('class', 'menu_click');
        } else {
            $menu_item.css('display', 'none');
            $side_footer.css('display', 'none');
            $sidebar.animate({
                width: '15vw',
                'background-color': 'rgba(255, 255, 255, 0)'
            }, 500, 'swing');

            $menu.animate({
                'color': 'black'
            }, 500, 'swing');

            $menu_item.animate({
                'color': 'rgba(255, 255, 255, 0)'
            }, 500, 'swing');

            $('#menu').attr('class', 'menu');
        }
    } else {
        if (className == 'menu') {
            $menu_item.css('display', 'block');
            $side_footer.css('display', 'block');

            $sidebar.animate({
                width: '300px',
                'background-color': 'black'
            }, 500, 'swing');


            $menu.animate({
                'color': 'white'
            }, 500, 'swing');

            $menu_item.animate({
                'color': 'white'
            }, 500, 'swing');

            $('#menu').attr('class', 'menu_click');
        } else {
            $menu_item.css('display', 'none');
            $side_footer.css('display', 'none');
            $sidebar.animate({
                width: '150px',
                'background-color': 'rgba(255, 255, 255, 0)'
            }, 500, 'swing');

            $menu.animate({
                'color': 'black'
            }, 500, 'swing');

            $menu_item.animate({
                'color': 'rgba(255, 255, 255, 0)'
            }, 500, 'swing');

            $('#menu').attr('class', 'menu');
        }
    }

}

