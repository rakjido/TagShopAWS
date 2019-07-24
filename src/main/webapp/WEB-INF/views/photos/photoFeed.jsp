<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/instagram.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loadingbar.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>



<%@ include file="/WEB-INF/views/include/header.jsp"%>




<!-- 본문 시작 -->
	
	<!-- ##### Instagram Start ##### -->

<div class="top_catagory_area section-padding-80 clearfix insta-background">

	<%@ include file="/WEB-INF/views/include/photosheader.jsp" %>
	
	  <div id="instafeed" class="content">
  	<div class="photocontent">
	        
      <div class="fx7hk"><a class="_9VEo1 T-jvg" href="${pageContext.request.contextPath}/${profile.userid}/feeds"><span class="smsjF">
            <c:if test="${sessionScope.userid eq profile.userid}">	
            	<div class="coreSpriteDesktopPhotoGridActive"></div>
            	<span class="PJXu4">Feed</span>
            </c:if>
            
          </span></a>
          	<a class="_9VEo1 " href="${pageContext.request.contextPath}/${profile.userid}/">
          	<span class="smsjF">
            <div class="coreSpriteDesktopProfileIGTV"></div>
            <span class="PJXu4">Timeline</span>
          </span></a><a class="_9VEo1 " href="${pageContext.request.contextPath}/${profile.userid}/likes">
          <span class="smsjF">
            <c:if test="${sessionScope.userid eq profile.userid}">
            	<div class="coreSpriteDesktopProfileSave"></div>
				<span class="PJXu4">Like</span>
            </c:if>
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
        
            <!-- Content -->

        <div class="inner-content clearfix">
       
          <!-- Content Post1 -->
        <c:if test="${anotherphotos.size()<= 0}">
                  <div class="feed-container">
                      <div class="feed-post">
						</div>
						<div>
						<span>친구는 이야기를 만드는 중 일꺼야....</span>
						</div>
					</div>
				</c:if>  
          
        <c:if test="${anotherphotos.size()> 0}"> <!-- 20190714 예외처리 추가  -->
          
          <div class="post-container">
             <%-- <c:forEach var="anotherphotos" items="${anotherphotos}" varStatus="status"> --%>
             <c:forEach var="i" begin="0" end="${anotherphotos.size()-1}" varStatus="status">
             
             
            <div class="post">
