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
<style type="text/css">
	 body {
	background-image: url("../resources/pic/background.jpg");
	background-size: contain;
	}	
	
	.nav-menu {
   	   display: flex;
   	   text-decoration: none;
   	   color: white;   	  
       padding: 10px 30px 10px 30px;
   }
   
   .nav-menu:hover {
   	   text-decoration: none;
   }
</style>
</head>


<body>

<div class="header2">
        <nav class="header-nav">
            <a href="" style="text-decoration: none; color:white; align-items: center; display: flex;">회원가입</a>
            &nbsp; <a href="/customLogin" style="text-decoration: none; color:white; align-items: center; display: flex;">로그인(임시임시얍!)</a>
        </nav>
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1><a class="moon" href="${root }">Moon's radio</a></h1>
        </div> 

            <div class="nav">
                <jsp:include page="/resources/include/main_nav.jsp" />                
            </div>

        <div class="corner">     
             <jsp:include page="/resources/include/main_corner.jsp" />  
        </div> 
        
        
        <div class="weekday">
            <jsp:include page="/resources/include/main_dayintro.jsp" />
        </div>  
        					

       <div class="main" style="padding: 100px">
      		<h1>아이디 찾기</h1>
       		<c:if test="${not empty id }">
				<h5>메일로 전송된 인증번호를 입력하세요.</h5>
				<form action="/member/yourid" method="post">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					<input type="hidden" name="serverKey" value="${AuthenticationKey }">
					<input type="hidden" name="id" value="${id }">
					<div class="form-group">
						<input type="text" name="userKey" style="width: 200px;">
					</div>
					<button id="loginBtn" type="submit" style="margin-top: 20px;">확인</button>	
				</form>
				</c:if>
				
				<c:if test="${empty id }">
				
					<h4>일치하는 정보가 없습니다.</h4>
					<form action="${root }/member/findid" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						<div class="form-group">
						    <label for="input-email">이메일</label>
						    <input name="email" type="email" class="form-control" id="input-email" style="width: 300px;">
						</div>
					
						
						<button id="loginBtn" type="submit" style="margin-top: 20px;">아이디 찾기</button>
					</form>

			</c:if>
       </div>
       
        <div class="empty1">

        </div>
        
    </div>
    
    <div class="footer">
        <footer>
            footer
        </footer>
    </div>
    


</body>
<body>


</body>
</html>