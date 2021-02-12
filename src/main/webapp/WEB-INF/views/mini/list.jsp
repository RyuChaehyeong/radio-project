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
<style type="text/css">
.container-sm {
width: 600px;

}

#title {
	text-align: center; 
	margin-top: 50px; 
	margin-bottom: 30px;

}

#formBox {
	border: 1px solid lightgray; 
	padding-top: 20px;
	padding-bottom: 15px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.pagination > li > a
{
    background-color: white;
    color: #30366b;
}

.pagination > li > a:focus,
.pagination > li > a:hover,
.pagination > li > span:focus,
.pagination > li > span:hover
{
    color: #5a5a5a;
    background-color: #eee;
    border-color: #ddd;
}

.pagination > .active > a
{
    color: white;
    background-color: #30366b !Important;
    border: solid 1px #30366b !Important;
}

.pagination > .active > a:hover
{
    background-color: #5A4181 !Important;
    border: solid 1px #5A4181;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var actionForm = $("#actionForm");
	$(".pagination a").click(function(e) {
		e.preventDefault();
		
		actionForm.find("[name='pageNum']").val($(this).attr('href'));
		
		actionForm.submit();
	});
});
</script>


<title>mini 메시지</title>
</head>
<body>
	<div class="container">
		
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



	<div class="container-sm" >
		<div id="title" class="row justify-content-center" >
			<h1><i class="fas fa-star-and-crescent"></i> 문진수의 별이 빛나는 밤에 <i class="fas fa-star-and-crescent"></i></h1>
		</div>
	</div>
	
	<div id="formBox" class="container-sm" >
	<h5> &emsp; &nbsp; <i class="far fa-envelope"></i> mini 메세지 보내기</h5>
		<div class="row justify-content-center">
			<form action="/mini/register" method="post" style="margin-top: 15px; ">
			
				<div class="form-row">
				  <div class="form-group col-md-3">
				    <input name="writer" type="text" class="form-control" id="inputWriter" placeholder="아이디">
				  </div>

				  <div class="form-group col-md-7">				   
				    <input name="content" type="text" class="form-control" id="inputContent" placeholder="오늘은 어떤 일이 있었나요?">
				  </div>
				  
				  <div class="form-group col-md-2">
			  		<button type="submit" class="btn btn-light">보내기</button>
				  </div>
				 </div>
			</form>
		</div>
	</div>
	
	
	<div class="container-sm">
		<div class="row justify-content-center">
			
			
			<c:if test="${empty list  }"> 해당 내역이 없습니다. </c:if>
			
			<table class="table table-dark" style="text-align: left;">

			  <tbody>
			  <c:forEach items="${list }" var="mini">
			     <tr>
				     <td style="padding-left: 50px; padding-top: 20px; padding-bottom: 20px;"><c:out value="${mini.writer }"/>&emsp; &emsp; &emsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${mini.regdate }"/>
				     <br><br><c:out value="${mini.content }"/> </td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	
	
	<div class="container-sm">
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example" style="margin-top:23px;">
			  <ul class="pagination">
			  
			  <c:if test="${pageMaker.prev }">
			    <li class="page-item" >
			    <!-- <a class="page-link" href="${prevLink }">Previous</a> -->
			    <a class="page-link" href="${pageMaker.startPage-1 }">이전</a>
			    </li>
			  </c:if>
			  
			  <c:forEach var="pageNo" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			
			    <li class="page-item ${pageMaker.cri.pageNum eq pageNo ? 'active' : '' } ">
			   <!--  <a class="page-link" href="${pageLink }">${pageNo }</a>  -->
			   <a class="page-link" href="${pageNo }">${pageNo }</a>
			    </li>
			  </c:forEach>
				
			    
	   		  <c:if test="${pageMaker.next }">
	   		
			    <li class="page-item">
			    <!-- <a class="page-link" href="${nextLink }">Next</a> -->
			    <a class="page-link" href="${pageMaker.endPage+1 }">다음</a>
			    </li>		   
			  </c:if>
			  
			  </ul>
			</nav>
			
			<div class="d-none"> 
				<form id="actionForm" action="${root }/mini/list">
					<input name="pageNum" value="${pageMaker.cri.pageNum }"/>
					<input name="amount" value="${pageMaker.cri.amount }"/>
					<input name="type" value="${pageMaker.cri.type }"/>
					<input name="keyword" value="${pageMaker.cri.keyword }"/>
					
					<input type="submit">
				</form>
			</div>
		
		</div>
	</div>
	
	
	<div id="formBox" class="container-sm" style="margin-bottom: 100px;" >
		<div class="row justify-content-center">
			 <form action="${root }/mini/list" id="searchForm" class="form-inline my-2 my-lg-0">
			     <select name="type" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
				    <option value="W" ${cri.type eq 'W' ? 'selected' : ''} >아이디</option>
				    <option value="C" ${cri.type eq 'C' ? 'selected' : '' }>내용</option>
				    <option value="WC" ${cri.type eq 'WC' ? 'selected' : '' }>전체</option>
				  </select>
			  
			      <input required="required" name="keyword"	value="${cri.keyword }" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요." aria-label="Search">
			      <input type="hidden" name="pageNum" value="1"/>
			      <input type="hidden" name="amount" value="${cri.amount}"/>
			      
			      <button class="btn btn-light my-2 my-sm-0" type="submit">검색</button>
	   		 </form>
		
		</div>
	</div>
</body>
</html>