<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
<style type="text/css">
.card-body {
	margin: 20px;

}

</style>
</head>
<body>
<sec:authorize access="isAnonymous()">
	<div class="card">
	  <div class="card-body">
	    	로그인 안한 사람만 보임
	    	isAnonymous() 사용
	  </div>
	</div>
</sec:authorize>

<sec:authorize access="permitAll">
	<div class="card">
	  <div class="card-body">
	    	로그인 한 사람 안한 사람 다보임
	    	permitAll 사용	    	
	  </div>
	</div>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<div class="card">
	  <div class="card-body">
	    	로그인한 유저 (user, manager, admin)만 보임
	  </div>
	</div>
</sec:authorize>


<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div class="card">
	  <div class="card-body">
	    	admin으로 로그인한 경우에만 보임
	  </div>
	</div>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_MANAGER')">
	<div class="card">
	  <div class="card-body">
	    	manager으로 로그인한 경우에만 보임
	  </div>
	</div>
</sec:authorize>



<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
	<div class="card">
	  <div class="card-body">
	    	admin과 manager로 로그인하면 볼 수 있음
	  </div>
	</div>
</sec:authorize>


 <sec:authorize access="isAnonymous()">
	<div class="card">
	  <div class="card-body">
		<a class="nav-link" href="/customLogin">로그인</a>
	 </div>
	</div>
 </sec:authorize>
  <sec:authorize access="isAuthenticated()">
	 <div class="card">
	  <div class="card-body">
		<form action="/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		 <button type="submit" class="btn btn-outline-dark btn-sm">로그아웃</button>
	 	</form>
		 </div>
		</div>
</sec:authorize>
  
</body>
</html>