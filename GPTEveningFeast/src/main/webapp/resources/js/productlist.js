let scrollLock = false;
const urlParams = new URLSearchParams(window.location.search);

setTimeout(() => {
	scrollLock = false;
}, 1000);

function scrollList() {

	if(scrollLock === false){
		scrollLock = true;
		const ctgrId = urlParams.get("category");
		const sectId = urlParams.get("section");
		const offset = +$(".product-list-container").data("offset") + 1;
		$(".product-list-container").data("offset", offset);
		
		ajax({
			url: "/evenapp/product/scroll",
			type: 'POST',
			data: {
				ctgrId,
				sectId,
				offset
			},
			success: function(response) {
				console.log(response);
				scrollLock = false;
			}
		});
	}
	
}