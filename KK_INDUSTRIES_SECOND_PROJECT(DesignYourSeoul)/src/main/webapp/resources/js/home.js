
var size;

$(document).ready(function () {
     size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };

});

/*$(window).resize(function () {
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    main1(size.width, size.height);
})

function main1(wid, hei) {
    var video = $('#mainVideo');
    if (wid > hei) {
        video.css('width', '100%');
        video.css('height', 'unset');
    }else{
        video.css('width', 'unset');
        video.css('height', '100%');
    }
}*/

function videoAutoPlay(index) {
    var $video = $('#mainVideo');

    if (index == 0) {
        $video.get(0).play();
    }
}


