function changePasswordFields() {
    var pwd = document.getElementsByClassName("pwdFormat");
    var length = pwd.length;
    var tmpPwd = "";

    for (var i = 0; i < length; i++) {
        tmpPwd = pwd[i].innerText;
        pwd[i].innerHTML = "<input id='pwd" + i + "' type='password' class='input' value='" + tmpPwd + "'></input>\
                <input type='checkbox' onclick='displayPassword("+ i + ")'>";
        //pwd[i].setAttribute("type", "password");
    }
}
function displayPassword(num) {
    //var elm = $(this);
    var elm = document.getElementById("pwd" + num);
    if (elm.type === "password") {
        elm.type = "text";
    } else {
        elm.type = "password";
    }
}