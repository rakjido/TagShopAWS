<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->

	<!-- ##### Welcome Area Start ##### -->
	<section class="welcome_area bg-img background-overlay"
      style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/ORE.jpg);">
	<div class="text_wrap">
		<p class="txcolor02">2019</p>
		<strong class="strong">TAGSHOP#</strong>
		<p class="txcolor02">COLLABORATION</p>
		<a href="#" class="more_btn">GO SHOP</a>
	</div>
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="hero-content"></div>
				</div>
			</div>
		</div>
	</section>
	<section class="new_arrivals_area section-padding-80 clearfix">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<h2>Popular POST</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<c:forEach var="likephoto" items="${likephotos }">
                       <!-- Single Product -->

                        <div class="card active">
                            <img class="feature"
                                src="${pageContext.request.contextPath}/uploads/${likephoto.fileName}"
                                alt="${likephoto.photoId }">
                            <div class="deets">
                                <p><a href="${pageContext.request.contextPath}/${likephoto.userId}/">${likephoto.userId}</a></p>
                                <div class="like-sec">
                                    <div class="line"></div>
                                    <img src="${pageContext.request.contextPath}/resources/img/core-img/heart.png" />
                                    <div class="likes">${likephoto.cnt_Like }</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
						
						
					</div>
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
				<div class="col-12 col-sm-6 col-md-4 bg-50">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/shirt.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/100200030" class="categoryF">Shirt</a>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4 bg-50">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/shoes.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/100700010" class="categoryF">Shoes</a>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4 bg-50">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/bag.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/100800020" class="categoryF">Bag</a>
					</div>
				</div>
			</div>
			
			<div class="row justify-content-center">
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/watch.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/100800130" class="categoryF">Watch</a>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/accessory.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/100900070" class="categoryF">Accessory</a>
					</div>
				</div>
				<!-- Single Catagory -->
				<div class="col-12 col-sm-6 col-md-4">
					<div
						class="single_catagory_area d-flex align-items-center justify-content-center bg-img"
						style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/perfume.jpg);">
					</div>
					<div class="catagory-content catagoryM">
						<a href="${pageContext.request.contextPath}/shops/index/200400020" class="categoryF">Perfume</a>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<!-- ##### Top Catagory Area End ##### -->
	
	<div class="top_catagory_area section-padding-80 clearfix">
		<div class="container">
			<ul class="footer-banner__list">
				<li class="footer-banner__item">
					<img src="${pageContext.request.contextPath}/resources/img/bg-img/Info1.png" align="absmiddle">
				</li>
				<li class="footer-banner__item">
					<img src="${pageContext.request.contextPath}/resources/img/bg-img/Info2.png" align="absmiddle">
				</li>
				<li class="footer-banner__item">
					<img src="${pageContext.request.contextPath}/resources/img/bg-img/Info3.png" align="absmiddle">
				</li>
			</ul>
		</div>
	</div>
	
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

		<div class="container" style="margin-bottom:10px">
			<div class="row">
				<div class="ks-item-filter" ks-filter-selector>
					<ul class="ks-item-filter__categories clearfix"
						ks-filter-categories>
						<li data-category="languages" class="tags-item"><a href="#" onclick="smallcodeM(70); return false;">#향수</a></li>
						<li data-category="cms" class="tags-item"><a href="#" onclick="smallcodeM(1); return false;">#댄디</li>
						<li data-category="libraries" class="tags-item">#깔끔</li>
						<li data-category="frameworks" class="tags-item">#힙합</li>
						<li data-category="software" class="tags-item">#아메리칸</li>
						<li data-category="workflow" class="tags-item">#캐주얼</li>
						<li data-category="languages" class="tags-item">#오늘의 패션</li>
						<li data-category="cms" class="tags-item">#HOT아이템</li>
						<li data-category="libraries" class="tags-item">#럭셔리</li>
						<li data-category="frameworks" class="tags-item">#빈티지</li>
						<li data-category="frameworks" class="tags-item">#러블리</li>
						<li data-category="languages" class="tags-item"><a href="#" onclick="smallcodeM(200400020); return false;">#향수</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- ##### #Tag List End #####-->

		<!-- ##### CTA Area Start ##### -->
		<div class="container">
			<div class="row" id="mainTagsList">
			<c:set var="list" value="${list}"></c:set>
			<c:forEach var="i" begin="0" end="5">
				<div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-wrapper w100">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/uploads/${list[i].photoFile}" alt="" class="imgheight">
                                        <!-- Favourite -->
                                        <div class="product-favourite">
                                            <a href="#" class="favme fa fa-heart" aria-hidden="true"></a>
                                        </div>
                                    </div>

                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <span><a href="${pageContext.request.contextPath}/shops/${list[i].shopid}/productList">${list[i].shopid}</a></span>

                                        <h6>${list[i].title}</h6>

                                        <fmt:formatNumber value="${list[i].price}" type="number" var="price"/>
                                        <p class="product-price">${price} 원</p>
                                        <!-- Hover Content -->
                                        <div class="hover-content">
                                            <!-- Add to Cart -->
                                            <div class="add-to-cart-btn">
                                                <a href="${pageContext.request.contextPath}/shops/${list[i].shopid}/products/${list[i].productid}" class="btn essence-btn">상세 보기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                   </c:forEach>

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
						<h2>Popular POST</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<c:forEach var="likephoto" items="${likephotos }">
                       <!-- Single Product -->

                        <div class="card active">
                            <img class="feature"
                                src="${pageContext.request.contextPath}/uploads/${likephoto.fileName}"
                                alt="${likephoto.photoId }">
                            <div class="deets">
                                <p><a href="${pageContext.request.contextPath}/${likephoto.userId}/">${likephoto.userId}</a></p>
                                <div class="like-sec">
                                    <div class="line"></div>
                                    <img src="${pageContext.request.contextPath}/resources/img/core-img/heart.png" />
                                    <div class="likes">${likephoto.cnt_Like }</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
						
						
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