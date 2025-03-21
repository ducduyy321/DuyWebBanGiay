<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Thêm Bootstrap JS và jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Quần Áo HT</title>
    <link rel="stylesheet" href="/css/homeUser.css">
    <script src="/js/Animation.js" defer></script>


</head>
<body>

<table  style="position: fixed; top: 0;left: 0;width: 100%;background: white;margin-bottom: 10px;z-index: 1000;">
    <tr>
        <td class="logo" style="width: 20%;">
            <h1>
                <a><img style="width: 40%" src="/img/logo.png"></a>
            </h1>
        </td>

        <td style="text-align: center;">
            <ul class="menu">
                <li>
                    Giày
                </li>
                <li>
                    Bán Chạy
                </li>
                <li>
                    Quần
                </li>
                <li>
                    Áo
                </li>
            </ul>
        </td>

        <td style="text-align: right; width: 20%;">
            <div class="search-cart">
                <input type="text" class="search-input" placeholder="Tìm kiếm">
                <button class="search-btn">🔎</button>
                <form action="/user?action=showCart" method="post">
                    <button type="submit" style="background:none; border:none;">
                        <span class="cart">🛒</span>
                    </button>
                </form>
                <div class="user-dropdown">
                    <span class="user-icon" id="userIcon">👤</span>
                    <div class="dropdown-content" id="dropdownContent">
                        <form  action="/products?action=logoutHomeUser" method="post" onsubmit="return confirmLogout()">
                            <a href="#">Thông tin người dùng</a>
                            <button id="logoutBtn">🔓 Đăng xuất</button>
                        </form>
                    </div>
                </div>
            </div>
        </td>
    </tr>
</table>
<div style="margin-top: 110px" id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="/img/logochat.webp" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/slide_4_img.webp" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="/img/slide_3_img.webp" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<section>
    <h1 style="font-weight: bold; padding: 10px">Danh sách sản phẩm</h1>

    <div class="container">
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-3" style="padding: 20px">
                    <div class="card">

                        <img src="${product.image}" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="text-primary">Giá : ${product.price} đ</p>
                        </div>
                        <div class="d-flex">
                            <form action="${pageContext.request.contextPath}/user?action=showDetailProduct&id=${product.id}"
                                  method="post">
                                <div>
                                    <button style="background: #4CAF50;width: 110px;margin-left: 20px" type="submit"
                                            class="btn btn-danger ms-1">Chi tiết
                                    </button>
                                </div>
                            </form>
                            <form action="/product?action=addToCart&id=${product.id}&quantity=1" method="post" onsubmit="return showSuccessMessage()">
                                <div>
                                    <button style="background: red;width: 75px" type="submit"
                                            class="btn btn-danger ms-1">Mua
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

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

<script>
    function confirmLogout() {
        const userConfirmed = confirm("Bạn có chắc chắn muốn đăng xuất không?");
        if (!userConfirmed) {
            return false;
        }
        return true;
    }
    function showSuccessMessage() {
        alert("Sản phẩm đã được thêm vào giỏ hàng thành công!");
        successMessage.style.display = "block";
        setTimeout(function() {
            successMessage.style.display = "none";
        }, 3000);

        return true;
    }
</script>


