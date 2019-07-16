<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- ##### Breadcumb Area Start ##### -->
	<div class="top_catagory_area section-padding-80 clearfix insta-background">
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
                    <form id="seller-register" method="post">
                <div class="sales_apply_details mt-50 clearfix">
    
                    <div class="cart-page-heading mb-30">
                        <h5>판매자 정보</h5>
                    </div>
    
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
                                        <label for="sales_apply_phone">전화번호 </label>
                                    </div>
                                    <input type="tel" class="form-control" id="sales_apply_phone" name="phone" value="" maxlength="11" placeholder="'-'없이 입력 해주세요">
                                </div>
                                <div><span id=phone_number> </span></div>
                            </div>
                            <div class="col-4">
                                <button type="button" id="phonecheck" name="phonecheck" value="5" class="btn phonecheck-btn">인증</button>
                            </div>


                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phonecheck">인증번호 </label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_phonecheck" value="" maxlength="6" required disabled>
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
                    
                </div>
                    </form>
            </div>
        </div>
    </div>
</div>
    <!-- ##### Checkout Area End ##### -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/seller-register.js"></script>
    