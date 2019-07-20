<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			var list = new Map();
				<c:forEach var="test" items="${vo }">
					list.set("${test.orderstatusCode}", "${test.cnt}");
				</c:forEach>
			test();
		
			function test() {
				list.forEach(function(value, key) {
					var v = value;
					var k = key;
					
					$('.count b').each(function(index,item) {
						if($(item, 'b').attr('id') == k){
							$(item,'b').text(v);
						}
						
					})
					
				});
			}
			

		});
	</script>
	
	
	
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myshop.css">
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	<!-- ##### Blog Wrapper Area Start ##### -->
	
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="${pageContext.request.contextPath}/resources/img/bg-img/bg-8.jpg" alt="">
        </div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                        <div class="order_status">
                        <script>
                        </script>
                                <div class="step" data-state="0">
                                    <div class="myshop-title">입금대기</div>
                                    <div class="count">
                                       <b id='OR02'>0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="1">
                                    <div class="myshop-title">결제완료</div>
                                    <div class="count">
                                       <b id="OR03">0</b>
                                    </div>
                                </div>
                           <!-- 
                                <div class="image_arrow"></div>
                                <div class="step" data-state="2">
                                    <div class="myshop-title">배송준비</div>
                                    <div class="count">
                                        <b id="OR04">0</b>
                                    </div>
                                </div>
                           
                                <div class="image_arrow"></div>
                                <div class="step" data-state="3">
                                    <div class="myshop-title">배송중</div>
                                    <div class="count">
                                        <b id="OR05">0</b>
                                    </div>
                                </div>
                           -->
                                <div class="image_arrow"></div>
                                <div class="step" data-state="4">
                                    <div class="myshop-title">배송완료</div>
                                    <div class="count">
                                        <b id="OR06">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="5">
                                    <div class="myshop-title">구매완료</div>
                                    <div class="count">
                                        <b id="OR07">0</b>
                                    </div>
                                </div>                               
                                <div class="image_arrow"></div>
                                <div class="step" data-state="6">
                                    <div class="myshop-title">교환</div>
                                    <div class="count">
                                        <b id="OR10">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="7">
                                    <div class="myshop-title">환불</div>
                                    <div class="count">
                                        <b id="OR11">0</b>
                                    </div>
                                </div>
                                
                            </div>
                </div>
                <div class="col-12 ">
                        <div class="row mt-5 mb-30">
                            <h5>주문내역</h5>
                        </div>

                        <div class="row">
                                <table class="table">
                                        <tr>
                                            <th class="ftd1">날짜/주문번호</th>
                                            <th class="ftd2">품목</th>
                                            <th class="ftd3">상품금액</th>
										   <th class="ftd4">수량</th>
                                            <th class="ftd5">주문상태</th>
                                            <th class="ftd6">확인</th>
                                        </tr>
                                        
                                        
                                        <c:forEach var="i" items="${list }">
                                        	<tr>
                                            <td>
                                                <h6>
                                                <fmt:formatDate var="date" value="${i.createdate}" pattern="yyyy-MM-dd"/>
													${date}
												</h6>
                                                <h6>${i.buyitemsid }</h6>
                                            </td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-3 colbg">
                                                            <img src="${pageContext.request.contextPath}/uploads/${i.photofile}">
                                                    </div>
                                                    <div class="col-6 productname-size">
                                                        ${i.productname }
                                                    </div>
                                                </div>
                                            </td>
                                            <fmt:formatNumber value="${i.unitprice }" type="number" var="price"/>
                                            <td><div class="col-2 productname-size">${price}</div></td>
                                            <td><div class="col-2 productname-size">${i.quantity}</div></td> 
                                            
                                            <c:choose>
       											<c:when test="${i.orderstatuscode == 'OR03'}">
           											<td><div class="productname-size">결제완료</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR04'}">
           											<td><div class="productname-size">배송준비</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR05'}">
           											<td><div class="productname-size">배송중</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR06'}">
           											<td><div class="productname-size">배송완료</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR07'}">
           											<td><div class="productname-size">구매완료</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR08'}">
           											<td><div class="productname-size">리뷰작성</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR09'}">
           											<td><div class="productname-size">취소</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR10'}">
           											<td><div class="productname-size">교환</div></td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR11'}">
           											<td><div class="productname-size">환불</div></td>
       											</c:when>
       											
   											</c:choose>

											<c:if test="${i.orderstatuscode == 'OR06'}">
												<td>
													<button class="mybtn2"
														onclick="location.href='${pageContext.request.contextPath}/shops/${sessionScope.userid}/myshop/changeorder/OR10/${i.buyitemsid }'">교환</button>
													<button class="mybtn2"
														onclick="location.href='${pageContext.request.contextPath}/shops/${sessionScope.userid}/myshop/changeorder/OR11/${i.buyitemsid }'">환불</button>
													<button class="mybtn2"
														onclick="location.href='${pageContext.request.contextPath}/shops/${sessionScope.userid}/myshop/changeorder/OR07/${i.buyitemsid }'">구매확정</button>
			
												</td>
											</c:if>
							</tr>	
                                        </c:forEach>
                                        </table> 
                            </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- ##### Blog Wrapper Area End ##### -->
	<!-- 본문 끝 -->
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!-- js파일 ! -->