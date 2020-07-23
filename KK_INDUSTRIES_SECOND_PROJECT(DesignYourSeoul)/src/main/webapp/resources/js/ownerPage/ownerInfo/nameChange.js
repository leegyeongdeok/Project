var id = sessionStorage.getItem("ID");

function updateName() {
    var name = $('#changeVal').val();
    if(name != ""){
        $.ajax({
            url: '/api/ownerUser/update/name/' + id + '/' + name,
            type: "PUT",
            contentType: 'application/json',
            success: function (data) {
                alert('이름이 변경되었습니다.');
                myInfo();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
}

function myInfo() {
    location.href = "/dys/owner/Info";
}
