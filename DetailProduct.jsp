<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/19/2024
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/DetailProduct.css">

<body style="text-align: center">

<form action="/product?action=addToCart&id=${product.id}" method="post" onsubmit="return showSuccessMessage()">
    <div style="width: 1100px;height: 600px;display: flex">
        <div class="imageDetail" style="width: 600px;margin-top: 90px;height: 300px">
            <img src="${product.image}" width="350px" height="400px" />
        </div>
        <div class="text" style="width: 450px;text-align: left;margin-left: -20px;">
            <h1 style="border: red;padding: 5px;">Chi tiết sản phẩm</h1>
            <h3 style="padding: 5px;" name="name">Tên sản phẩm: ${product.name}</h3>
            <h3 style="padding: 5px;" name="price">Giá sản phẩm: ${product.price}</h3>
            <h3 style="padding: 5px;">Số lượng: <input style="height: 25px" type="number" name="quantity" value="1" min="1" max="${product.quantity}"></h3>
            <h3 style="padding: 5px" nonce="discription">Mô tả: ${product.description}</h3>
            <button  type="submit" >Thêm giỏ hàng</button>
        </div>
    </div>
</form>

</body>
</html>
<script>
    function showSuccessMessage() {
        alert("Sản phẩm đã được thêm thành công!");
        return true;
    }
</script>
