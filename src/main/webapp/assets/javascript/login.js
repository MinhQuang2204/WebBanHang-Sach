
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function myFunction_showPassword() {
    var x = document.getElementById("Signup_Password");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}

function changeToLoginForm() {
    document.getElementById("signinForm").classList.remove('active');
    document.getElementById("forgotPwd").classList.remove('active');
    document.getElementById("loginForm").classList.add("active");
}

function changeToSigninForm() {
    document.getElementById("loginForm").classList.remove('active');
    document.getElementById("forgotPwd").classList.remove('active');
    document.getElementById("signinForm").classList.add("active");
}

function changeToForgotPwdForm() {
    document.getElementById("loginForm").classList.remove('active');
    document.getElementById("forgotPwd").classList.add("active");
}