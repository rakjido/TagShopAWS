
/* 테스트 전용 */
	
$(function() {
	
	
	
	
	/* 디테일 팔로우/팔로잉 버튼 이벤트 */
	
	$(document).on('click', '.oW_lN', function() {
		
		console.log("클릭 탐");
		
		var followplus = 0;
		var location = $('#url-import').attr('href').split('/');
		var photouserid = window.location.pathname.split('/');
		if($(this).text() == '팔로잉' || $(this).text() == '팔로우'){
			
			
			var following = {
					followingId : photouserid[2],
					usersuserId : location[2],
					follow : $(this).text()
							};
			var json = JSON.stringify(following);
			
			$.ajax({
				url: "photos/"+location[2]+"/follow",
				type: "POST",
				data: json,
				dataType: "JSON",
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					
					
					if(data == 1){
						$('.oW_lN').text('팔로잉');
						followplus = parseInt($('.follower-num b').text()) + 1;
						$('.follower-num b').text(followplus);
					}else if(data == 0){
						$('.oW_lN').text('팔로우');
						followplus = parseInt($('.follower-num b').text()) - 1;
						$('.follower-num b').text(followplus);
					}
					
				}
			});
		}
		
		
	});
	
	
	
	
	
	
	$('.header-search input').on('focus', function() {
		  $(this).css('text-align', 'left')
		});
		
		$('.header-search input').on('focusout', function() {
		  $(this).css('text-align', 'center')
		});
		
		
		/* Photo Popup Detail */
		$(document).on('click', '.photo-grid .grid', function() {
			
			const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
			var src = $('img', this).attr('src');
			var photoid = $('img', this).attr('alt');
			var location = $('#url-import').attr('href').split('/');
			var photouserid = window.location.pathname.split('/');
			var url = ctx+"/" + location[2]+"/photos/"+photouserid[2]+"/"+photoid;
			var profileimg = $('.profile-photo-link img').attr('src');
			
			$.ajax({
				url: url,
				type: "POST",
				dataType: "html",
				success : function(data) {
					
					
					$('#instafeed').append(data);

				
				$('#exit-button').on('click', function() {
				  $('.lightbox').remove();
				});
				
				$(".Ypffh").on("propertychange change keyup paste", function() {
					
					if($.trim($(this).val()) == ""){
						$('.sqdOP').attr('disabled', true);
					}else {
					    $('.sqdOP').attr('disabled', false);
					}

				});
				
				$("html").on("propertychange change keyup paste",'.YpffhR', function() {
					
					if($.trim($(this).val()) == ""){
						$('.sqdOPR').attr('disabled', true);
					}else {
					    $('.sqdOPR').attr('disabled', false);
					}

				});
					
				}
			});
			
		});

	

				
			$("html").on("propertychange change keyup paste",'.YpffhR', function() {
				
				if($.trim($(this).val()) == ""){
					$('.sqdOPR').attr('disabled', true);
				}else {
				    $('.sqdOPR').attr('disabled', false);
				}
			
			});	
			
			$("html").on("propertychange change keyup paste",'.Ypffh1', function() {
				if($.trim($(this).val()) == ""){
					$(this).closest('.RxpZH').find('.sqdOP').attr('disabled', true);
				}else {
					$(this).closest('.RxpZH').find('.sqdOP').attr('disabled', false);
				}
			
			});	

			
			
			/* 사진 업로드 */
			$(document).on('click', '.sqdOPa', function() {
				
				$.ajax({
					url: "photos",
					type: "GET",
					dataType: "html",
					success : function(data) {
						
						
						$('#instafeed').append(data);
						
						$('#exit-button').on('click', function() {
						  $('.lightbox').remove();
						});
						
					}
				});
				
			});
			
			
			$('.sqdOPaB').click(function() {
				
				var follow = "";
				var followplus = 0;
				var location = $('#url-import').attr('href').split('/');
				var photouserid = window.location.pathname.split('/');
				if($('i',this).attr('class') == 'fas fa-user-minus'){
					follow = "팔로잉";
				}else if($('i',this).attr('class') == 'fas fa-user-plus'){
					follow = "팔로우";
				}
					var following = {
							followingId : photouserid[2],
							usersuserId : location[2],
							follow : follow
									};
					var json = JSON.stringify(following);
					
					$.ajax({
						url: "photos/"+location[2]+"/follow",
						type: "POST",
						data: json,
						dataType: "JSON",
						contentType : 'application/json; charset=UTF-8',
						success : function(data) {
							
							
							if(data == 1){
								$('.sqdOPaB i').removeClass("fa-user-plus");
								$('.sqdOPaB i').addClass("fa-user-minus");
								followplus = parseInt($('.follower-num b').text()) + 1;
								$('.follower-num b').text(followplus);
							}else if(data == 0){
								$('.sqdOPaB i').removeClass("fa-user-minus");
								$('.sqdOPaB i').addClass("fa-user-plus");
								followplus = parseInt($('.follower-num b').text()) - 1;
								$('.follower-num b').text(followplus);
							}
							
						}
					});
				
				
			});
			
			
			$(document).on('click', '#exit-button',function() {
			  $('.lightbox').remove();
			});
			
			$(document).on('keyup', function(e) {
			  if (e.keyCode == 27 && $('.lightbox').hasClass('visible-box')) {
			    closeLightbox();
			  }
			});
			
			
			$(document).on('click', function(e){
				if($('.lightbox').is(e.target)){
					$('.lightbox').remove();
				}
			});
			$(document).on('click', function(e){
				if($('.lightbox-sub').is(e.target)){
					$('.lightbox-sub').remove();
				}
			});
			
			
			/* 오늘 날짜 가져오기 */
			function getRecentDate(){
			    var dt = new Date();
			 
			    var recentYear = dt.getFullYear();
			    var recentMonth = dt.getMonth() + 1;
			    var recentDay = dt.getDate();
			 
			    if(recentMonth < 10) recentMonth = "0" + recentMonth;
			    if(recentDay < 10) recentDay = "0" + recentDay;
			 
			    return recentYear + "-" + recentMonth + "-" + recentDay;
			}
			
			/* 댓글 비동기 */
			
			$(document).on('click','.sqdOP', function(e) {
				
				e.preventDefault();
				var photoid = $('.popup-all-sub img').attr('alt');
				var location = $('#url-import').attr('href').split('/');
				var photouserid = window.location.pathname.split('/');
				const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
				var comment = $('#comment').val();
				var commentappend = "";
				var today = getRecentDate();
				
				
				$.ajax({
					url: ctx+"/"+ location[2] +"/comments/"+ photouserid +"/"+ photoid,
					type: "POST",
					data: {comment: comment},
					dataType: "JSON",
					success : function(data) {
						commentappend += '<li class="gElp9">' +
						'<div class="P9YgZ">' +
						'<div class="pro-div">' +
							'<div class="right-profile-photo-sub">' +
								'<a class="profile-photo-link"> <img src="'+ ctx +'/uploads/'+data.photoName+'" alt="'+photoid+'"></a>' +
							'</div>' +
							'</div>' +
							'<div class="C4VMK">' +
								'<div class="profile-name-sub">' +
									'<a class="profile-a" title="" href="'+ ctx +'/'+ location[2] +'/">'+ location[2] +'</a>' +
									'<span class="RPhNB">'+ comment +'</span>' +
									'<div class="Igw0E">' +
										'<div class="PIoXz">' +
											'<time class="FH9sR" datetime="'+ today +'"' +
												'title="'+ today +'">0분 전</time>' +
										'</div>' +
									'</div>' +
								'</div>' +
							'</div>' +
						'</div>' +
					'</li>';
						
						$('.XQXOT').append(commentappend);
						
						$('.Ypffh').val('');
						
						$('.sqdOP').attr('disabled', true);
						
						$(this).closest('.post-interaction').closest('.post').find('.Ypffh1').focus();
						
					},
					beforeSend : function() {
						
						$('.save-bar').show();
					},
					complete : function() {
			
						$('.save-bar').hide();
					}
				});
				
			});
			
			/* 리포스트 내용 입력 */
			$(document).on('click','.sqdOPR', function(e) {
				
				e.preventDefault();
				var photoid = $('.popup-all-sub img').attr('alt');
				var location = $('#url-import').attr('href').split('/');
				var photouserid = window.location.pathname.split('/');
				const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
				var repost = $('#repost').val();
				
				
				$.ajax({
					url: ctx+"/"+ location[2] +"/reposts/"+ photouserid +"/"+ photoid,
					type: "POST",
					data: {repost: repost},
					success : function(data) {
						
						
						window.location.reload();
						
					},
					beforeSend : function() {
						
						$('.save-bar').show();
					},
					complete : function() {
			
						$('.save-bar').hide();
					}
				});
				
			});
			
			
			$('html').on('click','.dCJp8', function() {
				
				var photoid = $('.popup-all-sub img').attr('alt');
				var likeclass = $('span', this).attr('class');
				
				var feedphotoid = $(this).closest('.post-interaction').closest('.post').find('.post-image img').attr('alt');
				
				var likecount = parseInt($(this).closest('.post-interaction').find('.likes-display span').text());
				
				var useridyou = window.location.pathname.split('/');
				var location = $('#url-import').attr('href').split('/');
				
				
				/* 리포스트 */
				if(likeclass == 'Repost'){
					const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
					var src = $('.popup-all-sub img').attr('src');
					var location = $('#url-import').attr('href').split('/');
					var photouserid = window.location.pathname.split('/');
					var profileimg = $('.profile-photo-link img').attr('src');
					var url = "";
					var photoid = $('.popup-all-sub img').attr('alt');
					
					
					if(useridyou[3] == 'feeds' && location[2] == useridyou[2]){
						
						
						url = ctx+"/" + location[2]+"/reposts/"+photouserid[2]+"/"+feedphotoid;
						
						$.ajax({
							url: url,
							type: "GET",
							dataType: "html",
							success : function(data) {
								
								
								$('#instafeed').append(data);
								
								$('.lightbox').remove();

								
								$('.lightbox-sub i').on('click', function() {
									$('.lightbox-sub').remove();
									$('.Repost-black').addClass('Repost');
									$('.Repost-black').removeClass('Repost-black');
								});
								
								$(".Ypffh").on("propertychange change keyup paste", function() {
									
									if($.trim($(this).val()) == ""){
										$('.sqdOP').attr('disabled', true);
									}else {
										$('.sqdOP').attr('disabled', false);
									}
									
								});
								
							}
						});
						
					}else if(location[2] != useridyou[2]){
						
						url = ctx+"/" + location[2]+"/reposts/"+photouserid[2]+"/"+photoid;
						
						$.ajax({
							url: url,
							type: "GET",
							dataType: "html",
							success : function(data) {
								
								
								$('#instafeed').append(data);
								
								$('.lightbox').remove();
								
								
								$('.lightbox-sub i').on('click', function() {
									$('.lightbox-sub').remove();
									$('.Repost-black').addClass('Repost');
									$('.Repost-black').removeClass('Repost-black');
								});
								
								$(".Ypffh").on("propertychange change keyup paste", function() {
									
									if($.trim($(this).val()) == ""){
										$('.sqdOP').attr('disabled', true);
									}else {
										$('.sqdOP').attr('disabled', false);
									}
									
								});
								
							}
						});
					}
						
						
						

					
				}else if(likeclass == 'Repost-black'){
					
					const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
					var src = $('.popup-all-sub img').attr('src');
					var location = $('#url-import').attr('href').split('/');
					var photouserid = window.location.pathname.split('/');
					var profileimg = $('.profile-photo-link img').attr('src');
					var url = "";
					var photoid = $('.popup-all-sub img').attr('alt');
					
					if(location[2] == photouserid[2] && useridyou[3] != 'feeds'){
					
						url = ctx+"/" + location[2]+"/repostsOk/"+photouserid[2]+"/"+photoid;
						
						
						$.ajax({
							url: url,
							type: "POST",
							data: {timeline: "timeline"},
							success : function(data) {
								$('.Repost-black').addClass('Repost');
								$('.Repost-black').removeClass('Repost-black');
							}
						});
						
					}else if(useridyou[3] == 'feeds'){
						
						
						url = ctx+"/" + location[2]+"/repostsOk/"+photouserid[2]+"/"+feedphotoid;
						
						$.ajax({
							url: url,
							type: "POST",
							data: {timeline: "feed"},
							success : function(data) {
								window.location.reload();

							}
						});
						
					}else{
						
						url = ctx+"/" + location[2]+"/repostsOk/"+photouserid[2]+"/"+photoid;
						
						$.ajax({
							url: url,
							type: "POST",
							data: {timeline: "feed"},
							success : function(data) {
								$('.Repost-black').addClass('Repost');
								$('.Repost-black').removeClass('Repost-black');
								
							}
						});
						
					}
						

					
				}else if(likeclass == 'Comment'){
					
					$( ".Ypffh" ).focus();
					$(this).closest('.post-interaction').closest('.post').find('.Ypffh1').focus();
					
				}else if(likeclass == 'Heart' && useridyou[3] == 'likes' || likeclass == 'Heart' && location[2] != useridyou[2] || likeclass == 'Heart' && useridyou[3] == 'feeds'){
						if(likeclass == 'Heart' && useridyou[3] == 'feeds'){
							
							$('span', this).addClass('Heart-black');
							$('span', this).removeClass('Heart');
							
							$(this).closest('.post-interaction').find('.likes-display span').text(likecount+1);
							
							likecheckok(location[2], feedphotoid, true);
							
						}else{
							
							$('span', this).addClass('Heart-black');
							$('span', this).removeClass('Heart');
							
							likecheckok(location[2], photoid, true);
						}
						
					
				
				}else if (likeclass == 'Heart-black' && useridyou[3] == 'likes' || likeclass == 'Heart-black' && location[2] != useridyou[2] || likeclass == 'Heart-black' && useridyou[3] == 'feeds') {
						if(likeclass == 'Heart-black' && useridyou[3] == 'feeds'){
							$('span', this).addClass('Heart');
							$('span', this).removeClass('Heart-black');
							
							$(this).closest('.post-interaction').find('.likes-display span').text(likecount-1);
							
							likecheckok(location[2], feedphotoid, false);
						}else{
							
							$('span', this).addClass('Heart');
							$('span', this).removeClass('Heart-black');
							
							likecheckok(location[2], photoid, false);
						}
				}

			});

				
				$(document).on('click','._9VEo1',function(e) {

					history.pushState(null, null, $(this).attr('href'));
					
					
					if($.trim($(this).text()) == "Feed"){
						
						e.preventDefault();
						
								$('._9VEo1').removeClass('T-jvg');
								$(this).addClass('T-jvg');
								
						
					$.ajax({
						url: "feeds",
						type: "GET",
						dataType: "html",
						success : function(data) {
							
							
							var feeds = $(data).find('.photocontent');
							
							
							$('#instafeed').html(feeds);
						},
						beforeSend : function() {
							
							$('.save-bar').show();
						},
						complete : function() {
				
							$('.save-bar').hide();
						}
					});
					}else if($.trim($(this).text()) == "Timeline"){
						
						
						e.preventDefault();
						
									$('._9VEo1').removeClass('T-jvg');
									$(this).addClass('T-jvg');
									const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
									var location = window.location.pathname.split('/');

									
						$.ajax({
							url: "/tagshop/"+location[2]+"/",
							type: "POST",
							dataType: "html",
							success : function(data) {
								
								var timelines = $(data).find('.photocontent');
								$('#instafeed').html(timelines);
								
								
								
							}
						});
					}else if($.trim($(this).text()) == "Like"){
						
						
						e.preventDefault();
						
						$('._9VEo1').removeClass('T-jvg');
						$(this).addClass('T-jvg');
						var location = $('#url-import').attr('href').split('/');
						
						$.ajax({
							url: "likes",
							type: "POST",
							data: {userid: location[2]},
							dataType: "html",
							success : function(data) {
								
								var e = $(data).find('.photocontent');
								
								$('#instafeed').html(e);
								
								$('#exit-button').on("click", function(e){
								    $('.lightbox').remove(); 
							});
								
								
							}
						});
					}
					e.preventDefault();
				});
				
				$(window).on('popstate', function(event){
					
					$('#instafeed').load(location.href+' .photocontent');
				  });
				
});
			
function likecheckok(userid, photoid, likeyn) {
	
	$.ajax({
		url: "likecheckok",
		dataType: 'html',
		type: "POST",
		data: {userid: userid, photoid: photoid, likeyn: likeyn},
		success : function(data) {
			
		}
	})
}
