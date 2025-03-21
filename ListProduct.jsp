<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/17/2024
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/List.css">
    <script src="/js/LoadDataProduct.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body style="width: 99%;padding: 1px">
<div style="display: flex">
    <div id="left" style="width: 20%">
        <div style="height: 700px">
            <button id="homepage" onclick="loadHome()" name="Trang chủ">Trang chủ</button>
            <form action="/products?action=" method="get">
                <button>
                    Sản phẩm
                </button>
            </form>

            <button name="Người Dùng">Người dùng</button>
            <form action="/products?action=logout" method="post" onsubmit="return confirmLogout()">
                <button id="logout" name="Đăng Xuất">Đăng xuất</button>
            </form>
        </div>
    </div>
    <div style="width: 78% ; margin-left: 20px">
        <h1 style="text-align: center;font-size: 3.0rem">Danh sách sản phẩm</h1> <br>
        <div style="display: flex; flex-direction: column; align-items: flex-start; gap: 20px; margin-top: -20px">
            <div style="display: flex; align-items: center; gap: 10px;">
                <form action="products?action=search" method="post">
                    <input style="margin-left: 2px" id="search" name="text" type="text" placeholder="Nhập từ khóa...">
                    <button type="submit"
                            style="width: 120px; background-color: #007BFF; color: white; border: none; border-radius: 5px; cursor: pointer;margin-top: 10px;text-align: center">
                        Tìm kiếm
                    </button>
                </form>
            </div>
            <form action="products?action=interfaceAdd" method="post">
                <div>
                    <button id="button" type="submit"
                            style="width: 200px;margin-left: 500px; background-color: #28A745; color: white; font-size: 16px;
                border: none; border-radius: 5px; cursor: pointer;margin-top: -98px;">
                        Thêm sản phẩm
                    </button>
                </div>
            </form>
        </div>
        <table style="margin-top: -40px">
            <thead>
            <tr style="height: 45px">
                <th style="background: #e1a7a7">STT</th>
                <th style="background: #e1a7a7">Hình ảnh</th>
                <th style="background: #e1a7a7">Tên sản phầm</th>
                <th style="background: #e1a7a7">Giá</th>
                <th style="background: #e1a7a7">Số lượng</th>
                <th style="background: #e1a7a7">Mô tả</th>
                <th style="background: #e1a7a7">Trạng thái</th>
                <th style="background: #e1a7a7">Chức Năng</th>
            </tr>
            </thead>
        </table>
        <div style="margin: auto; width: 100%; overflow-y: auto; max-height: 500px; border: 1px solid #ccc;">

            <table>

                <c:forEach var="products" items="${products}">
                <tr>
                    <td><c:out value="${products.id}"/></td>
                    <td><img src="${products.image}" width="100px" height="100px"></td>
                    <td><c:out value="${products.name}"/></td>
                    <td><c:out value="${products.price}"/> vnđ</td>
                    <td><c:out value="${products.quantity}"/></td>
                    <td><c:out value="${products.description}"/></td>
                    <td>
                        <c:choose>
                            <c:when test="${products.quantity == 0}">
                                Hết hàng
                            </c:when>
                            <c:when test="${products.quantity > 0}">
                                Còn hàng
                            </c:when>

                        </c:choose>
                    </td>
                    <td>
                        <a href="/products?action=edit&id=${products.id}">Sửa</a>
                    </td>
                </tr>
                </c:forEach>
        </div>

        </table>
    </div>

</div>
</body>
</html>
<script>
    function confirmLogout() {
        const userConfirmed = confirm("Bạn có chắc chắn muốn đăng xuất không?");
        return userConfirmed;
    }
</script>
