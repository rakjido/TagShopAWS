<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="margin: 100px;">
		<a><img src="${pageContext.request.contextPath}/images/ms-logo.png"	style="height: 80px; margin-left: 10px;" /></a> <br>
		<br>
		<h3>안녕하세요, ${param.user_id} 님</h3>
		<br>
		<p>환영합니다!</p>
		<br>
		<p>회원가입이 정상적으로 이루어 졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="${pageContext.request.contextPath}/users/login">로그인 페이지로 이동하기</a>
	</div>

</body>
</html>