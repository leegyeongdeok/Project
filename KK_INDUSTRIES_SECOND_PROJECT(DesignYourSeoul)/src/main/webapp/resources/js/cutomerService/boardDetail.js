
var id;
var userId;

$(document).ready( function () {
    $.getScript( "/resources/js/jquery.serializeObject.js", function( data, textStatus, jqxhr ) {
        console.log( data ); // Data returned
        console.log( textStatus ); // Success
        console.log( jqxhr.status ); // 200
        console.log( "Load was performed." );
    });

    id = sessionStorage.getItem("ID");
    no = getParameterByName("no");

    if(id != null){
        $.ajax({
            url : '/function/detailList/getUserId/'+id,
            type : "GET",
            success : function(data){
                userId = data;
            },
            error:function(request,status,error){

            }
        });
    }
    loginManager(id);
});

function beforeNotice(no) {
    location.href = "/dys/board/detail?no="+no;
}

function afterNotice(no) {
    location.href = "/dys/board/detail?no="+no;
}

function loginManager(id) {
    if(id == null){
        $('#query').attr('placeholder', '로그인 후 댓글 작성이 가능합니다.');
        $('#query').attr('disabled', 'true');
        $('#search_btn').attr('disabled', 'true');
    }
}

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
        url : '/api/reply/create/general',
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