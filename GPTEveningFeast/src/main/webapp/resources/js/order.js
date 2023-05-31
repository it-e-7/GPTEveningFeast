function successOrder() {
    ajax({
        url: '/evenapp/order/success',
        type: 'POST',
        success : function(response) {
        	window.location.href = '/evenapp/order/ordersuccess';
        }
    });
}


function moveOrderList() {
	
    ajax({
        url: '/evenapp/order/orders',
        type: 'GET',
        success : function(response) {
        	window.location.href = '/evenapp/order/orders';
        }
    });
}