<!--               <div class="post-summary"> -->
                <!-- Content Post_header -->
                <div class="post-header">
                  <div class="post-account clearfix">
                    <div class="account-avatar-post">
                      <a href="${pageContext.request.contextPath}/${photos[i].userId}/">
                      <!--팔로잉한 유저 프로필 이미지 -->
                        <img src="${pageContext.request.contextPath}/uploads/${anotherphotos[i]}" class="account-avatar-post-style">
                      </a>
                    </div>
                    
                    <div class="account-detail">
                      <a href="${pageContext.request.contextPath}/${photos[i].userId}/">
                        <h2>${photos[i].userId}</h2>
                      </a>
                      <a href="#">
                        <p></p>
                      </a>
                    </div>
                  </div>
                </div>
               
                <!-- Content Post_header -->
    
                <!-- Content Post_image -->
                <div class="post-image">
                    <img src="${pageContext.request.contextPath}/uploads/${photos[i].fileName}" class="post-image-style" alt="${photos[i].photoId}">
                </div>
                <!-- Content Post_image -->
    
                <!-- Content Post_interaction -->
                <div class="post-interaction">
                  <!-- Content Post_interaction_icons -->
                  <div class="feed-top">
                        <span class="fr66n">
                        <button class="dCJp8">
                        
                          <c:if test="${likecheck[i] == null}">
								<span class="Heart" aria-label="false"> </span>
								<script src="${pageContext.request.contextPath}/resources/js/instagram_check.js"></script>
								<script>
									var userid = "${sessionScope.userid}";
									var photoid = ${photos[i].photoId};
									likecheck(userid, photoid);
								</script>
							</c:if>
							<c:if test="${likecheck[i].likeYn eq 'true'}">
								<span class="Heart-black" aria-label="true"> </span>
							</c:if>
							<c:if test="${likecheck[i].likeYn eq 'false'}">
								<span class="Heart" aria-label="false"> </span>
							</c:if>
							
                        </button>
                        </span>
                        <span class="fr66n"><button class="dCJp8">
                            <span class="Comment" aria-label="댓글 달기"></span></button></span>
                        <span class="fr66n"><button class="dCJp8">
                            <span class="Share" aria-label="게시물 공유"></span></button></span>
                        <span class="fr66nn"><button class="dCJp8">
                            <span class="${repostsclass[i] }" aria-label="저장"></span></button></span>
                      </div>
                  <!-- Content Post_interaction_icons -->
    
                  <!-- Content Post_interaction_likes_display -->
                  <div class="likes-display">
                    <div class="likes-content clearfix">
                   
                      <div class="likes-user-name">
                        <a href="#">
                          	<span>${feedlikecount[i]}</span>
                          	명
						</a>
                      	  이 좋아합니다
                      </div>
                    </div>
                  </div>
                  <!-- Content Post_interaction_likes_display -->
                  <!-- Content Post_content -->
                  <div class="post-content">
                    <ul class="content-style">
                            <li class="gElp99 ">
                                    <div class="P9YgZ">
                                        <div class="C7I1f ">
                                            <div class="C4VMK">
                                                <h3 class="_6lAjh"><a class="FPmhX" title="${photos[i].userId}" href="${pageContext.request.contextPath}/${photos[i].userId}/">${photos[i].userId}</a></h3>
                                                <span>${photos[i].descripTion}</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
								<div class="PIoXzT">
								<c:forEach var="tags" items="${phototags[i] }">
								<a class="profile-t" title="" href="${pageContext.request.contextPath}/${tags.tagsNameKo}/">#${tags.tagsNameKo}</a>
								</c:forEach>
								</div>
								
                      <li class="respond-list">
                        <a href="#">
                          <p>댓글 <span id="count"> ${commentList[i].size()}</span>개</p>
                        </a>
                      </li>
              <!-- Comment Start -->
               <c:forEach var = "j" items="${commentList[i] }">
                    <li class="gElp99 " role="menuitem">
                            <div class="P9YgZ">
                                <div class="C7I1f ">
                                    <div class="C4VMK">
                                        <h3 class="_6lAjh"><a class="FPmhX" title="ubd200" href="/ubd200/">${j.usersUserId}</a></h3>
										<span> ${j.comments}</span>
                                    </div>
                                </div>
                            </div>
                     </li>
               </c:forEach>   
               
               
					
					



              <!-- Comment End -->          
                        
                    </ul>
                  </div>
                  <div class="NnvRN1">
                        <a class="c-Yi7" href="#">
                          <time class="Nzb55" datetime="${photos[i].createDate }" title="${photos[i].createDate }">${photodate[i]}
                          </time>
                        </a>
                      </div>
                      <section class="sH9wk1">
                            <div class="RxpZH">
                              <form class="X7cDz" method="POST">
                              <textarea aria-label="댓글 달기..." placeholder="댓글 달기..." id="comment" name="comment" class="Ypffh1" autocomplete="off" autocorrect="off"></textarea>
                              <button class="_0mzm- sqdOP yWX7d        " disabled="" type="submit">게시</button></form>
                            </div>
                          </section>
                  <!-- Content Post_content -->
                </div>
                <!-- Content Post_interaction -->
               
             		 </div>
             	</c:forEach>
           		 </div>
            
            <!-- Content Post1 -->
            
         </c:if>  <!-- 20190714 예외처리 추가  -->
    <!-- ============================================================ -->
    
         <!-- Content Sidebar -->
          <div class="sidebar">
            <!-- sidebar-account -->
            <div class="sidebar-account">
              <div class="user-account clearfix">
                <div class="account-avatar-mainuser">
                  <a href="#">
                    <img src="${pageContext.request.contextPath}/uploads/${profile.photoName}" class="account-avatar-mainuser-style" alt="account-avatar">
                  </a>
                </div>
                <div class="user-account-info">
                  <a href="${pageContext.request.contextPath}/${profile.userid}/">
                    <h2>${profile.userid}</h2>
                  </a>
                  <a href="#">
                    <p>pierceshih</p>
                  </a>
                </div>
              </div>
            </div>
            <!-- sidebar-account -->
            
            
            <!-- sidebar-reference -->
        <div class="sidebar-reference">
          <header class="stories clearfix">
            <p>회원님을 위한 추천</p>
            <a href="">
              <h3>모두보기</h3>
            </a>
          </header>
          <c:forEach var = "i" items="${recommend }">
          <div class="user-account clearfix">
            <div class="account-avatar-otherusers">
              <a href="${pageContext.request.contextPath}/${i.userid}/">
                <img src="${pageContext.request.contextPath}/uploads/${i.photoname}" class="account-avatar-otherusers-style" alt="account-avatar">
              </a>
            </div>
            <div class="user-account-info">
              <div>
                <a href="${pageContext.request.contextPath}/${i.userid}/">
                  <h2>${i.userid }</h2>
                  <p> test</p>
                </a>
              </div>
            </div>
            <div class="follow"><a href="#">팔로우</a></div>
          </div>
          
	</c:forEach>
        </div>
        <!-- sidebar-reference -->
    
            <!-- sidebar-offical -->
            <div class="sidebar-offical">
              <nav class="sidebar-offical-info clearfix">
                <ul>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                  <li><a href="#">test</a></li>
                </ul>
              </nav>
              <span>&copy 2019 INSTAGRAM</span>
            </div>
            <!-- sidebar-offical -->
          </div>
          <!-- Content Sidebar -->
      
        </div>
      </div>
      <!-- Content -->
    </div>
<!--           <div class="loader-wrapper d-flex justify-content-center align-items-center">   
<div class="loader"><div class="line-spin-fade-loader"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div>
</div> -->

<div class="svg-wrap">
  <svg version="1.1" id="Loader" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
       viewBox="-2.5 -2.5 49 49">
    <circle class="path_circle" fill="none" stroke="#fff" stroke-width="5" stroke-linecap="round" stroke-linejoin="round" cx="22" cy="22" r="22"/>
  </svg>
</div>
      </div>



    <!-- ##### Instagram End ##### -->

	<!-- js파일 ! -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/classie.js'></script>
    <script src='https://tympanus.net/Development/ButtonComponentMorph/js/modernizr.custom.js'></script>

    

    
    	<!-- 본문 끝 -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/instagram.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/photo_scroll.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/instagram_Feed.js"></script>
	
