	
$(function() {
	
	$('form').submit(function(e) {
		
		e.preventDefault();
		
		var location = window.location.href.split('/');
		var url = "http://"+location[1]+"/"+location[2];
		
		
		var formData = $('#signup').serialize();
		
		console.log(formData);
		
		$.ajax({
			url: 'signup',
			type: 'post',
			data: formData,

			success: function(data) {
				
				console.log(data);
				switch (data) {
				case 0:
					swal("인증메일이 발송되었습니다.", $('#signup-input_text_email').val(),"success");
					
					swal({
						  title: "인증메일이 발송되었습니다.",
						  text: $('#signup-input_text_email').val(),
						  icon: "success",
						  button: "확인",
						}).then((value) => {
							window.location.href = ctx;
						});
					setTimeout(function() {
						window.location.href = ctx;
					}, 8000);
					break;
					
				case 1:
					alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
					break;
					
				default:
					alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
				e.preventDefault();
				break;
				}
			}
		});
	});
});
