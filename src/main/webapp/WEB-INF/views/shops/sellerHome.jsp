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
                        <h2>ZARA</h2>
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
                                    <form action="#" method="get">
                                            <select name="select" id="sortByselect">
                                                <option value="value">카테고리</option>
                                                <option value="value">인기순</option>
                                                <option value="value">낮은가격순</option>
                                                <option value="value">높은가격순</option>
                                            </select>
                                         <input type="submit" class="d-none" value="">
                                    </form>
                                    <form action="#" method="get">
                                            <select name="select" id="sortByselect">
                                                <option value="value">태그</option>
                                                <option value="value">인기순</option>
                                                <option value="value">낮은가격순</option>
                                                <option value="value">높은가격순</option>
                                            </select>
                                         <input type="submit" class="d-none" value="">
                                    </form>
                            </div>
                            <!-- Sorting -->
                            <div class="product-sorting d-flex mt-50">
                                <form action="#" method="get">
                                    <select name="select" id="sortByselect">
                                        <option value="value">최신순</option>
                                        <option value="value">인기순</option>
                                        <option value="value">낮은가격순</option>
                                        <option value="value">높은가격순</option>
                                    </select>
                                    <input type="submit" class="d-none" value="">
                                </form>
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
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/resources/img/product-img/product-5.jpg"
									alt="sample36" />
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
								<img
									src="${pageContext.request.contextPath}/resources/img/product-img/product-4.jpg"
									alt="sample36" />
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
				
				<div class="col-12 col-md-4 col-lg-3">
					<div class="single-product-wrapper-sub">

						<figure class="snip1366">
							<div class="image">
								<img
									src="${pageContext.request.contextPath}/resources/img/product-img/product-5.jpg"
									alt="sample36" />
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
								<img
									src="${pageContext.request.contextPath}/resources/img/product-img/product-4.jpg"
									alt="sample36" />
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
	</div>
	
    
    <!-- ##### Product Image Middle Start ##### -->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>