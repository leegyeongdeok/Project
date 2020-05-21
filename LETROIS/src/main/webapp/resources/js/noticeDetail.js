window.onload = function () {

    var filter = "win16|win32|win64|mac|macintel";
    if (navigator.platform) {
        if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
            mobileResizer();
            mobiKey = true;
        } else {
            mobiKey = false;
        }
    }
};

function mobileResizer() {
    $('#first_sec').css('height', '30vh');
    $('#second_sec').css('top', '30%');
    $('.ft_insta_content').text('');
}