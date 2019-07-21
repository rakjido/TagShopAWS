
$(function() {
	
	var passwordcheck = "";
	
	$('.select-profile-pwd').on('click', function(e) {
		e.preventDefault();
		
		$('.select-profile').removeClass('active');
		$('.select-profile-pwd').addClass('active');
		
		$.ajax({
			url: 'editpassword',
			type: 'GET',
			dataType: 'html',
			success : function(data) {
				
				$('.profile-content').html(data);
				

				
			}
		});
		
	});
	
	$('.select-profile').on('click', function(e) {
		e.preventDefault();
		
		$('.select-profile-pwd').removeClass('active');
		$('.select-profile').addClass('active');
		
		$.ajax({
			url: 'editprofile',
			type: 'GET',
			dataType: 'html',
			success : function(data) {
				
				$('.profile-content').html(data);
				
				

				
			}
		});
		
	});
	
	
	
	/* 기존 비밀번호 확인 */
	$('#prepassword').on("propertychange change keyup paste", function() {
        console.log($('#prepassword').val());
        
		$.ajax({
			url: 'passwordcheck',
			type: 'GET',
			dataType: 'html',
			data: {password: $('#prepassword').val()},
			success : function(data) {
				
				passwordcheck = data;
				
				if(data == "1"){
					$("#prepwd span").css("color", "#0064FF");
		    		$('#prepwd span').text("비밀번호가 일치합니다.");
				}else if(data == "0"){
					$("#prepwd span").css("color", "#ff0000");
		    		$('#prepwd span').text("기존 비밀번호가 일치하지 않습니다.");
				}
				
			}
		});
        
    });
	
	/* 변경 비밀번호 */
	$('#repassword').on("propertychange change keyup paste", function() {
        
	 	var pattern = /^[A-Za-z0-9]{4,20}$/;
	 	if(pattern.test($("#repassword").val())){
	 		$("#repwd").css("color", "#0064FF");
	 		$("#repwd").text("비밀번호를 한번 더 입력해주세요");
	 	}else{
	 		$("#repwd").css("color", "#ff0000");
	 		$("#repwd").text("숫자, 영어 4-20글자로 입력해주세요.");
	 	}
    });
	
	/* 변경 비밀번호 확인 */
	$('#repasswordOk').on("propertychange change keyup paste", function() {
        
	 	if($('#repassword').val() == $('#repasswordOk').val()){
	 		$("#reepwd").css("color", "#0064FF");
	 		$("#reepwd").text("비밀번호를 한번 더 입력해주세요");
	 	}else{
	 		$("#reepwd").css("color", "#ff0000");
	 		$("#reepwd").text("숫자, 영어 4-20글자로 입력해주세요.");
	 	}
        
    });
	
	
	$('form').on('submit', function() {
		
		console.log(passwordcheck);
		
		if($('#repassword').val() != $('#repasswordOk').val()){
			$("#reepwd span").css("color", "#ff0000");
			$('#reepwd span').text("두 비밀번호가 일치하지 않습니다.");
			$('#repassword').focus();
			return false;
		}else if(passwordcheck != "1"){
			$("#prepwd span").css("color", "#ff0000");
			$('#prepwd span').text("기존 비밀번호가 일치하지 않습니다.");
			$('#prepassword').focus();
			return false;
			
		}else
			console.log("마지막");
			return true;
	});
		


	$(document).on('click','.btn-sm', function() {
		
		$('#editphoto').click();
		
	});
	
	$(document).on('change','#editphoto', function() {
		
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		var file = $(this)[0].files[0];
		
		console.log(file);
		var location = $('#url-import').attr('href').split('/');
		var url = ctx+"/"+location[2]+"/profile/photo";
		console.log(url);
		var data = new FormData();
		data.append("photofile", file);
		
		console.log(data);
		
		var src = ctx+"/uploads/"+file.name;
		
		$.ajax({
			url: url,
			type: 'POST',
			data: data,
			processData: false,
			contentType: false,
			success : function(data) {
				
				console.log(data);
				
				$('.profile-img img').attr('src', src);
			}
		});
	});
});