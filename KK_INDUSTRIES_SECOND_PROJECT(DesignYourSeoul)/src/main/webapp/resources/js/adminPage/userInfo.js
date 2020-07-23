
function userBanned(id){
    $.ajax({
        url: '/api/generalUser/update/status/' + id,
        type: "PUT",
        contentType: 'application/json',
        success: function (data) {
            alert('상태가 변경 되었습니다.');
            window.close();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}

function ownerUserBanned(id){
    $.ajax({
        url: '/api/ownerUser/update/status/' + id,
        type: "PUT",
        contentType: 'application/json',
        success: function (data) {
            alert('상태가 변경 되었습니다.');
            window.close();
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}