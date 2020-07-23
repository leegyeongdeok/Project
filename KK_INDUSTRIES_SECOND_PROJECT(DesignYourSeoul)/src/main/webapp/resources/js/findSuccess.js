
var length;
var index = 0;
var runChk;
var name;
var phone;

function run(id) {
    runChk = id.substring(3, 4);
    if ($("#" + id).prop('checked') == true) {
        for (var i = 1; i <= index; i++) {
            if (i != runChk) {
                $("#chk" + i).prop('checked', false);
            }
        }
    }
}

$(function () {
    name = getParameterByName("name");
    phone = getParameterByName("phone");

    $.ajax({
        url: '/api/generalUser/get/findUser/' + name + '/' + phone,
        type: "GET",
        dataType: "JSON",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                index++;
                var account = data[i].account.toString();
                var regiseredAt = data[i].registered_at.toString();
                var userType = "일반고객";
                var date = "가입 :";
                length = data.length;
                date += regiseredAt.substring(0, 4) + ".";
                date += regiseredAt.substring(5, 7) + ".";
                date += regiseredAt.substring(8, 10);

                $("#id_list").append("<li>" + "<input onclick='run(this.id)' class=\"id_check\" type=\"checkbox\" id=\"chk\">"
                    + "<p class=\"id_p\"><strong id=\"user_id\">" + account + "</strong></p>" +
                    "<p class=\"type_p\"><strong id=\"user_type\">" + userType + "</strong></p>" +
                    "<p class=\"idbirth_p\"><strong>" + date + "</strong></p></li>");
                $("#chk").attr('id', "chk" + index);
                $("#user_type").attr('id', "user_type" + index);
                $("#user_id").attr('id', "user_id" + index);
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            alert(request);
        }

    });

    $.ajax({
        url: '/api/ownerUser/get/findUser/' + name + '/' + phone,
        type: "GET",
        dataType: "JSON",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                index++;
                var account = data[i].account.toString();
                var regiseredAt = data[i].registered_at.toString();
                var userType = "업주고객";
                var date = "가입 :";
                date += regiseredAt.substring(0, 4) + ".";
                date += regiseredAt.substring(5, 7) + ".";
                date += regiseredAt.substring(8, 10);


                $("#id_list").append("<li>" + "<input onclick='run(this.id)' class=\"id_check\" type=\"checkbox\" id=\"chk\">"
                    + "<p class=\"id_p\"><strong id=\"user_id\">" + account + "</strong></p>" +
                    "<p class=\"type_p\"><strong id=\"user_type\">" + userType + "</strong></p>" +
                    "<p class=\"idbirth_p\"><strong>" + date + "</strong></p></li>");

                $("#chk").attr('id', "chk" + index);
                $("#user_type").attr('id', "user_type" + index);
                $("#user_id").attr('id', "user_id" + index);
            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            alert(request);
        }
    });
});

function findPswd() {
    var id = $("#user_id" + runChk).text();
    var userType;
    var nullChecker;

    if ($("#user_type" + runChk).text() == '일반고객') {
        userType = "general";
    } else {
        userType = "owner";
    }

    for (var i = 1; i <= index; i++) {
        if (!$("#chk" + i).prop('checked')) {
            nullChecker = true;
        } else {
            nullChecker = false;
            break;
        }
    }
    if (nullChecker) {
        alert("비밀번호를 찾으려는 아이디를 선택해주세요.")
    } else {
        location.href = "findPswdSuccess" + "?id=" + id + "&userType=" + userType;
    }
}



