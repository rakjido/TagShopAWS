<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    	<c:set var="edits" value="${edit }" />
    
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