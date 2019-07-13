<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="//cdn.materialdesignicons.com/3.6.95/css/materialdesignicons.min.css">
    
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- ##### sign-in, sign-up Start #####-->
    <div class="sales_apply section-padding-80">
      <div class="container">
        <div class="row">
          <div class="signin_details mt-70 clearfix">
            <div class="signin-title">
              <span>로그인</span>
            </div>
            <div class="signin-icon">
              <div class="icon-btn">
                <button type="button" class="signin-icon-btn-facebook">
                  <i class="mdi mdi-facebook-box signin-icon-text icon-color-facebook"></i>
                </button>
              </div>
              <div class="icon-btn">
                <button type="button" class="signin-icon-btn-google">
                    <i class="mdi mdi-google signin-icon-text icon-color-google"></i>
                </button>
              </div>
              <div class="icon-btn">
                <button type="button" class="signin-icon-btn-instagram">
                    <i class="mdi mdi-instagram signin-icon-text icon-color-instagram"></i>
                </button>
              </div>
            </div>
            <div class="signin_mid"><span class="grey--text text--lighten-1">SNS계정으로 간편 로그인/회원가입</span>
            </div>
          </div>

	    
          <div class="signin_details-sub clearfix">
	          <c:url value="/login" var="loginUrl" />
			  <form:form name="f" action="${loginUrl}" method="POST">

	            <div class="signin_input_text_all">
	              <div class="signin-img">
	                <!-- <i class="mdi mdi-email signin-icon-text"></i> -->
	              </div>
	              <div class="signin-input_text">
	                <input type="text" class="form-control signin-input_text_detail" id="signin-input_text_email" name="userid" required
	                  placeholder="User ID">
	              </div>
	            </div>
	            <div class="signin_input_text_all">
	              <div class="signin-img">
	                <!-- <i class="mdi mdi-lock signin-icon-text"></i> -->
	              </div>
	              <div class="signin-input_text">
	                <input type="password" class="form-control signin-input_text_detail" id="signin-input_text_pwd1" name="password" required
	                  placeholder="비밀번호">
	              </div>
	            </div>
	            <div class="signin-btn">
	                <button type="submit" class="btn signin-btn-detail" id="sign-in">
	                  <div class="v-btn__content">로그인</div>
	                </button>
	                <button type="button" class="btn signin-btn-detail" id="sign-up" onclick="location.href='${pageContext.request.contextPath}/users/signup'">
	                        <div class="v-btn__content">회원가입</div>
	                </button>
	              </div>
              </form:form>
          </div>

          
          
        </div>
      </div>
    </div>
    <!-- ##### sign-in, sign-up End #####-->
    
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>