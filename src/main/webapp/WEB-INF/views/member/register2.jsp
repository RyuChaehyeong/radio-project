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
<form method="post" action="${root }/member/register">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
<input type="hidden" name="auth" value="ROLE_MANAGER"/>
<div class="container-sm mb-3">
	<div class="row" style="margin-left: 5px;">
		<div class="col-12">
		
			<h1>회원가입 화면입니다.</h1>
		</div>
  </div>
</div>
<div class="container-sm mb-3">
	<div class="row" style="margin-left: 5px;">
		<div class="col-12">
		  <div class="form-group">
		    <label for="input-name">이름</label>
		    <input name="name" type="text" class="form-control" id="input-name">
		  </div>
		  <div class="form-group">
		    <label for="input-id">아이디</label>
		    <input name="id" type="text" class="form-control" id="input-id">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
		  </div>
		  <div class="form-group">
		    <label for="input-Email">Email address</label>
		    <input name="email" type="email" class="form-control" id="input-Email">
		  </div>
		  
		  <div class="form-group">
		    <label for="input-name">주소1</label>
		    <input name="add1" type="text" class="form-control" id="input-add1">
		  </div>
		    <div class="form-group">
		    <label for="input-name">주소2</label>
		    <input name="add2" type="text" class="form-control" id="input-add2">
		  </div>
		    <div class="form-group">
		    <label for="input-name">주소3</label>
		    <input name="add3" type="text" class="form-control" id="input-add3">
		  </div>
		    <div class="form-group">
		    <label for="input-name">주소4</label>
		    <input name="add4" type="text" class="form-control" id="input-add4">
		  </div>
		  <button type="submit" class="btn btn-primary">가입</button>
  	 </div>
  </div>
</div>
</form>
</body>
</html>