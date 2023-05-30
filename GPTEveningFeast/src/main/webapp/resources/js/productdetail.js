function increment() {
	let quantityInput = $('input[name="product_count"]');
	quantityInput.val(+quantityInput.val() + 1);
	calculateTotalPrice();
}

function decrement() {
	let quantityInput = $('input[name="product_count"]');
	if (quantityInput.val() > 1) {
		 quantityInput.val(quantityInput.val() - 1 < 0 ? 0 : quantityInput.val() - 1);
	}
	calculateTotalPrice();
}

function cart(productId) {
	const productCnt = $('input[name="product_count"]').val();
	
	ajax({
		url: '/evenapp/cart',
		type: 'POST',
		data: {
			productId,
			productCnt,
		},
	});
}

function calculateTotalPrice(){
    let price = +$('#product_price').text().replace(/,/g, '').replace('원', '');
    let count = +$('#product_cnt').val();
    let total = price * count;
    $('#total_price').text(total.toLocaleString() + '원');
}




