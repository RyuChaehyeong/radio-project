<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    body {
        
  
        background-size: cover;
        
    }
   .wrapper{      
        margin: 0 10% 0 10%;
        display: grid;
        grid-gap: 15px;
        height: 100%;
        grid-template-columns: 1fr 1fr 1fr 1fr ;
        grid-template-rows:  200px 50px 150px 150px 200px 200px;
        grid-template-areas: 'header header header header'
                             'nav nav nav nav'
                             'coner main main main'
                             'weekday main main main'
                             'weekday main main main'
                             'empty1 main main main'                            
   }
   .wrapper div {
        border-radius: 5px 5px;      
        text-align: inherit;
        display: grid;
   }
   .header {
    grid-area: header;
    color: thistle;
   }
   .nav {
    background-color: snow;
    grid-area: nav;
   } 
   .coner {
    background-color: snow;
    grid-area: coner;
   }
   .weekday {
    background-color: snow;
    grid-area: weekday;
   }
   .main {
    background-color: snow;
    grid-area: main;
   }
   .empty1 {
    grid-area: empty1;
   }
   button {      
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px;
       background-color: thistle; 
       color: white;
   }
   button:hover {      
       cursor: pointer;
   }
   .nav .nav-flex {
       display: flex;
       padding-left: 30px;
       padding-right: 30px;
       border: none;
       outline: none;
       border-radius: 5px 5px;
       align-items: center;
       justify-content: center;
       background-color: thistle;     
   }
   .title {
       padding: 10px 10px 0px 10px;
       font-size: 15px;
   }
   .header h1 {
       text-align: center;
       margin-top: 80px;
   }
   .header2 .header-nav{
       display: flex;
       background-color: black;
       height: 40px;
       justify-content: flex-end;
   }
   .header2 .header-nav .header-button {
       background-color: black;
   }
   .footer{
       height: 200px;
       background-color: rgb(216, 161, 88);
       margin-top: 30px;
       width: 100%;
   }
   i {
       color: grey;
       margin-right: 5px;
   }
   .week {
       background-color: black;
       color: white;
   }
</style>
<script>  
</script>
<body>  

    <div class="header2">
    
		<nav class="navbar navbar-expand-lg navbar-light bg-light">

		  <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
	       		 <a class="nav-link" href="#">회원가입 <span class="sr-only">(current)</span></a>
	      	</li>
	      <sec:authorize access="isAnonymous()">
		      <li class="nav-item">
		        <a class="nav-link" href="/customLogin">로그인</a>
		      </li>
	      </sec:authorize>
	      
	      <sec:authorize access="isAuthenticated()">
		      <li class="nav-item">
	      	<form action="/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		        <button type="submit" class="btn btn-outline-dark btn-sm">로그아웃</button>
	      	</form>
		      </li>
	      </sec:authorize>
		   
		    </ul>
		  </div>
		</nav>
    
    
    </div>
    <div class="wrapper">  

        <div class="header">
            <h1>Moon's radio</h1>
        </div> 

            <div class="nav">
                <div class="nav-flex">               
                        <a class="nav-link" href="/mini/list">Mini 메시지 <span class="sr-only">(current)</span></a>
                        <button type="button">선곡표</button>
                        <button type="button">사연과 신청곡</button>
                        <button type="button">다시듣기</button>                   
                </div>                
            </div>

        <div class="coner">     
            <strong class="title" style="position: absolute;"><i class="far fa-list-alt"></i>매일코너</strong>
                <ul class="everyDay" style="list-style: none; margin:20%"> 
                    <li><i class="fas fa-caret-right"></i>사연과 신청곡</li>
                    <li><i class="fas fa-caret-right"></i>하루 틈</li>
                    <li><i class="fas fa-caret-right"></i>내일의 BGM, 꺼내 들어요</li>
                </ul>    
        </div> 
        
        
        <div class="weekday">
            <strong class="title" style="position: absolute"><i class="far fa-list-alt"></i>요일코너</strong>
                <ul class="weekUl" style="list-style: none;">
                    <li><span class="week"></span></li>                   
                    <li><span class="week"></span></li>
                    <li><span class="week"></span></li>
                    <li><span class="week"></span></li>
                    <li><span class="week"></span></li>
                    <li><span class="week"></span></li>
                    <li><span class="week"></span></li>
                </ul>
        </div>

        <div class="main">
            
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

</html>

