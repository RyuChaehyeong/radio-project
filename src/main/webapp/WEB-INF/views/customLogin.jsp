<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>Insert title here</title>
<style type="text/css">
.container-sm {
width: 600px;

}
</style>
</head>
	<div class="container-sm mt-5">
	
		<h1>로그인</h1>
		<h5><c:out value="${error }"/></h5>
		<h5><c:out value="${logout }"/></h5>
		
	</div>

		
		<div class="container-sm mt-5">
		
			<form action="/login" method="post">
				<div class="form-group">
					아이디 <input type="text" name="username" class="form-control" id="exampleInputEmail1">
				</div>
				<div class="form-group">
					비밀번호 <input type="password" name="password" class="form-control" />
				</div>
				<div>
					<input type="checkbox" name="remember-me"> 자동 로그인
				</div>
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<button id="loginBtn" type="submit">로그인</button>
			</form>
		</div>
	
</html>