<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <c:set var="detail" value="${photodetail }" />
	<div class="lightbox visible-box">
		<article class="popup-all">
			<div class="col-lg-8 pa-1">
				<div class="popup-all-sub">
					<img
						src="${pageContext.request.contextPath}/uploads/${detail.photos.fileName}"
						alt="${detail.photos.photoId }" usemap="#MapMapMap" class="fullimg">
					
					<map name="MapMapMap">
					
					<div style="position: absolute; top: ${coordinates.YAvg}px; left:${coordinates.XAvg}px;"><a href="${coordinates.ARefLink}"><img src="${pageContext.request.contextPath}/uploads/point.png" id="plusImg"></img></a></div>
					<area shape="rect" coords="${coordinates.ax1},${coordinates.ay1},${coordinates.ax2},${coordinates.ax1}" href="http://kr.yahoo.com/" onFocus="blur()">
					
					<div style="position: absolute; top: ${coordinates.YBvg}px; left:${coordinates.XBvg}px;"><a href="${coordinates.BRefLink}"><img src="${pageContext.request.contextPath}/uploads/point.png" id="plusImg2"></img></a></div>
					<area shape="rect" coords="${coordinates.bx1},${coordinates.by1},${coordinates.bx2},${coordinates.bx1}" href="http://kr.yahoo.com/" onFocus="blur()">
					</map>
					<div>
					
					</div>

				</div>
			</div>
			<div class="col-lg-4 pa-1">
				<header class="popup-header">
					<div class="right-profile-photo">
						<a class="profile-photo-link"> <img
							src="${pageContext.request.contextPath}/uploads/${detail.profile.photoName}"
							alt="${detail.photos.photoId}">${detail.profile.userid}
						</a>
					</div>
					<div class="profile-name">
						<a class="profile-a" title=""
							href="${pageContext.request.contextPath}/${detail.profile.userid}/">${detail.profile.userid}</a>
					</div>
					<div class="bY2yH">
						<span class="RPhNB">•</span>
						<button class="oW_lN type=">팔로우</button>
						<i class="fas fa-eraser"></i>
					</div>
				</header>
				<div class="popup-all-right">
					<div class="EtaWk">
						<ul class="XQXOT">
	
							<li class="gElp9">
									<div class="P9YgZ">
									<div class="pro-div">
										<div class="right-profile-photo-sub">
											<a class="profile-photo-link"> <img
												src="${pageContext.request.contextPath}/uploads/${detail.profile.photoName}"
												alt="${detail.photos.photoId}">
											</a>
										</div>
										</div>
										<div class="C4VMK">
											<div class="profile-name-sub">
												<a class="profile-a" title=""
													href="${pageContext.request.contextPath}/${detail.profile.userid}/">${detail.profile.userid}</a>
												<span class="RPhNB">${detail.photos.descripTion }</span>
												<div class="Igw0E">
													<div class="PIoXz">
														<time class="FH9sR" datetime="${detail.photos.createDate}"
															title="${detail.photos.createDate}">${detail.photos.dateDiff}일</time>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
	
							<c:forEach var="comment" items="${detail.comments }">
								<li class="gElp9">
									<div class="P9YgZ">
									<div class="pro-div">
										<div class="right-profile-photo-sub">
											<a class="profile-photo-link"> <img
												src="${pageContext.request.contextPath}/uploads/${comment.photoName }"
												alt="${comment.photoName }">
											</a>
										</div>
										</div>
										<div class="C4VMK">
											<div class="profile-name-sub">
												<a class="profile-a" title=""
													href="${pageContext.request.contextPath}/${comment.usersUserId}/">${comment.usersUserId}</a>
												<span class="RPhNB">${comment.comments}</span>
												<div class="Igw0E">
													<div class="PIoXz">
														<time class="FH9sR" datetime="${comment.createDate}"
															title="${comment.createDate}">${comment.dateDiff}일</time>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
	
						</ul>
					</div>
				</div>
				<div class="bottom-top">
					<span class="fr66n">
						<button class="dCJp8">
						
							<c:if test="${detail.likecheck.likeYn == null}">
								<span class="Heart" aria-label="false"> </span>
								<script>
									var userid = "${sessionScope.userid}";
									var photoid = ${detail.photos.photoId};
									likecheck(userid, photoid);
								</script>
							</c:if>
							<c:if test="${detail.likecheck.likeYn eq 'true'}">
								<span class="Heart-black" aria-label="true"> </span>
							</c:if>
							<c:if test="${detail.likecheck.likeYn eq 'false'}">
								<span class="Heart" aria-label="false"> </span>
							</c:if>
						</button>
					</span> <span class="fr66n"><button class="dCJp8">
							<span class="Comment" aria-label="댓글 달기"></span>
						</button></span> <span class="fr66n"><button class="dCJp8">
							<span class="Share" aria-label="게시물 공유"></span>
						</button></span> 
						<span class="fr66nn"><button class="dCJp8">
								<span class="${detail.repostsclass }" aria-label="저장"></span>
						</button>
						</span>
				</div>
				<div class="NnvRN">
					<time class="Nzb55" datetime="2019-06-21T04:23:09.000Z"
						title="2019년 6월 21일">2일 전 </time>
				</div>
				<section class="sH9wk  _JgwE ">
					<div class="RxpZH">
						<form class="X7cDz" action="" method="POST">
							<textarea aria-label="댓글 달기..." placeholder="댓글 달기..."
								class="Ypffh" id="comment" name="comment" autocomplete="off" autocorrect="off"></textarea>
							<button class="_0mzm- sqdOP yWX7d" disabled
								type="submit">게시</button>
						</form>
					</div>
				</section>
			</div>
			<i id="exit-button" class="fa fa-times"></i>
		</article>
	</div>
