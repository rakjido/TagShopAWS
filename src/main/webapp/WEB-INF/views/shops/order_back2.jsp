<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script type="text/javascript">
 			function check(box){
				if(box.checked == true) {
					document.getElementById('point').value = ${profileVo.point};
					document.getElementById('span_point').innerHTML = "${profileVo.point} 원";
					
					var final_price = Number(document.getElementById('total_sum').value) + Number(document.getElementById('delivery_fee').value) -  Number(document.getElementById('point').value);
					
					document.getElementById('final_price').innerHTML = final_price + " 원";
				} else {
					document.getElementById('point').value = 0;
					document.getElementById('span_point').innerHTML = "0 원";
					
					var final_price = Number(document.getElementById('total_sum').value) + Number(document.getElementById('delivery_fee').value) -  Number(document.getElementById('point').value);
					
					document.getElementById('final_price').innerHTML = final_price + " 원";
				}
			}	
    	
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zip_code').value = data.zonecode;
		                document.getElementById("address1").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("address2").focus();
		            }
		        }).open();
		    }

	</script>
	
	
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb_area bg-img" style="background-image: url(img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="page-title text-center">
                        <h2>Checkout</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Product List Start #####-->
    <c:set var="Itemlist" value="${itemList}"></c:set>
    <c:set var="TotalSum" value="0"></c:set>
    
<c:choose>
<c:when test="${ Itemlist.size()>0}">
    <div class="container">
        <div class="row item">
        <c:forEach var="i" begin="0" end="${Itemlist.size()-1}">
            <div class="checkout-all">
                <div class="col-md-2">
                    <div class="item-image">
                        <img src="https://cdn1.sanmar.com/imglib/catl/2017/f8/881657_white_model_front_072017.jpg">
                        <!-- <img src="${pageContext.request.contextPath}/uploads/${Itemlist[i].photoFile}">  -->
                        
                    </div>
                </div>
                <div class="col-md-10 col-xs-12 col-sm-12">
                    <div class="checkout-detail">
                        <a href="#product-detail-page">
                            <h3>
                                
                                <span class="title"> ${Itemlist[i].productName}</span>
                            </h3>
                        </a>
                        <hr>
                        
                        <table>
                            <tr class="line-item">
                            	<c:set var="OptionList" value="${Itemlist[i].options}"></c:set>
                            	<c:forEach var="j" begin="0" end="${OptionList.size()-1}">
	                                <td class="size editable form-inline">
	                                    	${OptionList[j].optionType} :
	                                    <label>${OptionList[j].optionCode}</label>
	                                </td>
	                            </c:forEach>
	                                <td class="quantity">
	                                	
	                                    <label>${Itemlist[i].quantity} 개</label>
	                                </td>
	                                <td class="total">
	                                    <label>${Itemlist[i].totalPrice} 원</label>
	                                </td>
                                	<c:set var="TotalSum" value="${TotalSum + Itemlist[i].totalPrice}"></c:set>
									
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
		</c:forEach>
        </div>
    </div>
	<input type="hidden" value="${TotalSum}" id="total_sum">
	<input type="hidden" value="${Itemlist[0].deliveryFee}" id="delivery_fee">
	
    <!-- ##### Product List End #####-->

    <!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area section-padding-80">
        <div class="container">
            <div class="row">
    
                <div class="col-12 col-md-6">
                    <div class="checkout_details_area mt-50 clearfix">
    
                        <div class="cart-page-heading mb-30">
                            <h5>배송지 정보</h5>
                        </div>
    
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="name">받는분 <span>*</span></label>
                                    <input type="text" class="form-control" name="name" id="name" value="${profileVo.recipientName}" required>
                                </div>
                                <div class="col-6 mb-3">
                                    <label for="zip_code">우편번호</label>
                                    <input type="text" class="form-control" name="zip_code" id="zip_code" value="${profileVo.postalCode}" required>
                                </div>
                                <div class="col-6">
                                    <button type="button" name="zip_code" class="btn zipcode-btn" onclick="execDaumPostcode();">우편번호</button>
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="street_address">주소 <span>*</span></label>
                                    <input type="text" class="form-control mb-3" id="address1" value="${profileVo.address1}">
                                    <input type="text" class="form-control" id="address2" value="${profileVo.address2}">
                                </div>

                                <div class="col-12 mb-3">
                                    <label for="delivery_mem">배송 메모 <span>*</span></label>
                                    <input type="text" class="form-control" id="delivery_mem" value="${profileVo.deliveryMemo}">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="checkout_details_area mt-50 clearfix">
    
                        <div class="cart-page-heading mb-30">
                            <h5>TAG# 포인트</h5>
                        </div>
    
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <div class="notice">3만원이상 결제시 포인트 사용이 가능합니다.
                                    </div>
                                </div>
                                <div class="col-6 mb-3">
                                    <input type="text" class="form-control" name="point" id="point" value=0 required>
                                </div>
                                <div class="point-div">P</div>
    
                                <div class="col-12 mb-3">
                                    <div class="available">
                                        <div class="notice">사용 가능한 포인트</div>
                                        <div class="point" data-hj-suppress="">${profileVo.point} P</div>
                                        <div class="custom-control custom-checkbox d-block mb-2 mg-left">
                                            <input type="checkbox" class="custom-control-input" id="allpoint" onclick="check(this)">
                                            <label class="custom-control-label" for="allpoint">전액사용</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="checkout_details_area mt-50 clearfix">
    
                            <div class="cart-page-heading mb-30">
                                <h5>예상 적립포인트</h5>
                            </div>
        
                            <form action="#" method="post">
                                <div class="row">
        
                                    <div class="col-12 mb-3">
                                        <div class="available">
                                        	<c:set var="getPoints" value="${TotalSum*0.001}"></c:set>
                                            <div class="point" data-hj-suppress="">${getPoints} P</div>
                                            <div class="notice">적립예정</div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                </div>

                <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                    <div class="order-details-confirmation">

                        <div class="cart-page-heading">
                            <h5>최종 결제금액</h5>
                        </div>

                        <ul class="order-details-form mb-4">
                            <li><span>총 상품 금액</span> <span>${TotalSum} 원</span></li>
                            <li><span>배송비</span> <span>${Itemlist[0].deliveryFee} 원</span></li>
                            <li><span>포인트 사용</span> <span id="span_point">0원</span></li>
                            <c:set var="FinalSettle" value="${TotalSum + Itemlist[0].deliveryFee}"></c:set>
                            <li><span>총 결제 금액</span> <span id="final_price">${FinalSettle} 원</span></li>
                        </ul>

                        <div id="accordion" role="tablist" class="mb-4">
                            <div class="card">
                                <div class="card-header" role="tab" id="headingOne">
                                    <h6 class="mb-0">
                                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><i class="fa fa-circle-o mr-3"></i>Paypal</a>
                                    </h6>
                                </div>

                                <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra tempor so dales. Phasellus sagittis auctor gravida. Integ er bibendum sodales arcu id te mpus. Ut consectetur lacus.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" role="tab" id="headingTwo">
                                    <h6 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><i class="fa fa-circle-o mr-3"></i>cash on delievery</a>
                                    </h6>
                                </div>
                                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo quis in veritatis officia inventore, tempore provident dignissimos.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" role="tab" id="headingThree">
                                    <h6 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><i class="fa fa-circle-o mr-3"></i>credit card</a>
                                    </h6>
                                </div>
                                <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse quo sint repudiandae suscipit ab soluta delectus voluptate, vero vitae</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" role="tab" id="headingFour">
                                    <h6 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour"><i class="fa fa-circle-o mr-3"></i>direct bank transfer</a>
                                    </h6>
                                </div>
                                <div id="collapseFour" class="collapse show" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est cum autem eveniet saepe fugit, impedit magni.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="#" class="btn essence-btn">Place Order</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->
</c:when>
<c:otherwise>
	장바구니에 상품이 없습니다
</c:otherwise>    
</c:choose>

    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>