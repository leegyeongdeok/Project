
var result = false;
var name;
var phone;
var password="";
var nickname;
var birth;
var email;

var id = sessionStorage.getItem("ID");
var username = sessionStorage.getItem("NAME");

$(function () {
    $.ajax({
        url: '/function/MyPage/myInfo/' + id,
        type: "GET",
        success: function (data) {
            name = data.name.toString();
            phoneAll = data.phone_num;
            passwordLength = data.password.toString().length;
            nickname = data.nickname.toString();
            birth = data.birth.toString();
            email = data.email.toString();
            nextStep();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            alert(request);
        }
    });
});

function nextStep() {
    for(var i = 0; i<passwordLength; i++){
        password+="●";
    }
    phone = phoneAll.substring(0,3)+"-"+phoneAll.substring(3,7)+"-"+phoneAll.substring(7,11);
    $("#info_id").text(id);
    $("#info_name").text(name);
    $("#info_pswd").text(password);
    $("#info_nick").text(nickname);
    $("#info_phone").text(phone);
    $("#info_email").text(email);
    $("#info_birth").text(birth);
}

function myPageHome() {

    location.href = "/dys/myPage/Home?id=" + id + "&name=" + username;
}

function myInfo() {

    location.href = "/dys/myInfo?id=" + id + "&name=" + username;
}

function myGoodList() {

    location.href = "/dys/myGoodList?id=" + id + "&name=" + username;
}

function memberCancel() {

    location.href = "/dys/memberCancel?id=" + id + "&name=" + username;
}

function myCourseList() {

    location.href = "/dys/myCourseList?id=" + id + "&name=" + username;
}

function saveCourseList() {

    location.href = "/dys/saveCourseList?id=" + id + "&name=" + username;
}

// view/myinfoChange
function idChange() {

    location.href = "/dys/myinfochange/idChange?id=" + id + "&name=" + username;
}

function pwChange() {

    location.href = "/dys/myinfochange/pwChange?id=" + id + "&name=" + username;
}

function nameChange() {

    location.href = "/dys/myinfochange/nameChange?id=" + id + "&name=" + username;
}

function nickNameChange() {

    location.href = "/dys/myinfochange/nickNameChange?id=" + id + "&name=" + username;
}

function birthChange() {

    location.href = "/dys/myinfochange/birthChange?id=" + id + "&name=" + username;
}

function emailChange() {

    location.href = "/dys/myinfochange/emailChange?id=" + id + "&name=" + username;
}

function phoneChange() {

    location.href = "/dys/myinfochange/phoneChange?id=" + id + "&name=" + username;
}

