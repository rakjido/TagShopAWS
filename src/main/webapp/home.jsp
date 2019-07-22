<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소켓 서버</title>
 
<style>
#chat_box {
    width: 800px;
    min-width: 800px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#msg {
    width: 700px;
}
#msg_process {
    width: 90px;
}
</style>
</head>
<body>
    <div id="chat_box"></div>
    <input type="text" id="msg">
    <button id="msg_process">전송</button>
 
    <script src="http://localhost:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script>
            $(document).ready(function(){
                var socket = io("http://localhost:82");
                
                socket.on('connect', function() {
					
                	var userid = ${sessionScope.userid};
                	
				});
                    
                	
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
        </script>
</body>
</html>
