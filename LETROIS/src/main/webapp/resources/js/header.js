$(window).on("mousewheel scroll DOMMouseScroll ", function (e) {
    var moveTop = $(window).scrollTop();
    var secondTop = $("#second_sec").offset().top;
    var $logo_other = $(".logo_other");
    var logo_fontSize = parseFloat($logo_other.css('fontSize'), 10);
    var logo_padding = parseFloat($logo_other.css('paddingTop'), 10);

    if (moveTop >= secondTop - logo_fontSize - logo_padding) {
        $logo_other.css('color', 'rgb(0, 0, 0, 0)');
    } else {
        $logo_other.css('color', 'white');
    }
});