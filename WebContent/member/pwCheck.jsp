<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vo.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::정보수정 | 팜팜농원:::</title>
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
	document.pwcheck.submit();
}
</script>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;개인정보수정</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="./pwCheck.us" name="pwcheck" method="post" onsubmit="return chkForm(this)">
	<input type="hidden" id="userId" name="userId" value="${id }"/>
	<table class="mytable" cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left"><label for="userID">아이디</label> </td>
		<td>${id}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userPass">비밀번호</label> </td>
		<td><input type="password" id="userPass" name="userPass"></td>
	</tr>
</table>
<br><br>
		<button id="bbutton" type="submit" id="submit">확인</button>
		<button id="bbutton" type="button" onclick="history.back();">돌아가기</button> 
		</form>
	</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>