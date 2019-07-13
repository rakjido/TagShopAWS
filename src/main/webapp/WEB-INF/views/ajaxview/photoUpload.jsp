<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="detail" value="${photodetail }" />

	<div class="lightbox visible-box">
		<article class="popup-all">
		
		<form action="photos" enctype="Multipart/form-data" method="POST">
								<div class="mt-10">
									<input type="file" name="file"
										class="single-input-secondary-sub-infor">
								</div>
								<div class="mt-10">
									<input type="text" name="descripTion" placeholder="내용"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '내용'" required=""
										class="single-input-secondary-sub-infor">
								</div>
								<div class="btn-file">
									<button type="submit" class="genric-btn info circle arrow">
										올리기<span class="lnr lnr-arrow-right"></span>
									</button>
								</div>
							</form>
							
			<i class="fa fa-times"></i>
		</article>
	</div>