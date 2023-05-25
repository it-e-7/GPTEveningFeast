function increment() {
	let quantityInput = $('input[name="product_count"]');
	quantityInput.val(+quantityInput.val() + 1);
}

function decrement() {
	let quantityInput = $('input[name="product_count"]');
	quantityInput.val(quantityInput.val() - 1 < 0 ? 0 : quantityInput.val() - 1);
}


function cart(productId) {
	const productCnt = $('input[name="product_count"]').val();
	
	$.ajax({
		url: '/evenapp/cart',
		type: 'POST',
		data: {
			productId,
			productCnt,
		},
		success: function(response){
			console.log(response)
	
		}
	})
	
}

function orderPage() {
	
}
