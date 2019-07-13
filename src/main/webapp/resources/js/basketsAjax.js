var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));


function getBasketsList(userid){
	var curl = ctx + "/" + userid + "/baskets";
	basketList(curl, userid)
}

function basketListDelete(userid, productitemId, buyitemsId){
	var curl1 = ctx + "/" + userid + "/baskets/" + buyitemsId;
	var curl2 = ctx + "/" + userid + "/baskets";
	
	$.when(deleteBasketItem(curl1)).done(function(result1) {
		console.log("result1 : " +result1);
		basketList(curl2, userid);
	}).fail(function(){         
		console.log('fail!!');  
	});                         

}


function deleteBasketItem(curl){        
	var ajax = $.ajax({
		url: curl,
		type: 'DELETE',
		async : false,
	    error:function(x,e){
	    	console.log(e);
    	},
    	success: function (data) {}
	});	
	return "delete success";     
};

function basketList(curl, userid){        
	var ajax = $.ajax({
		url: curl,
		type: 'GET',
		async : true,
	    error:function(x,e){
	    	console.log(e);
    	},
    	success : function(data) {
			$("#basketList").empty();
			$('#totalBasket').empty();
			$('#basketQuantity').empty();
			var jsontable = "";
			var jsontable2 = "";
			var totalPrice = 0;
			var quantity = 0;
			$.each(data,function(index, item){
				console.log(item.options);
				totalPrice += item.unitPrice;
				quantity += item.quantity;
				jsontable +=
					'<div class="single-cart-item">' +
					'<div  class="product-image"><img src="'+ctx+'/uploads/'+ item.photoFile + '" class="cart-thumb imgbasket" alt="">' +
						'<div class="cart-item-desc">' +
						'<a href="#" onclick="basketListDelete(' + '\'' + userid+ '\'' +',' +item.productitemId+ ','+ item.buyitemsId + '); return false;">' +
						'<span class="product-remove" style="cursor:pointer"><i class="fa fa-close"'+
							'aria-hidden="true"></i></span></a>'+
						'<span class="badge">PRODUCT</span>'+
						'<a href="'+ ctx + '/shops/'+ item.shopId + '/products/'+ item.productId + '">' +
						'<h6>'+item.productName+'</h6></a>'+
						'<p class="size">'+item.options[0].optionType+': '+ item.options[0].optionCode + '</p>' +
						'<p class="color">'+item.options[1].optionType+': '+ item.options[1].optionCode + '</p>'+
						'<p class="price">$'+ item.unitPrice + '</p></div><div></div>';
			});
			
/*			console.log(totalPrice);*/
			jsontable2 = 
				
				'<h2>Basket</h2>' +
				'<ul class="summary-table">' +
					'<li><span>subtotal:</span> <span>$'+totalPrice +'</span></li>' +
					'<li><span>delivery:</span> <span>Free</span></li>'+
					'<li><span>discount:</span> <span>0%</span></li>'+
					'<li><span>total:</span> <span>$'+totalPrice +'</span></li></ul>'+
				'<div class="checkout-btn mt-100">' +
					'<a href="'+ ctx + '/' + userid +'/'+ 'orders' + '" class="btn essence-btn">Go to buy</a></div>';
			
			var jsontable3 =
				'<a href="#" id="rightSideCart"><img src="'+ctx+'/resources/img/core-img/bag.svg"'+
					'alt=""> <span>'+quantity+'</span></a>';
			
			$('#basketList').append(jsontable);
			$('#totalBasket').append(jsontable2);
			$('#basketQuantity').append(jsontable3);				
		}
	});	
	return "get list success";     
};

