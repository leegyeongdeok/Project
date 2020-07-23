
var result = false;
var phoneFirst = ['010', '011', '016', '017', '018', '019'];
var number; // 인증번호
var name; // 이름
var id; // 아이디
var phone; // 휴대전화
var userType; //회원종류

function enablePhoneId(phoneNumber) {
    var check = true;
    var enableCheckerPhone = true;
    var first = phoneNumber.substring(0,3);
    var all = phoneNumber;
    for(var i = 0; i<phoneFirst.length; i++){
        if(first == phoneFirst[i]){
            check = true;
            enableCheckerPhone = true;
            break;
        }else {
            check = false;
            enableCheckerPhone = false;
        }
    }

    if(all.length != 11){
        check = false;
        enableCheckerPhone = false;
    }
    if (isNaN(all)) {
        enableCheckerPhone = false;
        check = false;
    }
    if(!check){
        alert("휴대전화 번호를 정확히 입력해주세요.");
        return;
    }else{
        checkUserId();
    }
}

function enablePhonePswd(phoneNumber) {
    var check = true;
    var enableCheckerPhone = true;
    var first = phoneNumber.substring(0,3);
    var all = phoneNumber;
    for(var i = 0; i<phoneFirst.length; i++){
        if(first == phoneFirst[i]){
            check = true;
            enableCheckerPhone = true;
            break;
        }else {
            check = false;
            enableCheckerPhone = false;
        }
    }

    if(all.length != 11){
        check = false;
        enableCheckerPhone = false;
    }
    if (isNaN(all)) {
        enableCheckerPhone = false;
        check = false;
    }
    if(!check){
        alert("휴대전화 번호를 정확히 입력해주세요.");
        return;
    }else{
        checkUserPswd();
    }
}

function checkUserId(){
    name = $("#find_id_name").val();
    phone = $("#find_id_phone").val();
    if(name == ""){
        alert("이름을 입력해주세요");
        return;
    }else{

    }
    $.ajax({
        url : '/function/find/id/'+name+'/'+phone,
        type : "GET",
        success : function(data){
            if (data == "false"){
                alert("일치하는 회원이 없습니다.");
            }else{
                sendMsg();
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(request);
        }
    });
}

function checkUserPswd(){
    id = $("#find_pswd_id").val();
    name = $("#find_pswd_name").val();
    phone = $("#find_pswd_phone").val();
    if(name == ""){
        alert("이름을 입력해주세요");
        return;
    }
    if(id == ""){
        alert("아이디 입력해주세요");
        return;
    }
    $.ajax({
        url : '/function/find/pswd/'+name+'/'+id+'/'+phone,
        type : "GET",
        success : function(data){
            if (data == "false"){
                alert("일치하는 회원이 없습니다.");
            }else{
                sendMsg('pswd');
                userType = data;
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(request);
        }
    });
}

function sendMsg(type) {
    addNum();
    if(type == 'pswd'){
        var form = $('#find_pswd_phone').serialize();
    }else {
        var form = $('#find_id_phone').serialize();
    }
    form = form +'&'+ $('#textarea').serialize();
    $.ajax({
        url: '/sendSms',
        type: "POST",
        data: form,
        success: function (data) {
            alert("인증번호를 보냈습니다.");
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(request);
        }
    });
}

function addNum(){
    number = Math.floor(Math.random()*10000+1000);
    var text = "본인확인 인증번호[" +number+"]를 화면에 입력해 주세요";
    $("#textarea").attr('value',text);
}

function checkNumberId() {
    var checkNum = $("#find_id_check").val();
    var url;
    if(checkNum == number){
        location.href='findSuccess'+'?name='+name+'&phone='+phone;
    }else{
        alert("인증번호가 일치하지 않습니다.");
    }
}

function checkNumberPswd() {
    var checkNum = $("#find_pswd_check").val();

    if(checkNum == number){
        location.href="findPswdSuccess"+"?id="+id+"&userType="+userType;
    }else{
        alert("인증번호가 일치하지 않습니다.");
    }
}
