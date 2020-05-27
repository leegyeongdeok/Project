var name;
var type;
var id;
var pswd;



function userType() {
    id = $("#id").val();
    pswd = $("#pswd").val();

    if (id == "" || pswd == "") {
        $("#idMsg").text("아이디와 비밀번호를 입력해주세요");
        return;
    }

    $.ajax({
        url: '/function/login/' + id + '/' + pswd,
        type: "GET",
        success: function (data) {
            if (data == "false") {
                $("#idMsg").text("아이디와 비밀번호를 확인해주세요");
            } else {
                type = data;
                nextStep();
            }
        },
        error: function (request, status, error) {
            alert(request);
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function nextStep() {
    var link = "/api/";
    var loc = "/dys";

    if (type == "general") {
        link += 'generalUser/get/' + id;
    }
    if (type == "owner") {
        link += 'ownerUser/get/' + id;
        loc = "/dys/owner/home"
    }
    if (type == "admin") {
        link += 'admin/get/' + id;
    }


    $.ajax({
        url: link,
        type: "GET",
        success: function (data) {
            if (type == "general") {
                name = data.nickname;
            }
            if (type == "owner") {
                name = data.name;
            }
            makeSession();
            location.href = loc;
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });


}

function makeSession() {
    sessionStorage.setItem("ID", id);
    sessionStorage.setItem("NAME", name);
    sessionStorage.setItem("TYPE", type);
    setSessionByIdAndType();
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

}