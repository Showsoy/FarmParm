<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::비밀번호찾기 | 팜팜농원:::</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
</style>
</head>
<script>
var chkId = false;
function chkForm(f){
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
 	if(f.userPass.value.length<6) {
	    alert("비밀번호는 6자리 이상 입력해주세요.");
	    f.userPass.focus();
	    return false;
	  }
	document.pwmod.submit();
}
</script>
<link rel="stylesheet" type="text/css" href="../style/style2.css">
<body>
<div class="pwfind-page">
		<div class="form">
			<form class="login-form" name="pwmod" action="/FarmParm/lostPwModify.us" method="post" onsubmit="return chkForm(this)">
				<h3>비밀번호 재설정</h3>
				<input type="password" id="userPass" name="userPass" placeholder="새 비밀번호" maxlength="20" class="input100"/>
				<input type="password" name="userPassre" id="userPassre" size="8" placeholder="새 비밀번호 확인" maxlength="20" class="input100"/>
				<button type="submit" class="input100">재설정</button> 
				<br><br>
				<div id="footer">
				<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">문제발생</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="idFind.jsp">아이디 찾기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>