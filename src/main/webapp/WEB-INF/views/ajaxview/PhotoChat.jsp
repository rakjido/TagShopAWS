<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<div class="lightbox visible-box">
		<article class="popup-all">
		
	
			   <div class="chat-window">
		<!--   對方資訊 -->
		  <div class="head">
		    <div class="photo">
		      <img src="http://cdn-img.instyle.com/sites/default/files/styles/320x384/public/images/2017/03/030716-tom-hiddleston-taylor-swift.jpg?itok=d75yZj67" alt="">
		    </div>
		    <div class="title">
		      <div class="name">Tom Hiddleston</div>
		      <div class="status">-Online-</div>
		    </div>
		  </div>
		<!--   對話視窗 -->
		  <div class="chat-sec-container">
		  <div class="chat-section">
		    <div class="message">
		      <div class="avatar">
		        <img src="http://cdn-img.instyle.com/sites/default/files/styles/320x384/public/images/2017/03/030716-tom-hiddleston-taylor-swift.jpg?itok=d75yZj67" alt=""></div>
		      <div class="text-frame">
		        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
		      </div>
		      <div class="time">10:10</div>
		    </div>
		    <div class="my-msg">
		      <div class="my-text-frame">
		        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
		      </div>
		      <div class="my-time">10:10</div>
		    </div>
		  </div>
		    </div>
		<!--   輸入框 -->
		  <div class="input-section">
		    <textarea placeholder="보내기...." class="YasWd" id="chattext" name="chattext"></textarea>
		      <button type="button" class="send-btn">
		          <img src="https://www.applozic.com/assets/resources/lib/images/icon-send.png" alt="">
		        </button>
		  </div>
		</div>


							
			<i class="fa fa-times"></i>
		</article>
	</div>