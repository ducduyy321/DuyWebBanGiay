function showTemporaryMessage(input, message) {
    input.setCustomValidity(message);
    setTimeout(() => {
        input.setCustomValidity('');
    }, 5000);
}
function validateFormProduct() {
    const name = document.getElementById("name").value.trim();
    const price = document.getElementById("price").value;
    const quantity = document.getElementById("quantity").value;
    const description = document.getElementById("description").value.trim();
    const image = document.getElementById("image").value.trim();

    if (name === "") {
        alert("Vui lòng nhập tên sản phẩm.");
        return false;
    }

    if (price === "" || isNaN(price) || price <= 0) {
        alert("Vui lòng nhập giá sản phẩm hợp lệ (lớn hơn 0).");
        return false;
    }

    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Vui lòng nhập số lượng sản phẩm hợp lệ (lớn hơn 0).");
        return false;
    }

    if (description === "") {
        alert("Vui lòng nhập mô tả sản phẩm.");
        return false;
    }

    const urlPattern = /^(http|https):\/\/[^ "]+$/;
    if (image === "" || !urlPattern.test(image)) {
        alert("Vui lòng nhập đường dẫn hình ảnh hợp lệ (bắt đầu với http hoặc https).");
        return false;
    }
    const userConfirmed = confirm("Bạn có chắc chắn muốn thêm sản phẩm này?");
    if (!userConfirmed) {
        return false;
    }
    return true;
}






