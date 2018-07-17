<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::회원가입 페이지:::|팜팜농원</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
h2{
	text-align:center;
}
.login-page {
	width: 550px;
	padding: 8% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 10px 45px 45px 45px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	outline: 0;
	background: #f2f2f2;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.input100{
	width:100%;
}

.form button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 100%;
	border: 0;
	padding: 13px;
	color: #FFFFFF;
	font-size: 16px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form a {
	margin: 15px 0 0;
	font-size: 12px;
	color: #4CAF50;
	text-decoration: none;
}

#genCheck{
	text-align:center;
}

#footer{
	text-align:center;
	font-size: 12px;
	color: #4CAF50;
}

select {
    width: 200px;
    height: 42px;
    padding-left: 10px;
    font-size: 20px;
    border: 2px solid #4CAF50;
}

body {
	background: #76b852; /* fallback for old browsers */
	background: -webkit-linear-gradient(right, #76b852, #8DC26F);
	background: -moz-linear-gradient(right, #76b852, #8DC26F);
	background: -o-linear-gradient(right, #76b852, #8DC26F);
	background: linear-gradient(to left, #76b852, #8DC26F);
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<script>
var chkId = false;
function chkForm(f){
	
	var age = f.userAge.value;
	var mail1 = f.userEmailId.value;
	var mail2 = f.userEmailAd.value;
	var phone = f.userPhone.value;
	
	var reg_age = /^\d{8}$/
	var reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/i;
	var reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var reg_phone = /^\d{10-11}$/
	
	
	if(!chkId){
		alert("아이디 중복 확인이 필요합니다!");
		return false;
	}
	if(f.userPass.value.trim()==""){
		alert("비밀번호는 필수항목입니다.");
		f.userPass.focus();
		return false;
	}
	if(f.userPass.value.trim()!=""){
		if(f.userPass.value!=f.userPassre.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.userPassre.value="";
			f.userPassre.focus();
			return false;
		}
	}
	if (!reg_age.test(age)) {
		alert("올바른 형식이 아닙니다.");
		f.userAge.focus();
		return false;
	}
	if (!reg_email1.test(mail1)) {
		alert("올바른 이메일 주소가 아닙니다.");
		f.userEmailId.focus();
		return false;
	}
	if (!reg_email2.test(mail2)) {
		alert("올바른 이메일 주소가 아닙니다.");
		f.userEmailAd.focus();
		return false;
	}
	if (!reg_phone.test(phone)) {
		alert("올바른 번호가 아닙니다.");
		f.userPhone.focus();
		return false;
	}
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.joinform.submit();
}
function selectEmail(sel) {
	var choiceText = sel.options[sel.selectedIndex].text;

	if (choiceText == '직접입력') {
		document.getElementById("emailform").innerHTML = "<td><input type='text' name='email1' id='email1'/></td>";
	}
}
</script>
<body>
<div class="login-page">
		<div class="form">
			<form class="login-form" name="joinform" action="./memberJoinAction.me" method="post" onsubmit="return chkForm(this)">
				<br><h2>회원가입</h2><br>
		<label for="userID">아이디</label>
		<input type="text" name="userID" id="userID" class="input100">
		<button name="check" id="check"
		onclick="window.open('./dulpTest.jsp?openInit=true','','width=370, height=200')">중복검사</button>
		<br><br>
	
		<label for="userPass">비밀번호</label>
		<input type="password" name="userPass" id="userPass" class="input100"/>
	
	
		<label for="userPassre">비밀번호확인</label>
		<input type="password" name="userPassre" id="userPassre" class="input100"/>
	
	
		<label for="userName">이름</label>
		<input type="text" name="userName" id="userName" class="input100"/>
	
	
		<label for="userAge">생년월일</label>
		<input type="text" name="userAge" id="userAge" 
		placeholder="ex) 19990303" class="input100"/>
		
		<label for="userGen">성별</label><br><br>
		<div id="genCheck">
		<input type="radio" name="userGen" value="남" checked="checked" id="userGen"/>&nbsp;남자&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="userGen" value="여">&nbsp;여자
		<hr color="#4CAF50">
		</div>
		<br>
		<label for="userEmail">이메일</label><br>
		<input type="text" name="userEmailId" id="userEmailId"size="10" />&nbsp;@
		<span id="emailform">
			<select name="userEmailAd" id="userEmailAd" onchange="selectEmail(this)">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="naver.com">daum.net</option>
						<option value="naver.com">hotmail.co.kr</option>
						<option value="null">직접입력</option>
			</select>
		</span>
		<label for="userPhone">연락처</label>
		<input type="text" name="userPhone" id="userPhone" class="input100"/>
		<br><br><br>
				<button type="submit">회원가입</button>
				<br><br><br><br>
			<div id="footer">
				&nbsp;&nbsp;<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">개인정보처리방침</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">고객센터</a>&nbsp;&nbsp;
			</div>
			</form>
		</div>
	</div>
</body>
</html>