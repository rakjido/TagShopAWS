<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                            <label for="username" class="col-4 col-form-label">기존 비밀번호</label>
                            <div class="col-8">
                                <input id="prepassword" name="prepassword" placeholder="기존 비밀번호" class="form-control here"
                                    required="required" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label">기존 비밀번호 확인</label>
                            <div class="col-8">
                                <input id="password" name="phone" placeholder="password" class="form-control here" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-4 col-form-label">기존 비밀번호 확인</label>
                            <div class="col-8">
                                <input id="password" name="phone" placeholder="password" class="form-control here" type="text" value="">
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