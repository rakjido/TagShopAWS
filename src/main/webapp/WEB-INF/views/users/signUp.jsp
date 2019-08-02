<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/3.6.95/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modify.css">
    <script src='https://www.google.com/recaptcha/api.js'></script>

    
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/* 아이디 비동기 */
			$('#signup-input_text_instaid').on("propertychange change keyup paste", function(){
				var pattern = /^[0-9a-zA-Z]{3,15}$/;
				$.ajax({
					url: "check",
				    data: { userid : $('#signup-input_text_instaid').val()},
				    type: "POST",
				    success : function(data){
				    	if(data==0 && pattern.test($('#signup-input_text_instaid').val())){
				    		$("#check_id").css("color", "#0064FF");
				    		$('#check_id').text("사용가능 합니다.");
				    	}
				    	else if(data==1){
				    		$("#check_id").css("color", "#ff0000");
				    		$('#check_id').text("중복된 ID입니다.");
				    	}
				    	else{
				    		$("#check_id").css("color", "#ff0000");
				    		$('#check_id').text("숫자, 영어 3-15글자로 입력해주세요.");
				    	}
				    }
				})
			});
			
			/* 이메일 비동기 */
			$('#signup-input_text_email').on("propertychange change keyup paste", function(){
				var pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
				$.ajax({
					url: "emailcheck",
				    data: { email : $('#signup-input_text_email').val()},
				    type: "POST",
				    success : function(data){
				    	if(pattern.test($('#signup-input_text_email').val())){
				    	//if(data==0 && pattern.test($('#signup-input_text_email').val())){
				    		$("#email").css("color", "#0064FF");
				    		$('#email').text("사용가능 합니다.");
				    	}
/* 				    	else if(data==1){
				    		$("#email").css("color", "#ff0000");
				    		$('#email').text("중복된 email 입니다.");
				    	}
 */				    	else{
				    		$("#email").css("color", "#ff0000");
				    		$('#email').text("이메일 형식에 맞게 입력해주세요");
				    	}
				    }
				})
			});
		
			 /* 아이디 정규식 (숫자,영어 3-15글자) */
			$("#signup-input_text_instaid").on("propertychange change keyup paste", function() {
	           console.log($('#signup-input_text_instaid').val());
				var pattern = /^[0-9a-zA-Z]{3,15}$/;
				if(pattern.test($('#signup-input_text_instaid').val())){
				}else{
				}
	       });
			 
			 /* 비밀번호 1차 정규식 (숫자,영어 4-20글자) */
			$("#signup-input_text_pwd1").on("propertychange change keyup paste", function(){
				console.log($("#signup-input_text_pwd1").val());
			 	var pattern = /^[A-Za-z0-9]{4,20}$/;
			 	if(pattern.test($("#signup-input_text_pwd1").val())){
			 		$("#password_first").css("color", "#0064FF");
			 		$("#password_first").text("비밀번호를 한번 더 입력해주세요");
			 	}else{
			 		$("#password_first").css("color", "#ff0000");
			 		$("#password_first").text("숫자, 영어 4-20글자로 입력해주세요.");
			 	}
			});
		
		
			 /* 비밀번호 2차 확인 (숫자,영어 4-20글자) */
			$("#signup-input_text_pwd2").on("propertychange change keyup paste", function(){
				console.log($("#signup-input_text_pwd2").val());

				if($("#signup-input_text_pwd2").val() == $("#signup-input_text_pwd1").val()){
			 		$("#password_second").css("color", "#0064FF");
			 		$("#password_second").text("비밀번호가 일치 합니다.");
			 	}else{
			 		$("#password_second").css("color", "#ff0000");
			 		$("#password_second").text("비밀번호가 일치하지 않습니다.");
			 	}
			});
				
			 
			 /* 이메일 정규식 */
			$("#signup-input_text_email").on("propertychange change keyup paste", function() {
	           console.log($('#signup-input_text_email').val());
				var pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
				if(pattern.test($('#signup-input_text_email').val())){
				}else{
				}
	       });
			 
			/* 휴대전화 정규식 01012345678*/
			$("#signup-input_text_phone").on("propertychange change keyup paste", function() {
	           console.log($('#signup-input_text_phone').val());
				var pattern = /^\d{11}$/;
				if(pattern.test($('#signup-input_text_phone').val())){
					$("#phone").css("color", "#0064FF");
					$("#phone").text("올바른 형식입니다.");
				}else{
					$("#phone").css("color", "#ff0000");
					$("#phone").text("숫자만 입력해주세요.");
				}
	       }); 
			 
			
			 
		})

	</script>
    
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	
	<!-- ##### sign-in, sign-up Start #####-->
    <div class="sales_apply section-padding-80">
      <div class="container">
        <div class="row">
          <div class="signup_details mt-70 clearfix">
            <div class="signup-title">
              <span>회원 가입</span>
            </div>
          </div>
    
          <div class="signup_details-sub clearfix">
          	<form id="signup" action="" method="POST">
          
	            <div class="signup_input_text_all">
	              <div class="signup-img">
	                <!-- <i class="mdi mdi-account signup-icon-text"></i> -->
	              </div>
	              <div class="signup-input_text">
	                <input type="text" class="form-control signup-input_text_detail" id="signup-input_text_instaid" name="userid" required
	                  placeholder="User ID">
	              </div>
	            </div>
	            
	            <div style='position:absolute'>
	              <span id='check_id' style='font-size:14px'></span>
	            </div>
	             <div><span id=check_id> </span></div>
	            <div class="signup_input_text_all">
	              <div class="signup-img">
	                <!-- <i class="mdi mdi-lock signup-icon-text"></i> -->
	              </div>
	              <div class="signup-input_text">
	                <input type="password" class="form-control signup-input_text_detail" id="signup-input_text_pwd1" name="password" required
	                  placeholder="비밀번호">
	              </div>
	            </div>
	            <!-- 비밀번호 1차 -->
	            <div style='position:absolute'>
	              <span id='password_first' style='font-size:14px'></span>
	            </div>
	            <div class="signup_input_text_all">
	              <div class="signup-img">
	                <!-- <i class="mdi mdi-lock signup-icon-text"></i> -->
	              </div>
	              <div class="signup-input_text">
	                <input type="password" class="form-control signup-input_text_detail" id="signup-input_text_pwd2" required
	                  placeholder="비밀번호확인">
	              </div>
	            </div>
				<!-- 비밀번호 2차 -->
				<div style='position:absolute'>
	              <span id='password_second' style='font-size:14px'></span>
	            </div>
	          
	            <div class="signup_input_text_all">
	              <div class="signup-img">
	                <!-- <i class="mdi mdi-email signup-icon-text"></i> -->
	              </div>
	              <div class="signup-input_text">
	                <input type="text" class="form-control signup-input_text_detail" id="signup-input_text_email" name="email" required
	                  placeholder="E-mail">
	              </div>
	            </div>
	            <div style='position:absolute'>
	              <span id='email' style='font-size:14px'></span>
	            </div>
	            <div class="signup_input_text_all">
	              <div class="signup-img">
	                <!-- <i class="mdi mdi-email signup-icon-text"></i> -->
	              </div>
	              <div class="signup-input_text">
	                <input type="text" class="form-control signup-input_text_detail" id="signup-input_text_phone" name="phone" required
	                  placeholder="Phone">
	              </div>
	            </div>
	            <div style='position:absolute'>
	              <span id='phone' style='font-size:14px'></span>
	            </div>
	            <!-- 자동가입 방지 시작-->
	            <div class="g-recaptcha recaptcha-sub" data-sitekey="6LeNoKgUAAAAAN-RzLgagTZZYfcaVOcY_8ThYYD3"></div>
	            
	            <p id="has-account">이미 아이디가 있으신가요?<a class="signup-signin-text" href="${pageContext.request.contextPath}/users/login">로그인</a></p>
	            <div class="signup-btn">
	                <button type="submit" class="btn signup-btn-detail" id="sign-up">
	                  <div class="v-btn__content">회원가입</div>
	                </button>
	            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/Googlerecapcha.js"></script>
    <!-- ##### sign-in, sign-up End #####-->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>