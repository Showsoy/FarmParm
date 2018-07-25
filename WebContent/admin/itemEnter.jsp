<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.mypage table{
	width:700px;
	margin:0 auto;
	text-align:left;
	padding : 15px;
	border-radius:10px;
	border-collapse: collapse;
}
.mypage tr{
	padding-top: 12px;
    padding-bottom: 12px;
}
.mypage td{
	padding:5px 5px 5px 10px;
}
.mypage table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
}
td, tr{
	border: 1px solid #ddd;
}
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 10px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
.mypage button:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
</style>
<script>

</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;입고등록</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="itemEnter.im" method="post" name="enterform">
			<table>
				<tr>
					<th><img src="../images/${item.img_path }" width="300px"></th>
					<td>${item.category }</td>
					<td>${item.item_code }</td>
					<td>${item.item_name }</td>
					<td>${item.origin }</td>
					<td>${item.price }</td>
				</tr>
				<tr>
					<td id="td_left">일자</td>
					<td colspan="2"><input type="text" id="idate" name="idate" placeholder="ex)19991212"/></td>
					<td id="td_left">수량</td>
					<td><input type="text" id="amount" name="amount"/></td>
					<td><button type="submit" id="gbutton" onclick="location.href='itemEnterPro.im?item_code=${item.item_code}'">입고</button></td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<button onclick="location.href='adminPage.jsp'">관리자 페이지</button> 
			</section>
		</form>
	</div>
	
</div>
<footer>
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  <p class="w3-medium">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a>
  </p>
</footer>
</body>
</html>
