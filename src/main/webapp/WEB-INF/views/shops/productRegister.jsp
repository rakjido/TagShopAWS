<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!-- css 넣으세요 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/productReg.css">

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script>
    function postForm() {
        $('textarea[name="description"]').val($('#summernote').summernote('code'));
    }
    </script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<!-- 본문 시작 -->
<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area d-flex align-items-center">

	<!-- Single Product Thumb -->
	<div class="single_product_thumb clearfix" style="margin-top:85px";>

		<img
			src="${pageContext.request.contextPath}/resources/img/core-img/productdefault.jpg"
			alt="" id="previewImage" class="fullimg">

	</div>

	<!-- Single Product Description -->
	<div class="single_product_desc clearfix"  style="margin-top:85px";>
		<h2>물품 등록</h2>
		<!-- onsubmit="postForm()"  -->
		<form
			action="${pageContext.request.contextPath}/shops/${sessionScope.shopid}/products/new"
			method="post" onsubmit="postForm()" enctype="multipart/form-data" commandName="OptionListVo">
			<div class="row">
				<div class="col-12 mb-3">
					<label for="company">제목</label> <input type="text"
						class="form-control" id="company" name="title" value="">
				</div>
				<div class="col-12 mb-3">
					<label for="company">가격</label> <input type="text"
						class="form-control" id="company" name="price" value="">
				</div>
				
				
				<div class="row">
					<div class="col-3 pr-0">
						<div class="select-box d-flex mb-4"
							style="margin-top: 1rem !important; margin-left: 17px;" id="largeCategoryRow">
							<select id="largeCategory" class="mr-3" name="largeCategoryCode">
								<option value="">카테고리</option>
								<option value="100">패션의류/잡화</option>
								<option value="200">뷰티</option>
							</select>
 
						</div>
					</div>
					

 						<div class="col-3 pr-0">
							<div class="select-box d-flex mb-4"
								style="margin-top: 1rem !important; margin-left: 17px;"  id="midcategoryRow">
								<select id="midCategory" class="mr-3" name="midCategoryCode">
									
								</select>

							</div>
						</div>

					

 						<div class="col-3 pr-0"  id="smallcategoryRow">
							<div class="select-box d-flex mb-4"
								style="margin-top: 1rem !important; margin-left: 17px;" id="smallcategoryRow">
								<select id="smallCategory" class="mr-3" name="smallCategoryCode">

								</select>
			
							</div>
						</div> 
					
					<div class="filebox">
						<label for="ex_file">이미지</label> <input type="file" name="file"
							id="ex_file">
					</div> 
					
				</div> <!-- row끝 -->
				
				
				


				<div class="col-12 mb-3" 
					style="background-color: #e2e2e2; padding-top: 15px; padding-bottom: 15px">
					<input type="text" class="form-control" id="company" value=""
						placeholder="제품 명" name="productName"> <input type="text"
						class="form-control mb-3" id="company" value="" placeholder="제품 가격"
						name="unitPrice" style="margin-top: 15px;">
						
						 
				<div class="row mb-3">
					<div class="col-4">
						<input type="text" class="form-control" id="insertOption" value="" placeholder="옵션명">
					</div>
					<div class="col-4">
						<input type="text" class="form-control" id="insertOption2" value="" placeholder="옵션값">
					</div>
					<div class="col-3">
						<input type="button" value="옵션 추가" class="btn essence-btn buttoncolor mybtn"
	                            style="height:40px; background-color: #e2e2e2; padding:0 30px; line-height:0" id="addOption"/>
					</div>
				</div>
				
				<div id="optionDiv">
				
				</div>
				
			
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-9">
					<input type="text" class="form-control" id="insertTag" value="#태그">
				</div>
				<div class="col-3">
					<input type="button" value="태그 추가" class="btn essence-btn buttoncolor mybtn"
                            style="height:40px; background-color: #e2e2e2; padding:0 30px; line-height:0" id="addTag"/>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-9" >
					<div class="row" id="tagArea">
					
					</div>
					<!-- <input type="text" class="form-control" id="tagText" value="" style="border:none; font-size:0.7rem; width:15%; font-weight: bold" readonly> -->
					
				</div>
			</div>
	</div>


</section>
<!-- ##### Single Product Details Area End ##### -->
<section class="single_product_details_area d-flex align-items-center">
	<div class="col-12" align="center">
		<div class="col-11">

			<textarea name="description" style="display: none;"></textarea>

			<div id="summernote" class="mt-30"></div>

		</div>
		<div class="col-11">
			<!-- Cart -->
			<div class="col-12 mt-30 pr-0" align="right">

				<input type="submit" name="addtocart" value="등록하기"
					class="btn essence-btn buttoncolor" />

			</div>
		</div>
		</form>
		<br> <br>
	</div>

