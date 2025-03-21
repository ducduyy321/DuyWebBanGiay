<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/16/2024
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/Login.css">
    <script src="/js/Login.js"></script>
</head>
<body class="container">
<div class="login-box">
    <h1 style="color: white">Đăng nhập</h1>
    <form action="login?action=login" method="post" onsubmit="return validateForm()">
        <div class="user-box">
            <input id="email" type="text" name="email" required
                   oninvalid="showTemporaryMessage(this, 'Vui lòng nhập email của bạn')"
                   onblur="validateForm()"
                   oninput="clearMessage('email')">
            <label>Email</label>
        </div>
        <div id="errorEmail" style="color: red;"></div>
        <div class="user-box">
            <input id="password" type="password" name="password" required
                   oninvalid="showTemporaryMessage(this, 'Vui lòng nhập mật khẩu của bạn')"
                   onblur="validateForm()"
                   oninput="clearMessage('password')">

            <label>Mật khẩu</label>
        </div>
        <div id="errorPass" style="color: red;"></div>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div id="error-message" class="error-message" style="color: red;">
            <%= error %>
        </div>
        <script>
            setTimeout(function() {
                document.getElementById('error-message').style.display = 'none';
            }, 3000);
        </script>
        <%
            }
        %>

        <button type="submit" name="submit">Đăng nhập</button>
    </form>
    <a href="/login?action=redirectRegister" class="sign-up-btn" methods="GET">Bạn chưa có tài khoản? Đăng ký</a>
</div>
</body>
</html>
