<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root }/resources/css/form.css">
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
	 body {
	background-image: url("../resources/pic/background.jpg");
	background-size: cover;  
}
	#miniForm {
		margin: 3%;
		padding: 3%;
	}
	.form-tag {
		 margin-top: 15px; 
		 border:solid 1px silver;
		 padding:10px; 
		 width: 100%;
		 height: 200px;
		 border-radius: 5px 5px; 
		 padding-top: 50px;
		 background-color: lightslategrey;
	}
	
	.h5message {
		text-align: center;
		margin-bottom: 30px;
		color: snow;
		font-weight: bold
	}

	.input-writer {		
		border: 1px solid white;
		outline: none;	
		margin-bottom: 5px;
		margin-right: 10px;
		width: 120px;
	}
	.input-content {
		border: 1px solid white;
		outline: none;		
		margin-bottom: 5px;
		margin-right: 10px;
		width: 500px;
	}
	.writerContentBtn {
		background-color: lightgrey;	
		text-align: center;
		display: flex;
		justify-content: center;
		width: 80px;
		height: 26px;
		font-size: 15px;
		padding: 0;
		items-align: center;
		padding-top: 2px;
			
	}	
	.writerContentBtn:hover {
		background-color: lightgrey;
		color: lightslategrey;
	}
	.mini-table {
		text-align: left; 
		padding:10px; 
		border-collapse: collapse; 
		background-color: snow;
		color: lightslategrey; 
	} 
	.page-nav ul {
		display: flex;
		list-style: none;
		justify-content: center;
		margin-top: 16px;
	}
	
	.num {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;		
		display: inline-block;
		width: 30px;
		background-color: lightslategrey;
		text-align: center;
		color: white;
	}
	
	.priLi, .numLi, .nexLi {
		padding: 0;
	}
	
	.pri, .nex {
		border-radius: 3px 3px;
		text-decoration: none;
		border: 1px silver solid;
		display: inline-block;
		width: 50px;
		background-color: lightslategrey; 
		text-align: center;
		color: white;
		
	}
	
	.pri:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.num:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.nex:hover {
		text-decoration: none;
		background-color: snow;
		color: lightslategrey;
	}
	
	.search-form {
		display: flex;
		justify-content: center;
		border: 1px solid rgb(241, 241, 241);
		padding: 30px 30px;
		margin: 30px;
		background-color: rgb(241, 241, 241);
	}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var actionForm = $("#actionForm");
	$(".page-nav a").click(function(e) {
		e.preventDefault();
		
		actionForm.find("[name='pageNum']").val($(this).attr('href'));
		
		actionForm.submit();
	});
});
</script>
</head>
<body>

	<div id="miniForm">
	
		<div class="input-message" style="margin-bottom: 5px;">
		
			<form action="${root }/mini/register" class="form-tag" method="post">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/> 
					<h5 class="h5message"><i style="color: snow;" class="far fa-envelope"></i> mini 메세지 보내기</h5>
				<div class="input-form" style="display: flex; justify-content: center;">
				
				
				<sec:authorize access="isAuthenticated()">
				  <div class="inp">
				    <input name="writer" type="text" class="input-writer" id="inputWriter" 
				    value='<sec:authentication property="principal.username"/>' readonly>
				  </div>
				</sec:authorize>
				  
				<sec:authorize access="isAnonymous()">	
				  <div class="inp">
				    <input name="writer" type="text" class="input-writer" id="inputWriter" placeholder="아이디" readonly>
				  </div>
				</sec:authorize>
				
				
				  <div class="inp">				   
				    <input name="content" type="text" class="input-content" id="inputContent" placeholder="오늘은 어떤 일이 있었나요?">
				  </div>
				  
				  <div class="inp">
			  			<button type="submit" class="writerContentBtn"> 보내기 </button>
				  </div>
				  
				</div>
				  
				  
				  
			</form>
			
		</div>
		
	
	
	<div class="">
		<div class="">
			<c:if test="${empty list  }"> 해당 내역이 없습니다. </c:if>
			 <table class="mini-table">
			 	<tbody>
			 		 <c:forEach items="${list }" var="mini">				
			     		<tr style="display: flex; justify-content: space-between; padding: 3px 10px 3px 10px;">  
				     		<td><strong><c:out value="${mini.writer }"/></strong></td>
				     		<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value= "${mini.regdate }"/></td>
				 		</tr>
				 		<tr style="border-bottom: 2px white solid;">
				     		<td style="padding: 8px 5px 8px 10px; font-size: 14px"><c:out value="${mini.content }"/> </td>
			    		</tr> 
			 		</c:forEach>
			  </tbody>
			</table>
		</div>
	</div>
		
		<div class="page-nav">
			 <ul class="">		  
			  	<c:if test="${pageMaker.prev }">
			    	<li class="priLi" >
			   		 	<!-- <a class="page-link" href="${prevLink }">Previous</a> -->
			    		<a class="pri" href="${pageMaker.startPage-1 }">이전</a>
			    	</li>
			  	</c:if>
			  
			  <c:forEach var="pageNo" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			
			    	<li class="numLi">
			   			<!--  <a class="page-link" href="${pageLink }">${pageNo }</a>  -->
			   			<a class="num" href="${pageNo }">${pageNo }</a>
			    	</li>
			  </c:forEach>
				
			    
	   		  <c:if test="${pageMaker.next }">
	   		
			   		<li class="nexLi">
			    		<!-- <a class="page-link" href="${nextLink }">Next</a> -->
			    		<a class="nex" href="${pageMaker.endPage+1 }">다음</a>
			    	</li>		   
			  </c:if>		  
			  </ul>
		
			
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
		
		
	
		<div class="search-form">
			 <form action="${root }/mini/list" id="searchForm" class="form-inline my-2 my-lg-0">
			     <select name="type" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
				    <option value="W" ${cri.type eq 'W' ? 'selected' : ''} >아이디</option>
				    <option value="C" ${cri.type eq 'C' ? 'selected' : '' }>사연</option>
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