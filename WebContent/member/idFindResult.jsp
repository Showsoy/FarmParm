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
<body>
	<div class="login-page">
		<div class="form">
			<br/>
			<h3>회원님의 아이디는 <br/>${user_id} 입니다.</h3>
			<br>
			<div id="footer">
			<a href="login.jsp?findId=${user_id }">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="issue.jsp">문제발생</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="pwFind.jsp">비밀번호 찾기</a>
			</div>
		</div>
	</div>
</body>
</html>