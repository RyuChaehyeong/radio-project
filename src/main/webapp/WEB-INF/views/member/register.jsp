<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	var root = '${root}';
</script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${root }/resources/js/joincheck.js"></script>
<script src="${root }/resources/js/address.js"></script>
<script type="text/javascript">
</script>
<script>
$(document).ready(function() { 	
	$("#id").blur(function() {
		var idt = /^[a-z]+[a-z0-9]{4,12}$/;
		var id = $('#id').val();
		
		$.ajax({
			url : root + '/member/check_id?id=' + id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");			
					document.getElementById("signUpIdCheck").value = "0";
				} else {
					if (idt.test(id)) {
						$("#id_check").text("");
						document.getElementById("signUpIdCheck").value = "1";
					} else if (id === "") {
						$('#id_check').text('아이디를 입력해주세요 :p');
						document.getElementById("signUpIdCheck").value = "0";
					} else {
						$('#id_check').text("[아이디는 소문자와 숫자 4~12자리만 가능합니다.]");
						document.getElementById("signUpIdCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	
	$("#password").blur(function() {
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		
			if (pwt.test(pw1)) {
				$('#password_check').text("");
				document.getElementById("signUpPwCheck").value = "1";
			} else if(pw1 == "") {
				$('#password_check').text("비밀번호를 입력하세요");
				document.getElementById("signUpPwCheck").value = "0";
			} else {
				$('#password_check').text("[비밀번호는 영문,숫자, 특수문자~`!@#$%\^&*()-+=를 조합하여 8자 이상으로 만들어주세요.]");
				document.getElementById("signUpPwCheck").value = "0";
			}							
	}); 
	
	$("#confirmPassword").blur(function() {				
		var pw1 = $('#password').val();
		var pw2 = $('#confirmPassword').val();
		var pwt = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			
									
			if ((pw1 == pw2) && pwt.test(pw2)) {
				$('#confirm_check').text("");	
				document.getElementById("signUpRePwCheck").value = "1";
			} else if ((pw1 == pw2) && !pwt.test(pw2)){
				$('#confirm_check').text("");
				document.getElementById("signUpRePwCheck").value = "0";
			} else if ((pw1 =! pw2) && !pwt.test(pw2)) {					
				$('#confirm_check').text("비밀번호가 일치하지 않습니다.");	
				document.getElementById("signUpRePwCheck").value = "0";
			} else {
				$("#confirm_check").text("비밀번호가 일치하지 않습니다.");
				document.getElementById("signUpRePwCheck").value = "0";
			} 							
		if (pw2 == ''){
			$('#confirm_check').text("비밀번호 확인을 입력하세요");
			document.getElementById("signUpRePwCheck").value = "0";
		}									
	});	
	
	$("#name").blur(function() {
		var namet = /^[가-힣]{2,6}$/;
		var name = $('#name').val();
		
		if (namet.test(name)) {
			$('#name_check').text("");
			document.getElementById("signUpNameCheck").value = "1";
		} else if(name == "") {
			$('#name_check').text("이름을 확인해주세요.");
			document.getElementById("signUpNameCheck").value = "0";
		} else {
			$('#name_check').text("[한글로 이루어진 2~6자리의 이름만 사용가능합니다.]");
			document.getElementById("signUpNameCheck").value = "0";
		}
	});
	
	$("#email").blur(function() {
		var emailt = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = $('#email').val();
		
		$.ajax({
			url : root + '/member/check_email?email=' + email,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x :" + data);

				if (data === '1') {
					// 아이디가 중복되는 문구
					$("#email_check").text("사용중인 이메일 입니다.");
					document.getElementById("signUpEmailCheck").value = "0";
				} else {
					if (emailt.test(email)) {
						$("#email_check").text("");
						document.getElementById("signUpEmailCheck").value = "1";
					} else if (email === "") {
						$('#email_check').text('이메일을 입력해주세요.');
						document.getElementById("signUpEmailCheck").value = "0";
					} else {
						$('#email_check').text("알맞지 않은 형식입니다.");
						document.getElementById("signUpEmailCheck").value = "0";
					}
				}
			},
			error : function() {
				console.log("실패");
			}
		});
	});
	 
});
</script>
<style type="text/css">
*{
	margin: 0;
	padding: 0;	
}

body {
	background-image: url("../resources/pic/background.jpg");
	background-size: cover;
}
.wapper { 
	width: 100%;
	background-image: url(../resources/pic/crescent-4875339_1920.jpg);
	background-size: contain;
	background: #E9E9E9;
}
	.wapper #headerMember {
		width: 100%;
		border-bottom: 2px solid #D8D8D8;
		background: #fff;
	}
		.wrapper #headerMember .header {
			padding: 19px 0 16px;
			margin: 0 auto;
			text-aling: center;
		}
			.wrapper #headerMember .header h2 {
                text-align: center;                
                background-size: cover;                                
                vertical-align: top;
            }

#headerMember {
	background: white;
}




#memberContent {
	background: white;
}
.container {
	width: 1000px;
	padding: 6em 6.154em;
	margin: 3em auto 6.154em;
	
}       

.container .tip-top {
	padding-bottom: 10px;
	margin-bottom: 3.85em;
	border-bottom: 1px solid #d2d2d2;
}     


.field {
	width: 100%;
	position: relative;
	background-color: white;
	border-radius: 20px 20px;
	border: 1px solid #AAAAAA;
	padding: 10px 60px 10px 60px;
	
} 

