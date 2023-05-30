function cartGPT() {
	let productList = [];
	
	$("input[name=product]:checked").each(function() {
		productList.push($(this).val());
	});
	
	ajax({
		url: "/evenapp/gpt/cart",
		method: "post",
		data: {
			productList,
		},
		success: function(response) {
			location.href = "/evenapp/cart";
		}
	});
}