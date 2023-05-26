/*function increment() {
	let quantityInput = $('input[name="product_count"]');
	quantityInput.val(+quantityInput.val() + 1);
	printPrice();
}

function decrement() {
	let quantityInput = $('input[name="product_count"]');
	 if (quantityInput > 1) {
	    	quantityInput--;
	    	quantityInput.val(quantityInput.val() - 1 < 0 ? 0 : quantityInput.val() - 1);
	    }
	printPrice();
}
*/
function increment(index) {
	let quantityInput = $(`#product_cnt_${index}`);
	quantityInput.val(+quantityInput.val() + 1);
	printPrice(index);
}

function decrement(index) {
	let quantityInput = $(`#product_cnt_${index}`);
	if (quantityInput.val() > 1) {
		quantityInput.val(quantityInput.val() - 1);
	}
	printPrice(index);
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
/*
function printPrice(){
    calculateTotalPrice();
    document.getElementById('product_cnt').addEventListener('change', calculateTotalPrice);
}

function calculateTotalPrice(){
    let price = document.getElementById('product_price').innerText.replace(/,/g, '').replace('원', '');
    let count = document.getElementById('product_cnt').value;
    let total = parseFloat(price) * count;
    document.getElementById('total_price').innerText = total.toLocaleString() + '원';
}*/

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


