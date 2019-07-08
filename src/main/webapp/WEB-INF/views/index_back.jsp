<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body>
	<h3>TagShop</h3>
	<hr>
	<a href="${pageContext.request.contextPath}/emps">EMP 목록 </a><br>
	
	<a href="${pageContext.request.contextPath}/shops/tags/new">태그추가 </a><br>
	<hr>
	<sec:authorize access="isAnonymous()">
		<a href="${pageContext.request.contextPath}/users/login">로그인</a><br>
		<a href="${pageContext.request.contextPath}/users/signup">회원가입</a><br>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="${pageContext.request.contextPath}/users/logout">로그아웃</a><br>
	</sec:authorize>
	 
</body>
</html>
