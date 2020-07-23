
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

