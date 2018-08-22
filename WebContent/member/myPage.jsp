<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vo.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;개인정보</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<div id="grade"><b id="grade_deco">|</b>${user.grade }</div>
	<p id="point">사용가능 포인트 <b id="grade_deco">${user.point }</b>점</p>
	<table class="mytable" cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left"><label for="userID">아이디</label> </td>
		<td>${user.user_id}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">이름</label></td>
		<td>${user.name}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">연락처</label></td>
		<td>${user.phone}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">생년월일</label></td>
		<td>${user.birth}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">성별</label></td>
		<td>${user.gender}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">이메일</label></td>
		<td>${email1}@${email2}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">주소</label></td>
		<td rowspan="3">${user.postcode}<br>${user.address}<br>${user.address_second}</td>
	</tr>
</table>
<br><br>
			<button id="bbutton" onclick="location.href='./pwCheckForm.us?id=${user.user_id}'">수정</button>
			<button id="bbutton" onclick="location.href='main.im'">홈으로</button> 
			<button id="bbutton" onclick="location.href='#'">내 문의 보기</button>
	</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>