
$(document).ready(function(){
	
                var socket = io("http://15.164.0.222:82");
            	var location = $('#url-import').attr('href').split('/');
            	var photouserid = window.location.pathname.split('/');
    			var receptionid = "";
    			
    			
    			reconntectd();
                    
                	
                
                $('.sqdOPaC').on('click',function() {
                	const ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
                	var location = $('#url-import').attr('href').split('/');
                	var photouserid = window.location.pathname.split('/');
                	var url = ctx+"/" + location[2]+"/chats";
                	
                	var message = {
                			myid: location[2],
                			recepient: photouserid[2],
                			command:'connect'
                	};
                	
                	//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                	console.log('클릭');
                	socket.emit('message', message);
                	
                	
						$.ajax({
							url: url,
							type: "GET",
							dataType: "html",
							data: {
								photouserid: photouserid[2]
								   },
							
							success : function(data) {
								
								$('#instafeed').append(data);
								

								
				                socket.on('response', function(input) {
				                	
				                	console.log("응답 -> : " + JSON.stringify(input));
				                	
				                	var text = "";
				                	
				                	text +=  '<msg>'+
				                    '<i class="msg msg-send">'+
				                    ''+input.sender+''+
				                    '</i>'+
				                  '</msg>';
				                	
				                	console.log("텍스트" + text);
				                	
				                	$('main').append(text);
			                    	
			                    	$('main').scrollTop($('main').height());
				                });
								
								
								socket.on('message', function(message) {
									console.log('수신 -> ' + JSON.stringify(message));

									receptionid = message.myid;
									var text = "";
				                	
				                	text +=  '<msg>'+
				                    '<i class="msg msg-receive">'+
				                    ''+message.sender+''+
				                    '</i>'+
				                  '</msg>';
									

				                	
				                	console.log("텍스트" + text);
				                	
				                	$('main').append(text);
			                    	
			                    	$('main').scrollTop($('main').height());
								});
				                //msg_process를 클릭할 때
				                //msg에서 키를 누를떄
				                $("#msg").keydown(function(key){
				                    //해당하는 키가 엔터키(13) 일떄
				                    if(key.keyCode == 13){
				                    	var message = {
				                    			myid: location[2],
				                    			sender: $("#msg-input").val(),
				                    			recepient: photouserid[2],
				                    			command:'chat',
				                    			type:'text'
				                    	};
				                    	
				                    	//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				                    	console.log('클릭');
				                    	socket.emit('message', message);
				                    	
				                    	//#msg에 벨류값을 비워준다.
				                    	$("#msg-input").val("");

				                    }
				                	
				                });
								
							}
								   
								   
						});
                	
                });
                
                
                function reconntectd() {
				
        			if(location[2] != ""){
        				
        				socket.on('connect', function() {
        					
        					
        					
        					var userids = {
        							myid: location[2]
        					};
        					
        					socket.emit('userids',userids);
        					
        					console.log(socket.id);
        					console.log(userids);
        					
        					
        					
        				});
        			}
                	
				}
                

            });