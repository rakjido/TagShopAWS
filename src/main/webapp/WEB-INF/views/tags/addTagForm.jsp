<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Tag</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/shops/tags/new" method="post">
		<input type="text" name="tags"/>
		<button type="submit" class="btn">태그 추가</button>
	</form>
</body>
</html>