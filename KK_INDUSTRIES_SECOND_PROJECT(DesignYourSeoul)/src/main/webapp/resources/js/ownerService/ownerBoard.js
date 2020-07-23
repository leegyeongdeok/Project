var searchPath;
var searchTypePath;
var page = 1;
var nowPage = 0;
var totalPage;

$(document).ready(function () {
    totalPage = Number($('#totalPages').val()) - 1;

    if(getParameterByName("page") != ""){
        page = Number(getParameterByName("page"))+1
        nowPage = Number(getParameterByName("page"));
    }

    searchPath = getParameterByName("search");
    searchTypePath = getParameterByName("searchType");

/*
    if (typeof (history.pushState) == 'function') {
        history.pushState(null, null, "/dys/board");
    }
*/

    btnColorManager(page);
});

function detail(num) {
    location.href = "board/detail?no="+num;
}

function pageUp() {
    if(nowPage == totalPage){
        alert("마지막 페이지 입니다.");
    }else{
        nowPage++;
        if (searchPath == "") {
            location.href = "board?page=" + nowPage;
        } else {
            location.href = "board?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + nowPage;
        }
    }
}

function pageDown() {
    if(nowPage == 0){
        alert("첫번째 페이지 입니다.");
    }else{
        nowPage--;
        if (searchPath == "") {
            location.href = "board?page=" + nowPage;
        } else {
            location.href = "board?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + nowPage;
        }
    }

}

function pageFront() {
    if(nowPage == 0){
        alert("첫번째 페이지 입니다.");
    }else{
        if (searchPath == "") {
            location.href = "board?page=" + 0;
        } else {
            location.href = "board?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + 0;
        }
    }

}

function pageBack() {
    if(nowPage == totalPage){
        alert("마지막 페이지 입니다.");
    }else{
        if (searchPath == "") {
            location.href = "board?page=" + totalPage;
        } else {
            location.href = "board?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + totalPage;
        }
    }
}

function pageSelect(page) {
    if (searchPath == "") {
        location.href = "board?page=" + page;
    } else {
        location.href = "board?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + page;
    }

}

function searchBoard(search) {
    var searchType = $('#type_selecter').val();
    location.href = "board?search=" + search + "&searchType=" + searchType;
}

function writing() {
    location.href="board/write";
}

function btnColorManager(page) {
    var nowPage = $('#btn'+page);
    nowPage.css("color", "#fff");
    nowPage.css("border", "1px solid orange");
    nowPage.css("background-color", "orange")
}