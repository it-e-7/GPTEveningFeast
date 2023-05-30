function ajax(config) {
	const success = config.success;
	config.success = (response) => {
		try {
			response = JSON.parse(response);
			if(response.redirect) {
				alert(response.msg);
				window.location.href = response.redirect;
				return;
			}
		} catch (err) {
			// JSON 형식으로 내려온 데이터가 아닌 경우
			console.log(response);
		}
		
		if(success) {
			success(response);
		}
	}
	
	$.ajax(config);
}