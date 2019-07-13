<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/instagram.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modify.css">
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	
	<c:set var="edits" value="${edit }" />
	
    <div class="top_catagory_area section-padding-80 clearfix insta-background">
    
   	  <div id="instafeed">
      <div class="photocontent">
	<div class="container">
        <div class="row profile">
            <div class="col-md-3">
                <div class="profile-sidebar">
                <div class="E1qwE">
                    <div class="profile-img">
                        <img src="${pageContext.request.contextPath}/uploads/${edits.profile.photoName}" alt="${edits.profile.photoName}" />
                    </div>
                    </div>
                    <div class="profile-usertitle">
                        <div class="profile-usertitle-name">
                            ${edits.users.userid }
                        </div>
                        <div class="profile-usertitle-job">
                            ${edits.profile.website }
                        </div>
                    </div>

                    <div class="profile-userbuttons">
                    	<input id="editphoto" type="file" name="file" />
                        <button type="submit" class="btn btn-success btn-sm">프로필 사진 바꾸기</button>
                    </div>

                    <div class="profile-usermenu">
                        <ul class="nav">
                            <li class="active">
                                <a href="profile.html">
                                    <i class="glyphicon glyphicon-home"></i>
                                    	프로필 수정 </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="glyphicon glyphicon-user"></i>
                                    Account Settings </a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <i class="glyphicon glyphicon-ok"></i>
                                    Tasks </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="glyphicon glyphicon-flag"></i>
                                    Help </a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-md-9">
                <div class="profile-content">
                    <div class="row">
                        <div class="col-md-11 B1qwE">
                            <h4 class="edit-title">프로필 수정</h4>
                            <br>
                        </div>
                    </div>
						<form class="editform" action="" method="POST">
						<div class="form-group row">
							<label for="username" class="col-4 col-form-label">사용자 이름</label>
							<div class="col-8">
								<input id="userid" name="userid" placeholder="아이디"
									class="form-control here" required="required" type="text" value="${edits.users.userid }" disabled>
							</div>
						</div>
                        <div class="form-group row">
                            <label for="publicinfo" class="col-4 col-form-label">소개</label>
                            <div class="col-8">
                                <textarea id="introduction" name="introduction" cols="40" rows="4" class="form-control">${edits.profile.introduction }</textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="username" class="col-4 col-form-label">이메일</label>
                            <div class="col-8">
                                <input id="email" name="email" placeholder="이메일" class="form-control here"
                                    required="required" type="text" value="${edits.users.email }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label">전화번호</label>
                            <div class="col-8">
                                <input id="phone" name="phone" placeholder="전화번호" class="form-control here" type="text" value="${edits.users.phone }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="text" class="col-4 col-form-label">웹사이트</label>
                            <div class="col-8">
                                <input id="website" name="website" placeholder="사이트" class="form-control here" required="required"
                                    type="text" value="${edits.profile.website }">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                                <button name="submit" type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	</div>
	</div>
	</div>


	<script src="${pageContext.request.contextPath}/resources/js/photoedit.js"></script>

    
    	<!-- 본문 끝 -->

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<!-- js파일 ! -->
