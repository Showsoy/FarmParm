<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
	margin:0 auto;
	border-collapse: collapse;
    width: 80%;
	background-color:white;
}
tr{
	height:50px;
}
tr:nth-child(even) {background-color: #f2f2f2;}
td{
    border-bottom: 1px solid #ddd;
}
td p{
	text-height:100%;
	float:left;
}
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 60px;
	border: 0;
	padding: 5px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
.mypage button:hover, .mypage button:active, .mypage button:focus {
	background: #43A047;
}
input{
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 5px;
	color: #FFFFFF;
	font-size: 18px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
input:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
#top_menu{
	background-color:#333;
	color:white;
	height:40px;
}
#td_check{
	width:50px;
}
#td_info{
	color:#5D5D5D;
	font-size:14px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;주문/배송 조회</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<table cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td>주문일</td>
				<td>주문번호</td>
				<td>수령인</td>
				<td>주문상품</td>
				<td>조회</td>
			</tr>
			<tr>
				<td>2018-07-07</td>
				<td>0001</td>
				<td>박나래</td>
				<td>청송사과 외</td>
				<td><button onclick="location.href='#'">조회</button></td>
			</tr>
			<tr>
				<td>2018-07-07</td>
				<td>0001</td>
				<td>박나래</td>
				<td>청송사과 외</td>
				<td><button onclick="location.href='#'">조회</button></td>
			</tr>
			<tr>
				<td>2018-07-07</td>
				<td>0001</td>
				<td>박나래</td>
				<td>청송사과 외</td>
				<td><button onclick="location.href='#'">조회</button></td>
			</tr>
			<tr>
				<td>2018-07-07</td>
				<td>0001</td>
				<td>박나래</td>
				<td>청송사과 외</td>
				<td><button onclick="location.href='#'">조회</button></td>
			</tr>
			<tr>
				<td colspan="6" id="td_info"><!-- 페이지 수 넣을 것임 -->
					<a href="#">둘러보기</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">배송비정책</a>
				</td>
			</tr>
		</table>
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