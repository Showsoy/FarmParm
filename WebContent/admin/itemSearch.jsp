<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
img{
	border: 1px solid #ddd;
	padding : 4px 4px 10px 4px;
}
th{
	text-align:center;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<jsp:include page="/common/adminbar.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;입고등록</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="./itemSearch.im" method="post">
		<input type="text" id="keyword" name="keyword" size="20" placeholder="분류 이름 원산지로 검색가능"/>&nbsp;<button type="submit" id="wbutton">검색</button>
	</form>
	<br><br><br>
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<td></td>
		<td>분류</td>
		<td>코드</td>
		<td>이름</td>
		<td>원산지</td>
		<td>가격</td>
		<th>선택</th>
	</tr>
	<c:forEach var="isearch" items="${iSearchList }">
	<tr>
		<th><img src="../images/${isearch.img_path }" width="100px" height="70px"></th>
		<td>${isearch.category }</td>
		<td>${isearch.item_code }</td>
		<td>${isearch.item_name }</td>
		<td>${isearch.origin }</td>
		<td>${isearch.price }</td>
		<th><button type="button" id="gbutton" onclick="location.href='./itemEnterForm.im?item_code=${isearch.item_code}'">선택</button></th>
	</tr>
	</c:forEach>
	</table>
	<br><br><br>
	<button type="button" id="bbutton" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>