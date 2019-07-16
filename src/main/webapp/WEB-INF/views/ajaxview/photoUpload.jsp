<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="detail" value="${photodetail }" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/imgareaselect-default.css">
	
	<div class="lightbox visible-box">
		<article class="popup-all">
	
			<div class="col-lg-8 pa-1">
				<div class="popup-all-sub">
					<img src="${pageContext.request.contextPath}/resources/img/core-img/defaultImage.png"
						alt="" id="previewImage" class="fullimg">
	
				</div>
			</div>
			<div class="col-lg-4 pa-1">


				<section class="sH9wk  _JgwE ">
				
				<form action="photos" enctype="Multipart/form-data" method="POST" id="uploadForm">
                <div class="row">
                    <div class="filebox" style="align:right" id="wirteForm">
                        <label for="file">이미지</label> <input type="file" name="file" id="file">
                    </div>
                    
                    <div class="col-12 mb-3">
                        <label for="descripTion">글내용</label>
                        <textarea name="descripTion" form="uploadForm" cols="40" rows="10" autofocus required wrap="hard"></textarea>
                    </div>
					
					
					<!-- http://192.168.1.22:8090/tagshop/shops/test/products/45
					http://192.168.1.22/tagshop/shops/test/products/49 -->
					<div class="col-12 mb-3" id="productDiv">

					</div>
					
					
				    <div class="col-12 mb-3" align="right">
	                    <input hidden name="Ax1" value="Ax1" />
					    <input hidden name="Ay1" value="Ay1" />
					    <input hidden name="Ax2" value="Ay2" />
					    <input hidden name="Ay2" value="Ay2" />
					    <input hidden name="Bx1" value="By1" />
					    <input hidden name="By1" value="By1" />
					    <input hidden name="Bx2" value="By2" />
					    <input hidden name="By2" value="By2" />
					</div>
					
					<div class="col-12 mb-3" align="right" id="axisDiv">
					<input type="submit" value="글쓰기" class="btn essence-btn buttoncolor mybtn"
                            style="height:40px; background-color: #e2e2e2; padding:0 30px; line-height:0" id=""/>
					</div>
				</div>
				</form>

				</section>
			</div>
			<i class="fa fa-times"></i>
		</article>
	</div>

	
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.imgareaselect.pack.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	var regNum = 0;
		$(function(){
			  
	          $("#file").change(function(e) {
	    			event.preventDefault();
	    			var file = e.target.files[0];
	    			var url = URL.createObjectURL(file);
	    			$("#previewImage").attr("src", url);
	    	  });
	          
	          var x1 = 0;
	          var x2 = 0;
	          var y1 = 0;
	          var y2 = 0;
	          var tagStr = '';
	          
	          $('#previewImage').imgAreaSelect({
	              onSelectEnd: function (img, selection) {
	            	  
	            	  if(regNum == 1){

		                  $('input[name="Bx1"]').val(parseInt(selection.x1));
		                  $('input[name="By1"]').val(parseInt(selection.y1));
		                  $('input[name="Bx2"]').val(parseInt(selection.x2));
		                  $('input[name="By2"]').val(parseInt(selection.y2));
		                  
		                  
		                	  var tagStr = '<div class="col-12 mb-3">' +
								'<label for="company">상품 페이지</label> <input type="text"' +
						        'class="form-control" id="company" name="ARefLink" value=""></div>';
								 console.log(tagStr);
								 $('#productDiv').append(tagStr); 
								 regNum++;
								 console.log(regNum);
						
		               }
	            	  
	            	  if(regNum == 0){
/* 	            		  var axis = '<input hidden name="Ax1" value="Ax1" /> ' +
					    	'<input hidden name="Ay1" value="Ay1" />' +
						    '<input hidden name="Ax2" value="Ax2" />'+
						    '<input hidden name="Ay2" value="Ay2" />';
          		  		$('#axisDiv').append(axis); */
	                  $('input[name="Ax1"]').val(parseInt(selection.x1));
	                  $('input[name="Ay1"]').val(parseInt(selection.y1));
	                  $('input[name="Ax2"]').val(parseInt(selection.x2));
	                  $('input[name="Ay2"]').val(parseInt(selection.y2));
	                  console.log( $('input[name="Ay2"]').val());
	                  
	                	  var tagStr = '<div class="col-12 mb-3">' +
							'<label for="company">상품 페이지</label> <input type="text"' +
					        'class="form-control" id="company" name="BRefLink" value=""></div>';
							 console.log(tagStr);
							 $('#productDiv').append(tagStr); 
							 regNum++;
							 console.log(regNum);
					
	                  }
	            	  

	                  
	              }
	          });
	          
		});
	</script>