function validateUniqueUserId() {
	const userId = $('input[name="userId"]').val();
	$.ajax({
		url: '/evenapp/signup/validation',
		type: 'POST',
		data: {
			userId
		},
		success: function(response){
			console.log(response);
		}
	})
	
}