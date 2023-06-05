let validateId = false;
let pwNext = false;
let docTitle=document.title;


function validateUniqueUserId() {
	const userId = $('input[name="userId"]').val();
	ajax({
		url: '/evenapp/signup/validation',
		type: 'POST',
		data: {
			userId
		},
		success: function(response){
			if (response=="success") {
				validateId = true;
				alert("해당 아이디는 사용 가능합니다.");
			} else {
				alert("이미 존재하는 아이디 입니다.");
			}
				
		}
	});
}

function changeId() {
	validateId = false;
}

function submitForm() {
	if(validateId === true && pwNext===true) {
		const userId = $('input[name="userId"]').val();
		const userPw = $('input[name="userPw"]').val();
		const userName = $('input[name="userName"]').val();
		const userBirth = $('input[name="userBirth"]').val();
		const userSex = $('input[name="userSex"]:checked').val();
		let userAddress = $('input[name="userAddress"]').val();
		const detailAddress = $('input[name="detailAddress"]').val();
		const extraAddress = $('input[name="extraAddress"]').val();
		userAddress = userAddress + extraAddress + " " + detailAddress
		ajax({
			url: '/evenapp/signup/success',
			type: 'POST',
			data: {
				userId,
				userPw,
				userName,
				userBirth,
				userSex,
				userAddress,
			},
			success: function(response) {
				alert('회원가입 성공!');
				window.location.href = '/evenapp/signup/success';
			},
			error : function(response) {
				alert('회원가입 실패: 알 수 없는 이유로 회원가입에 실패했습니다. 다시 시도하세요.');
				location.href = '/evenapp/signup';
			}
		});
	} else if (validateId === false) {
		alert('아이디 중복확인을 진행해주세요 !');
	} else {
		alert('입력하신 비밀번호가 일치하지 않습니다 !');
	}
	
}

function checkPw(){
	const pw1 = $('input[name="userPw"]').val();
	const pw2 = $('input[name="pwCheck"]').val();
	
	pwNext = (pw1===pw2)
}

function agree() {
	const firstAgree = $("#firstAgree").is(":checked");
	const secondAgree = $("#secondAgree").is(":checked");

	if (firstAgree && secondAgree) {
		ajax({
			url: '/evenapp/signup/agreement',
			type: 'POST',
			data: {
				agreement: true
			},
			success: function(response) {
				alert('약관에 동의하셨습니다.');
				window.location.href = 'form';
			}
		});
	} else {
		alert('모든 약관에 동의하셔야 합니다.');
	}
}

$(document).ready(function() {
    $("#allAgree").click(function() {
      let isChecked = $(this).prop("checked");
      $("input[type='checkbox']").prop("checked", isChecked);
    });
  });

window.addEventListener("blur",() =>{document.title="ComeBack ;(";});
window.addEventListener("focus",() =>{document.title=docTitle;});


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
