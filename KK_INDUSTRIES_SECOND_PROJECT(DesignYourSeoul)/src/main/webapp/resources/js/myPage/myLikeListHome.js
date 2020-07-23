
var list = ['food', 'cafe', 'accom', 'activity', 'attraction'];
var index = 0;

$(document).ready(function () {
    setSession();

    $('.theme_box').on('click', function f() {
        var boxContain = $('.box_container');
        var id = $(this).attr('id');
        $('.title_container, .top_box, .bottom_box').css('display', 'none');
        boxContain.css('max-width', '1500px');

        boxContain.animate({
            width: '80vw',
            height: '85vh'
        });

        $('.likeList').css('display', 'block');
        $('.btn_container').css('display', 'grid');
        listType(id);
    });
    
});

function setSession() {
    var id = sessionStorage.getItem("ID");

    $.ajax({
        url: '/function/session/setSession/account/' + id,
        type: "POST",
        success: function (data) {

        },
        error: function (request, status, error) {
            alert("틀려떠");
        }
    });

}

function listType(id) {

    $('.theme_likeList').css('display', 'none');

    if (id == 'food') {
        index = 0;
        $('#food_likeList').css('display', 'grid');
        $('.btn_name').text("맛집 리스트");
    }

    if (id == 'cafe') {
        index = 1;
        $('#cafe_likeList').css('display', 'grid');
        $('.btn_name').text("카페 리스트");
    }

    if (id == 'accom') {
        index = 2;
        $('#accomm_likeList').css('display', 'grid');
        $('.btn_name').text("숙소 리스트");
    }

    if (id == 'activity') {
        index = 3;
        $('#activity_likeList').css('display', 'grid');
        $('.btn_name').text("액티비티 리스트");
    }

    if (id == 'attraction') {
        index = 4;
        $('#attraction_likeList').css('display', 'grid');
        $('.btn_name').text("명소 리스트");
    }
}

function pageUp() {
    if(index == 4){
        index = 0;
    }else{
        index ++;
    }
    listType(list[index]);
}

function pageDown() {
    if(index == 0){
        index = 4;
    }else{
        index --;
    }
    listType(list[index]);
}

function hrefStore(theme, no) {
    location.href = '/dys/theme/'+theme +'/detail?no='+no;
}