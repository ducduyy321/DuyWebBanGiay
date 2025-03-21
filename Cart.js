function updateTotal() {
    let total = 0;

    document.querySelectorAll('tr').forEach(function(row) {
        let checkbox = row.querySelector('input[type="checkbox"]');
        let quantityInput = row.querySelector('input[type="number"]');
        let priceLabel = row.querySelector('td:nth-child(4) label');
        let amountCell = row.querySelector('td:nth-child(7) label');

        if (checkbox && checkbox.checked) {
            let quantity = parseInt(quantityInput.value);
            let price = parseFloat(priceLabel.innerText.replace(' đ', '').trim());
            let amount = quantity * price;

            // Cập nhật số tiền cho mỗi sản phẩm trong bảng
            amountCell.innerText = amount.toLocaleString() + '.000 đ';

            // Cộng tổng tiền
            total += amount;
        }
    });

    // Cập nhật tổng tiền
    document.getElementById('total').innerText = "Tổng tiền: " + total.toLocaleString() + '.000 đ';
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('input[type="number"]').forEach(function(input) {
        input.addEventListener('input', updateTotal);
    });

    document.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {
        checkbox.addEventListener('change', updateTotal);
    });

    updateTotal();


    const selectAllCheckbox = document.getElementById('selectAll');
    const individualCheckboxes = document.querySelectorAll('input[type="checkbox"]:not(#selectAll)');

    selectAllCheckbox.addEventListener('change', function() {
        individualCheckboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });
        updateTotal();
    });

    individualCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            const allChecked = Array.from(individualCheckboxes).every(function(checkbox) {
                return checkbox.checked;
            });
            selectAllCheckbox.checked = allChecked;
            updateTotal();
        });
    });
});

