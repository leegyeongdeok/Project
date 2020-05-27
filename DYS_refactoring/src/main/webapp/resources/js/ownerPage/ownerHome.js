$(document).ready(function () {
    var name = sessionStorage.getItem("NAME");
    $('#username').text(name);
});