<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- ##### Breadcumb Area Start ##### -->
		<div class="top_catagory_area section-padding-80 clearfix">
    <div class="breadcumb_area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="page-title text-center">
                       <c:forEach var="pl" items="${productsList}" begin="0" end="0">
                        <h2>${pl.title}</h2>
                  	  </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->
    
    <!-- ##### Product Category Start ##### -->
    <div class="container">
            <div class="shop_grid_product_area">
                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar-sub d-flex align-items-center justify-content-between">
                            <!-- Total Products -->
                            <div class="select-box d-flex mt-50">
<!--                                     <form action="#" method="get"> -->
<!--                                             <select name="select" id="sortByselect"> -->
<!--                                                 <option value="value">카테고리</option> -->
<!--                                                 <option value="value">인기순</option> -->
<!--                                                 <option value="value">낮은가격순</option> -->
<!--                                                 <option value="value">높은가격순</option> -->
<!--                                             </select> -->
<!--                                          <input type="submit" class="d-none" value=""> -->
<!--                                     </form> -->
<!--                                     <form action="#" method="get"> -->
<!--                                             <select name="select" id="sortByselect"> -->
<!--                                                 <option value="value">태그</option> -->
<!--                                                 <option value="value">인기순</option> -->
<!--                                                 <option value="value">낮은가격순</option> -->
<!--                                                 <option value="value">높은가격순</option> -->
<!--                                             </select> -->
<!--                                          <input type="submit" class="d-none" value=""> -->
<!--                                     </form> -->
                            </div>
                            <!-- Sorting -->
                            <div class="product-sorting d-flex mt-50">
<!--                                 <form action="#" method="get"> -->
                                    <select name="select" id="sortByselect">
                                        <option value="productidDesc">최신순</option>
                                        <option value="priceDesc">높은가격순</option>
                                        <option value="priceAsc">낮은가격순</option>
                                    </select>
<!--                                     <input type="submit" class="d-none" value=""> -->
<!--                                 </form> -->
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ##### Product Category End ##### -->
    
    <!-- ------------------------------------------------ -->
    
    <!-- ##### Product Image Middle Start ##### -->
    
    <div class="top_catagory_area section-padding-0-80 clearfix">
		<div class="container">
            
            <!-- Image -->
		<div class="row" id="categoriesRow">
		<c:set var="productsList" value="${productsList}"></c:set>
		<c:forEach var="i" begin="0" end="${productsList.size()-1}">
		<!-- Ajax Start!!!!!!!!!!!!!!!!! -->	
		
				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">
						<figure class="snip1366">
							<div class="image">
							<img src="${pageContext.request.contextPath}/uploads/${productsList[i].photoFile}" alt="sample36" />
							</div>
							<figcaption><img src="${pageContext.request.contextPath}/uploads/${productsList[i].photoFile}"></figcaption>
							<a href="${pageContext.request.contextPath}/shops/${productsList[i].shopid}/products/${productsList[i].productid}"></a>
						</figure>
						<div class="product-description-sub">
							<a href="${pageContext.request.contextPath}/shops/${productsList[i].shopid}/products/${productsList[i].productid}"><span>${productsList[i].title}</span></a>
							<a href="single-product-details.html">
<%-- 								<h6>${productsList[i].description}</h6> --%>
							</a>
							<p class="product-price">${productsList[i].price}</p>
						</div>
					</div>
				</div>
				<!-- Ajax End!!!!!!!!!!!!!!!!!!! -->
				
		</c:forEach>
		</div>
		
		<!-- Sample SourceCode End  -->

<!-- 			<div class="col-12 col-md-4 col-lg-3"> -->
<!-- 				<div class="single-product-wrapper-sub"> -->
<!-- 					<figure class="snip1366"> -->
<!-- 						<div class="image"> -->
<!-- 							<img src="/tagshop/uploads/1.jpg" alt="sample36"> -->
<!-- 						</div> -->
<!-- 						<figcaption></figcaption> -->
<!-- 						<a href="/tagshop/shops/SOS/products/1"></a> -->
<!-- 					</figure> -->
<!-- 					<div class="product-description-sub"> -->

<!-- 						<a href="/tagshop/shops/SOS/products/1"><span>ZARA</span></a> <a -->
<!-- 							href="single-product-details.html"> -->
<!-- 							<h6>테스트</h6> -->
<!-- 						</a> -->
<!-- 						<p class="product-price">30000.0</p> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<!--  Sample SourceCode End -->

		</div>
	</div>

    
    <!-- ##### Product Image Middle Start ##### -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
   <!-- js파일 -->
   <script src="${pageContext.request.contextPath}/resources/js/ajaxsellerhome.js"></script>
    