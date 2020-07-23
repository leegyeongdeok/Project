
var id = sessionStorage.getItem("ID");

var nullPhone = true;
var check = true;
var enableChckerphone;

var phoneFirst = ['010', '011', '016', '017', '018', '019'];

function enablePhone() {
    var phone = $("#changeVal").val();
    var errorBox = $(".error_next_box");
    enableChckerphone = true;
    var first = phone.substring(0,3);

    if (phone == "") {
        nullPhone = true;
        errorBox.text("휴대폰 번호를 입력해 주세요.");
        errorBox.css('color', 'red');
        return;
    }else{
        nullPhone = false;
    }

    if (phone.length < 11) {
        check = false;
        errorBox.text("휴대폰 번호를 정확히 입력해 주세요.");
        errorBox.css('color', 'red');
        return;
    }else{
        nullPhone = false;
    }

    for(var i = 0; i<phoneFirst.length; i++){
        if(first == phoneFirst[i]){
            check = true;
            break;
        }else {
            check = false;
            errorBox.text("휴대폰 번호를 정확히 입력해 주세요.");
            errorBox.css('color', 'red');
            return;
        }
    }

    errorBox.text("");
}

function updatePhoneNum(){
    enablePhone();

    if(nullPhone){
        return;
    }

    if(!check){
        return;
    }

    var phone = $("#changeVal").val();
    $.ajax({
        url : '/api/generalUser/update/phone/'+id+'/'+ phone,
        type : "PUT",
        contentType:'application/json',
        success : function(data){
            alert('핸드폰번호가 변경되었습니다.');
            myInfo();
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function myInfo() {
    location.href = "/dys/myPage/myInfo";
}
