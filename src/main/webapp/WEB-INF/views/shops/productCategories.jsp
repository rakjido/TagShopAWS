<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/3accodian.css">
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	<!-- ##### Shop Grid Area Start ##### -->
	<div class="top_catagory_area section-padding-80 clearfix">
    <section class="shop_grid_area section-padding-80">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop_sidebar_area">

                        <!-- ##### Single Widget ##### -->
						<div class="widget catagory mb-50">
							<!-- Widget Title -->
							<h6 class="widget-title mb-30">Catagories</h6>

							<!--  Catagories  -->
							<div class="catagories-menu">
								<ul class="nav__list">
									<li><input id="group-1" value="100" type="checkbox" hidden />
										<label for="group-1" id="largeCategory1"><span
											class="fa fa-angle-right"></span>패션의류/잡화</label>
										<ul class="group-list" id="midCategory1">
										</ul></li>

									<li><input id="group-2" value="200" type="checkbox" hidden />
										<label for="group-2" id="largeCategory2"><span
											class="fa fa-angle-right"></span>뷰티</label>
										<ul class="group-list" id="midCategory2">
										</ul></li>

								</ul>


							</div>
						</div>

						<!-- ##### Single Widget ##### -->
                        <div class="widget price mb-50">
                            <!-- Widget Title -->
                            <h6 class="widget-title mb-30">Filter by</h6>
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Price</p>

                            <div class="widget-desc">
                                <div class="slider-range">
                                    <div data-min="0" data-max="500000" data-unit="&#8361" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="0" data-value-max="500000" data-label-result="Price:">
                                        <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                        <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                                    </div>
                                    <div class="range-price" id="priceRange">Price: &#8361;0 - &#8361;500000</div>
                                </div>
                            </div>
                        </div>

                        <!-- ##### Single Widget ##### -->
                        <div class="widget color mb-50">
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Color</p>
                            <div class="widget-desc">
                                <ul class="d-flex">
                                    <li><a href="#" onclick="sameColor('WHITE'); return false;" style="background-color : #FFFFFF"></a></li>
                                    <li><a href="#" onclick="sameColor('GRAY'); return false;" style="background-color : #808080"></a></li>
                                    <li><a href="#" onclick="sameColor('BLACK'); return false;" style="background-color : #000000"></a></li>
                                    <li><a href="#" onclick="sameColor('BLUE'); return false;" style="background-color : #0000FF"></a></li>
                                    <li><a href="#" onclick="sameColor('RED'); return false;" style="background-color : #FF0000"></a></li>
                                    <li><a href="#" onclick="sameColor('YELLOW'); return false;" style="background-color : #FFFF00"></a></li>
                                    <li><a href="#" onclick="sameColor('PINK'); return false;" style="background-color : #FFC0CB"></a></li>
                                    <li><a href="#" onclick="sameColor('BROWN'); return false;" style="background-color : #A52A2A"></a></li>
                                    <li><a href="#" onclick="sameColor('GREEN'); return false;" style="background-color : #008000"></a></li>
                                    <li><a href="#" onclick="sameColor('PURPLE'); return false;" style="background-color : #800080"></a></li>
                                    
                                </ul>
                            </div>
                        </div>

                        <!-- ##### Single Widget ##### -->
                        <div class="widget brands mb-50">
                            <!-- Widget Title 2 -->
                            <p class="widget-title2 mb-30">Brands</p>
                            <div class="widget-desc">
                                <ul>
                                    <li><a href="#">Asos</a></li>
                                    <li><a href="#">Mango</a></li>
                                    <li><a href="#">River Island</a></li>
                                    <li><a href="#">Topshop</a></li>
                                    <li><a href="#">Zara</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop_grid_product_area">
                        <div class="row">
                            <div class="col-12">
                                <div class="product-topbar d-flex align-items-center justify-content-between">
                                    <!-- Total Products -->
                                    <div class="total-products">
                                        <p><span>186</span> products found</p>
                                    </div>
                                    <!-- Sorting -->
                                    <div class="product-sorting d-flex">
                                        <p>Sort by:</p>

                                            <select name="selectSort" id="sortByselect">
                                                <option value="productidDesc">Newest</option>
                                                <option value="priceDesc">Price: High</option>
                                                <option value="priceAsc">Price: Row</option>
                                            </select>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="categoriesRow">
							<c:set var="list" value="${list}"></c:set>
							<c:forEach var="i" begin="0" end="${list.size()-1}">
								<!-- Single Product -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-wrapper">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/uploads/${list[i].photoFile}" alt="" class="imgheight">
                                        <!-- Favourite -->
                                        <div class="product-favourite">
                                            <a href="#" class="favme fa fa-heart"></a>
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

                </div>
            </div>
        </div>
    </section>
    </div>
    <!-- ##### Shop Grid Area End ##### -->
	<!-- 본문 끝 -->
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!-- js파일 ! -->
	<script src="${pageContext.request.contextPath}/resources/js/ajaxcategories.js"></script>
    
     
    <script>
	    var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	 	function sameColor(color){
	 		var curl = ctx+"/shops/categories/color/" + color;
	 		ajaxfn(curl);
		}
	 	
	 	function betweenPrice(fromPrice, toPrice){
	 		var curl = ctx+"/shops/categories/price/" + fromPrice + "/" + toPrice;
	 		ajaxfn(curl);
		}
	 	
	 	
	 	$( ".slider-range" ).on( "slidechange", function() {
	        //console.log("변경중");
	        var priceArray = $('#priceRange').text().split('-');
	        //alert($('#priceRange').text());
	        var fromPrice = Number(priceArray[0].split('₩')[1]);
	        var toPrice = Number(priceArray[1].replace('₩',''));
	        betweenPrice(fromPrice, toPrice)
	        
	    });

		var codeList =  JSON.parse('${categoryList}');
		console.log(codeList);

		var tableNum = 0;
			    
		 $(function(){
			 $('#largeCategory1').click(function(){
				 $('#midCategory1').empty();
				 $('#midCategory1').append(printCategory(100));
			 });
			 
			 $('#largeCategory2').click(function(){
				 console.log("됨");
				 $('#midCategory2').empty();
				 $('#midCategory2').append(printCategory(200));
			 });
			 
			 
		 });
		 
		 function printCategory(num){
			var data_filter = codeList.filter( element => element.largeCategoryCode == num);
			var jsonTable ="";
			var smallJsonTable = "";
			var midCodeArray =  new Array();
			var midNameArray =  new Array();
			 
			 for(var i = 0 ; i<data_filter.length ; i++){
	  				midCodeArray.push(data_filter[i].midCategoryCode);
	  				midNameArray.push(data_filter[i].midCategoryName);
	  			}
				
				midCodeArray = $.unique(midCodeArray);
				midNameArray = $.unique(midNameArray);

				
				for(var i = 0; i < midCodeArray.length; i++){
					var smallJsonTable = "";
					var smallCodeArray = [];
		 			var smallNameArray = [];
		 			data_filter = codeList.filter( element => element.midCategoryCode == midCodeArray[i]);
		 				
	 				for(var j = 0 ; j < data_filter.length ; j++){
	  					smallNameArray.push(data_filter[j].smallCategoryName);
	 	  				smallCodeArray.push(data_filter[j].smallCategoryCode);
	 	  			}
	 				
	 				for(var j = 0; j < smallCodeArray[j]; j++){
	 					smallJsonTable += '<li><a href="#" onclick="smallcode('+ smallCodeArray[j] +'); return false;">'+ smallNameArray[j] +'</a></li>';
	 				}
		 				
					jsonTable += '<li><input id="sub-group-'+ num + i +'" type="checkbox" value="'+ midCodeArray[i] +'" hidden/>' +
		            '<label for="sub-group-'+ num+ i +'"><span class="fa fa-angle-right"></span>' + midNameArray[i] + '</label>' +
		            '<ul class="sub-group-list" id="smallCategory'+  i +'">'+ smallJsonTable +
		            '</ul>'+
		            '</li>';
				}
					
				
				return jsonTable;
					
			}


    </script>