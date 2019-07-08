<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->

	<!-- ##### Welcome Area Start ##### -->
	<section class="welcome_area bg-img background-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/01.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="hero-content"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Welcome Area End ##### -->

	<!-- ##### Top Catagory Area Start ##### -->
	<div class="top_catagory_area section-padding-80 clearfix">
		<div class="container">
			<div class="row justify-content-center">
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/bg-2.jpg);">
						<div class="catagory-content">
							<a href="#">Clothing</a>
						</div>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/bg-3.jpg);">
						<div class="catagory-content">
							<a href="#">Shoes</a>
						</div>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/bg-4.jpg);">
						<div class="catagory-content">
							<a href="#">Accessories</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Top Catagory Area End ##### -->

	<!-- ##### #Tag List Start #####-->
	<section class="new_arrivals_area section-padding-80 clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<h2>Tag Select</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="ks-item-filter" ks-filter-selector>
					<ul class="ks-item-filter__categories clearfix"
						ks-filter-categories>
						<li data-category="languages">#댄디룩</li>
						<li data-category="cms">#여름 패션</li>
						<li data-category="libraries">#깔끔</li>
						<li data-category="frameworks">#힙합</li>
						<li data-category="software">#아메리칸</li>
						<li data-category="workflow">#캐주얼</li>
						<li data-category="languages">#오늘의 패션</li>
						<li data-category="cms">#HOT아이템</li>
						<li data-category="libraries">#럭셔리</li>
						<li data-category="frameworks">#빈티지</li>
						<li data-category="software">#놈코어</li>
						<li data-category="workflow">#모던</li>

					</ul>
				</div>
			</div>
		</div>
		<!-- ##### #Tag List End #####-->

		<!-- ##### CTA Area Start ##### -->
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-5.jpg" alt="sample36" />
							</div>
							<figcaption></figcaption>
							<a href="#"></a>
						</figure>
						<div class="product-description-sub">
							<a href="#"><span>ZARA</span></a> <a
								href="single-product-details.html">
								<h6>프릴 슬리브 크롭 탑</h6>
							</a>
							<p class="product-price">49,000원</p>

						</div>
					</div>
				</div>

				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-4.jpg" alt="sample36" />
							</div>
							<figcaption></figcaption>
							<a href="#"></a>
						</figure>
						<div class="product-description-sub">
							<a href="#"><span>ZARA</span></a> <a
								href="single-product-details.html">
								<h6>플라워 튤 탑</h6>
							</a>
							<p class="product-price">49,000 원</p>

						</div>
					</div>
				</div>

				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img
									src="https://static.zara.net/photos///2019/I/0/2/p/8211/307/401/4/w/1024/8211307401_1_1_1.jpg?ts=1560444629640"
									alt="sample36" />
							</div>
							<figcaption></figcaption>
							<a href="#"></a>
						</figure>
						<div class="product-description-sub">
							<a href="#"><span>ZARA</span></a> <a
								href="single-product-details.html">
								<h6>후드 러스틱 셔츠</h6>
							</a>
							<p class="product-price">69,000 원</p>

						</div>
					</div>
				</div>

				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img
									src="https://static.zara.net/photos///2019/V/0/2/p/4333/500/250/7/w/1024/4333500250_1_1_1.jpg?ts=1560425437342"
									alt="sample36" />
							</div>
							<figcaption></figcaption>
							<a href="#"></a>
						</figure>
						<div class="product-description-sub">
							<a href="#"><span>ZARA</span></a> <a
								href="single-product-details.html">
								<h6>수트럭처 수트 팬츠</h6>
							</a>
							<p class="product-price">59,000 원</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ##### CTA Area End ##### -->

	<!-- ##### New Arrivals Area Start ##### -->
	<section class="new_arrivals_area section-padding-80 clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<h2>Popular Products</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<!-- Single Product -->
						<div class="single-product-wrapper">
							<!-- Product Image -->
							<div class="product-img">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-1.jpg" alt="">
								<!-- Hover Thumb -->
								<img class="hover-img" src="${pageContext.request.contextPath}/resources/img/product-img/product-2.jpg"
									alt="">
								<!-- Favourite -->
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<!-- Product Description -->
							<div class="product-description">
								<span>topshop</span> <a href="single-product-details.html">
									<h6>Knot Front Mini Dress</h6>
								</a>
								<p class="product-price">$80.00</p>

								<!-- Hover Content -->
								<div class="hover-content">
									<!-- Add to Cart -->
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>

						<!-- Single Product -->
						<div class="single-product-wrapper">
							<!-- Product Image -->
							<div class="product-img">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-2.jpg" alt="">
								<!-- Hover Thumb -->
								<img class="hover-img" src="${pageContext.request.contextPath}/resources/img/product-img/product-3.jpg"
									alt="">
								<!-- Favourite -->
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<!-- Product Description -->
							<div class="product-description">
								<span>topshop</span> <a href="single-product-details.html">
									<h6>Poplin Displaced Wrap Dress</h6>
								</a>
								<p class="product-price">$80.00</p>

								<!-- Hover Content -->
								<div class="hover-content">
									<!-- Add to Cart -->
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>

						<!-- Single Product -->
						<div class="single-product-wrapper">
							<!-- Product Image -->
							<div class="product-img">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-3.jpg" alt="">
								<!-- Hover Thumb -->
								<img class="hover-img" src="${pageContext.request.contextPath}/resources/img/product-img/product-4.jpg"
									alt="">

								<!-- Product Badge -->
								<div class="product-badge offer-badge">
									<span>-30%</span>
								</div>

								<!-- Favourite -->
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<!-- Product Description -->
							<div class="product-description">
								<span>mango</span> <a href="single-product-details.html">
									<h6>PETITE Crepe Wrap Mini Dress</h6>
								</a>
								<p class="product-price">
									<span class="old-price">$75.00</span> $55.00
								</p>

								<!-- Hover Content -->
								<div class="hover-content">
									<!-- Add to Cart -->
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>

						<!-- Single Product -->
						<div class="single-product-wrapper">
							<!-- Product Image -->
							<div class="product-img">
								<img src="${pageContext.request.contextPath}/resources/img/product-img/product-4.jpg" alt="">
								<!-- Hover Thumb -->
								<img class="hover-img" src="${pageContext.request.contextPath}/resources/img/product-img/product-5.jpg"
									alt="">

								<!-- Product Badge -->
								<div class="product-badge new-badge">
									<span>New</span>
								</div>

								<!-- Favourite -->
								<div class="product-favourite">
									<a href="#" class="favme fa fa-heart"></a>
								</div>
							</div>
							<!-- Product Description -->
							<div class="product-description">
								<span>mango</span> <a href="single-product-details.html">
									<h6>PETITE Belted Jumper Dress</h6>
								</a>
								<p class="product-price">$80.00</p>

								<!-- Hover Content -->
								<div class="hover-content">
									<!-- Add to Cart -->
									<div class="add-to-cart-btn">
										<a href="#" class="btn essence-btn">Add to Cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


<!-- ##### New Arrivals Area End ##### -->

	<!-- ##### Brands Area Start ##### -->
	<div
		class="brands-area d-flex align-items-center justify-content-between">
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand1.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand2.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand3.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand4.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand5.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="${pageContext.request.contextPath}/resources/img/core-img/brand6.png" alt="">
		</div>
	</div>
	<!-- ##### Brands Area End ##### -->

	<!-- 본문 끝 -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- js파일 ! -->