/*function categoriesList(code,id){
	var curl = 
	$.ajax({
		type : "GET",
		url : curl,
		success : function(data) {
			$("#categoriesRow").empty();
			console.log(data);
			var jsontable = "";
			
			$.each(data,function(index, item){

			});
			
			$('#categoriesRow').append(jsontable);
							
		}
	});
}*/

function smallcode(code){
	var curl = "categories/sub/" + code;

	ajaxfn(curl);
}


function ajaxfn(curl){
	$.ajax({
		type : "GET",
		url : curl,
		success : function(data) {
			$("#categoriesRow").empty();
			console.log(data);
			var jsontable = "";
			
			$.each(data,function(index, item){
				jsontable +=
					'<div class="col-12 col-sm-6 col-lg-4">'+
		                '<div class="single-product-wrapper">'+
		                    '<div class="product-img">'+
		                        '<img src="'+ctx+'/uploads/'+ item.photoFile + '" alt="" class="imgheight">'+
		                        '<div class="product-favourite">'+
		                            '<a href="#" class="favme fa fa-heart"></a>'+
		                        '</div></div><div class="product-description">' +
		                        '<span>' + item.shopid + '</span>' +
		                        '<a href="single-product-details.html"><h6>' +
		                        item.title +
		                        '</h6></a><p class="product-price">$'+
		                        item.price + 
		                        '</p><div class="hover-content"><div class="add-to-cart-btn">'+
		                        '<a href="'+ctx+'/shops/'+item.shopid+'/products/'+ item.productid+'" class="btn essence-btn">상세 보기</a>' +
		                            '</div></div></div></div></div>';
			});
			
			$('#categoriesRow').append(jsontable);
							
		}
	});
}

$(function(){
	$('#sortByselect').change(function() {
		var ajaxurl = "categories/sort/" + $('#sortByselect').val();
		$.ajax({
			type : "GET",
			url : ajaxurl,
			success : function(data) {
				$("#categoriesRow").empty();
				console.log(data);
				var jsontable = "";
				
				$.each(data,function(index, item){
					jsontable +=
						'<div class="col-12 col-sm-6 col-lg-4">'+
			                '<div class="single-product-wrapper">'+
			                    '<div class="product-img">'+
			                        '<img src="'+ctx+'/uploads/'+ item.photoFile + '" alt="" class="imgheight">'+
			                        '<div class="product-favourite">'+
			                            '<a href="#" class="favme fa fa-heart"></a>'+
			                        '</div></div><div class="product-description">' +
			                        '<span>' + item.shopid + '</span>' +
			                        '<a href="single-product-details.html"><h6>' +
			                        item.title +
			                        '</h6></a><p class="product-price">$'+
			                        item.price + 
			                        '</p><div class="hover-content"><div class="add-to-cart-btn">'+
			                        '<a href="'+ctx+'/shops/'+item.shopid+'/products/'+ item.productid+'" class="btn essence-btn">상세 보기</a>' +
			                            '</div></div></div></div></div>';
				});
				
				$('#categoriesRow').append(jsontable);
								
				
			}
		});
	});
	
	


});