<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb_area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="page-title text-center">
                        <h2>판매자 신청</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Sales Apply Start ##### -->
    <div class="sales_apply section-padding-80">
        <div class="container">
            <div class="row">
                <div class="sales_apply_details mt-50 clearfix">
    
                    <div class="cart-page-heading mb-30">
                        <h5>판매자 정보</h5>
                    </div>
    
                    <form action="${pageContext.request.contextPath}/shops/new" method="post">
                        <div class="row">
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_compnay">회사 이름 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_compnay" value="" required
                                        placeholder="숫자,한글,영어,(,) 2-20글자" name="corporateName">
                                </div>
                                <div><span id=company_name> </span></div>
                            </div>
    
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_license1">사업자 등록번호 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_license1" value="" required
                                        placeholder="123" name="regNum1">
                                    <span class="sales-form-divider">-</span>
                                    <input type="text" class="form-control" id="sales_apply_license2" value="" required
                                        placeholder="45" name="regNum2">
                                    <span class="sales-form-divider">-</span>
                                    <input type="text" class="form-control" id="sales_apply_license3" value="" required
                                        placeholder="67890" name="regNum3">
                                </div>
                                <div><span id=company_number> </span></div>
                            </div>
                            
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_myhomeurl">판매자 닉네임<span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_myhomeurl" value="" required
                                        placeholder="숫자,한글,영어 2-15글자" name="shopid">
                                </div>
                                <div><span id=check_name> </span></div>
                            </div>
                            
                            
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phone1">전화번호 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_phone1" name="phone1" value="" required
                                        placeholder="010" >
                                    <span class="sales-form-divider">-</span>
                                    <input type="text" class="form-control" id="sales_apply_phone2" name="phone2" value="" required
                                        placeholder="1234">
                                    <span class="sales-form-divider">-</span>
                                    <input type="text" class="form-control" id="sales_apply_phone3" name="phone3" value="" required
                                        placeholder="5678">
                                </div>
                                <div><span id=phone_number> </span></div>
                            </div>
                            <div class="col-4">
                                <button type="submit" name="phonecheck" value="5" class="btn phonecheck-btn">인증</button>
                            </div>


                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phonecheck">인증번호 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_phonecheck" value="" required>
                                </div>
                                <div><span id=certification_number> </span></div>
                            </div>
                            
                            
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phonecheck">은행 <span>*</span></label>
                                    </div>
                                     <c:set var="bankList" value="${bankList}" ></c:set>
                                        <select id="bankCode" name="bankCode" class="form-control">
                                            <option value="">은행을 선택하세요</option>
                                            <c:forEach var="i" begin="0" end="${bankList.size()-1 }">
                                                <option value="${bankList[i].code }">${bankList[i].codeName }</option>
                                            </c:forEach>    
                                        </select>
                                </div>
                            </div>
                            
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_bankaccount">계좌 번호 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_bankaccount" value="" required
                                        placeholder="'-'없이 입력 해주세요" name="bankAccount">
                                </div>
                                <div><span id=account_number> </span></div>
                            </div>

                        </div>
                    
                </div>
    
                <div class="sales_apply_details mt-50 clearfix">
    
                    <div class="cart-page-heading mb-30">
                        <h5>상품 정보</h5>
                    </div>
    
  
                        <div class="row">
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_brand">브랜드 이름 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_brand" value="" required
                                        placeholder="숫자,한글,영어 2-15자리" name="brandName">
                                </div>
                            </div>
                            <div><span id=brand_name> </span></div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-9">
                                <div class="sales_infor">
                                    <div class="offet-set col-3">
                                        <label for="sales_apply_category">취급카테고리 <span>*</span></label>
                                    </div>
                                    <div class="col-12">
                                        <div class="sales_apply_category_check">
                                            <div class="sales_apply_category_check__categories clearfix">
                                                
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                <c:set var="categoryCodeList" value="${categoryCodeList}" ></c:set>
		                                        <select id="midCategoryCode" name="midCategoryCode" class="form-control">
		                                            <option value="">카테고리를 선택하세요</option>
		                                            <c:forEach var="i" begin="0" end="${categoryCodeList.size()-1 }">
		                                                <option value="${categoryCodeList[i].categoryCode }">${categoryCodeList[i].categoryName }</option>
		                                            </c:forEach>    
		                                        </select>
		                                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
 
                        <div class="col-12 mt-5" style="text-align:center">
                            <button type="submit" name="phonecheck" value="5" class="btn phonecheck-btn">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <script>
	$(document).ready(function(){
		var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		/* 판매자 닉네임 비동기 */
		$("#sales_apply_myhomeurl").on("propertychange change keyup paste",function(){
			var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;

			 console.log($('#sales_apply_myhomeurl').val());
				var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
				if(pattern.test($('#sales_apply_myhomeurl').val())){
					console.log("판매자 닉네임 정규식 O");
				}else{
					console.log("판매자 닉네임 정규식 X");
				}
				
			$.ajax({
				url: ctx +"/shops/check_name",
				data:{name:$("#sales_apply_myhomeurl").val()},
				type:"POST",
				success:function(data){
					console.log(data);
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
	
	
	
	
	$(function() {
		 /* 회사 이름 정규식 (숫자,한글,영어,(,) 2-20글자)*/
		$("#sales_apply_compnay").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_compnay').val());
			var pattern = /^[()0-9가-힣a-zA-Z]{2,20}$/;
			if(pattern.test($('#sales_apply_compnay').val())){
				console.log("회사이름 정규식 O");
				$("#company_name").css("color", "#0064FF");
				$("#company_name").text("사용 가능합니다.");
			}else{
				console.log("회사이름 정규식 X");
				$("#company_name").css("color", "#ff0000");
				$("#company_name").text("숫자, 한글, 영어, 특수문자 ( , ) 2-20글자로 입력해주세요.");
			}
        });
		 
		/* 사업자번호 정규식 ex.123-12-12345 */
		$("#sales_apply_license1").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_license1').val());
			var pattern = /^[0-9]{3}$/;
			if(pattern.test($('#sales_apply_license1').val())){
				console.log("사업자번호1 정규식 O");
			}else{
				console.log("사업자번호1 정규식 X");
			}
        });
		$("#sales_apply_license2").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_license2').val());
			var pattern = /^[0-9]{2}$/;
			if(pattern.test($('#sales_apply_license2').val())){
				console.log("사업자번호2 정규식 O");
			}else{
				console.log("사업자번호2 정규식 X");
			}
        });
		$("#sales_apply_license3").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_license3').val());
			var pattern = /^[0-9]{5}$/;
			if(pattern.test($('#sales_apply_license3').val())){
				console.log("사업자번호3 정규식 O");
			}else{
				console.log("사업자번호3 정규식 X");
			}
        });
		
		/* 판매자 닉네임 정규식(숫자,한글,영어 2-15글자) */
		$("#sales_apply_myhomeurl").on("propertychange change keyup paste", function() {
           /*  console.log($('#sales_apply_myhomeurl').val());
			var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
			if(pattern.test($('#sales_apply_myhomeurl').val())){
				console.log("판매자 닉네임 정규식 O");
			}else{
				console.log("판매자 닉네임 정규식 X");
			} */
        });
		
		/* 휴대전화 정규식 (ex.010-1234-1234) */
		$("#sales_apply_phone1").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_phone1').val());
			var pattern = /^\d{3}$/;
			if(pattern.test($('#sales_apply_phone1').val())){
				console.log("휴대전화1 정규식 O");
			}else{
				console.log("휴대전화1 정규식 X");
			}
        });
		$("#sales_apply_phone2").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_phone2').val());
			var pattern = /^\d{4}$/;
			if(pattern.test($('#sales_apply_phone2').val())){
				console.log("휴대전화2 정규식 O");
			}else{
				console.log("휴대전화2 정규식 X");
			}
        });
		$("#sales_apply_phone3").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_phone3').val());
			var pattern = /^\d{3}$/;
			if(pattern.test($('#sales_apply_phone3').val())){
				console.log("휴대전화3 정규식 O");
			}else{
				console.log("휴대전화3 정규식 X");
			}
        });
		
		/* 인증번호 정규식 (ex.123456) */
		$("#sales_apply_phonecheck").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_phonecheck').val());
			var pattern = /^\d{6}$/;
			if(pattern.test($('#sales_apply_phonecheck').val())){
				console.log("인증번호 정규식 O");
			}else{
				console.log("인증번호 정규식 X");
			}
        });
		
		
		/* 계좌번호 정규식(숫자 11-14글자) */
		$("#sales_apply_bankaccount").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_bankaccount').val());
			var pattern = /^\d{11,14}$/;
			if(pattern.test($('#sales_apply_bankaccount').val())){
				console.log("계좌번호 정규식 O");
				$("#account_number").css("color", "#0064FF");
				$("#account_number").text("사용 가능합니다.");
			}else{
				console.log("계좌번호 정규식 X");
				$("#account_number").css("color", "#ff0000");
				$("#account_number").text("숫자 11-14글자로 입력해주세요.");
			}
        });
		
		/* 브랜드 이름 정규식(숫자, 한글, 영어 2-15자리) */
		$("#sales_apply_brand").on("propertychange change keyup paste", function() {
            console.log($('#sales_apply_brand').val());
			var pattern = /^[0-9가-힣a-zA-Z]{2,15}$/;
			if(pattern.test($('#sales_apply_brand').val())){
				console.log("브랜드 이름 정규식 O");
				$("#brand_name").css("color", "#0064FF");
				$("#brand_name").text("사용 가능합니다.");
			}else{
				console.log("브랜드 이름 정규식 X");
				$("#brand_name").css("color", "#ff0000");
				$("#brand_name").text("숫자, 한글, 영어 2-15글자로 입력해주세요.");
			}
        });
		
		
	})
	
	
	</script>
    