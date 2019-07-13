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
                                        <label for="sales_apply_compnay">회사 이름 <span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_compnay" value="" required
                                        placeholder="회사 이름" name="corporateName">
                                </div>
                            </div>
    
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_license1">사업자 등록번호 <span>*</span></label>
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
                            </div>
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_myhomeurl">판매자 닉네임<span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_myhomeurl" value="" required
                                        placeholder="닉네임" name="shopid">
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phone1">전화번호 <span>*</span></label>
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
                            </div>
                            <div class="col-4">
                                <button type="submit" name="phonecheck" value="5" class="btn phonecheck-btn">인증</button>
                            </div>
                            <div class="col-7">
                                <div class="sales_infor">
                                    <div class="col-4">
                                        <label for="sales_apply_phonecheck">인증번호 <span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_phonecheck" value="" required>
                                </div>
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
                                        <label for="sales_apply_phone1">계좌 번호 <span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_phone1" value="" required
                                        placeholder="번호를 입력하세요" name="bankAccount">
                                </div>
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
                                        <label for="sales_apply_brand">브랜드 이름 <span>*</span></label>
                                    </div>
                                    <input type="text" class="form-control" id="sales_apply_brand" value="" required
                                        placeholder="브랜드 이름" name="brandName">
                                </div>
                            </div>
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
                                                <!-- <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck1" name="largeCategoryCode" value="100">
                                                    <label class="custom-control-label" for="customCheck1" value="100">여름 패션</label>
                                                </div>
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck2" name="LargeCategoryCode2" value="200">상의</label>
                                                </div> 
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck3">하의</label>
                                                </div>
                      
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck2">상의</label>
                                                </div>
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                    <label class="custom-control-label" for="customCheck3">하의</label>
                                                </div>
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                    <label class="custom-control-label" for="customCheck3">하의</label>
                                                </div> 
                                                <div
                                                    class="custom-control custom-checkbox d-block mb-2 sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                                    <label class="custom-control-label" for="customCheck2">상의</label>
                                                </div>
                                                <div class="custom-control custom-checkbox d-block sales_category_checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                                    <label class="custom-control-label" for="customCheck3">하의</label>
                                                </div> -->
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