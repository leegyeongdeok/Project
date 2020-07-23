$(function () {
    $.getScript("/resources/js/jquery.serializeObject.js", function (data, textStatus, jqxhr) {
        console.log(data); // Data returned
        console.log(textStatus); // Success
        console.log(jqxhr.status); // 200
        console.log("Load was performed.");
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
    $("#btn_update").click(function () {
        $('#title').val($('#titleArea').val());
        obj.getById["content_textArea"].exec("UPDATE_CONTENTS_FIELD", []);
        update();
    });

    $("#btn_create").click(function () {
        $('#title').val($('#titleArea').val());
        obj.getById["content_textArea"].exec("UPDATE_CONTENTS_FIELD", []);
        create();
    });
});

function update() {
    var id = getParameterByName("no");

    var form = $("#insertQuestionFrm").serializeObject();
    $.ajax({
        url: '/function/notice/update/' + id,
        type: "PUT",
        contentType: 'application/json',
        dataType: 'text',
        data: JSON.stringify(form),
        success: function (data) {
            alert("공지가 수정되었습니다.");
            window.close();
            location.reload();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function create() {
    var form = $("#insertQuestionFrm").serializeObject();
    $.ajax({
        url: '/function/notice/create/',
        type: "PUT",
        contentType: 'application/json',
        dataType: 'text',
        data: JSON.stringify(form),
        success: function (data) {
            alert("공지가 등록되었습니다.");
            window.close();
            location.reload();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function deleteNotice() {
    var id = getParameterByName("no");
    $.ajax({
        url: '/function/notice/delete/'+id,
        type: "DELETE",
        dataType: 'text',
        success: function (data) {
            alert("공지가 삭제되었습니다.");
            window.close();
            location.reload();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function backPage() {
    var id = getParameterByName("no");
    location.href = '/dys/admin/noticeDetail?no='+id;
}