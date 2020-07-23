
var loginCondition = false;
var id;
var name;

$(document).ready(function () {
    id = sessionStorage.getItem("ID");
    name = sessionStorage.getItem("NAME");

    if (id != null) {
        changeLogin('yes');
        loginCondition = true;
    }else{
        changeLogin('not');
        loginCondition = false;
    }
    var size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
    };

    fontSize();
    user_boxSizer(size.width);
    fontColor(window.location.pathname);
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

function user_boxSizer(size) {
    if(loginCondition){
        if(size < 920){
            $('#user_box').css('width', '20vw');
            $('#user_info').css('width', '20vw');
        }else{

            $('#user_box').css('width', '12vw');
            $('#user_info').css('width', '12vw');
        }
    }
}

function changeLogin(val) {
    if(val == 'yes'){
        $('#login').text(name + "님 반갑습니다.");
        $('#login').css('font-size', '15px');
    }else{
        $('#login').text("로그인");
        $('#login').css('font-size', '20px');
    }
}



function loginJudge() {
    if(!loginCondition){
        location.href = "/dys/login"
    }else{
        userInfoViewer();
    }
}

function userInfoViewer() {
    var key = $('#user_info').css('display');
    if(key == 'none'){
        $('#user_info').css('display', 'block');
    }else{
        $('#user_info').css('display', 'none');
    }
}

function logout() {
    var decision = confirm("정말 로그아웃 하시겠습니까?");

    if(decision){
        sessionStorage.clear();
        location.href = "/dys";
    }

}

function fontColor(pathName){

    if(pathName != '/dys'){
        $('#login').css('color', 'black');
        $('.totalMenu_text').css('color', 'black');
        $('#menu1 .main .sub li').css('background-color', 'rgba(255,255,255,0.7)');
        $('#menu1 .main li:hover').css('background-color', 'white');
        $('#totalMenu').css('position', 'initial');
    }else{
        $('#login').css('color', 'white');
        $('.totalMenu_text').css('color', 'white');
        $('#menu1 .main .sub li').css('background-color', 'rgba(0,0,0,0.35)');
        $('.main li:hover').css('background-color', 'rgba(0,0,0,0.35)');
        $('#totalMenu').css('position', 'absolute');
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


