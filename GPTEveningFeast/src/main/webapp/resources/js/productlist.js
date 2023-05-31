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
		const searchParam = urlParams.get("searchParam");
		
		const offset = +$(".product-list-container").data("offset") + 1;
		$(".product-list-container").data("offset", offset);
		
		const url = searchParam ? "/evenapp/search/scroll" : "/evenapp/product/scroll";
		const data = searchParam ? { searchParam, offset } : { ctgrId, sectId, offset };
		
		const container = $(".product-list-container");
		
		ajax({
			url: url,
			type: 'POST',
			data: data,
			success: function(response) {
				response.forEach(product => {
					container.append($(
					`<li>
						<a href="/evenapp/product/${ product.productId }">
							<img src="${ product.productImgUrl }">
							<p>${ product.productName }</p>
							<p>${ product.productPrice }</p>
						</a>
					</li>`));
				});
				setTimeout(() => {
					scrollLock = false;
					if(response.length < 20) {
						scrollLock = true;
					}
				}, 500);
			}
		});
	}
	
}

//현재 스크롤 위치 저장
let lastScroll = 0;

$(document).scroll(function(e){
    //현재 높이 저장
    var currentScroll = $(this).scrollTop();
    //전체 문서의 높이
    var documentHeight = $(document).height();

    //(현재 화면상단 + 현재 화면 높이)
    var nowHeight = $(this).scrollTop() + $(window).height();


    //스크롤이 아래로 내려갔을때만 해당 이벤트 진행.
    if(currentScroll > lastScroll){

        //nowHeight을 통해 현재 화면의 끝이 어디까지 내려왔는지 파악가능 
        //즉 전체 문서의 높이에 일정량 근접했을때 글 더 불러오기)
        if(documentHeight < (nowHeight + (documentHeight*0.1))){
            scrollList();
        }
    }

    //현재위치 최신화
    lastScroll = currentScroll;

});