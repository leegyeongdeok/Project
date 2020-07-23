var id = sessionStorage.getItem("ID");
var birth = "";

function updateBirth() {
    var year = $('#year_sel').val();
    var month = $('#mon_sel').val();
    var day = $('#day_sel').val();

    if (year == "년" || month == "월" || day == "일") {
        alert("생년원일을 입력해 주세요.")
    } else {
        birth += year + "년 ";
        birth += month + "월 ";
        birth += day + "일";

        $.ajax({
            url: '/api/generalUser/update/birth/' + id + '/' + birth,
            type: "PUT",
            contentType: 'application/json',
            success: function (data) {
                alert('생년월일이 변경되었습니다.');
                myInfo();
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }


}

function myInfo() {
    location.href = "/dys/myPage/myInfo";
}
