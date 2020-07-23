var id = sessionStorage.getItem("ID");
var nickName;

var nullNick = true;
var duplieNick = true;

function enableNickName() {
    var errorBox = $(".error_next_box");
    nickName = $("#ChangeVal").val();
    if (nickName == "") {
        errorBox.text("닉네임 입력해주세요");
        errorBox.css('color', 'red');
        nullNick = true;
        return;
    } else {
        nullNick = false;
    }

    $.ajax({
        url: '/function/user/duplicateNick/' + nickName,
        type: "GET",

        success: function (data) {
            var result = data;
            if (result == "중복된 닉네임입니다. 다른 닉네임을 사용하세요") {
                errorBox.css('color', 'red');
                duplieNick = true;
            } else if (result == "멋진 닉네임이네요!!") {
                errorBox.css('color', 'green');
                duplieNick = false;
            }
            errorBox.text(data);
        }
    });

}

function updateNickName() {
    var errorBox = $(".error_next_box");
    if (nullNick) {
        errorBox.text("닉네임 입력해주세요");
        return;
    }

    if (duplieNick) {
        errorBox.text("중복된 닉네임입니다. 다른 닉네임을 사용하세요");
        return;
    }

    $.ajax({
        url: '/api/generalUser/update/nick/' + id + '/' + nickName,
        type: "PUT",
        contentType: 'application/json',
        success: function (data) {
            alert('닉네임이 변경되었습니다.');
            myInfo();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function myInfo() {
    sessionStorage.setItem("NAME", nickName);
    location.href = "/dys/myPage/myInfo";
}
