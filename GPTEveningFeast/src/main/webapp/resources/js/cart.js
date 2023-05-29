function printPrice(index) {
	calculateTotalPrice(index);
	document.getElementById(`product_cnt_${index}`).addEventListener('change', () => calculateTotalPrice(index));
}


function calculateTotalPrice(index) {
	let price = document.getElementById(`product_price_${index}`).innerText.replace(/,/g, '').replace('원', '');
	let count = document.getElementById(`product_cnt_${index}`).value;
	let total = parseFloat(price) * count;
	document.getElementById(`total_price_${index}`).innerText = total.toLocaleString() + '원';
}
/*
 * function increment(index) { let quantityInput = $(`#product_cnt_${index}`);
 * quantityInput.val(+quantityInput.val() + 1); printPrice(index); }
 * 
 * function decrement(index) { let quantityInput = $(`#product_cnt_${index}`);
 * if (quantityInput.val() > 1) { quantityInput.val(quantityInput.val() - 1); }
 * printPrice(index); }
 */
function increment(index) {
    let quantityInput = document.getElementById(`product_cnt_${index}`);
    let quantity = Number(quantityInput.value);
    quantityInput.value = quantity + 1;
    calculateTotalPrice(index);

    // 체크박스 상태 및 총 금액 업데이트
    $('.productCheckbox').trigger('change');
}

function decrement(index) {
    let quantityInput = document.getElementById(`product_cnt_${index}`);
    let quantity = Number(quantityInput.value);
    if (quantity > 1) {
        quantityInput.value = quantity - 1;
        calculateTotalPrice(index);

        // 체크박스 상태 및 총 금액 업데이트
        $('.productCheckbox').trigger('change');
    }
}


function totalPricePrint() {
	let totalProductAmount = 0;
    let selectedCount = 0;
    $('.productCheckbox:checked').each(function() {
        const productIndex = $(this).closest('.productContainer').attr("index");
        const productPrice = parseInt($('#total_price_' + productIndex).text().replace(',', ''), 10);
        totalProductAmount += productPrice;
        selectedCount++;
    });
    $('.totalAmount p').text("총 상품금액: " + totalProductAmount.toLocaleString() + " 원");
    $('.orderButton').text("주문하기 " + selectedCount);
}


function deleteCartProduct(productId) {
	console.log(productId);
	$.ajax({
	      url: '/evenapp/cart/delete',
	      type: 'POST',
	      data: {
	    	  productId
	      },

	      success: function(response) {
	    	  console.log(response)
	    	  if (response="success")
		        alert('상품이 삭제되었습니다.');
		        window.location.href = 'cart';
		  }
	 });
}

function moveToOrder() {
    let cart = updateCartProduct();
    $.ajax({
        url: '/evenapp/order',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(cart),
        success: function(response) {
            console.log(response);
            window.location.href = '/evenapp/order';
        }
    });
}

function updateCartProduct() {
	let product;
	const cart = []
	
	$('.productCheckbox:checked').each(function() {
		product = new Object();
		
        const productIndex = $(this).closest('.productContainer').attr("index");
        product.productId = $('#product_id_' + productIndex).val();
        product.productCnt = parseInt($('#product_cnt_' + productIndex).val());
        
        cart.push(product);
    });
	
	cart.forEach(function(object, index){
		console.log(object.productId + ", " + object.productCnt);
	});
	
	return cart;
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