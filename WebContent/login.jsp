<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::로그인 페이지:::|팜팜농원</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.login-page {
	width: 360px;
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
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
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
<script type="text/javascript">
function chkForm(f){
	if(f.userID.value.trim()==""){
		alert("아이디는 필수항목입니다.");
		f.userID.focus();
		return false;
	}
	if(f.userPass.value.trim()==""){
		alert("비밀번호는 필수항목입니다.");
		f.userPass.focus();
		return false;
	}
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.joinform.submit();
}
</script>
<body>
	<div class="login-page">
		<div class="form">
			<form class="login-form" name="loginform" action="loginAction.me" method="post" onsubmit="return chkForm(this)">
				<h2>로고넣을거</h2>
				<input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" /> 
				<input type="password" name="userPass" id="userPass" placeholder="비밀번호" /> 
				<button type="submit">로그인</button> 
				<br><br>
				<div id="footer">
				<a href="idfind.jsp">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="pwfind.jsp">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="joinForm.jsp">회원가입</a>&nbsp;&nbsp;
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</form>
		</div>
	</div>
</body>
</html>