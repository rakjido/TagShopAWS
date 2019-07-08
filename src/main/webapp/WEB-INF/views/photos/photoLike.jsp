<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/instagram.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loadingbar.css"> --%>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	
	<!-- ##### Instagram Start ##### -->
	
    <div class="top_catagory_area section-padding-80 clearfix insta-background">
    
   	<%@ include file="/WEB-INF/views/include/photosheader.jsp" %>
   	  <div id="instafeed">
      <div class="photocontent">
      <div class="fx7hk"><a class="_9VEo1" href="${pageContext.request.contextPath}/${profile.userid}/feeds"><span class="smsjF">
            <div class="coreSpriteDesktopPhotoGridActive"></div><span class="PJXu4">Feed</span>
          </span></a><a class="_9VEo1" href="${pageContext.request.contextPath}/${profile.userid}/"><span class="smsjF">
            <div class="coreSpriteDesktopProfileIGTV"></div><span class="PJXu4">Timeline</span>
          </span></a><a class="_9VEo1 T-jvg" href="${pageContext.request.contextPath}/${profile.userid}/likes"><span class="smsjF">
            <div class="coreSpriteDesktopProfileSave"></div><span class="PJXu4">Like</span>
          </span></a>
        </div>
        
        <!-- ##### Ajax Loading Bar Start ##### -->

<%-- 		<div class="save-bar">
			<div class="circle-loader">
				<div class="checkmark draw"></div>
			</div>
			<div class="saved">Saved!</div>
		</div>
	
		<script src="${pageContext.request.contextPath}/resources/js/script.js"></script> --%>

	<!-- ##### Ajax Loading Bar End ##### -->
        
        

      <div class="photo-grid">
        <div class="container">
          <div class="row">
          <c:forEach var="photos" items="${photos }">
            <div class="col-xs-12 col-sm-4 grid photocount">
              <img src="${pageContext.request.contextPath}/uploads/${photos.fileName}" alt="${photos.photoId }" />
            </div>
            </c:forEach>
          </div>
        </div>

      
      <div class="load-more">
        <span>Load More</span>
      </div>
      
      </div>
      </div>
      </div>
      </div>
      
      <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/classie.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/modernizr.custom.js'></script>
    
        <script src="${pageContext.request.contextPath}/resources/js/instagram.js"></script>


    <!-- ##### Instagram End ##### -->
    
    	<!-- 본문 끝 -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- js파일 ! -->