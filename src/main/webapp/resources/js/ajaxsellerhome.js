

function smallcode(code){
	var curl = "categories/" + code;

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
					'<div class="col-12 col-md-4 col-lg-3">'+
					'<div class="single-product-wrapper-sub">'+
						'<figure class="snip1366">'+
							'<div class="image">'+
								'<img src="'+ ctx +'/uploads/'+ item.photoFile + '/>'+
							'</div>'+
							'<figcaption><img src="'+ ctx +'/uploads/'+ item.photoFile + '/></figcaption>'+
							'<a href="'+ ctx +'/shops/' + item.shopid + '/products/' + item.productid + '"></a>'+
						'</figure>'+
						'<div class="product-description-sub">'+
							'<a href="'+ ctx +'/shops/' + item.shopid + '/products/' + item.productid + '"><span>' + item.title + '</span></a>'+
							'<a href="single-product-details.html">'+
//								'<h6>'+ item.description +'</h6>'+
							'</a>'+
							'<p class="product-price">'+ item.price +'</p>'+
						'</div></div></div>';
					
								});			
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
						'<div class="col-12 col-md-4 col-lg-3">'+
						'<div class="single-product-wrapper-sub">'+
							'<figure class="snip1366">'+
								'<div class="image">'+
								'<img src="'+ctx+'/uploads/'+ item.photoFile +'" alt="sample36" />'+
								'</div>'+
								'<figcaption><img src="'+ ctx +'/uploads/'+ item.photoFile +'"></figcaption>'+
								'<a href="'+ ctx +'/shops/' + item.shopid + '/products/' + item.productid + '"></a>'+
							'</figure>'+
							'<div class="product-description-sub">'+
								'<a href="'+ ctx +'/shops/' + item.shopid + '/products/' + item.productid + '"><span>' + item.title + '</span></a>'+
								'<a href="single-product-details.html">'+
//									'<h6>'+ item.description +'</h6>'+
								'</a>'+
								'<p class="product-price">'+ item.price +'</p>'+
							'</div></div></div>';
				});
				
				$('#categoriesRow').append(jsontable);
								
				
			}
		});
	});
	


	
	
});