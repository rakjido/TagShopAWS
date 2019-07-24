<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<div class="lightbox visible-box">
		<article class="popup-all">
		
	
			   <chat>
  <aside id='chats'>
    <header>
      <button class='fa fa-plus'></button>
      <button class='fa fa-search'></button>
      <input type='search' placeholder='Search' />
    </header>
    <li class='actual'>
      <img src="${pageContext.request.contextPath}/uploads/${profilevo.photoName}" />
      <h1 class="h1-chat">${profilevo.userid }</h1>
      <h2 class="h2-chat">● ● ●</h2>
    </li>
    <span id='status'>Available</span>
  </aside>
  <aside id='messages'>
    <header>
      <span>To: <strong>${profilevo.userid }</strong></span>
      <i></i>
    </header>
    <main>

    </main>
    <div id='msg'>
      <input id="msg-input" type='text' placeholder='Leave your message here' />
      <svg id='smile' xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" version="1.1" height="20px" viewBox="0 0 64 64" enable-background="new 0 0 64 64">
        <g>
          <g fill="#1D1D1B">
            <path d="M32,0C14.355,0,0,14.355,0,32s14.355,32,32,32s32-14.355,32-32S49.645,0,32,0z M32,60    C16.561,60,4,47.439,4,32S16.561,4,32,4s28,12.561,28,28S47.439,60,32,60z" fill="#b6b6b6" />
            <circle cx="20.518" cy="21.361" r="4.338" fill="#b6b6b6" />
            <circle cx="43.48" cy="21.361" r="4.338" fill="#b6b6b6" />
            <path d="m52.541,36.568c-1.053-0.316-2.172,0.287-2.488,1.344-0.035,0.119-3.739,11.947-18.053,11.947-14.219,0-17.904-11.467-18.055-11.955-0.32-1.055-1.441-1.65-2.486-1.336-1.059,0.317-1.66,1.432-1.344,2.489 0.045,0.148 4.627,14.802 21.885,14.802s21.84-14.654 21.885-14.803c0.316-1.056-0.285-2.171-1.344-2.488z"
              fill="#b6b6b6" />
          </g>
        </g>
      </svg>
    </div>
  </aside>
</chat>


							
			<i class="fa fa-times"></i>
		</article>
	</div>