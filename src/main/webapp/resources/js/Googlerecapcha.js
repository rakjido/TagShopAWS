	
$(function() {
	
	$('form').submit(function(e) {
		
		e.preventDefault();
		
		var location = window.location.href.split('/');
		var url = "http://"+location[2]+"/"+location[3];
		
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
					alert("TAG#");
					window.location.href = url;
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
