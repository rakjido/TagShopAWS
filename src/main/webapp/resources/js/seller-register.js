$(function() {
	
	var checknum = "";
	
	var location = window.location.href.split('/');
	var url = "http://"+location[2]+"/"+location[3]+"/users/logout";
	console.log(location);
	
	$('form').submit(function(e) {
			
			e.preventDefault();

			var formData = $('#seller-register').serialize();
			
			console.log(formData);
			
			if(checknum != $('#sales_apply_phonecheck').val()){
				
				$("#certification_number").css("color", "#ff0000");
				$("#certification_number").css("font-weight", "bold");
				$("#certification_number").text("인증번호를 다시 확인해주세요.");
				
			}else {
				
				$.ajax({
					url: 'new',
					type: 'post',
					data: formData,
					
					success: function() {
						
						window.location.href = url;
					}
				});
			}
			
		});
	
	
	$("#phonecheck").on('click', function() {
		
        console.log($('#sales_apply_phone').val());
        
		$.ajax({
			url: ctx +"/shops/sendsms",
			type:"POST",
			data: {phonenum:$('#sales_apply_phone').val() },
			success:function(data){
				
				checknum = data;
				
				$('#sales_apply_phonecheck').removeAttr("disabled");
				$('#sales_apply_phonecheck').focus();
				
			}
		})
        
	});
	
	
	
	$("#sales_apply_phonecheck").on("propertychange change keyup paste",function(){
		
		console.log($("#sales_apply_phonecheck").val())
		
	});
	
	
	
	
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	/* 판매자 닉네임 비동기 */
	$("#sales_apply_myhomeurl").on("propertychange change keyup paste",function(){
		var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;

			var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
			if(pattern.test($('#sales_apply_myhomeurl').val())){
			}else{
			}
			
		$.ajax({
			url: ctx +"/shops/check_name",
			data:{name:$("#sales_apply_myhomeurl").val()},
			type:"POST",
			success:function(data){
				if(data == 0 && pattern.test($('#sales_apply_myhomeurl').val())){
					$("#check_name").css("color", "#0064FF");
					$("#check_name").text("사용 가능합니다.");
					
				}
				else if(data==1){
					$("#check_name").css("color", "#ff0000");
					$("#check_name").text("중복된 닉네임입니다.");
				}
				else{
					$("#check_name").css("color", "#ff0000");
					$("#check_name").text("숫자,한글,영어 2-15글자로 입력해주세요.");
				}
			}
		})
	})
})




	 /* 회사 이름 정규식 (숫자,한글,영어,(,) 2-20글자)*/
	$("#sales_apply_compnay").on("propertychange change keyup paste", function() {
		var pattern = /^[()0-9가-힣a-zA-Z]{2,20}$/;
		if(pattern.test($('#sales_apply_compnay').val())){
			$("#company_name").css("color", "#0064FF");
			$("#company_name").text("사용 가능합니다.");
		}else{
			$("#company_name").css("color", "#ff0000");
			$("#company_name").text("숫자, 한글, 영어, 특수문자 ( , ) 2-20글자로 입력해주세요.");
		}
    });
	 
	/* 사업자번호 정규식 ex.123-12-12345 */
	$("#sales_apply_license1").on("propertychange change keyup paste", function() {
		var pattern = /^[0-9]{3}$/;
		if(pattern.test($('#sales_apply_license1').val())){
		}else{
		}
    });
	$("#sales_apply_license2").on("propertychange change keyup paste", function() {
		var pattern = /^[0-9]{2}$/;
		if(pattern.test($('#sales_apply_license2').val())){
		}else{
		}
    });
	$("#sales_apply_license3").on("propertychange change keyup paste", function() {
		var pattern = /^[0-9]{5}$/;
		if(pattern.test($('#sales_apply_license3').val())){
		}else{
		}
    });
	
	/* 판매자 닉네임 정규식(숫자,한글,영어 2-15글자) */
	$("#sales_apply_myhomeurl").on("propertychange change keyup paste", function() {
		var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
		if(pattern.test($('#sales_apply_myhomeurl').val())){
		}else{
		} 
    });
	
	/* 인증번호 정규식 (ex.123456) */
	$("#sales_apply_phonecheck").on("propertychange change keyup paste", function() {
		var pattern = /^\d{6}$/;
		if(pattern.test($('#sales_apply_phonecheck').val())){
		}else{
		}
    });
	
	
	/* 계좌번호 정규식(숫자 11-14글자) */
	$("#sales_apply_bankaccount").on("propertychange change keyup paste", function() {
		var pattern = /^\d{11,14}$/;
		if(pattern.test($('#sales_apply_bankaccount').val())){
			$("#account_number").css("color", "#0064FF");
			$("#account_number").text("사용 가능합니다.");
		}else{
			$("#account_number").css("color", "#ff0000");
			$("#account_number").text("숫자 11-14글자로 입력해주세요.");
		}
    });
	
	/* 브랜드 이름 정규식(숫자, 한글, 영어 2-15자리) */
	$("#sales_apply_brand").on("propertychange change keyup paste", function() {
		var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
		if(pattern.test($('#sales_apply_brand').val())){
			$("#brand_name").css("color", "#0064FF");
			$("#brand_name").text("사용 가능합니다.");
		}else{
			$("#brand_name").css("color", "#ff0000");
			$("#brand_name").text("숫자, 한글, 영어 2-15글자로 입력해주세요.");
		}
    });

