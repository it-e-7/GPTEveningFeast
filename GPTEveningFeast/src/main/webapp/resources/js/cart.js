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
    let delivaryCharge = 0;
    $('.productCheckbox:checked').each(function() {
        const productIndex = $(this).closest('.productContainer').attr("index");
        const productPrice = +$(`#total_price_${productIndex}`).text().replace(/,/g, '').replace('원', '');
        totalProductAmount += productPrice;
        selectedCount++;
    });
    $('#totalAmount').text(totalProductAmount.toLocaleString() + " 원");
    $('.orderButton').text("주문하기 " + selectedCount);
    
    delivaryCharge = (totalProductAmount < 50000 ? 3500 : 0);
    console.log(delivaryCharge);
    $('#delivery-price-text').text(delivaryCharge.toLocaleString() + " 원");
    
    totalPrice = totalProductAmount;
    
    $('#last-total-price').text((totalPrice+delivaryCharge).toLocaleString() + " 원");
    
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
    const cnt = +$('.orderButton').text().replace('주문하기', '');
   
    if (cnt > 0) {
        ajax({
            url: '/evenapp/order',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json; charset=UTF-8',
            data: JSON.stringify({cart:cart, productPrice:totalPrice}),
            success: function(response) {
            	
            	console.log(response);
            	if (response.status="success") {
    	            window.location.href = '/evenapp/order';
            	}
            }
        });
    }
    else {
    	alert("주문할 상품이 없습니다.");
    }
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
    product.productCnt = +$(`#product_cnt_${index}`).val();
    product.productName = $(`#product_name_${index}`).text();
    const price = +$(`#total_price_${index}`).text().replace(/,/g, '').replace('원', '');
    cart.push(product);
	  
	ajax({
        url: '/evenapp/order/quick',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({cart:cart, productPrice:price}),
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