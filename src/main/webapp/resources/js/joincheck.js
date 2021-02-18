//----------------------------------------------------------
//checkAll()
//--------------------------------------------------------------
function checkAll() {
	var form = document.getElementById("join_form");
	
	var signUpIdCheck    = document.getElementById("signUpIdCheck").value;
	var signUpPwCheck    = document.getElementById("signUpPwCheck").value;
	var signUpRePwCheck  = document.getElementById("signUpRePwCheck").value;
	var signUpNameCheck  = document.getElementById("signUpNameCheck").value;
	var signUpEmailCheck = document.getElementById("signUpEmailCheck").value;
	
	console.log(signUpIdCheck); 
	console.log(signUpPwCheck);   
	console.log(signUpRePwCheck); 
	console.log(signUpNameCheck); 
	console.log(signUpEmailCheck);

	checkId(document.getElementById("id").value);
	checkPw(form.password.value);
	checkConfirmPw(form.confirmPassword.value);
 	checkName(form.name.value);
 	checkEmail(form.email.value);
	checkPostCode(form.sample6_postcode.value);	
	checkAdd1(form.sample6_address.value);
 	checkAdd2(form.sample6_detailAddress.value);
 	checkAdd3(form.sample6_extraAddress.value);
 
 if(document.getElementById("id").value == null || document.getElementById("id").value == "" || document.getElementById("id").value == undefined) {
 	return;
 } else if(form.password.value == null || form.password.value == "" || form.password.value == undefined) {
 	return;
 } else if(form.confirmPassword.value == null || form.confirmPassword.value == "" || form.confirmPassword.value == undefined) {
 	return;
 } else if(form.name.value == null || form.name.value == "" || form.name.value == undefined) {
 	return;
 } else if(form.email.value == null || form.email.value == "" || form.email.value == undefined) {
 	return;
 }       
 
	
	if( signUpPwCheck != "1" &&
	    signUpIdCheck != "1" &&
	    signUpRePwCheck != "1" &&
	    signUpNameCheck != "1" &&
	    signUpEmailCheck != "1") {
	    	return;
	    }
 
 form.action = root + "/member/register";
 form.submit();      	   	   	   
}
 //--------------------------------------------------
//아이디 
//------------------------------------------------------
function checkId(id) {
 var idCheck = document.getElementById("id_check");
 if (id == "") {
     idCheck.innerHTML =  "아이디를 입력해주세요";
 }
 return true;
}
 //--------------------------------------------------
//비밀번호 
//------------------------------------------------------
function checkPw(password) {
 var pwCheck = document.getElementById("password_check");
 if (password == "") {
     pwCheck.innerHTML = "비밀번호를 입력해주세요";
 }
 return true;
}
 //--------------------------------------------------
//비밀번호확인 
//------------------------------------------------------
function checkConfirmPw(confirmPassword) {
 var confirmPwCheck = document.getElementById("confirm_check");
 if (confirmPassword == "") {
     confirmPwCheck.innerHTML = "비밀번호 확인을 입력해주세요";
 }
 return true;
}
 //--------------------------------------------------
//이름 
//------------------------------------------------------
function checkName(name) {
 var nameCheck = document.getElementById("name_check");
 if (name == "") {
     nameCheck.innerHTML = "이름을 입력해주세요";
 }
 return true;
}
 //--------------------------------------------------
//이메일 
//------------------------------------------------------
function checkEmail(email) {
 var emailCheck = document.getElementById("email_check");
 if (email == "") {
     emailCheck.innerHTML = "이메일을 입력해주세요";
 }
 return true;
}
 //--------------------------------------------------
//우편번호 
//------------------------------------------------------
function checkPostCode(postCode) {
 var postCodeCheck = document.getElementById("add1_check");
 if (postCode == "") {
     postCodeCheck.style.borderColor = "red";
 }
 return true;
}
 //--------------------------------------------------
//주소 
//------------------------------------------------------
function checkAdd1(address) {
 var addressCheck = document.getElementById("add2_check");
 if (address == "") {
     addressCheck.style.borderColor = "red";
 }
 return true;
}
 //--------------------------------------------------
//상세주소 
//------------------------------------------------------
function checkAdd2(detailAddress) {
 var detailAddressCheck = document.getElementById("add3_check");
 if (detailAddress == "") {
     detailAddressCheck.style.borderColor = "red";
 }
 return true;
}
 //--------------------------------------------------
//동
//------------------------------------------------------
function checkAdd3(extraAddress) {
 var extraAddressCheck = document.getElementById("add4_check");
 if (extraAddress == "") {
     extraAddressCheck.style.borderColor = "red";
 }
 return true;
}