
$(function() {
	isRun = false;
	/* feed 댓글 비동기 */
	$(document).on('click','.yWX7d', function(e) {
		e.preventDefault();
		var photoid = $(this).closest('.sH9wk1').closest('.post-interaction').closest('.post').find('.post-image img').attr('alt');
		var location = $('#url-import').attr('href').split('/');
		var photouserid = window.location.pathname.split('/');
		const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		var comment = $(this).closest('.sH9wk1').find('#comment').val();
		var temp = $(this).closest('.sH9wk1').closest('.post-interaction');
		var commentappend = "";
		
		if(isRun == true) {
			return;
		}
		
		isRun = true;
		
		$.ajax({
			url: ctx+"/"+ location[2] +"/comments/"+ photouserid[2] +"/"+ photoid,
			type: "POST",
			data: {comment: comment},
			dataType: "JSON",
			success : function(data) {
				
				isRun = false;
				
				commentappend += '<li class="gElp99 " role="menuitem">' +
				'<div class="P9YgZ">' +
				'<div class="C7I1f ">' +
				'<div class="C4VMK">' +
				'<h3 class="_6lAjh"><a class="FPmhX" title="'+location[2]+'" href="'+ ctx +'/'+ location[2] +'/">'+location[2]+'</a></h3>' +
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
	
});
