
var id;
var userId;
var no;
var theme;
var likePresenceOrAbsence;
$(document).ready(function () {

    $.getScript( "/resources/js/jquery.serializeObject.js", function( data, textStatus, jqxhr ) {
        console.log( data ); // Data returned
        console.log( textStatus ); // Success
        console.log( jqxhr.status ); // 200
        console.log( "Load was performed." );
    });

    id = sessionStorage.getItem("ID");
    no = getParameterByName("no");

    $.ajax({
        url : '/function/detailList/getUserId/'+id,
        type : "GET",
        success : function(data){
            userId = data;
        },
        error:function(request,status,error){

        }
    });

    presenceOrAbsence();
});

function createReview(kind) {

    var content = $('#query').val();
    if(sessionStorage.getItem("ID") == null){
        alert("로그인 후 이용이 가능합니다.");
    }else{
        if(content == ""){
            alert("리뷰를 입력해주세요.")
        }else {
            $('.form_content').val(content);
            $('.user_id').val(userId);
            reviewPost(kind);
        }
    }
}

function reviewPost(kind){
    var form = $("#data_form").serializeObject();
    $.ajax({
        url : '/api/review/create/'+kind,
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

function presenceOrAbsence() {
    var pathName = window.location.pathname.replace("/dys/theme/", "").replace("/detail", "");

    if(pathName == "foodList"){
        theme = "famousRestaurant";
    }else if(pathName == "cafeList"){
        theme = "cafe";
    }else if(pathName == "accomList"){
        theme = "accommodation";
    }else if(pathName == "attractionList"){
        theme = "attraction";
    }else if(pathName == "activityList"){
        theme = "activity";
    }else{
        theme = "";
    }

    presenceOrAbsenceNext();
}
function presenceOrAbsenceNext() {

    $.ajax({
        url : '/function/detailList/likePresenceOrAbsence/'+id+"/"+theme+"/"+no,
        type : "GET",
        success : function(data){
            likePresenceOrAbsence = data;
            likeBtnController(data);
        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });
}

function likeBtnController(PresenceOrAbsence){
    if(PresenceOrAbsence == "presence"){
        $(".like").css("background-image", "url(/resources/image/courseRanking/likeFull.png)")
    }else{
        $(".like").css("background-image", "url(/resources/image/courseRanking/like.png)")
    }
}

function like() {
    if(sessionStorage.getItem("ID") == null){
        alert("로그인 후 이용이 가능합니다.");
    }else{
        if(likePresenceOrAbsence == "absence"){
            var decision = confirm("좋아요를 누르시겠습니까?");
            if(decision){
                likeThat();
            }
        }else{
            var decision = confirm("좋아요를 취소 하시겠습니까?");
            if(decision){
                unLikeThat();

            }
        }
    }

}

function likeThat() {
    $.ajax({
        url : '/api/likeList/create/'+id+"/"+theme+"/"+no,
        type : "POST",
        success : function(data){

        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });

    $.ajax({
        url : '/api/likeList/updatePlus/'+theme+"/"+no,
        type : "PUT",
        success : function(data){
            location.reload(true);
        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });
}
function unLikeThat() {
    $.ajax({
        url : '/api/likeList/delete/'+id+"/"+theme+"/"+no,
        type : "DELETE",
        success : function(data){

        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });

    $.ajax({
        url : '/api/likeList/updateMinus/'+theme+"/"+no,
        type : "PUT",
        success : function(data){
            location.reload(true);
        },
        error:function(request,status,error){
            alert("틀려떠");
        }
    });
}
