<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                    <div class="row">
                        <div class="col-md-11 B1qwE">
                            <h4 class="edit-title">비밀번호 수정</h4>
                            <br>
                        </div>
                    </div>
						<form class="editpassword" action="editpassword" method="POST">
                        <div class="form-group row">
                            <label for="username" class="col-4 col-form-label">기존 비밀번호</label>
                            <div class="col-8">
                                <input id="prepassword" name="prepassword" placeholder="기존 비밀번호" class="form-control here" required="required" type="password" value="">
							<div class="checksty" id='prepwd'>
								<span></span>
							</div>
						</div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label">변경 비밀번호</label>
                            <div class="col-8">
                                <input id="repassword" name="repassword" placeholder="변경 비밀번호" class="form-control here" type="password" value="">
                            <div class="checksty" id='repwd'>
								<span></span>
							</div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label">변경 비밀번호 확인</label>
                            <div class="col-8">
                                <input id="repasswordOk" name="repasswordOk" placeholder="변경 비밀번호 확인" class="form-control here" type="password" value="">
                            <div class="checksty" id='reepwd'>
								<span></span>
							</div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                                <button name="submit" type="submit" class="btn btn-primary">수정</button>
                            </div>
                        </div>
                    </form>
