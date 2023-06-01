function successOrder() {
	ajax({
		url : '/evenapp/order/success',
		type : 'POST',
		success : function(response) {
			window.location.href = '/evenapp/order/ordersuccess';
		}
	});
}

function moveOrderList() {

	ajax({
		url : '/evenapp/order/orders',
		type : 'GET',
		success : function(response) {
			window.location.href = '/evenapp/order/orders';
		}
	});
}

function getOrderList() {
	const products = $(".order-product-wrapper");
	
	products.each(function(index, product) {
		console.log(product);
		const cnt = +product.querySelector(".order-list-cnt").innerText.replace('개', '');
		const price = +product.querySelector(".order-list-price").innerText.replace(/,/g, '').replace('원', '');
		product.querySelector(".order-list-price").innerText = (cnt * price).toLocaleString() + " 원";
	});
}

$(document).ready(function() {
	getOrderList();
});