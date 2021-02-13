<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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

				<sec:authorize access="isAuthenticated()">
				    <div class="col-12">
				   <p>principal: <sec:authentication property="principal"/></p>
					<p>MemberVO: <sec:authentication property="principal.member"/></p>
					<h2>김관리 님의 정보입니다. </h2>
					<p>사용자 이름: <sec:authentication property="principal.member.name"/></p>
					<p>사용자 아이디: <sec:authentication property="principal.member.id"/></p>
					<p>사용자 아이디2: <sec:authentication property="principal.username"/></p>
					<p>사용자 이메일: <sec:authentication property="principal.member.email"/></p>
					<p>사용자 주소1: <sec:authentication property="principal.member.add1"/></p>
					<p>사용자 주소2: <sec:authentication property="principal.member.add2"/></p>
					<p>사용자 주소3: <sec:authentication property="principal.member.add3"/></p>
					<p>사용자 주소4: <sec:authentication property="principal.member.add4"/></p>
					<p>사용자 grade: <sec:authentication property="principal.member.grade"/></p>
					<p>사용자 regdate: <sec:authentication property="principal.member.regdate"/></p>
					<p>사용자 권한 리스트: <sec:authentication property="principal.member.authList"/></p>
					</div>
				</sec:authorize>
				
				
				<sec:authorize access="isAnonymous()">		
				  <div class="col-12">
				  	<h2>로그인부터 하세요.</h2>			  
				        <a class="nav-link" href="/customLogin">로그인</a>
				  </div>
				</sec:authorize>

</body>
</html>