
$(function() {
	
	isRun = false;
	/* feed 댓글 비동기 */
	$(document).on('click','.yWX7d', function(e) {
		e.preventDefault();
		var photoid = $(this).closest('.sH9wk1').closest('.post-interaction').closest('.post').find('.post-image img').attr('alt');
		var location = $('#url-import').attr('href').split('/');
		var photouserid = window.location.pathname.split('/');
		var comment = $(this).closest('.sH9wk1').find('#comment').val();
		var temp = $(this).closest('.sH9wk1').closest('.post-interaction');
		var commentappend = "";
		
		if(isRun == true) {
			return;
		}
		
		isRun = true;
		
		$.ajax({
			url: ctx+"/"+ location[1] +"/comments/"+ photouserid[1] +"/"+ photoid,
			type: "POST",
			data: {comment: comment},
			dataType: "JSON",
			success : function(data) {
				
				isRun = false;
				
				commentappend += '<li class="gElp99 " role="menuitem">' +
				'<div class="P9YgZ">' +
				'<div class="C7I1f ">' +
				'<div class="C4VMK">' +
				'<h3 class="_6lAjh"><a class="FPmhX" title="'+location[1]+'" href="'+ ctx +'/'+ location[1] +'/">'+location[1]+'</a></h3>' +
				'<span> '+comment+'</span>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</li>';
				
				$(temp).find('.post-content').append(commentappend);
				
				$(temp).find('.Ypffh1').val('');
				
				$(temp).find('.yWX7d').attr('disabled', true);
				
				$(temp).find('.Ypffh1').focus();
				
				$.ajax({
					url: ctx+"/commentcount/"+ photoid,
					type: "POST",
					success : function(data) {
						$(temp).find('#count').text(data);
						
					}
				});
				
			},
			beforeSend : function() {
				
				$('.save-bar').show();
			},
			complete : function() {
				
				$('.save-bar').hide();
			}
		});
		
	});
	
	
/* Feed 친구추천 팔로우/팔로잉 버튼 이벤트 */
	
	$(document).on('click', '.feed-follow', function(e) {
		e.preventDefault();
		console.log("클릭 탐");
		
		var attr = $('a',this);
		var followplus = 0;
		var location = $('#url-import').attr('href').split('/');
		var followid = $.trim($(this).closest('.user-account').find('.user-account-info h2').text());
		console.log($('a',this).text());
			
			
			var following = {
					followingId : followid,
					usersuserId : location[1],
					follow : $(this).text()
							};
			var json = JSON.stringify(following);
			
			$.ajax({
				url: ctx+"/"+location[1]+"/photos/"+followid+"/follow",
				type: "POST",
				data: json,
				dataType: "JSON",
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					
					
					if(data == 1){
						attr.text('팔로잉');
						followplus = parseInt($('.following-num b').text()) + 1;
						$('.following-num b').text(followplus);
					}else if(data == 0){
						attr.text('팔로우');
						followplus = parseInt($('.following-num b').text()) - 1;
						$('.following-num b').text(followplus);
					}
					
				}
			});
		
		
	});
	
	
});
