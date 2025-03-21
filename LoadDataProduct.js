function loadProductPage() {
    var xhr = new XMLHttpRequest();

    xhr.open('GET', '/products?action=' + action, true);
    xhr.open('GET', '/view/ListProduct.jsp', true);

    xhr.onload = function() {
        if (xhr.status === 200) {
            document.getElementById('content').innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}
function loadHome(){
    window.location.href = "/products?action=home";
}

