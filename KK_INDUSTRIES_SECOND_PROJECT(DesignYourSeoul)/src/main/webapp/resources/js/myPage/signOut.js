
function userSignOut() {
    if (!$("#chk_agree").prop('checked')) {
        alert("약관에 동의해주세요");
    }else{
        if(confirm("정말 탈퇴 하시겠습니까?")){
            var account = sessionStorage.getItem("ID");
            $.ajax({
                url: '/api/generalUser/delete/' + account,
                type: 'DELETE',
                success: function (data) {
                    alert("회원탈퇴가 완료 되었습니다.");
                    sessionStorage.clear();
                    location.href = "/dys";
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    alert(request);
                }
            });
        }
    }



}

