window.onload = function () {
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    styler(size.width);
};

$(window).resize(function () {
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    styler(size.width);
});

function styler(wid){
    var $insta = $('.ft_insta_content');
    var $icon = $('.ft14');

    if(wid <= 550){
        $insta.text("(@letrois_official)");
        $insta.css('font-size', '13px');
        $icon.css('font-size', '35px');
    }else{
        $insta.text("Instagram(@letrois_official)");
        $insta.css('font-size', '17px');
        $icon.css('font-size', '40px');
    }
}