.id_pw-form {
	height: 200px;
	margin-top: 30px;
} 

.password-form, .info-form{
	display: flex; 
	justify-content: space-around;
	flex-wrap: wrap;
	position: relative;
}

.id-form {
	display: flex;
	justify-content: flex-start space-around;
	margin-bottom: 8px;  
	position: relative;
}

.info-form {
	height: 150px;
}

.post {
	display: flex;
	align-items: baseline;	 
}

.post2{
	display: flex;
	align-items: baseline;
}

input {
	width: 250px;
	flex-wrap: wrap;
	border: 1px solid silver; 
	outline: none;
	background: none;
	position: relative;
	font-size: 14px;
	border-radius: 5px 5px;
	
}

small {
	color: red;
	font-size: 10px;
	position: absolute;
}

label {
	font-size: 13px;
	color: black;
}

p {
	background: lightblue;
}
.postCode {
	background: white;
	border: 1px solid silver;
	font-size: 14px;
	border-radius: 2px;
	color: gray;
	margin-left: 10px;
	margin-top: 2px; 
	outline: none;
}

.postCode:hover {
	background: silver;
	color: white;
}
 
#insertCustomer {
	background: none;
	color: #70a1ff;
	border: 1px solid #70a1ff;
	padding: 12px 30px;
	border-radius: 8px;
	font-size: 14px;
	transition: 0.2s linear;
	margin-top: 20px;
	width: 100%;
	outline: none;
}

#insertCustomer:hover {
	background: #70a1ff;
	color: #fff;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div id="wrap" class="wrapper join">
	<header id="headerMember">
		<div class="header">
			<h2>MOON</h2>
		</div>
		</header>

<div id="memberContent" class="container">
	<div class="tip-top">
	<h3 class="title">회원가입</h3>
	<div class="item-box1 v1 top-txt-sub">
	
	</div>
	</div>
	
	
	<form id="join_form" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		<input type="hidden" name="auth" value="ROLE_MEMBER"/>
			<div class="field">
			
		<section class="id_pw-form">
		
			<div class="id-form">
			
				<div class="form-group">
					<div class="input_field">		
						<label><i class="fa fa-user"></i>아이디<br>
						<input type="text" class="id" name="id" id="id"> 
						</label>					
					</div>
						<small class="check_font" id="id_check"></small> 
				</div>
			
			</div>
												
				
			<div class="password-form">
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-unlock-alt"></i>비밀번호<br>
							<input type="password" class="password" name="password" id="password"> <br>
							<small class="check_font" id="password_check"></small>					
						</label>
					</div>
				</div>
				
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-unlock-alt"></i>비밀번호 확인<br>
						<input type="password" class="confirmPassword" id="confirmPassword">
						</label> <br>
						<small class="check_font" id="confirm_check"></small>													
					</div>
				</div>		
			</div>
		</section>	
				
		<section>
			<div class="info-form">
				<div class="form-group ">
					<div class="input_field"> 
						<label><i class="fa fa-user"></i>이름<br>
						<input type="text"class="name" name="name" id="name">
						</label>
					</div>
						<small class="check_font" id="name_check"></small>						
				</div>
				
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-share" aria-hidden="true"></i>이메일<br>
						<input type="text" class="email" name="email" id="email">
						</label>
					</div>
						<small class="check_font" id="email_check"></small>				
				</div>
			</div>
		</section>
		
		<p>*<strong>주소정보</strong>는<strong>선택</strong>입력 정보이며<strong>방청 및 방송참여, 경품 이벤트</strong>시 필요합니다.</p>
				
		<section>				
			<div class="post">
				<div class="form-group">
					<div class="input_field">
						<label>우편 번호<br>
						<input type="text" class="add1" name="add1" id="sample6_postcode"
							 readonly style="width:100px; text-align:center"> 
						</label>
					</div>				
						<small class="check_font" id="add1_check"></small>
					</div>
					
				<div class="form-group">
					<div class="input_button">
						<button class="postCode"
						 type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						우편번호 찾기</button>
					</div>
				</div>
			</div>
				
				
		<div class="post2">
			
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-map-marker"></i>주소<br>
						<input style="width:600px;" type="text" class="add2" name="add2" id="sample6_address"
							readonly>
						</label>
					</div>
						<small class="check_font" id="add2_check"></small>
				</div>
						
				<div class="form-group"> 
					<div class="input_field"> 
						<input style="width:100px; text-align:center;"type="text" class="add4" name="add4"
							id="sample6_extraAddress" readonly >
					</div>
						<small class="check_font" id="add4_check"></small>		 		
				</div>
						
		</div>
			
					
				<div class="form-group">
					<div class="input_field">
						<label><i class="fa fa-map-marker"></i>상세주소<br>
						<input style="width:700px" type="text" class="add3" name="add3"
							id="sample6_detailAddress">
						</label>
					</div>
						<small class="check_font" id="add3_check"></small>
				</div>
					
		</section>																					
		</div>			 
			
		<button id="insertCustomer" type="button" onclick="checkAll()" value="회원가입">회원가입</button>
				
	</form> 		 
	</div>
</div>

<input type="text" id="signUpIdCheck" name="signUpIdCheck" >
<input type="text" id="signUpPwCheck" name="signUpPwCheck" >
<input type="text" id="signUpRePwCheck" name="signUpRePwCheck" >
<input type="text" id="signUpNameCheck" name="signUpNameCheck" >
<input type="text" id="signUpEmailCheck" name="signUpEmailCheck" >

</body>
</html>