<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	
	$(document).ready(function() {
		
		var actionForm = $("#actionForm2");
		
		$("#list a").click(function(e){
			e.preventDefault();
			
			actionForm.find("[name='day']").val($(this).attr('href'));
			
			actionForm.submit();
		});
	});
</script>
<style type="text/css">
 .title1 {
       padding: 10px 10px 0px 10px;
       font-size: 15px;
   }
   .da {
		background-color: black;
		color: white;
		margin-right: 8px;
		padding: 3px 6px 3px 6px;
		border-radius: 100%;
	}
	
	.listCorner { 
		padding-left: 10px;
	}
	
	ul li {
		padding: 10px;		 
	}
	
	.tit {
		text-decoration: none;
		color: gray;
	}
	
	.tit:hover {
		text-decoration: none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<strong class="title1"><i class="far fa-list-alt"></i>요일코너</strong>
               <ul class="item listCorner" id="list" style="list-style:none;">
					<li>
						<span class="da">월</span>
						<a href="1" class="tit">영업합니다</a>
					</li>
					<li>
						<span class="da">화</span>
						<a href="2" class="tit">뮤직에세이, 노래 속 책갈피</a>
					</li>
					<li>
						<span class="da">수</span>
						<a href="3" class="tit">뮤직에세이, 노래 속 책갈피</a>
					</li>
					<li>
						<span class="da">목</span>
						<a href="4" class="tit">극한일상</a>
					</li>
					<li>
						<span class="da">금</span>
						<a href="5" class="tit">전지적 작사 시점</a>
					</li>
					<li>
						<span class="da">토</span>
						<a href="6" class="tit">SoSo썰_의뢰사연</a>
					</li>
					<li>
						<span class="da">일</span>
						<a href="7" class="tit">북 트래블러</a>
					</li>
				</ul>
				
				<form id="actionForm2" action="${root }/board/list">
					<input type="hidden" name="day" value="1">
					<input type="submit" hidden />
				</form>	
</body>
</html>