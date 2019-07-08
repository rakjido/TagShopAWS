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
        ${list }
            <div class="row justify-content-center">
                <div class="col-12">
                        <div class="order_status">
                        <script>
                        </script>
                                <div class="step" data-state="0">
                                    <div class="title">입금대기</div>
                                    <div class="count">
                                       <b id='OR02'>0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="1">
                                    <div class="title">결제완료</div>
                                    <div class="count">
                                       <b id="OR03">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="2">
                                    <div class="title">배송준비</div>
                                    <div class="count">
                                        <b id="OR04">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="3">
                                    <div class="title three">배송중</div>
                                    <div class="count">
                                        <b id="OR05">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="4">
                                    <div class="title">배송완료</div>
                                    <div class="count">
                                        <b id="OR06">0</b>
                                    </div>
                                </div>
                                <div class="image_arrow"></div>
                                <div class="step" data-state="6">
                                    <div class="title">리뷰작성</div>
                                    <div class="count">
                                        <b id="OR08">0</b>
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
                                            <th class="ftd">날짜/주문번호</th>
                                            <th class="ftd2">품목</th>
                                            <th class="ftd">상품금액/수량</th>
                                            <th class="ftd3">주문상태</th>
                                            <th class="ftd3">확인</th>
                                        </tr>
                                        
                                        
                                        <c:forEach var="i" items="${list }">
                                        	<tr>
                                            <td>
                                                <h5>
                                                <fmt:formatDate var="date" value="${i.createdate}" pattern="yyyy-MM-dd"/>
													${date}
												</h5>
                                                <h6>${i.buyitemsid }</h6>
                                            </td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-3 colbg">
                                                            <img src="${pageContext.request.contextPath}/resources/img/sample-img/sample22.jpg" class="fullimg">
                                                    </div>
                                                    <div class="col-8">
                                                        ${i.productname }
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${i.unitprice }/${i.quantity }</td> 
                                            
                                            <c:choose>
       											<c:when test="${i.orderstatuscode == 'OR03'}">
           											<td>결제완료</td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR04'}">
           											<td>배송준비</td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR05'}">
           											<td>배송중</td>
       											</c:when>
       											<c:when test="${i.orderstatuscode == 'OR06'}">
           											<td>배송완료</td>
       											</c:when>
   											</c:choose>


                                            
       											<c:if test="${i.orderstatuscode == 'OR06'}">
           											<td>
                                                		<button class="mybtn2">교환</button>
                                                		<button class="mybtn2">반품</button>
                                                		<button class="mybtn2">확정</button>
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