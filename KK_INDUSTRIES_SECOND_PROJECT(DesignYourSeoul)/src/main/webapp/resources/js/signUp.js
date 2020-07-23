
function checker(type) {
    if ($("input:checkbox[id=termsPrivacy]").is(":checked") == true && $("input:checkbox[id=termsService]").is(":checked") == true) {
        location.href = type;
    } else {
        $("#agreeMsg").get(0).style.display = "unset";
    }
}

function allSelect() {
    if ($("input:checkbox[id=chk_all]").is(":checked") == true) {
        $("#join_form input[type=checkbox]").prop("checked", true);
    } else {
        $("#join_form input[type=checkbox]").prop("checked", false);
    }

}
