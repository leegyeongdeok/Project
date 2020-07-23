$(document).ready(function () {
    setSession();
});

function setText() {
    var size = $('.size_famous').val();
    alert(size)
}

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

/* 초기화 initView(ul엘리먼트의 id, 최초 보여지는 li 엘리먼트 갯수, display 값) */
function initView(el_id, view_item_count, style) {
    var menu = document.getElementById(el_id);
    var menu_list = menu.getElementsByTagName('li');
    var menu_count = menu_list.length;
    style = (typeof (style) != 'undefined') ? style : 'block';

    for (var i = 0; i < menu_count; i++) {
        if (i < view_item_count) menu_list[i].style.display = style;
        else menu_list[i].style.display = 'none';
    }
}

/* 목록 이동 moveList(이동시킬방향 prev 또는 next, 이동시킬 ul 엘리먼트의 id, 보여질 목록 갯수, 이동시킬 갯수, display 값) */
function moveList(direction, el_id, view_item_count, scroll_count, style) {
    var menu = document.getElementById(el_id);
    var menu_list = menu.getElementsByTagName('li');
    var menu_count = menu_list.length;
    var start_no = 0;

    style = (typeof (style) != 'undefined') ? style : 'block';

    // 현재 보여지고 있는 엘리먼트의 시작을 확인
    for (var i = 0; i < menu_count; i++) {
        if (menu_list[i].style.display == style) {
            start_no = i;
            break;
        }
    }

    // 방향에 따른 이동
    if (direction == 'next') {
        if (menu_list[menu_count - 1].style.display == style) return false;
        else {
            for (var i = 0; i < menu_count; i++) {
                if (i >= start_no + scroll_count && i < start_no + scroll_count + view_item_count) {
                    menu_list[i].style.display = style;
                } else {
                    menu_list[i].style.display = 'none';
                }
            }
        }
    } else if (direction == 'prev') {
        if (menu_list[0].style.display == style) return false;
        else {
            for (var i = 0; i < menu_count; i++) {
                if (i >= start_no - scroll_count && i < start_no - scroll_count + view_item_count) {
                    menu_list[i].style.display = style;
                } else {
                    menu_list[i].style.display = 'none';
                }
            }
        }
    }
}