<script>

$(function(){
	var tagStr = '';
	var productList =  JSON.parse('${productList}');
	var xOffset = 10;
    var yOffset = 30;

    $(document).on("mouseover","#plusImg",function(e){ //마우스 오버시
    	productList =  JSON.parse('${productList}');
    	
    	tagStr = '<div id="preview">' + 
				    '<div style="flex:0 0 100%; width:300px; height:300px">'+
				    '<img src="${pageContext.request.contextPath}/uploads/'+ productList[0].photoFile +'"class="fullimg"/></div>' +				
				    '<h6  style="text-align:center">'+ productList[0].title +'</h6></div>';
		console.log(tagStr);
		
    	$("body").append(tagStr);                    
        $("#preview")
            .css("top",(e.pageY - xOffset - 50) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast"); //미리보기 화면 설정 셋팅
    });
    
    $(document).on("mousemove","#plusImg",function(e){ //마우스 이동시
        $("#preview")
            .css("top",(e.pageY - xOffset - 50) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
     
    $(document).on("mouseout","#plusImg",function(){ //마우스 아웃시
        $("#preview").remove();
    });
    
$(document).on("mouseover","#plusImg2",function(e){ //마우스 오버시
	productList =  JSON.parse('${productList}');
	
	tagStr = '<div id="preview2">' + 
    '<div style="flex:0 0 100%; width:300px; height:300px">'+
    '<img src="${pageContext.request.contextPath}/uploads/'+ productList[1].PhotoFile +'"class="fullimg"/></div>' +				
    '<h6  style="text-align:center">'+ productList[1].title +'</h6></div>';
        
        $("body").append(tagStr); //보여줄 이미지를 선언                       
        $("#preview2")
            .css("top",(e.pageY - xOffset - 50) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast"); //미리보기 화면 설정 셋팅
    });
    
    $(document).on("mousemove","#plusImg2",function(e){ //마우스 이동시
        $("#preview2")
            .css("top",(e.pageY - xOffset - 50) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
     
    $(document).on("mouseout","#plusImg2",function(){ //마우스 아웃시
        $("#preview2").remove();
    });
    
});
</script>