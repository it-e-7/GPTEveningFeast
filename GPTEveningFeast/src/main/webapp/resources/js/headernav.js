const ctgrList = $('.ctgr');

ajax({
	url : "/evenapp/category",
	method : "GET",
	success : function(data) {
		data.forEach(ctgr => {
			const li = $(`<li class="depth1"></li>`);
			const a = $(`<a href="/evenapp/product?category=` + ctgr.ctgrId + `" class="depth1-a">` + ctgr.name + `</a>`);
			li.append(a);
			
			const ul2 = $(`<ul class="depth2"></ul>`);
			ul2.append($(`<li><a href="/evenapp/product?category=` + ctgr.ctgrId + `" class="depth2-a"> 전체보기 </a></li>`))
			ctgr.sections.forEach(section => {
				const li2 = $(`<li></li>`);
				const a2 = $(`<a href="/evenapp/product?category=` + ctgr.ctgrId + `&section=` + section.sectId + `" class="depth2-a">` + section.name + `</a>`);
				
				li2.append(a2);
				ul2.append(li2);
			});
			li.append(ul2);
			
			$('.ctgr').append(li);
		})
	}
});