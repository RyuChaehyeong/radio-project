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


<title>미니게시판</title>
</head>
<body>
	<div class="container-sm" >
		<div id="title" class="row justify-content-center" >
			<h1>문진수의 별이 빛나는 밤에</h1>
		</div>
	</div>
	
	<div id="formBox" class="container-sm" >
		<div class="row justify-content-center">
			<form action="/mini/register" method="post">
				<div class="form-row">
				  <div class="form-group col-md-3">
				    <label for="inputWriter">아이디</label>
				    <input name="writer" type="text" class="form-control" id="inputWriter">
				  </div>
				  
				
				  <div class="form-group col-md-7">
				    <label for="inputContent">사연</label>
				    <input name="content" type="text" class="form-control" id="inputContent" placeholder="사연을 입력하세요.">
				  </div>
				  
				  <div class="form-group col-md-2" style="margin-top: 32px;">
			  		<button type="submit" class="btn btn-light">보내기</button>
				  </div>
				 </div>
			</form>
		</div>
	</div>
	
	
	<div class="container-sm">
		<div class="row justify-content-center">
			<table class="table table-dark" style="text-align: left; ">

			  <tbody>
			  <c:forEach items="${list }" var="mini">
			     <tr>
				     <td style="padding-left: 50px;"><c:out value="${mini.writer }"/>&emsp; &emsp; &emsp;<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${mini.regdate }"/>
				     <br><c:out value="${mini.content }"/> </td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
	
	
	<div class="container-sm">
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example" style="margin:15px;">
			  <ul class="pagination">
			  
			  <c:if test="${pageMaker.prev }">
			    <li class="page-item">
			    <!-- <a class="page-link" href="${prevLink }">Previous</a> -->
			    <a class="page-link" href="${pageMaker.startPage-1 }">Previous</a>
			    </li>
			  </c:if>
			  
			  <c:forEach var="pageNo" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			
			    <li class="page-item ${pageMaker.cri.pageNum eq pageNo ? 'active' : '' }">
			   <!--  <a class="page-link" href="${pageLink }">${pageNo }</a>  -->
			   <a class="page-link" href="${pageNo }">${pageNo }</a>
			    </li>
			  </c:forEach>
				
			    
	   		  <c:if test="${pageMaker.next }">
	   		
			    <li class="page-item">
			    <!-- <a class="page-link" href="${nextLink }">Next</a> -->
			    <a class="page-link" href="${pageMaker.endPage+1 }">Next</a>
			    </li>		   
			  </c:if>
			  
			  </ul>
			</nav>
			
			<div class="d-none"> 
				<form id="actionForm" action="${root }/mini/list">
					<input name="pageNum" value="${pageMaker.cri.pageNum }"/>
					<input name="amount" value="${pageMaker.cri.amount }"/>
					<input type="submit">
				</form>
			</div>
		
		</div>
	</div>
	
</body>
</html>