function calculateTotalPrice(index) {
	let price = +$(`#product_price_${index}`).text().replace(/,/g, '').replace('원', '');
	let count = +$(`#product_cnt_${index}`).val();
	let total = price * count;
	$(`#total_price_${index}`).text(total.toLocaleString() + '원');
}

function increment(index) {
    let quantityInput = $(`#product_cnt_${index}`);
    let quantity = Number(quantityInput.val());
    quantityInput.val(quantity + 1);
    calculateTotalPrice(index);

    // 체크박스 상태 및 총 금액 업데이트
    $('.productCheckbox').trigger('change');
    
}

function decrement(index) {
    let quantityInput = $(`#product_cnt_${index}`);
    let quantity = Number(quantityInput.val());
    if (quantity > 1) {
        quantityInput.val(quantity - 1);
        calculateTotalPrice(index);

        // 체크박스 상태 및 총 금액 업데이트
        $('.productCheckbox').trigger('change');
    }
    
}

let totalPrice;

function totalPricePrint() {
	let totalProductAmount = 0;
    let selectedCount = 0;
    $('.productCheckbox:checked').each(function() {
        const productIndex = $(this).closest('.productContainer').attr("index");
        const productPrice = parseInt($(`#total_price_${productIndex}`).text().replace(',', ''), 10);
        totalProductAmount += productPrice;
        selectedCount++;
    });
    $('.totalAmount p').text("총 상품금액: " + totalProductAmount.toLocaleString() + " 원");
    $('.orderButton').text("주문하기 " + selectedCount);
    
    totalPrice = totalProductAmount;
}


function deleteCartProduct(productId) {
	ajax({
	      url: '/evenapp/cart/delete',
	      type: 'POST',
	      data: {
	    	  productId
	      },

	      success: function(response) {
	    	  if (response="success")
		        alert('상품이 삭제되었습니다.');
		        window.location.href = 'cart';
		  }
	 });
}

function moveToOrder() {
    let cart = updateCartProduct();

    ajax({
        url: '/evenapp/order',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(cart),
        success: function(response) {
        	if (response="success") {
	            window.location.href = '/evenapp/order';
        	}
        }
    });
}


function updateCartProduct() {
	let product;
	const cart = [];
	
	$('.productCheckbox:checked').each(function() {
		product = new Object();

        const productIndex = $(this).closest('.productContainer').attr("index");
        product.productId = $(`#product_id_${productIndex}`).val();
        product.productCnt = parseInt($(`#product_cnt_${productIndex}`).val());
        cart.push(product);
    });
	
	return cart;
}



function quickOrder(index) {
	const product = new Object();
	const cart = []
	
    product.productId = $(`#product_id_${index}`).val();
    product.productCnt = parseInt($(`#product_cnt_${index}`).val());
    product.productName = $('#product-name').text();
    cart.push(product);
	
	ajax({
        url: '/evenapp/order',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(cart),
        success: function(response) {
        	if (response="success") {
	            console.log(response);
	            window.location.href = '/evenapp/order';
        	}
        }
    });	
}

$(document).ready(function() {
	totalPricePrint();
	
	$("#allCheck").click(function() {
	      let isChecked = $(this).prop("checked");
	      $("input[type='checkbox']").prop("checked", isChecked);
	      totalPricePrint();
	    });
	
    $('.productCheckbox').on('change', function() {
    	totalPricePrint();
    });
    
    
});