</section>
<!-- 본문 끝 -->

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<!-- js파일 ! -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script>
		
        $(function(){
        	var opnum = 0;
        	var tagNum = 1;
          $('#summernote').summernote({
              height:200,
              minHeight:null,
              maxHeight:null,
              focus:true,
              
          });
          
          $("#ex_file").change(function(e) {
  			event.preventDefault();
  			var file = e.target.files[0];
  			var url = URL.createObjectURL(file);
  			$("#previewImage").attr("src", url);
  			});
          
          $('.note-editor').css("border", 0);
          
          $('#addTag').click(function(){
        	  var tagstr = document.getElementById("insertTag").value;
        	  
        	  
        	  if(tagNum != 4){  	  
            	  var tag = '<input type="text" name="tagText' + tagNum +'" class="form-control mr-3" id="tagText' + tagNum +'" value="'+ tagstr +'" style="border:none; font-size:0.7rem; width:15%; font-weight: bold" readonly>';
            	  $('#tagArea').append(tag);
            	  tagNum++;
            	  console.log(tagNum);
        	  }
        	  
          });
          
          $('#addOption').click(function(){
        	  var optionStr = document.getElementById("insertOption").value + ":{" + document.getElementById("insertOption2").value+"}";
        	  
        	  var options = '<input type="text"' + 
						    'class="form-control mb-3" id="company" value="'+ optionStr +'" placeholder="'+ optionStr +'"' +
							'name="optionList[' + opnum +'].option" style="margin-top: 15px" readonly>';
            	  $('#optionDiv').append(options);

              opnum++;
          });
          

 			var codeList =  JSON.parse('${categoryList}');
			console.log(codeList);
           
				
/* 				<option value="${categoryList[i].largeCategoryCode}">${categoryList[i].largeCategoryName}</option>
 */

          	
 			
           	$('#largeCategory').change(function(){
           		var data_filter = codeList.filter( element => element.largeCategoryCode == $('#largeCategory').val());
				var midCodeArray =  new Array();
				var midNameArray =  new Array();
				
				var midSelectLi = '<li data-value="" class="option selected">카테고리</li>';
				var midSelectOp = '<option value="">카테고리</option>';
 				
				
				$('#midCategory').empty();
				$('#midcategoryRow > div > ul').empty();
				$('#midcategoryRow > div > span').empty();
				
				for(var i = 0 ; i<data_filter.length ; i++){
					
      				midCodeArray.push(data_filter[i].midCategoryCode);
      				midNameArray.push(data_filter[i].midCategoryName);
      			}
				midCodeArray = $.unique(midCodeArray);
				midNameArray = $.unique(midNameArray);
				 
				for(var i=0; i<midCodeArray.length; i++){
					midSelectLi += '<li data-value="'+ midCodeArray[i] +'"class="option">'+ midNameArray[i] +'</li>' ;
					midSelectOp += '<option value="'+  midCodeArray[i] +'">'+ midNameArray[i] +'</option>';
				}
				
				$('#midCategory').append(midSelectOp);
				$('#midcategoryRow > div > ul').append(midSelectLi);
				$('#midcategoryRow > div > span').text("카테고리");
          			
          	});  
 			
           	$('#midCategory').change(function(){
           		var data_filter = codeList.filter( element => element.midCategoryCode == $('#midCategory').val());

				var smallCodeArray =  new Array();
				var smallNameArray =  new Array();
				
				var smallSelectLi = '<li data-value="" class="option selected">카테고리</li>';
				var smallSelectOp = '<option value="">카테고리</option>';
 				
				
				$('#smallCategory').empty();
				$('#smallcategoryRow > div > ul').empty();
				$('#smallcategoryRow > div > span').empty();
				
				for(var i = 0 ; i<data_filter.length ; i++){
					
      				smallCodeArray.push(data_filter[i].smallCategoryCode);
      				smallNameArray.push(data_filter[i].smallCategoryName);
      			}
				smallCodeArray = $.unique(smallCodeArray);
				smallNameArray = $.unique(smallNameArray);
				
				console.log(smallCodeArray);
				for(var i=0; i<smallCodeArray.length; i++){
					smallSelectLi += '<li data-value="'+ smallCodeArray[i] +'"class="option">'+ smallNameArray[i] +'</li>' ;
					smallSelectOp += '<option value="'+  smallCodeArray[i] +'">'+ smallNameArray[i] +'</option>';
					
				}
				
				$('#smallCategory').append(smallSelectOp);
				$('#smallcategoryRow > div > ul').append(smallSelectLi);
				$('#smallcategoryRow > div > span').text("카테고리");
          			
          	});
 			
 			
        }); 
</script>