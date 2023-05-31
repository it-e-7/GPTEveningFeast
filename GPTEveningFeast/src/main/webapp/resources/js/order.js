function successOrder() {
    ajax({
        url: '/evenapp/order/success',
        type: 'POST',
        success : function(response) {
        	window.location.href = '/evenapp/order/ordersuccess';
        }
    });
}