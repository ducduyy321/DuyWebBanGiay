<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/24/2024
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Thanh toán</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/homeUser.css">
    <link rel="stylesheet" href="/css/Pay.css">
</head>
<body style="margin: auto">
<div style="display: flex;padding: 20px ;margin-left: 100px;">
    <img src="/img/logo.png" width="150px" height="100px">
    <h1 style="padding: 10px;margin-top: 35px;font-size: 45px;width: 100%">| Thanh Toán</h1>

    <div class="search-cart" style="width: 60% ; margin-left: 700px">
        <div class="user-dropdown">
            <span style="font-size: 60px" id="userIcon">👤</span>
            <div class="dropdown-content" id="dropdownContent">
                <form action="/products?action=logoutHomeUser" method="post"
                      onsubmit="return confirmLogout()">
                    <a href="#">Thông tin người dùng</a>
                    <button id="logoutBtn">🔓 Đăng xuất</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div style="background: #eeeeee;padding: 10px">
    <div style="background: white; width: 80%;margin: auto">
        <table style="margin-top: 10px;width: 100%;text-align: center;border: none">
            <thead>
            <tr>
                <th style="padding: 0px;">Sản phẩm</th>
                <th style="text-align: left"></th>
                <th>Size</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty selectedProducts}">
                <c:set var="totalBill" value="0"/>
                <c:forEach items="${selectedProducts}" var="product">
                    <tr>
                        <td><img src="${product.image}" style="max-width: 100px; max-height: 100px;"></td>
                        <td style="text-align: left">${product.name}</td>
                        <td name="size" >${product.size}</td>
                        <td name="quantity">${product.quantity}</td>
                        <td>${product.price} đ</td>
                        <td>
                            <label>
                                <fmt:formatNumber value="${product.price * product.quantity}" type="currency"
                                                  currencySymbol="đ"
                                                  pattern="#,##0"/>.000 đ
                            </label>
                        </td>
                    </tr>
                    <c:set var="totalBill" value="${totalBill + (product.price * product.quantity)}"/>
                </c:forEach>
            </c:if>
            <c:if test="${empty selectedProducts}">
                <tr>
                    <td colspan="6">Không có sản phẩm nào được chọn</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <div style="margin: auto;width: 80%;">
            <form style="margin-top: 40px" action="/product?action=PayBill" method="post" onsubmit="return validatePaymentMethod()">
                <div style=" margin: auto;">
                    <label><strong>Phương thức thanh toán:</strong></label><br>
                    <div>
                        <input type="radio" id="transfer" name="paymentMethod" value="Chuyển khoản">
                        <label for="transfer">Chuyển khoản</label>
                    </div>
                    <div style="margin-right: 10px">
                        <input type="radio" id="cod" name="paymentMethod" value="Thanh toán khi nhận hàng" >
                        <label for="cod">Thanh toán khi nhận hàng</label>
                    </div>
                </div>

                <div style="display: flex ; margin-left: 510px;margin-top: -50px">
                    <label name="totalBill" style="padding: 10px ;width: 300px; color: red">Tổng tiền hàng :
                        <fmt:formatNumber value="${totalBill}" type="currency" currencySymbol="đ" pattern="#,##0"/>.000
                        đ
                    </label>
                    <input type="hidden" name="totalBill" value="${totalBill}">
                    <c:forEach items="${selectedProducts}" var="product">
                        <input type="hidden" name="selectedProductIds" value="${product.id}">
                        <input type="hidden" name="selectedProductQuantitys" value="${product.quantity}">
                        <input type="hidden" name="selectedProductSizes" value="${product.size}">
                    </c:forEach>

                    <button style="color: white;background: red;border: none;padding: 10px;border-radius: 5px;width: 120px;height: 40px">
                        Đặt hàng
                    </button>
                </div>


            </form>
        </div>
    </div>
</div>

<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h1>
                <a href="http://localhost:8081/user"><img style="width: 40%" src="/img/logo.png"></a>
            </h1>
            <p> Cửa Hàng Thời Trang
                <HT></HT>
            </p>
            <p>Chủ sở hữu: Đỗ QUốc Huy</p>

            <a style="color: black" href="https://www.facebook.com/oquochuy.634694?locale=vi_VN">FaceBook: Quốc Huy</a>
            <br><br>
            <a style="color: black" href="https://mail.google.com/mail/u/0/#inbox/FMfcgzQXKWjgwHLSPNnZHBWdKjVMzfTg?compose=new">Email: doquochuyy66@gmail.com</a>
        </div>
        <div class="footer-section">
            <h3>CHÍNH SÁCH KHÁCH HÀNG</h3>
            <ul>
                <li>Chính sách khách hàng</li>
                <li>Chính sách thanh toán</li>
                <li>Chính sách đổi trả</li>
                <li>Chính sách bảo hành</li>
                <li>Chính sách mua hàng</li>
                <li>Chính sách giao nhận</li>
                <li>Chính sách kiểm hàng</li>
                <li>Chính sách bảo mật</li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>THÔNG TIN CỬA HÀNG</h3>
            <p>Địa chỉ: QL32, Đức Giang, Hoài Đức, Hà Nội</p>
        </div>
        <div class="footer-section">
            <h3>LIÊN HỆ</h3>
            <a style="color: black" href="https://mail.google.com/mail/u/0/#inbox">Email:viettam205@gmail.com</a>
        </div>
    </div>
</footer>


</body>
</html>

<script type="text/javascript">
    function validatePaymentMethod() {
        var paymentMethodSelected = document.querySelector('input[name="paymentMethod"]:checked');
        if (!paymentMethodSelected) {
            alert("Vui lòng chọn phương thức thanh toán!");
            return false;
        }
        alert("Đặt hàng thành công!");
        return true;
    }
</script>
