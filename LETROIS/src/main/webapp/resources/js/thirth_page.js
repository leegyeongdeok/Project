




function moreInfo() {
    var $more_info_wrap = $('.more_info_wrap');
    var $shutter = $('#shutter');
    var $shuttercloser = $('.shutter_closer');
    var $shutter_content = $('.shutter_content');

    $shutter.animate({
        height: '100%'
    }, {
        duration: 500
    });

    $more_info_wrap.css('display', 'none');
    $shuttercloser.css('display', 'block');
    $shutter_content.css('display', 'block');
}

function closeShutter() {
    var $more_info_wrap = $('.more_info_wrap');
    var $shutter = $('#shutter');
    var $shuttercloser = $('.shutter_closer');
    var $shutter_content = $('.shutter_content');
    $shutter.animate({
        height: '0%'
    }, {
        duration: 500
    });

    $more_info_wrap.css('display', 'block');
    $shuttercloser.css('display', 'none');
    $shutter_content.css('display', 'none');
}

function projectHistory() {
    location.href="project";
}