
var id;
var userId;
var no;

$(document).ready( function () {
    id = sessionStorage.getItem("ID");
    no = getParameterByName("no");

    if(id != null){
        $.ajax({
            url : '/function/detailList/ownerUserId/'+id,
            type : "GET",
            success : function(data){
                userId = data;
            },
            error:function(request,status,error){

            }
        });
    }
});

function createReply() {
    var content = $('#query').val();

    if(content == ""){
        alert("리뷰를 입력해주세요.")
    }else {
        $('.form_reply').val(content);
        $('.user_id').val(userId);
        replyPost();
    }
}

function replyPost(){
    var form = $("#data_form").serializeObject();
    $.ajax({
        url : '/api/reply/create/owner',
        type : "POST",
        contentType:'application/json',
        dataType : 'json',
        data : JSON.stringify(form),
        success : function(data){
            location.reload(true);
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            alert(JSON.stringify(form))

        }
    });
}

function beforeNotice(no) {
    location.href = "/dys/owner/board/detail?no="+no;
}

function afterNotice(no) {
    location.href = "/dys/owner/board/detail?no="+no;
}

