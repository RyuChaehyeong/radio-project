<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 재설정 페이지 입니다.</h1>
<form action="/member/resetpw" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
	아이디: <input type="text" name="id" value="${id }"> <br>
	비밀번호: <input type="password" name="password" value="${password }"> <br>
	비밀번호 확인: <input type="password" name="ch_password" value="${ch_password }"> <br>
	${unEqual }
	<input type="submit" value="변경">
</form>
</body>
</html>