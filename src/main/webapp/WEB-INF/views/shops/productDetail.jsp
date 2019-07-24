<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- css 넣으세요 -->
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/productDetail.css">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 본문 시작 -->
<!-- ##### Single Product Details Area Start ##### -->
<section class="single_product_details_area d-flex align-items-center">
    <!-- Single Product Thumb -->
    <div class="single_product_thumb clearfix mt86" >
            <img
                src="${pageContext.request.contextPath}/uploads/${vo.photoFile}"
                alt="" class="wh100 mt50 ml50">
    </div>
    <!-- Single Product Description -->
    <div class="single_product_desc clearfix">
        <span>${vo.shopid}</span>
        <h3>${vo.productName}</h3>
        
        <p class="product-price" id="price">${vo.unitPrice}</p>
        <!-- Form -->
        <form class="cart-form clearfix" 
            method="post" commandName="OptionListVo">
        <!-- Select Box -->
        
        <div class="row" id="optionDiv">
            
        </div>
        
        <div class="cart-page-heading mt-30">
            <h5>Your Order</h5>
            <p>Quantity</p>
            <div id="goods_list">
                    <table align='' cellspacing='0' cellpadding='0'>
                        <tr>
                            <td>
                                <div class="col-10 pzero">
                                    <div class="row">
                                        <div class="col-6 pzero">
                                            <input type="text" class="form-control" name="quantity"
                                                value="1" id="quantity">
                                        </div>
                                        <div class="pzero w40p">
                                            <input type="button" class="form-control plusbtnback"
                                                id="plusbtnback">
                                        </div>
                                        <div class="pzero w40p" style="color: white">
                                            <input type="button" class="form-control minusbtnback"
                                                id="minusbtnback">
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
            </div>
        </div>
        <!-- Cart & Favourite Box -->
        <br>
            <input type="hidden" class="form-control" name="unitPrice" value="${vo.unitPrice}">
        <div class="cart-fav-box d-flex align-items-center">
            <!-- Cart -->
            <button type="submit" name="addtocart" value="basket"
                class="btn mr-30 buttoncolor mt-30 EasWx" formaction="${pageContext.request.contextPath}/users/${sessionScope.userid}/baskets/${vo.productItemid}">
                장바구니</button>
        </div>
        
    </div>
</section>
<!-- ##### Single Product Details Area End ##### -->
<section class="single_product_details_area d-flex">
    <div class="col-7 textcenter" id="fixed1">
        <div class="col-12 mb1px">
            <h5 style="margin-top: 12px;">상품정보</h5>
        </div>
    </div>
    <div class="col-7 pl50 EeqsX">
            ${vo.description}
    </div>
    <div class="col-4 EqeeW" id="fixed2">
        <div class="order-details-confirmation">
            <div class="cart-page-heading">
                <h5>Your Order</h5>
                <p>OPTION</p>
            </div>
            <div id="accordion" role="tablist" class="mb-4">
                <div id="orderDiv">
                
                </div>
                <ul class="order-details-form mb-4">
                    <li><span>Product</span> <span>${vo.productName}</span></li>
                    <li><span>Shipping</span> <span id="Shipping">2,500원</span></li>
                    <li><span>Total</span> <span id="TotalPrice">${vo.unitPrice}</span></li>
                </ul>
                <p></p>
                
                <button type="submit" name="addtocart" value="buy"
                class="btn essence-btn" formaction="${pageContext.request.contextPath}/users/${sessionScope.userid}/baskets/${vo.productItemid}">
                Place Order</button>
                </form>
            </div>
        </div>
</section>
<!-- ##### Footer Area Start ##### -->
<!-- 본문 끝 -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- js파일 ! -->
<script>
	
    $(document).ready(function() {
    	var btnNum = 0;

        
        $('#plusbtnback').click(function(){
        	++btnNum;
        	$('#quantity').val(btnNum);
        });
        
        $('#minusbtnback').click(function(){
        	if(btnNum != 1){
        		--btnNum;
            	$('#quantity').val(btnNum);
        	}
        });
        
        function priceFormat(num){
            var len, point, str; 
            num = num + "";
            num = num.substr(0,num.length-2);
            
            point = num.length % 3 ;
            len = num.length; 
           
            str = num.substring(0, point); 
            while (point < len) { 
                if (str != "") str += ","; 
                str += num.substring(point, point + 3); 
                point += 3; 
            } 
             
            return str;
        }
        
        $('#price').text(priceFormat($('#price').text()) + "원");
        $('#TotalPrice').text($('#price').text());
        
        $(window).scroll(function() {
            var height = $(document).scrollTop(); //실시간으로 스크롤의 높이를 측정
            if (height > 950) {
                $('#fixed1').addClass('fixed1');
                $('#fixed2').addClass('fixed2');
                $('#fixed2').removeClass('EqeeW');
            } else {
                $('#fixed1').removeClass('fixed1');
                $('#fixed2').removeClass('fixed2');
                $('#fixed2').addClass('EqeeW');
            }
        });
        
        var opNum = 0;
        var options =  JSON.parse('${options}');
        var typeArr = [];
        var codeArr = [];
        var codeNumArr = [];
        var jsonTable = "";
        var jsonTable2 = "";
        
        for(var i = 0; i < options.length; i++){     
            typeArr.push(options[i].optionType);
        }
        
        typeArr = $.unique(typeArr);
        
        var typeNum = typeArr.length;
        for(var i = 0; i < typeNum; i++){
            var data_filter = options.filter( element => element.optionType == typeArr[i]);
            
            for(var j = 0; j < data_filter.length; j++){
                codeArr.push(data_filter[j].optionCode);
            }
            
            codeNumArr.push(data_filter.length)
        } 
        
        console.log(typeNum);
        console.log(typeArr);
        console.log(codeArr);
        console.log(codeNumArr);
        
        var opnum=0;
        
        for(var i = 0; i < typeNum; i++){
            
            jsonTable += '<div class="select-box d-flex mt-30">' + 
                        '<select name="optionList[' + opnum +'].option" id="productSize" class="mr-3 myselect">';
                        
            jsonTable2 += '<div class="card"><div class="card-header" role="tab" id="headingTwo">' +
                        '<select name="optionList" id="productSize" class="mr-3 myselect2"><div class="select-box d-flex">'
            for(var j = 0; j < codeNumArr[i]; j++){
                jsonTable += '<option value="' + typeArr[i] + ':' + codeArr[0] + '">'+
                            typeArr[i] + ':' + codeArr[0] + '</option>';
                            
                jsonTable2 += '<option value="' + typeArr[i] + ':' + codeArr[0] + '">'+
                            typeArr[i] + ':' + codeArr[0] + '</option>';
                
                codeArr.splice(0,1);
                
            }           
            
            jsonTable +='</select></div>';
            
            jsonTable2 += '</select></div></div></div>'
            
            opnum++;
            
        }
        
        console.log(jsonTable);
        
        $('#optionDiv').append(jsonTable);
        /* $('#orderDiv').append(jsonTable2); */
        
    });
</script>