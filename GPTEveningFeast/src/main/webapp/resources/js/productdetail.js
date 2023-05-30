function increment() {
	let quantityInput = $('input[name="product_count"]');
	quantityInput.val(+quantityInput.val() + 1);
	printPrice();
}

function decrement() {
	let quantityInput = $('input[name="product_count"]');
	 if (quantityInput.val() > 1) {
		 quantityInput.val(quantityInput.val() - 1 < 0 ? 0 : quantityInput.val() - 1);
	}
	printPrice();
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
		success: function(response){
			console.log(response);
		},
		error: function(err) {
			console.log(err);
		}
	})
}


function orderPage() {
	
}

function printPrice(){
    calculateTotalPrice();
    document.getElementById('product_cnt').addEventListener('change', calculateTotalPrice);
}

function calculateTotalPrice(){
    let price = document.getElementById('product_price').innerText.replace(/,/g, '').replace('원', '');
    let count = document.getElementById('product_cnt').value;
    let total = parseFloat(price) * count;
    document.getElementById('total_price').innerText = total.toLocaleString() + '원';
}




