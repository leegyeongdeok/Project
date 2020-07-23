var loginCondition = false;
var id;
var name;

$(document).ready(function () {
    id = sessionStorage.getItem("ID");
    name = sessionStorage.getItem("NAME");

    if (id != null) {
        changeLogin('yes');
        loginCondition = true;
    } else {
        changeLogin('not');
        loginCondition = false;
    }
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };
    headerManager();
    fontSize();
    user_boxSizer(size.width);

    /*   $('.sub li .totalMenu_text').on('mouseenter', function () {
           $(this).animate({
               color: 'orange',
               'font-weight':'bold',
           }, 500);
       });*/
});

$(window).resize(function () {
    size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };

    fontSize();
    user_boxSizer(size.width);
});


function fontSize() {
    var $size = $('.totalMenu_text').css('font-size').replace('px', '');
    var $fontSize = $('.totalMenu_text');
    var nowWidth = $('#totalMenu').css('width').replace('px', '');
    var list = $('.main>li');

    var menuList = $('#menu1 .main>li');

    if ($size > 20) {
        $fontSize.css('font-size', '20px');
        menuList.css('width', '');
        list.css('width', '140px')
    }

    if (nowWidth < 800) {
        $fontSize.css('font-size', '2.5vw');
        list.css('width', '')
    }
}

/*    function logoColorManager(index) { /!*in fullpage.js*!/
        var $totalMenu = $('#totalMenu');
        var hover = $('.sub li .totalMenu_text:hover');
        var allText = $('.all_text');
        var sub = $('.sub li');
        pageIndex = index;

        if (index == 0) {
            $totalMenu.css('border-bottom', 'solid orange 2px');

            sub.css('background-color', 'white');
            $totalMenu.animate({
                'background-color': "white",
            }, 500);

            allText.animate({
                color: "black",
            }, 500);

            hover.css('color', 'orange');
        } else {
            $totalMenu.css('border', 'unset');

            sub.css('background-color', 'rgb(0,0,0,0)');
            $totalMenu.animate({
                'background-color': "rgb(0,0,0,0)",
            }, 500);

            allText.animate({
                color: "white",
            }, 500);

            hover.css('color', 'black');
        }
    }*/

function user_boxSizer(size) {
    if (loginCondition) {
        if (size < 920) {
            $('#user_box').css('width', '20vw');
            $('#user_info').css('width', '20vw');
        } else {

            $('#user_box').css('width', '12vw');
            $('#user_info').css('width', '12vw');
        }
    }
}

function changeLogin(val) {
    if (val == 'yes') {
        $('#login').text(name + "님 반갑습니다.");
        $('#login').css('font-size', '15px');
    } else {
        $('#login').text("로그인");
        $('#login').css('font-size', '20px');
    }
}


function loginJudge() {
    if (!loginCondition) {
        location.href = "/dys/login"
    } else {
        userInfoViewer();
    }
}

function userInfoViewer() {
    var key = $('#user_info').css('max-height');
    if (key == '0px') {
        $('#user_info').css('max-height', '100px');
        $('#menu2').css('height', '150px')
    } else {
        $('#user_info').css('max-height', '0');
        $('#menu2').css('height', '50px')
    }
}

function logout() {
    var decision = confirm("정말 로그아웃 하시겠습니까?");

    if (decision) {
        sessionStorage.clear();
        location.reload();
    }

}

function headerManager() {
    var pathName = location.pathname;
    var totalMenu = $('#totalMenu');
    var userInfoTxt = $('.user_info_txt');
    if (pathName != '/dys') {
        totalMenu.css('background-color', 'white');
        totalMenu.css('border-bottom', 'orange solid 2px');
        $('.totalMenu_text').css('color', 'black');
        $('#login').css('color', 'black');
        userInfoTxt.css('color', 'black')
    } else {
        totalMenu.css('background-color', 'rgba(0,0,0,0)');
        totalMenu.css('border-bottom', 'unset');
        $('.totalMenu_text').css('color', 'white');
        $('#login').css('color', 'white');
        userInfoTxt.css('color', 'white')
    }
}

function mainHome() {
    location.href = "/dys"
}

function userInformation() {
    location.href = "/dys/myPage/Home";
}

function company() {
    location.href = "/dys/company/intro"
}

function courseRanking() {
    location.href = "/dys/course/ranking"
}


function food() {
    location.href = "/dys/theme/foodList"
}

function cafe() {
    location.href = "/dys/theme/cafeList"
}

function accommodation() {
    location.href = "/dys/theme/accomList"
}

function attraction() {
    location.href = "/dys/theme/attractionList"
}

function activity() {
    location.href = "/dys/theme/activityList"
}

function notice() {
    location.href = "/dys/notice"
}

function question() {
    location.href = "/dys/question"
}

function board() {
    location.href = "/dys/board"
}


/*function setSessionById() {

    var id = sessionStorage.getItem("ID");

    $.ajax({
        url : '/function/session/setSession/account/'+id,
        type : "POST",
        success : function(data){

        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });

}

function setSessionByIdAndType() {
    var id = sessionStorage.getItem("ID");
    var type = sessionStorage.getItem("TYPE");
    $.ajax({
        url : '/function/session/setSession/accountAndType/'+id+'/'+type,
        type : "POST",
        success : function(data){

        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });

}*/


