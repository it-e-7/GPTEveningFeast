function clickUpdate() {
	
	const userPw = $('input[name="userPw"]').val();
	let userAddress = $('input[name="userAddress"]').val();
	const detailAddress = $('input[name="detailAddress"]').val();
	const extraAddress = $('input[name="extraAddress"]').val();
	userAddress = userAddress + extraAddress + " " + detailAddress
	
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


function addressSearch(){
	new daum.Postcode({
	    oncomplete: function(data) {
	        var addr = '';
	        var extraAddr = '';

	        if (data.userSelectedType === 'R') {
	            addr = data.roadAddress;
	        } else {
	            addr = data.jibunAddress;
	        }

	        if(data.userSelectedType === 'R'){
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraAddr += data.bname;
	            }
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if(extraAddr !== ''){
	                extraAddr = ' (' + extraAddr + ')';
	            }
	            document.getElementById("extraAddress").value = extraAddr;
	        
	        } else {
	            document.getElementById("extraAddress").value = '';
	        }

	        document.getElementById("userAddress").value = addr;
	        document.getElementById("detailAddress").focus();    }
	}).open();
}
