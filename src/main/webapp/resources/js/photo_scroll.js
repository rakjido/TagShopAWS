
$(function() {
	var win = $(window);
	const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var isRun = false;
	
    // Each time the user scrolls
    $(document).on('scroll',win,function() {
    	
    	var length = $('.photocount').length;
        // End of the document reached?
        if ($(document).height() - win.height() == win.scrollTop()) {
        	
        	var location = window.location.pathname.split('/');
        	var result = "";
        	
        	if(location[3] == ""){
        		
        		
                $.ajax({
                    url: 'photos/loads',
                    type: "POST",
                    data: {limit: length},
                    dataType: 'json',
                    beforeSend : function(){ // 요청을 보내기전
                        $('.svg-wrap').show(); // 요청을 보내기전에 스피너를 보여줍니다.
        			}

                })
        		.done(function(data) {
        			setTimeout(function () { 
        			$.each(data, function(index, item){
                    	
                        result += '<div id="photo" class="col-xs-12 col-sm-4 grid photocount">' +
                        '<img src="'+ctx+'/uploads/'+item.fileName+'" alt="'+item.photoId+'" />'+
                      '</div>';
                	});
        			
                	
                	$('.photo-grid .row').append(result);
                	result = "";
                	$('.svg-wrap').hide();
        			}, 0);
				});
        		
        	}else if(location[3] == "likes"){
        		$.ajax({
                    url: 'photos/likesloads',
                    type: "POST",
                    data: {limit: length},
                    dataType: 'json',
                    beforeSend : function(){ // 요청을 보내기전
                        $('.svg-wrap').show(); // 요청을 보내기전에 스피너를 보여줍니다.
        			}

                })
            		.done(function(data) {
            			setTimeout(function () { 
            			$.each(data, function(index, item){
                        	
                            result += '<div id="photo" class="col-xs-12 col-sm-4 grid photocount">' +
                            '<img src="'+ctx+'/uploads/'+item.fileName+'" alt="'+item.photoId+'" />'+
                          '</div>';
                    	});
            			
                    	
                    	$('.photo-grid .row').append(result);
                    	result = "";
                    	$('.svg-wrap').hide();
            			}, 0);
    				});

        	}

        }
    });
    
    $(document).on('mouseenter','.photocount', function() {
		
		var photoid = $('img', this).attr('alt');
		var location = window.location.pathname.split('/');
		var html = $(this);
		var url = ctx+"/"+location+"/photos/"+ photoid +"/likes";
		var count ="";
		if(isRun == true) {
			return;
		}
		
		isRun = true;
		
		$.ajax({
			url: url,
			type: "POST",
			dataType: "json",
			success : function(data) {
				isRun = false;
				count += '<div class="overlay shows">' +
                '<div class="likes">' +
                  '<i class="fa fa-heart">' +
                  '</i> ' + data.likecount + '' +
                '</div>' +
                '<div class="comments">' +
                  '<i class="fa fa-comment"></i> ' + data.commentcount +'' +
                '</div>' +
              '</div>';
				html.append(count);
				
			}
		});

	}).on('mouseleave','.photocount', function() {
		$('.overlay').remove();
	});
	
});