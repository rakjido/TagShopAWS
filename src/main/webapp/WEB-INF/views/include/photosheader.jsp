<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
	
	<c:set var="profile" value="${profile }" />
	<c:set var="follower" value="${follower }" />
	<c:set var="following" value="${following }" />
	<c:set var="photo" value="${photos }" />
	<c:set var="followcheck" value="${followcheck }" />
        <div class="user-info">
                <div class="container">
                  <div class="row">
                    <div class="col-xs-12 col-sm-3 profile-photo">
                      <div class="img-wrapper">
                        <img src="${pageContext.request.contextPath}/uploads/${profile.photoName}" alt="profileimg" />
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-9">
                      <div class="follow">
                        <p>${profile.userid }</p>
                        <c:if test="${profile.userid == sessionScope.userid }">
                        </c:if>
                        
                        <c:if test="${profile.userid != sessionScope.userid && followcheck eq null}">
<%--                         <script src="${pageContext.request.contextPath}/resources/js/instagram_check.js"></script>
                        <script>
							var followingid = "${profile.userid}";
							var usersuserid = "${sessionScope.userid}";
							followcheck(followingid, usersuserid);
						</script> --%>
						<button class="sqdOPaB" type="button"><i class="fas fa-user-plus"></i></button>
                        </c:if>
                        
                        <c:if test="${profile.userid != sessionScope.userid && followcheck ne null}">
                        <button class="sqdOPaB" type="button"><i class="fas fa-user-minus"></i></button>
                        </c:if>
                        
                        <c:choose>
                        	<c:when test="${connectcheck eq 'connecting' }">
                        	<button class="sqdOPaC" type="button"><i class="fas fa-comment"></i></button>
                        	</c:when>
                        	<c:otherwise>
                        	<button class="sqdOPaCO" type="button"><i class="fas fa-comment-slash"></i></button>
                        	</c:otherwise>
                        </c:choose>
                        
                        <c:if test="${sessionScope.userid eq profile.userid}">
                        <a class="thEYr " href="${pageContext.request.contextPath}/${sessionScope.userid }/photos/edit">
                        <button class="sqdOPaa" type="button"><i class="fas fa-user-cog"></i></button></a>
                        <button class="sqdOPa" type="button"><i class="fas fa-camera"></i></button>
                        </c:if>



                      </div>
                      <div class="user-stats">
                        <div>
                          게시글 <b>${fn:length(timelinephoto) }</b>
                        </div>
                        <div class="follower-num">
                          팔로워 <b>${follower }</b>
                        </div>
                        <div>
                          팔로우 <b>${following }</b>
                        </div>
                      </div>
                      <div class="user-website">
                          <a href="${profile.website }" target="_blank">${profile.website }</a>
                      </div>
                      <div class="user-biography">
                         <span>${profile.introduction }</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
