<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/instagram.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loadingbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	
	<!-- ##### Instagram Start ##### -->
	
    <div class="top_catagory_area section-padding-80 clearfix insta-background">
    
		<div class="breadcumb_area bg-img" style="background-image: url(${pageContext.request.contextPath}/resources/img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center tCenter">

                    <div class="page-title tCenter">

                        <h2>${tagname}</h2>

                    </div>

            </div>
        </div>
    </div>

   	  <div id="instafeed">
      <div class="photocontent">
        
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
          <c:forEach var="photos" items="${photolist }">
            <div id="photo" class="col-xs-12 col-sm-4 grid photocount">
              <img src="${pageContext.request.contextPath}/uploads/${photos.fileName}" alt="${photos.photoId }" />
            </div>
            </c:forEach>
          </div>
        </div>
        
          
      </div>
      </div>
      </div>
<!--             <div class="loader-wrapper d-flex justify-content-center align-items-center">     
<div class="loader"><div class="line-spin-fade-loader"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>
	      </div> -->
	      
	      
	      <div class="svg-wrap">
  <svg version="1.1" id="Loader" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
       viewBox="-2.5 -2.5 49 49">
    <circle class="path_circle" fill="none" stroke="#fff" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" cx="22" cy="22" r="22"/>
  </svg>
</div>
	      
      </div>
      

      
      

      	<!-- Noesjs Server js -->
      <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/classie.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/modernizr.custom.js'></script>



    <!-- ##### Instagram End ##### -->
    
    	<!-- 본문 끝 -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- js파일 ! -->
	<script src="${pageContext.request.contextPath}/resources/js/instagram.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/photo_scroll.js"></script>