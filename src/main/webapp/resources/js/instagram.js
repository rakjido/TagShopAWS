
/* 테스트 전용 */
	
$(function() {
	
	
	$('.header-search input').on('focus', function() {
		  $(this).css('text-align', 'left')
		});
		
		$('.header-search input').on('focusout', function() {
		  $(this).css('text-align', 'center')
		});
		
		
		
		$('html').off().on('mouseenter', '.photocount', function() {
			

			$(this).addClass("hover");
			var photoid = $('img', this).attr('alt');
			
			var url = "photos/"+ photoid +"/likes";
			var count ="";
			
			$.ajax({
				url: url,
				type: "POST",
				dataType: "json",
				success : function(data) {
					count += '<div class="overlay shows">' +
	                '<div class="likes">' +
	                  '<i class="fa fa-heart">' +
	                  '</i> ' + data.likecount + '' +
	                '</div>' +
	                '<div class="comments">' +
	                  '<i class="fa fa-comment"></i> ' + data.commentcount +'' +
	                '</div>' +
	              '</div>';
					$('.hover').append(count);
				}
			});

		});
		
		$('html').on('mouseleave', '.photocount', function() {
			$(this).removeClass('hover');
		  $('.overlay').detach();
		});
		
		
		$('.load-more').on('click', function() {
		  var latestThree = $('.photo-grid .grid').slice(-3);
		
		  latestThree.clone().appendTo('.photo-grid .container .row')
		});
		
		/* Photo Popup Detail */
		$(document).off().on('click', '.photo-grid .grid', function() {
			
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

				$('.load-more').on('click', function() {
					  var latestThree = $('.photo-grid .grid').slice(-3);

					  latestThree.clone().appendTo('.photo-grid .container .row')
					});
				
				
				$('.lightbox i').on('click', function() {
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
});
	

				
				

			
			
			/* 사진 업로드 */
			$(document).on('click', '.sqdOPa', function() {
				
				$.ajax({
					url: "photos",
					type: "GET",
					dataType: "html",
					success : function(data) {
						
						$('#instafeed').append(data);
						
						$('.lightbox i').on('click', function() {
						  $('.lightbox').remove();
						});
						
					}
				});
				
			});
			
			
			$('.sqdOPaB').click(function() {
				
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
								$('.sqdOPaB').text('팔로잉');
								followplus = parseInt($('.follower-num b').text()) + 1;
								$('.follower-num b').text(followplus);
							}else if(data == 0){
								$('.sqdOPaB').text('팔로우');
								followplus = parseInt($('.follower-num b').text()) - 1;
								$('.follower-num b').text(followplus);
							}
							
						}
					});
				}
				
				
			});
			
			
			$('.lightbox i').on('click', function() {
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
					$('.Repost-black').addClass('Repost');
					$('.Repost-black').removeClass('Repost-black');
				}
			});
			
			;( function( window ) {
			
			  'use strict';
			
			  var transEndEventNames = {
			    'WebkitTransition': 'webkitTransitionEnd',
			    'MozTransition': 'transitionend',
			    'OTransition': 'oTransitionEnd',
			    'msTransition': 'MSTransitionEnd',
			    'transition': 'transitionend'
			  },
			      transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ],
			      support = { transitions : Modernizr.csstransitions };
			
			  function extend( a, b ) {
			    for( var key in b ) { 
			      if( b.hasOwnProperty( key ) ) {
			        a[key] = b[key];
			      }
			    }
			    return a;
			  }
			
			  function UIMorphingButton( el, options ) {
			    this.el = el;
			    this.options = extend( {}, this.options );
			    extend( this.options, options );
			    this._init();
			  }
			
			  UIMorphingButton.prototype.options = {
			    closeEl : '',
			    onBeforeOpen : function() { return false; },
			    onAfterOpen : function() { return false; },
			    onBeforeClose : function() { return false; },
			    onAfterClose : function() { return false; }
			  }
			
			  UIMorphingButton.prototype._init = function() {
			    // the button
			    this.button = this.el.querySelector( 'button' );
			    // state
			    this.expanded = false;
			    // content el
			    this.contentEl = this.el.querySelector( '.morph-content' );
			    // init events
			    this._initEvents();
			  }
			
			  UIMorphingButton.prototype._initEvents = function() {
			    var self = this;
			    // open
			    this.button.addEventListener( 'click', function() { self.toggle(); } );
			    // close
			    if( this.options.closeEl !== '' ) {
			      var closeEl = this.el.querySelector( this.options.closeEl );
			      if( closeEl ) {
			        closeEl.addEventListener( 'click', function() { self.toggle(); } );
			      }
			    }
			  }
			
			  UIMorphingButton.prototype.toggle = function() {
			    if( this.isAnimating ) return false;
			
			    // callback
			    if( this.expanded ) {
			      this.options.onBeforeClose();
			    }
			    else {
			      // add class active (solves z-index problem when more than one button is in the page)
			      classie.addClass( this.el, 'active' );
			      this.options.onBeforeOpen();
			    }
			
			    this.isAnimating = true;
			
			    var self = this,
			        onEndTransitionFn = function( ev ) {
			          if( ev.target !== this ) return false;
			
			          if( support.transitions ) {
			            // open: first opacity then width/height/left/top
			            // close: first width/height/left/top then opacity
			            if( self.expanded && ev.propertyName !== 'opacity' || !self.expanded && ev.propertyName !== 'width' && ev.propertyName !== 'height' && ev.propertyName !== 'left' && ev.propertyName !== 'top' ) {
			              return false;
			            }
			            this.removeEventListener( transEndEventName, onEndTransitionFn );
			          }
			          self.isAnimating = false;
			
			          // callback
			          if( self.expanded ) {
			            // remove class active (after closing)
			            classie.removeClass( self.el, 'active' );
			            self.options.onAfterClose();
			          }
			          else {
			            self.options.onAfterOpen();
			          }
			
			          self.expanded = !self.expanded;
			        };
			
			    if( support.transitions ) {
			      this.contentEl.addEventListener( transEndEventName, onEndTransitionFn );
			    }
			    else {
			      onEndTransitionFn();
			    }
			
			    // set the left and top values of the contentEl (same like the button)
			    var buttonPos = this.button.getBoundingClientRect();
			    // need to reset
			    classie.addClass( this.contentEl, 'no-transition' );
			    this.contentEl.style.left = 'auto';
			    this.contentEl.style.top = 'auto';
			
			    // add/remove class "open" to the button wraper
			    setTimeout( function() { 
			      self.contentEl.style.left = buttonPos.left + 'px';
			      self.contentEl.style.top = buttonPos.top + 'px';
			
			      if( self.expanded ) {
			        classie.removeClass( self.contentEl, 'no-transition' );
			        classie.removeClass( self.el, 'open' );
			      }
			      else {
			        setTimeout( function() { 
			          classie.removeClass( self.contentEl, 'no-transition' );
			          classie.addClass( self.el, 'open' ); 
			        }, 25 );
			      }
			    }, 25 );
			  }
			
			  // add to global namespace
			  window.UIMorphingButton = UIMorphingButton;
			
			})( window );
			
			(function() {
			  var docElem = window.document.documentElement, didScroll, scrollPosition;
			
			  // trick to prevent scrolling when opening/closing button
			  function noScrollFn() {
			    window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
			  }
			
			  function noScroll() {
			    window.removeEventListener( 'scroll', scrollHandler );
			    window.addEventListener( 'scroll', noScrollFn );
			  }
			
			  function scrollFn() {
			    window.addEventListener( 'scroll', scrollHandler );
			  }
			
			  function canScroll() {
			    window.removeEventListener( 'scroll', noScrollFn );
			    scrollFn();
			  }
			
			  function scrollHandler() {
			    if( !didScroll ) {
			      didScroll = true;
			      setTimeout( function() { scrollPage(); }, 60 );
			    }
			  };
			
			  function scrollPage() {
			    scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
			    didScroll = false;
			  };
			
			  scrollFn();
			
			  [].slice.call( document.querySelectorAll( '.morph-button' ) ).forEach( function( bttn ) {
			    new UIMorphingButton( bttn, {
			      closeEl : '.icon-close',
			      onBeforeOpen : function() {
			        // don't allow to scroll
			        noScroll();
			      },
			      onAfterOpen : function() {
			        // can scroll again
			        canScroll();
			      },
			      onBeforeClose : function() {
			        // don't allow to scroll
			        noScroll();
			      },
			      onAfterClose : function() {
			        // can scroll again
			        canScroll();
			      }
			    } );
			  } );
			
			  // for demo purposes only
			  [].slice.call( document.querySelectorAll( 'form button' ) ).forEach( function( bttn ) { 
			    bttn.addEventListener( 'click', function( ev ) { ev.preventDefault(); } );
			  } );
			})();
			
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
			
			
			
		
			$(document).on('click','.sqdOP', function(e) {
				
				e.preventDefault();
				var photoid = $('.popup-all-sub img').attr('alt');
				var location = $('#url-import').attr('href').split('/');
				var photouserid = window.location.pathname.split('/');
				const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
				var comment = $('#comment').val();
				var commentappend = "";
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
												'title="'+ today +'">0일</time>' +
										'</div>' +
									'</div>' +
								'</div>' +
							'</div>' +
						'</div>' +
					'</li>';
						
						$('.XQXOT').append(commentappend);
						
						$('.Ypffh').val('');
						
						$('.sqdOP').attr('disabled', true);
						
						$( ".Ypffh" ).focus();
						
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
				console.log(repost);
				$.ajax({
					url: ctx+"/"+ location[2] +"/reposts/"+ photouserid +"/"+ photoid,
					type: "POST",
					data: {repost: repost},
					success : function(data) {
						
						$('.lightbox-sub').remove();
						
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
				
				console.log(likeclass);
				var useridyou = window.location.pathname.split('/');
				var location = $('#url-import').attr('href').split('/');

				if(likeclass == 'Repost'){

					const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
					var src = $('.popup-all-sub img').attr('src');
					var photoid = $('.popup-all-sub img').attr('alt');
					var location = $('#url-import').attr('href').split('/');
					var photouserid = window.location.pathname.split('/');
					var url = ctx+"/" + location[2]+"/reposts/"+photouserid[2]+"/"+photoid;
					var profileimg = $('.profile-photo-link img').attr('src');

					console.log(url);
					
					$.ajax({
						url: url,
						type: "GET",
						dataType: "html",
						success : function(data) {
							console.log(data);
							
							$('#instafeed').append(data);
							
							$('.lightbox').remove();
							
							$('.Repost').addClass('Repost-black');
							$('.Repost').removeClass('Repost');
							

						$('.load-more').on('click', function() {
							  var latestThree = $('.photo-grid .grid').slice(-3);
		
							  latestThree.clone().appendTo('.photo-grid .container .row')
							});
						
						
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
					

					
				}else if(likeclass == 'Comment'){
					
					$( ".Ypffh" ).focus();
					
				}else if(likeclass == 'Heart' && useridyou[3] == 'likes' || likeclass == 'Heart' && location[2] != useridyou[2]){
						
						$('span', this).addClass('Heart-black');
						$('span', this).removeClass('Heart');
						
						likecheckok(location[2], photoid, true);
						
					
				
				}else if (likeclass == 'Heart-black' && useridyou[3] == 'likes' || likeclass == 'Heart-black' && location[2] != useridyou[2]) {
						
						$('span', this).addClass('Heart');
						$('span', this).removeClass('Heart-black');
						
						likecheckok(location[2], photoid, false);
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
									var location = window.location.pathname.split('/');
			
						$.ajax({
							url: "/tagshop/"+location[2]+"/",
							type: "POST",
							dataType: "html",
							success : function(data) {
								
								var timelines = $(data).find('.photocontent');
								
								$('#instafeed').html(timelines);
								
							},
							beforeSend : function() {
								
								$('.save-bar').show();
							},
							complete : function() {
					
								$('.save-bar').hide();
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
								
								$('.lightbox i').on("click", function(e){
								    $('.lightbox').remove(); 
							});
							$('.load-more').on('click', function() {
								  var latestThree = $('.photo-grid .grid').slice(-3);
			
								  latestThree.clone().appendTo('.photo-grid .container .row')
								});
								
							},
							beforeSend : function() {
								
								$('.save-bar').show();
							},
							complete : function() {
					
								$('.save-bar').hide();
							}
						});
					}
					e.preventDefault();
				});
				
				$(window).on('popstate', function(event){
					
					$('#instafeed').load(location.href+' .photocontent');
				  });
				
			function likecheck(userid, photoid) {
				var likes = {
					photoId : photoid,
					usersUserId : userid,
					likeYn : false,
					buyYn : false
				}
				var jsonlikes = JSON.stringify(likes);
				
				console.log(jsonlikes);
				$.ajax({
					url : "likecheck",
					dataType : 'json',
					type : "POST",
					data : jsonlikes,
					contentType : 'application/json; charset=UTF-8',
					success : function(data) {
						
					}
			
				})
			}
			function likecheckok(userid, photoid, likeyn) {
				
				$.ajax({
					url: "likecheckok",
					dataType: 'html',
					type: "POST",
					data: {userid: userid, photoid: photoid, likeyn: likeyn},
					success : function(data) {
						console.log(data);
					}
				})
			}
			
			function followcheck(followingid, usersuserid) {
				
				$.ajax({
					url: "photos/followcheck",
					type: "POST",
					data: {followingid: followingid, usersuserid: usersuserid},
					success: function(data) {
						console.log(data);
						if(data != ""){
							$('.sqdOPaB').text("팔로잉");
						}else {
							$('.sqdOPaB').text("팔로우");
						}
					}
				})
				
			}
			
