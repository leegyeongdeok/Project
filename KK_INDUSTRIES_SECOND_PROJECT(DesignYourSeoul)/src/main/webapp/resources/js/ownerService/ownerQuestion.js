var searchPath;
var searchTypePath;
var page = 1;
var nowPage = 0;
var totalPage;
$(document).ready(function () {
    totalPage = Number($('#totalPages').val()) - 1;

    if (getParameterByName("page") != "") {
        page = Number(getParameterByName("page")) + 1
        nowPage = Number(getParameterByName("page"));
    }

    searchPath = getParameterByName("search");
    searchTypePath = getParameterByName("searchType");

    if (typeof (history.pushState) == 'function') {
        history.pushState(null, null, "/dys/owner/question");
    }

    btnColorManager(page);
});

function detail(num) {
    location.href = "question/detail?no=" + num;
}

function pageUp() {
    if (nowPage == totalPage) {
        alert("마지막 페이지 입니다.");
    } else {
        nowPage++;
        if (searchPath == "") {
            location.href = "question?page=" + nowPage;
        } else {
            location.href = "question?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + nowPage;
        }
    }
}

function pageDown() {
    if (nowPage == 0) {
        alert("첫번째 페이지 입니다.");
    } else {
        nowPage--;
        if (searchPath == "") {
            location.href = "question?page=" + nowPage;
        } else {
            location.href = "question?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + nowPage;
        }
    }

}

function pageFront() {
    if (nowPage == 0) {
        alert("첫번째 페이지 입니다.");
    } else {
        if (searchPath == "") {
            location.href = "question?page=" + 0;
        } else {
            location.href = "question?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + 0;
        }
    }

}

function pageBack() {
    if (nowPage == totalPage) {
        alert("마지막 페이지 입니다.");
    } else {
        if (searchPath == "") {
            location.href = "question?page=" + totalPage;
        } else {
            location.href = "question?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + totalPage;
        }
    }

}

function pageSelect(page) {
    if (searchPath == "") {
        location.href = "question?page=" + page;
    } else {
        location.href = "question?search=" + searchPath + "&searchType=" + searchTypePath + "&page=" + page;
    }
}

function searchQuestion(search) {
    var searchType = $('#type_selecter').val();
    location.href = "question?search=" + search + "&searchType=" + searchType;
}

function btnColorManager(page) {
    var nowPage = $('#btn' + page);
    nowPage.css("color", "#fff");
    nowPage.css("border", "1px solid orange");
    nowPage.css("background-color", "orange")
}

function writing() {
    location.href = "/dys/owner/question/write"

}