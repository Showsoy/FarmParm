<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.login-page {
	width: 400px;
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
	text-align: center;
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

#footer{
	text-align:center;
	font-size: 12px;
	color: #4CAF50;
}

select {
    width: 165px;
    height: 42px;
    padding-left: 10px;
    font-size: 16px;
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
function chkForm(f){
	var mail1 = f.userEmailId.value;
	var mail2 = f.userEmailAd.value;
	
	var reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/i;
	var reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(f.userID.value.trim()==""){
		alert("아이디는 필수사항입니다.");
		f.userID.focus();
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
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.joinform.submit();
}
function selectEmail(sel) {
	var choiceText = sel.options[sel.selectedIndex].text;

	if (choiceText == '직접입력') {
		document.getElementById("emailform").innerHTML = "<td><input type='text' name='email1' id='email1' size='15'/></td>";
	}
}
</script>
</head>
<body>
<div class="login-page">
		<div class="form">
			<form class="login-form" name="pwfindform" action="findPWAction.me" method="post" onsubmit="return chkForm(this)">
				<h3>비밀번호 찾기</h3>
				<input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" class="input100"/>
				<input type="text" name="userEmailId" id="userEmailId" size="8" placeholder="이메일"/>&nbsp;@
				<span id="emailform">
				<select name="userEmailAd" id="userEmailAd" onchange="selectEmail(this)">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="naver.com">daum.net</option>
						<option value="naver.com">hotmail.co.kr</option>
						<option value="null">직접입력</option>
				</select>
				</span>
				<button type="submit">찾기</button> 
				<br><br>
				<div id="footer">
				<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">문제발생</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="idfind.jsp">아이디 찾기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>