$(function() {
	
	$('.favourite-area').on('click', function(e) {
		
		e.preventDefault();
		
        var socket = io("http://192.168.0.12:82");
        var location = $('#url-import').attr('href').split('/');
		var photouserid = window.location.pathname.split('/');
		var receptionyouid = "";
			
			socket.on('connect', function() {
				
				
				
				var userids = {
						myid: location[2]
				};
				
				socket.emit('userids',userids);
				
				console.log(socket.id);
				console.log(userids);
				
				
				
			});
		
		console.log("클릭");
		
    	const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
		var location = $('#url-import').attr('href').split('/');
		var photouserid = window.location.pathname.split('/');
		var url = ctx+"/" + location[2]+"/chats";
		
		$.ajax({
			url: url,
			type: "GET",
			dataType: "html",
			success : function(data) {
				
				
				$('body').append(data);
				
				
				
				$('.lightbox-sub i').on('click', function() {
					$('.lightbox-sub').remove();
					$('.Repost-black').addClass('Repost');
					$('.Repost-black').removeClass('Repost-black');
				});
				
                socket.on('response', function(input) {
                	
                	console.log("응답 -> : " + JSON.stringify(input));
                	
                	var text = "";
                	
                	text += '<div class="message">'+
      		      '<div class="avatar">'+
  		        '<img src="http://cdn-img.instyle.com/sites/default/files/styles/320x384/public/images/2017/03/030716-tom-hiddleston-taylor-swift.jpg?itok=d75yZj67" alt=""></div>'+
  		      '<div class="text-frame">'+
  		        ''+input.sender+''
  		      '</div>'+
  		      '<div class="time">10:10</div>'+
  		    '</div>';
                	
                	console.log("텍스트" + text);
                	
                	$('.chat-section').append(text);
                });
				
				
				socket.on('message', function(message) {
					console.log('수신 -> ' + JSON.stringify(message));
					
					receptionyouid = message.myid;
					
					var text = "";
                	
                	text += '<div class="my-msg">' +
                	'<div class="my-text-frame">' +
                	''+message.sender+'' +
                	'</div>' +
                	'<div class="my-time">10:10</div>' +
                	'</div>';
                	
                	console.log("텍스트" + text);
                	
                	$('.chat-section').append(text);
				});
                //msg_process를 클릭할 때
                $('.send-btn').on('click', function() {
                	
                	var message = {
                			sender: $("#chattext").val(),
                			recepient: receptionyouid,
                			command:'chat',
                			type:'text'
                	};
					
                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                	console.log('클릭');
                     socket.emit('message', message);
                     
                    //#msg에 벨류값을 비워준다.
                    $("#chattext").val("");
                });
				
			}
		});
		
	});
	
	
});