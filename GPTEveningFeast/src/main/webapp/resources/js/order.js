function successOrder() {
    ajax({
        url: '/evenapp/order/success',
        type: 'POST',
        success : function(response) {
        	window.location.href = '/evenapp/order/ordersuccess';
        }
    });
}

let index=0;

function moveOrderList(idx) {
	
	index=idx;
	console.log(index);
	
    ajax({
        url: '/evenapp/order/orders',
        type: 'GET',
        success : function(response) {
        	window.location.href = '/evenapp/order/orders';
        }
    });
}

function getOrderList(index) {
	for (let i=0; i < index; i++) {
		const cnt = +$(`#order-list-cnt_${i}`).text();
		const price = +$(`#order-list-price_${i}`).text();
		$(`#order-list-price_${i}`).text(price * cnt);
	}
	
	console.log(totalPrice);
}

$(document).ready(function() {
	getOrderList(index);
});