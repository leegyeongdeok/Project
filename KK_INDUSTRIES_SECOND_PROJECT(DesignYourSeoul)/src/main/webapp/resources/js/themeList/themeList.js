var imgWidth;
var topCount = 1;

$(document).ready(function () {
    nowPageColor();
/*    imgWidthManager();*/
});

/*$(window).resize(function () {
    imgWidthManager();
});*/

function nowPageColor() {
    var pagePram = getParameterByName("page");
    if (pagePram == "") {
        pagePram = 1;
    }
    $("#" + pagePram).css('color', 'orange');
}

function detail(num) {
    location.href = window.location.pathname+"/detail?no=" + num;
}

function pageUp() {
    var nowPage = getParameterByName("page");
    var nextPage  = Number(nowPage) + 1;
    var searchParam = window.location.search;

    if(nowPage == ""){
        if(searchParam == ""){
            location.href = window.location.pathname +"?page=2";
        }else{
            location.href = window.location.pathname +"?page=2&"+searchParam.replace("?", "");
        }
    }else{
        location.href = window.location.pathname +searchParam.replace(nowPage, nextPage);
    }

}

function pageDown() {
    var nowPage = getParameterByName("page");
    var nextPage  = Number(nowPage) - 1;
    var searchParam = window.location.search;

    if(nowPage == "" || nowPage == 1){
       alert("첫번째 페이지 입니다.")
    }else{
        location.href = window.location.pathname +searchParam.replace(nowPage, nextPage);
    }

}

/*function pageFront() {
    if (nowPage == 1) {
        alert("첫번째 페이지입니다");
    } else {
        nowPage = 1;
        location.href = "foodList?id=" + account + "&name=" + userName + "&type=owner" + "&page=" + nowPage + "&location=" + $("#location_search").val();
    }

}

function pageBack() {
    if(nowPage == totalP){
        alert("마지막 페이지입니다");
    }else{
        nowPage = ${foodList.totalPages};
        location.href="foodList?id="+account+"&name="+userName+"&type=owner"+"&page="+nowPage+"&location="+$("#location_search").val();
    }

}*/

function pageSelect(page) {
    nowPage = page;
    var locationParam = getParameterByName("location");
    var nowRankParam = getParameterByName("rank");
    var locationUrl = window.location.pathname+"?page=" + page;

    if(locationParam != ""){
        locationUrl = locationUrl+ "&location=" + locationParam;
    }

    if(nowRankParam != ""){
        locationUrl = locationUrl+ "&rank=" + nowRankParam;
    }
    location.href = locationUrl;

}

function locationSearch() {
    var searchLoc = $("#location_search").val();
    var nowRankParam = getParameterByName("rank");
    var nowPathName = window.location.pathname;

    if(nowRankParam == ""){
        location.href = nowPathName+"?page=1&location=" + searchLoc;
    }else{
        location.href = nowPathName+"?page=1&location=" + searchLoc +"&rank="+nowRankParam;
    }

}

/*function imgWidthManager() {
    var listWidth = $('.list').css('width').replace("px", "");
    imgWidth = (listWidth - 126) / 5;

    $('.list li').css('width', imgWidth);
    $('.list img').css('width', imgWidth);

    $('.rankingList li').css('width', imgWidth);
    $('.rankingList img').css('width', imgWidth)
}*/

function back() {
/*
    var searchParam = window.location.search;
    var nowRankParam = getParameterByName("rank");
    var nowPathName = window.location.pathname;

    if(searchParam == ""){
       // location.href = nowPathName+"?rank=first";
        history.replaceState(null, null, nowPathName+"?rank=first");
    }else if(nowRankParam == ""){
        //location.href = nowPathName +searchParam +"&rank=first";
        history.replaceState(null, null, nowPathName +searchParam +"&rank=first");
    }else{
        //location.href = nowPathName +searchParam.replace("second", "first");
        history.replaceState(null, null, nowPathName +searchParam.replace("second", "first"));
    }*/

    if(topCount == 1){
        alert("첫번째 페이지 입니다.");
    }else{
        topCount--;
        $('#item'+topCount).css('display', 'block');
    }
}

function next() {
    if(topCount == 6){
        alert("마지막 페이지 입니다.");
    }else{
        $('#item'+topCount).css('display', 'none');
        topCount++;
    }

}


