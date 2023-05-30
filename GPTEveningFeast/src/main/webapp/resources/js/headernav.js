const ctgrList = $('.ctgr');

ajax({
	url : "/evenapp/category",
	method : "GET",
	success : function(data) {
		data.forEach(ctgr => {
			const li = $(`<li class="depth1"></li>`);
			const a = $(`<a href="/evenapp/product?category=` + ctgr.ctgrId + `">` + ctgr.name + `</a>`);
			li.append(a);
			
			const ul2 = $(`<ul class="depth2"></ul>`);
			ctgr.sections.forEach(section => {
				const li2 = $(`<li></li>`);
				const a2 = $(`<a href="/evenapp/product?category=` + ctgr.ctgrId + `&section=` + section.sectId + `">` + section.name + `</a>`);
				
				li2.append(a2);
				ul2.append(li2);
			});
			li.append(ul2);
			
			$('.ctgr').append(li);
		})
	}
});