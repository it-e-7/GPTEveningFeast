function clickSignin() {
	const userId = $('input[name="userId"]').val();
	const userPw = $('input[name="userPw"]').val();
	
	$.ajax({
		url: "/evenapp/signin",
		method: "POST",
		data: {
			userId,
			userPw
		},
		success: function(data) {
			if(data.result === 'success') {
				alert("로그인 성공");
				location.href = "/evenapp";
			} else {
				alert("아이디/비밀번호를 다시 확인해주세요");
				$('input[name="userId"]').val('');
				$('input[name="userPw"]').val('');
			}
		}
	})
}