function locLogout() {
    var out = confirm("정말 로그아웃 하시겠습니까?");
    if(out){
        sessionStorage.clear();
        location.href = "/dys";
    }
}