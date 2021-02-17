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
<h1>비밀번호 찾는 페이지입니다.</h1>

<h4>아이디와 회원가입시 사용한 이메일을 입력해주세요.</h4>
<form action="${root }/member/findpw" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
	아이디: <input name="id" type="text" class="form-control" id="input-id"> 
	이메일: <input name="email" type="email" class="form-control" id="input-email">
	<input type="submit" value="비밀번호 찾기">
</form>
</body>
</html>