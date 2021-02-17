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

<c:if test="${not empty id }">
<h1>메일로 받으신 인증번호를 입력하세요.</h1>


<form action="/member/authnum" method="post">
	<input type="hidden" name="serverKey" value="${AuthenticationKey }">
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
	<input type="text" name="userKey" >
	<input type="submit" value="확인">
</form>
</c:if>

<c:if test="${empty id }">

<h1>일치하는 정보가 없습니다.</h1>
<h4>회원가입시 사용한 이메일을 입력해주세요.</h4>
<form action="${root }/member/findid" method="post">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
<input name="email" type="email" class="form-control" id="input-id">
<input type="submit" value="아이디 찾기">
</form>
</c:if>
</body>
</html>