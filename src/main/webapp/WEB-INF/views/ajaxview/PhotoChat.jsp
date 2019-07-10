<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="detail" value="${photodetail }" />

	<div class="lightbox visible-box">
		<article class="popup-all">
		
	
	    <div id="chat_box"></div>
	    <input type="text" id="msg">
	    <button id="msg_process">전송</button>


							
			<i class="fa fa-times"></i>
		</article>
	</div>