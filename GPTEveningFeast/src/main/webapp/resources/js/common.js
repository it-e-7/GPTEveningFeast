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
			console.log(err);
		}
		
		if(success) {
			success(response);
		}
	}
	
	$.ajax(config);
}

$(document).ready(function() {
    $('a[href="/evenapp/signout"]').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: '/evenapp/signout',
            type: 'POST',
            success: function(response) {
                window.location.href = '/evenapp';
            },
            error: function(response) {
                alert('로그아웃 실패: 알 수 없는 이유로 로그아웃에 실패하였습니다. 다시 시도하세요.');
            }
        });
    });
});