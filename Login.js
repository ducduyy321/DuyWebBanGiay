function showTemporaryMessage(input, message) {
    input.setCustomValidity(message);
    setTimeout(() => {
        input.setCustomValidity('');
    }, 5000);
}
function clearMessage(inputId) {
    var errorDiv = document.getElementById('error' + inputId);
    errorDiv.textContent = '';
}

function validateForm() {
    var Email = document.getElementById("email").value;
    var pass = document.getElementById("password").value;

    var errorEmail = document.getElementById("errorEmail");
    var errorPass = document.getElementById("errorPass");


    var regexEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;
    var regexPass = /^.{8,}$/;

    errorEmail.textContent = "";
    errorPass.textContent = "";

    if (!regexEmail.test(Email)) {
        errorEmail.textContent = "Email không hợp lệ.";
        return false;
    }
    if (!regexPass.test(pass)){
        errorPass.textContent = "Mật khẩu phải ít nhất 8 kí tự.";
        return false;
    }
    return true;
}

document.getElementById("password").addEventListener("input", function () {
    var pass = document.getElementById("password").value;
    var errorPass = document.getElementById("errorPass");

    if (pass.length >= 8) {
        errorPass.textContent = '';
    }
});





