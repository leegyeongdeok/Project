
var enableChckerId = true;
var enableChckerPswd = true;
var enableChckerNull = true;
var enableChckerEmail = true;
var enableChckerphone = true;
var phoneFirst = ['010', '011', '016', '017', '018', '019'];

$(function () {
    $.getScript("/resources/js/jquery.serializeObject.js", function (data, textStatus, jqxhr) {
        console.log(data); // Data returned
        console.log(textStatus); // Success
        console.log(jqxhr.status); // 200
        console.log("Load was performed.");
    });
});

function json(){
    var form = $("#join_form").serializeObject();
    $.ajax({
        url : '/api/ownerUser/create',
        type : "POST",
        contentType:'application/json',
        dataType : 'json',
        data : JSON.stringify(form),
        success : function(data){
            location.href='signUpSuccess';
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(JSON.stringify(form))

        }
    });
}

function duplieId(){
    enableId();
    var id = $("#owner_id").val();
    $.ajax({
        url : '/function/user//duplicateId/'+id,
        type : "GET",

        success : function(data){
            var result = data;
            if(result == "중복된 아이디입니다. 다른 아이디를 사용하세요"){
                $("#idMsg").get(0).style.color = "red";
                enableChckerId = false;
            }else{
                $("#idMsg").get(0).style.color = "green";
                enableChckerId = true;
            }
            $("#idMsg").text(data);

        }
    });
}
function enableId(){
    var id = $("#owner_id").val();

    if(!/^(?=.*[a-zA-Z])(?=.*[0-9]).{5,10}$/.test(id)){
        $("#idMsg").text("5~10자 영문자, 숫자를 1자리 이상 사용해야 합니다.");
        $("#idMsg").get(0).style.color = "red";
        $('#owner_id').val('');
        enableChckerId = false;
        return;
    }else{
        enableChckerId = true;
    }
}

function pswdCheck(){
    var pswd1 = $("#password").val();
    var pswd2 = $("#pswd2").val();
    if(pswd1 != pswd2){
        $("#pswd2Img").attr('class','ps_box int_pass_check');
        $("#pswd2Msg").text("비밀번호가 일치하지 않습니다.");
        $("#pswd2Msg").get(0).style.display= "";
        $("#pswd2").val('');
    }else{
        $("#pswd2Msg").get(0).style.display= "none";
        $("#pswd2Img").attr('class','ps_box int_pass_check2')
    }
}

function pswdRank(){
    var pswd = $("#password").val();

    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pswd)){
        $("#pswd1Msg").text("8~20자 영문자, 숫자, 특수문자를 1자리 이상 사용해야 합니다.");
        $('#pswd1Img').attr('class','ps_box int_pass_step1');
        $('#pswd1Span').text('사용불가');
        $("#pswd1Span").get(0).style.color = "red";
        $('#password').val('');
        enableChckerPswd = false;
        return
    }
    if(/(\w)\1\1\1/.test(pswd)){
        // 같은 문자 4번 이상
        $('#pswd1Img').attr('class','ps_box int_pass_step3');
        $("#pswd1Msg").text("");
        $('#pswd1Span').text('보통');
        $("#pswd1Span").get(0).style.color = "#C48A1B";
        enableChckerPswd = true;
    }else{
        $('#pswd1Img').attr('class','ps_box int_pass_step4');
        $("#pswd1Msg").text("");
        $('#pswd1Span').text('안전');
        $("#pswd1Span").get(0).style.color = "green";
        enableChckerPswd = true;
    }
}

function txtFieldCheck(){
    // form안의 모든 text type 조회
    var txtEle = $("#join_form input[type=text]");
    for(var i = 0; i < txtEle.length; i ++){
        if("" == $(txtEle[i]).val() || null == $(txtEle[i]).val()){
            enableChckerNull = false;
            return;
        }else if("월"==$("#mm").val()  ){
            enableChckerNull = false;
            return;
        } else if("년(4자)"==$("#yy").val()){
            enableChckerNull = false;
            return;
        } else if("일"==$("#dd").val()){
            enableChckerNull = false;
            return;
        } else{
            enableChckerNull = true;
        }
    }
}

function enablePhone() {
    var check = true;
    enableChckerphone = true;
    var first = $("#phoneNo").val().substring(0,3);
    var all = $("#phoneNo").val();
    for(var i = 0; i<phoneFirst.length; i++){
        if(first == phoneFirst[i]){
            check = true;
            enableChckerphone = true;
            break;
        }else {
            check = false;
            enableChckerphone = false;
        }
    }

    if(all.length != 11){
        check = false;
        enableChckerphone = false;
    }
    if (isNaN(all)) {
        enableChckerphone = false;
        check = false;
    }
    if(check){
        $("#phoneNoMsg").get(0).style.display="none";
    }else{
        $("#phoneNoMsg").get(0).style.display = "unset";
        $("#phoneNo").val("");
    }
}

function enableEmail() {
    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if (regExp.test($("#email").val())){
        $("#emailMsg").get(0).style.display="none";
        enableChckerEmail = true;
    }else{
        $("#emailMsg").get(0).style.display="unset";
        enableChckerEmail = false;
        $("#email").val("");
    }

}

function sum(){
    var bir = $("#yy").val()+"년 ";
    bir+=$("#mm").val()+"월 ";
    bir+=$("#dd").val()+"일";
    $("#birthSum").attr('value',bir);
}

function createUser(){
    sum();
    txtFieldCheck();
    if(!enableChckerNull){
        alert("모든 정보를 입력해주세요");
        return;
    }else if(!enableChckerId){
        alert("아이디를 확인해주세요");
        return;
    }else if(!enableChckerPswd){
        alert("비밀번호를 확인해주세요");
        return;
    }else if(!enableChckerEmail){
        alert("이메일을 확인해주세요");
        return;
    } else if(!enableChckerphone){
        alert("휴대폰번호를 확인해주세요");
        return;
    } else{
        json();
    }
}
