$(document).ready(function(){
	

                var socket = io("http://localhost:82");
                var location = $('#url-import').attr('href').split('/');
    			var photouserid = window.location.pathname.split('/');
                socket.on('connect', function() {
                	
                	
                	
                	var userids = {
                			myid: location[2]
                	};
					
                	socket.emit('userids',userids);
                	
                	console.log(socket.id);
                	console.log(userids);
         	
                
                    //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
                    socket.on('update', function(data) {
                        //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                        $('<div></div>').text(data.name + ' : ' + data.message).appendTo("#chat_box");
                    });
				})
                    
                	
                //msg에서 키를 누를떄
                $("#msg").keydown(function(key){
                    //해당하는 키가 엔터키(13) 일떄
                    if(key.keyCode == 13){
                        //msg_process를 클릭해준다.
                        msg_process.click();
                    }
                });
                
                //msg_process를 클릭할 때
                $("#msg_process").click(function(){
                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                     socket.emit("message", {type: 'message', message: $("#msg").val()});
                    //#msg에 벨류값을 비워준다.
                    $("#msg").val("");
                });


            });