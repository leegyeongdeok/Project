
var id = sessionStorage.getItem("ID");
function enableEmail() {
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var errorBox = $(".error_next_box");

    if (regExp.test($("#changeVal").val())){
        errorBox.text("");
        enableChckerEmail = false;
    }else{

        errorBox.text("이메일 형식이 틀립니다.");
        errorBox.css('color', 'red');
        enableChckerEmail = true;
    }
}

function updateEmail() {
    var errorBox = $(".error_next_box");
    var email = $("#changeVal").val();
    if (email == "") {
        errorBox.text("변경할 이메일을 입력해주세요");
        errorBox.css('color', 'red');
        return;
    }

    if(enableChckerEmail){
        errorBox.text("이메일 형식이 틀립니다.");
        errorBox.css('color', 'red');
        return;
    }

    $.ajax({
        url: '/api/ownerUser/update/email/' + id + '/' + email,
        type: "PUT",
        contentType: 'application/json',
        success: function (data) {
            alert('이메일이 변경되었습니다.');
            myInfo();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function myInfo() {
    location.href = "/dys/owner/Info";
}