
function answerWriting() {

    $('.questionAnswer').css('display', 'none');
    $('.btn_answer').css('display', 'none');
    var obj = [];
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "questionWriting",
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

    $('#questionWriting').css('display', 'block');
    $('.btn_writing').css('display', 'block');
}

function writingCancel() {
    $('#questionWriting').css('display', 'none');
    $('.questionAnswer').css('display', 'block');
    $('.btn_answer').css('display', 'block');
    $('.btn_writing').css('display', 'none');
}

function createAnswer() {

}