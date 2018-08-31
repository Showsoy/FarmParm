<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::문제발생 | 팜팜농원:::</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
textarea{
	background: #f2f2f2;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	color:#5D5D5D;
	font-family:"Nanum Gothic";
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
<div class="login-page">
		<div class="form">
			<form class="login-form" name="issuemail" action="loginIssue.us" method="post" onsubmit="return chkForm(this)">
				<h3>문제발생</h3>
				문제가 발생하셨습니까?<br>
				자세한 경위 혹은 이미지파일과 함께<br>
				<b>clemado1@gmail.com</b><br>
				로 메일을 보내주세요.
				<br><br>
				<div id="footer">
				<a href="login.jsp">로그인</a>&nbsp;|&nbsp;
				<a href="idFind.jsp">아이디 찾기</a>&nbsp;|&nbsp;
				<a href="pwFind.jsp">비밀번호 찾기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>