function clickUpdate() {
	
	const userPw = $('input[name="userPw"]').val();
	const userAddress = $('input[name="userAddress"]').val();
	
	ajax({
		url: '/evenapp/update/updateUser',
		type: 'POST',
		data: JSON.stringify({
			userPw: userPw,
			userAddress: userAddress,
		}),
		contentType: "application/json",
		dataType: "json",
		complete: function(response) {
			if(response.status == 200) {
				alert('회원정보 변경 성공');
				window.location.href = '/evenapp';
			}else {
                alert('회원정보 변경 실패: 알 수 없는 이유로 회원정보 변경에 실패하였습니다. 다시 시도하세요.');
                location.href = '/evenapp';
            }
		}
	});
}
