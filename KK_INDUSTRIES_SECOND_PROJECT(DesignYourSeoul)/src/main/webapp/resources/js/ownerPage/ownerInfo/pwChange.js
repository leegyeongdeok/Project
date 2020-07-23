
var password;
var nullAcc = true;
var enableAcc = true;
var confPswd = true;

var id = sessionStorage.getItem("ID");

function enablePswd(){

    password = $("#pw").val();
    if(password == ""){
        $("#pwMsg").text("새로운 비밀번를 입력해주세요");
        $("#pwMsg").get(0).style.color = "red";
        nullAcc = true;
        return;
    }else{
        nullAcc = false;

        if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(password)){
            $("#pwMsg").text("8~20자 영문자, 숫자, 특수문자를 1자리 이상 사용해야 합니다.");
            $('#pw').val('');
            enableAcc = true;
            return;
        }else{
            $("#pwMsg").text("");
            enableAcc = false;
        }
    }
}

function pswdCheck(){
    var pswd1 = $("#pw").val();
    var pswd2 = $("#pwChange").val();
    if(pswd1 != pswd2){
        $("#pwMsg").text("비밀번호가 일치하지 않습니다.");
        $("#pwChange").val('');
        confPswd = true;
        return;
    }else{
        confPswd = false;
    }
}

function updateUser(){
    if(nullAcc){
        return;
    }

    if(confPswd){
        return;
    }

    if(enableAcc){
        return;
    }

    $.ajax({
        url : '/api/ownerUser/update/pswd/'+id+'/'+password,
        type : "PUT",
        contentType:'application/json',
        success : function(data){
            alert('비밀번가 변경되었습니다.');
            myInfo();
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function myInfo() {
    location.href = "/dys/owner/Info";
}
