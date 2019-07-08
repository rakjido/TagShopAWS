<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>

<body>
	<!-- ##### Header Area Start ##### -->
	<header class="header_area">
		<div
			class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
			<!-- Classy Menu -->
			<nav class="classy-navbar" id="essenceNav">
				<!-- Logo -->
				<a class="nav-brand" href="${pageContext.request.contextPath}/"><img
					src="${pageContext.request.contextPath}/resources/img/core-img/태그샵14.png" alt=""></a>
				<!-- Navbar Toggler -->
				<div class="classy-navbar-toggler">
					<span class="navbarToggler"><span></span><span></span><span></span></span>
				</div>
				<!-- Menu -->
				<div class="classy-menu">
					<!-- close btn -->
					<div class="classycloseIcon">
						<div class="cross-wrap">
							<span class="top"></span><span class="bottom"></span>
						</div>
					</div>
					<!-- Nav Start -->
					<div class="classynav">
						<ul>
							<li><a id="url-import" href="${pageContext.request.contextPath}/${sessionScope.userid}/feeds">Community</a></li>
							
						    <li><a href="#">Shop</a>
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/shops/categories">Shop</a></li>
                                    <li><a href="${pageContext.request.contextPath}/${sessionScope.userid}/orders">주문</a></li>
                                    <li><a href="${pageContext.request.contextPath}/${sessionScope.userid}/myshop">나의 쇼핑</a></li>
                                    <li><a href="${pageContext.request.contextPath}/shops/${sessionScope.shopid}/management/">판매관리</a></li>
                                    <li><a href="${pageContext.request.contextPath}/shops/tags">태그의 세계</a></li>
                                </ul>
                            </li>
 
							<li><a href="#">Seller</a>
								<ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/shops/new">판매자 신청</a></li>
                                    <li><a href="#">판매자 수정</a></li>
                                    <li><a href="${pageContext.request.contextPath}/shops/test/products/new">제품등록</a></li>
                                    <li><a href="#">제품수정</a></li>
								</ul></li>

							
							<li><a href="#">Admin</a>
                                <ul class="dropdown">
                                    <li><a href="#">대시보드</a></li>
                                </ul>
                            </li>

							
						</ul>
					</div>
					<!-- Nav End -->
				</div>
			</nav>

			<!-- Header Meta Data -->
			<div class="header-meta d-flex clearfix justify-content-end">
				<!-- Search Area -->
				<div class="search-area">
					<form action="#" method="post">
						<input type="search" name="search" id="headerSearch"
							placeholder="검색">
						<button type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
				<!-- Favourite Area -->
				<div class="favourite-area">
					<a href="#"><img src="${pageContext.request.contextPath}/resources/img/core-img/heart.svg" alt=""></a>
				</div>
				<!-- User Login Info -->
				<div class="user-login-info-open">
					<input type="checkbox" id="user-login-info-open"
						class="user-login-info-open" data-role="none"> <label
						for="user-login-info-open" class="user-login-info-open"> <img
						src="${pageContext.request.contextPath}/resources/img/core-img/lock-outline.svg">
					</label> </input>
					<!-- ##### Mypage Button Start ##### -->
					<div class="navigation-mypage-btn">
						<ul class="navigation-user-menu">
							<li><a href="#">나의 쇼핑</a></li>
							<li><a href="${pageContext.request.contextPath}/shops/new">판매자 신청</a></li>
							<sec:authorize access="isAnonymous()">
								<li><a href="${pageContext.request.contextPath}/users/login">로그인</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<li><a href="${pageContext.request.contextPath}/users/logout">로그아웃</a></li>
							</sec:authorize>
						</ul>

					</div>
					<!-- ##### Mypage Button End ##### -->
				</div>
				<!-- Cart Area -->
				<div class="cart-area">
					<a href="#" onclick="getBasketsList('${sessionScope.userid}'); return false;"  id="essenceCartBtn"><img src="${pageContext.request.contextPath}/resources/img/core-img/bag.svg"
						alt=""> <span>3</span></a>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->

	<!-- ##### Right Side Cart Area ##### -->
	<div class="cart-bg-overlay"></div>

	<div class="right-side-cart-area">

		<!-- Cart Button -->
		<div class="cart-button" id="basketQuantity">
			
		</div>

		<div class="cart-content d-flex"> 
			
			<!-- Cart List Area -->
			<div class="cart-list" id="basketList">

			</div>

			<!-- Cart Summary -->
			<div class="cart-amount-summary" id="totalBasket">

			</div>
		</div>
	</div>
	<!-- ##### Right Side Cart End ##### -->
	