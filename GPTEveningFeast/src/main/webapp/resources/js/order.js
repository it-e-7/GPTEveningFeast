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
	console.log("getOrderList");
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
	console.log("구매 완료 페이지");
	getOrderList();
	
	const totalPrice = +$('.orderprice strong em').text().replace(/,/g, '').replace('원', '');
	const deliCharge = totalPrice > 50000 ? 0 : 3500;	 
	$('.plus strong em').text(deliCharge.toLocaleString());
	
	
});