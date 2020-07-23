
var generalId;
$(function () {
    $.getScript( "/resources/js/jquery.serializeObject.js", function( data, textStatus, jqxhr ) {
        console.log( data ); // Data returned
        console.log( textStatus ); // Success
        console.log( jqxhr.status ); // 200
        console.log( "Load was performed." );
    });

    var account = sessionStorage.getItem("ID");
    $.ajax({
        url: '/function/user/get/general/'+account,
        type: "GET",
        success: function (data) {
            generalId = data;
        },
        error: function (data) {

        }
    });
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "content_textArea",
        sSkinURI: "/resources/editor/SmartEditor2Skin.html",
        htParams: {
            // 툴바 사용 여부
            bUseToolbar: true,
            // 입력창 크기 조절바 사용 여부
            bUseVerticalResizer: false,
            // 모드 탭(Editor | HTML | TEXT) 사용 여부
            bUseModeChanger: false,
        }
    });

    //전송버튼
    $("#insertQuestion").click(function () {
        $('#title').val($('#titleArea').val());
        $('#generalUserId').val(generalId);
        obj.getById["content_textArea"].exec("UPDATE_CONTENTS_FIELD", []);
        nextStep();
    });
});

function nextStep() {

    var form = $("#insertQuestionFrm").serializeObject();
    $.ajax({
        url: '/function/board/general/create',
        type: "POST",
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify(form),
        success: function (data) {
            alert("게시글이 등록되었습니다.");
            location.href = "/dys/board"
        },
        error: function (request,status,error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

function cancel() {
    location.href = "/dys/board";
}

