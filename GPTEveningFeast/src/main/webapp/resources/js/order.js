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
	const orders = $(".order-list-wrapper");
	
	orders.each(function(index, order) {
		const products = order.getElementsByClassName("order-product-wrapper");
		let totalPrice = 0;
		
		for(let i = 0; i < products.length; i++) {
			const product = products[i];
			const cnt = +product.querySelector(".order-list-cnt").innerText.replace('개', '');
			const price = +product.querySelector(".order-list-price").innerText.replace(/,/g, '').replace('원', '');
			const cntPrice = cnt * price;
			totalPrice += cntPrice;
			product.querySelector(".order-list-price").innerText = cntPrice.toLocaleString() + " 원";	
		}
		
		order.querySelector(".order-list-total-price").innerText = totalPrice.toLocaleString() + " 원";
	});
	
}

$(document).ready(function() {
	getOrderList();
});