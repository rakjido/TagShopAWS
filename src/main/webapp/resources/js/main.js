
function smallcodeM(code){
	console.log(curl);
	var curl = ctx + "/shops/categories/sub/" + code;

	ajaxMainFn(curl);
}
function ajaxMainFn(curl){
	var num = 0;
	$.ajax({
		type : "GET",
		url : curl,
		success : function(data) {
			$("#mainTagsList").empty();
			console.log(data);
			var jsontable = "";
			
			$.each(data,function(index, item){
				if(num == 6){
					return false;
				}
				jsontable +=
					'<div class="col-12 col-sm-6 col-lg-4">'+
		                '<div class="single-product-wrapper w100">'+
		                    '<div class="product-img">'+
		                        '<img src="'+ctx+'/uploads/'+ item.photoFile + '" alt="" class="imgheight">'+
		                        '<div class="product-favourite">'+
		                            '<a href="#" class="favme fa fa-heart" aria-hidden="true"></a>'+
		                        '</div></div><div class="product-description">' +
		                        '<span><a href="'+ctx+'/shops/' + item.shopid +'productList">'+ item.shopid + '</a></span>' +
		                        '<h6>' +
		                        item.title +
		                        '</h6><p class="product-price">'+
		                        numberFormat(item.price) + 
		                        '원</p><div class="hover-content"><div class="add-to-cart-btn">'+
		                        '<a href="'+ctx+'/shops/'+item.shopid+'/products/'+ item.productid+'" class="btn essence-btn">상세 보기</a>' +
		                            '</div></div></div></div></div>';
				num++;

			});
			
			$('#mainTagsList').append(jsontable);
							
		}
	});
}


$(function(){
	
});