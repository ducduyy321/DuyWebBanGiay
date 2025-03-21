<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/18/2024
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa Sản Phẩm</title>
    <link rel="stylesheet" href="/css/EditProduct.css">
    <script src="/js/Login.js" defer></script>

</head>
<body>
<%
    String successMessage = (String) request.getAttribute("successMessage");
    if (successMessage != null) {
%>
<div class="notification" style="display: block;">
    <%= successMessage %>
</div>
<%
    }
%>

<form action="products?action=edit&id=${product.id}" method="post" onsubmit="return confirmEditProdct()">
    <h1>Sửa sản phẩm</h1>
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" value="${product.name}" required
    /><br><br>
    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" min="0" value="${product.price}" required
    /><br><br>
    <%--    <label for="size">Size:</label>--%>

    <%--    <select id="size" name="size">--%>
    <%--        <option value="${product.size}">S</option>--%>
    <%--        <option value="${product.size}">M</option>--%>
    <%--        <option value="${product.size}">L</option>--%>
    <%--        <option value="${product.size}">XL</option>--%>
    <%--    </select>--%>
    <label id="sl" for="quantity">Số lượng:</label>
    <input type="number" id="quantity" name="quantity" min="0" value="${product.quantity}" required>
    <br><br>
    <label for="description">Mô tả:</label>
    <input type="text" id="description" name="description" value="${product.description}" required
    /><br><br>

    <label for="image">Link ảnh:</label>
    <input type="text" id="image" value="${product.image}" name="image" oninput="updateImage()" required
    /><br><br>
    <img id="productImage" src="${product.image}" alt="Ảnh sản phẩm"/><br><br>
    <input style="margin-top: 20px" type="submit" value="Lưu sản phẩm"/>
</form>
</body>
</html>
<script type="text/javascript">
    function updateImage() {
        var imageUrl = document.getElementById('image').value;
        var imageElement = document.getElementById('productImage');
        imageElement.src = imageUrl;
    }

    function confirmEditProdct() {
        const userConfirmed = confirm("Bạn có chắc chắn muốn thêm sản phẩm này?");
        if (!userConfirmed) {
            return false;
        }

        alert("Sản phẩm đã được cập nhật!");
        successMessage.style.display = "block";
        setTimeout(function () {
            successMessage.style.display = "none";
        }, 3000);

        return true;
    }

</script>
