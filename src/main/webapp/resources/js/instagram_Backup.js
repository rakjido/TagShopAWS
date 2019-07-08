				
		$('.dCJp8').on('click', function() {
					
					var location = $('#url-import').attr('href').split('/');
					var photoid = $('.popup-all-sub img').attr('alt');
					
					var test = $('.Heart').css('background-image');
					
					if(test == 'url("http://localhost:8090/tagshop/resources/img/product-img/heart-outline.png")'){
						
						likecheckok(location[2], photoid, true);
						
						$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-black.png)');
					
					}else if (test == 'url("http://localhost:8090/tagshop/resources/img/product-img/heart-black.png")') {
						
						likecheckok(location[2], photoid, false);
						
						$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-outline.png)');
					}

					
				});



				$('.header-search input').on('focus', function() {
				  $(this).css('text-align', 'left')
				});
				
				$('.header-search input').on('focusout', function() {
				  $(this).css('text-align', 'center')
				});
				
				$('html').on('mouseover', '.photo-grid .grid', function() {
				  $('.overlay', this).addClass('shows');
				  
					var photoid = $('img', this).attr('alt');
					
					var url = "photos/"+ photoid +"/likes";
					
					$.ajax({
						url: url,
						type: "POST",
						dataType: "json",
						success : function(data) {
							
							console.log(data);
							
								$('.likes').html('<i class="fa fa-heart"></i> '+data.likecount);
								$('.comments').html('<i class="fa fa-comment"></i> '+data.commentcount);
								
						}
					});
				  
				});
				
				$('html').on('mouseout', '.photo-grid .grid', function() {
				  $('.overlay', this).removeClass('shows');
				});
				
				$('.button.follow').on('click', function() {
				  $(this).html($(this).data('text'));
				  if ($(this).data('text') == 'UNFOLLOW') {
				    $(this).data('text', 'FOLLOW')
				  } else {
				    $(this).data('text', 'UNFOLLOW')
				  }
				});
				
				$('.load-more').on('click', function() {
				  var latestThree = $('.photo-grid .grid').slice(-3);
				
				  latestThree.clone().appendTo('.photo-grid .container .row')
				});
				
				function openLightbox(imgUrl, alt) {
				  $('.lightbox').addClass('visible-box');
				  $('.popup-all-sub img').attr('src', imgUrl)
				  $('.popup-all-sub img').attr('alt', alt)
				}
				
				function closeLightbox() {
				  $('.lightbox').removeClass('visible-box');
				}


			/* Photo Popup Detail */
			$(document).on('click', '.photo-grid .grid', function() {
				const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
				var src = $('img', this).attr('src');
				var photoid = $('img', this).attr('alt');
				var location = $('#url-import').attr('href').split('/');
				var url = "photos/"+ photoid;
				var profileimg = $('.profile-photo-link img').attr('src');
				
				$.ajax({
					url: url,
					type: "POST",
					dataType: "json",
					success : function(data) {
						
						if(data.likecheck === null){
							likecheck(location[2], photoid);
						}else if(data.likecheck.likeYn == true){
							$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-black.png)');
						}else if(data.likecheck.likeYn == false){
							$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-outline.png)');
						}
						
						var photos = "";
						var comments = "";
						photos += '<li class="gElp9">' +
			        	'<div class="P9YgZ">' +
			            '<div class="right-profile-photo-sub">' +
			              '<a class="profile-photo-link">' +
			                '<img src="'+ profileimg + '" alt="'+data.photos.photoId+'">' +
			              '</a>' +
			            '</div>' +
			            '<div class="C4VMK">' +
			              '<div class="profile-name-sub">' +
			                '<a class="profile-a" title="" href="'+ctx+'/'+data.photos.userId+'/">'+data.photos.userId+'</a>' +
			                '<span class="RPhNB">'+data.photos.descripTion+'</span>' +
			                '<div class="Igw0E">' +
			                  '<div class="PIoXz"><time class="FH9sR" datetime="'+data.photos.createDate+'" title="'+data.photos.createDate+'">'+data.photos.dateDiff+'일</time></div>' +
			                '</div>' +
			              '</div>' +
			            '</div>' +
			          '</div>' +
			          '</li>';
						
						$.each(data.comments,function(index, item){
							
						photos += '<li class="gElp9">' +
			        	'<div class="P9YgZ">' +
			            '<div class="right-profile-photo-sub">' +
			              '<a class="profile-photo-link">' +
			                '<img src="'+ctx+'/uploads/'+ item.photoName + '" alt="'+item.photoName+'">' +
			              '</a>' +
			            '</div>' +
			            '<div class="C4VMK">' +
			              '<div class="profile-name-sub">' +
			                '<a class="profile-a" title="" href="'+ctx+'/'+item.userId+'/">'+item.userId+'</a>' +
			                '<span class="RPhNB">'+item.comments+'</span>' +
			                '<div class="Igw0E">' +
			                  '<div class="PIoXz"><time class="FH9sR" datetime="'+item.createDate+'" title="'+item.createDate+'">'+item.dateDiff+'일</time></div>' +
			                '</div>' +
			              '</div>' +
			            '</div>' +
			          '</div>' +
			          '</li>';
						});
						
				        $('.XQXOT').html(photos);
				        $('.NnvRN').html('<time class="Nzb55" datetime="'+data.photos.createDate+'" title="'+data.photos.createDate+'">'+data.photos.dateDiff+'일</time>')
			        
					},
					beforeSend : function() {
			
					},
					complete : function() {
			
					}
				});
				
			  openLightbox($('img', this).attr('src'),photoid)
			  
			});
			
			
			$('.lightbox i').on('click', function() {
			  closeLightbox();
			});
			
			$(document).on('keyup', function(e) {
			  if (e.keyCode == 27 && $('.lightbox').hasClass('visible-box')) {
			    closeLightbox();
			  }
			});
			
			
			$(document).on('click', function(e){
				if($('.lightbox').is(e.target)){
					$('.lightbox').removeClass('visible-box');
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

			$(document).ready(function() { 
				
				
				$("._9VEo1").click(function(e) {
					
							e.preventDefault();
					if($.trim($(this).text()) == "Feed"){
								$('._9VEo1').removeClass('T-jvg');
								$(this).addClass('T-jvg');
						
					$.ajax({
						url: "feeds",
						type: "GET",
						dataType: "html",
						success : function(data) {
							
							var feeds = $(data).find('.inner-content');
							
							
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
						
									$('._9VEo1').removeClass('T-jvg');
									$(this).addClass('T-jvg');
									var location = window.location.pathname.split('/');
			
						$.ajax({
							url: "/tagshop/"+location[2]+"/",
							type: "POST",
							dataType: "html",
							success : function(data) {
								
								var timelines = $(data).find('.photo-grid');
								
								$('#instafeed').html(timelines);
								
								$('.lightbox i').on("click", function(e){
								    $('.lightbox').removeClass('visible-box'); 
							});
							$('.load-more').on('click', function() {
								  var latestThree = $('.photo-grid .grid').slice(-3);
			
								  latestThree.clone().appendTo('.photo-grid .container .row')
								});
							
							$('.dCJp8').on('click', function() {
								var test = $('.Heart').css('background-image');
								var photoid = $('.popup-all-sub img').attr('alt');
								
								if(test == 'url("http://localhost:8090/tagshop/resources/img/product-img/heart-outline.png")'){
									
									likecheckok(location[2], photoid, true);
									
									$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-black.png)');
								
								}else if (test == 'url("http://localhost:8090/tagshop/resources/img/product-img/heart-black.png")') {
									
									likecheckok(location[2], photoid, false);
									
									$('.Heart').css('background-image','url(/tagshop/resources/img/product-img/heart-outline.png)');
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
					}else if($.trim($(this).text()) == "Like"){
						$('._9VEo1').removeClass('T-jvg');
						$(this).addClass('T-jvg');
						
						$.ajax({
							url: "likes",
							type: "POST",
							dataType: "html",
							success : function(data) {
								
								var e = $(data).find('.photo-grid');
								
								$('#instafeed').html(e);
								
								$('.lightbox i').on("click", function(e){
								    $('.lightbox').removeClass('visible-box'); 
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
				});
				
			});

			function likecheck(userid, photoid) {

				var likes = {
					photoId : photoid,
					usersUserId : userid,
					likeYn : false,
					buyYn : false
				}
				var jsonlikes = JSON.stringify(likes);
				$.ajax({
					url : "likecheck",
					dataType : 'json',
					type : "POST",
					data : jsonlikes,
					contentType : 'application/json; charset=UTF-8',
					success : function(data) {
						console.log(data);
					}
			
				});
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
				});
			}
