<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::아이디찾기 | 팜팜농원:::</title>
<style>
</style>
<link rel="stylesheet" type="text/css" href="../style/style2.css">
</head>
<script>
function chkForm(f){
	var age = f.userAge.value;
	var reg_age = /^\d{8}$/
	
	if(f.userName.value.trim()==""){
		alert("이름은 필수사항입니다.");
		f.userName.focus();
		return false;
	}
	if (!reg_age.test(age)) {
		alert("올바른 형식이 아닙니다.");
		f.userAge.focus();
		return false;
	}
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.idfindform.submit();
}
</script>
<body>
	<div class="login-page">
		<div class="form">
			<form class="login-form" name="idfindform" action="findIdAction.us" method="post" onsubmit="return chkForm(this)">
				<h3>아이디 찾기</h3>
				<input type="text" id="userName" name="userName" placeholder="이름" maxlength="10" class="input100"/>
				<input type="text" name="userAge" id="userAge" placeholder="생년월일   ex) 19990303" class="input100"/>
				<button type="submit" class="input100">찾기</button> 
				<br><br>
				<div id="footer">
				<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">문제발생</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="pwFind.jsp">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>