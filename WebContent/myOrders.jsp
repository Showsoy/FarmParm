<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}
.header {
    padding: 10px; /* some padding */
    text-align:center;
    background: #fff; /* green background */
     /* white text color */
}
.right{
	text-align:right;
}
.right a{
	text-decoration:none;
	font-size:12px;
}
/* Increase the font size of the <h1> element */
.header h1 {
    font-size: 40px;
}
/* Style the top navigation bar */
.navbar {
    overflow: hidden; /* Hide overflow */
    background-color: #333; /* Dark background color */
     display: flex;
    justify-content: center;
}

/* Style the navigation bar links */
#market{
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: #4CAF50; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#market:hover {
    background-color: #4CAF50;
    color: white;
}
#menu{
	background-color:#4CAF50;
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: black; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#menu:hover {
    background-color:#4CAF50;
    color: black;
}
.navbar a {
    /* Make sure that the links stay side-by-side */
    display: block; /* Change the display to block, for responsive reasons (see below) */
    color: white; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}

/* Right-aligned link */
.navbar a.right {
    float: right; /* Float a link to the right */
}

/* Change color on hover/mouse-over */
.navbar a:hover {
    background-color: #ddd;
    color:black;
}

footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
.pageform{
	margin: 0 auto;
	width:1200px;
	padding:30px;
}
.mypage{
	margin:0 auto;
	text-align:center;
	padding : 25px;
}

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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<div class="header">
   <a href="main.jsp"><img src="images/farm_logo.png" width="150px"></a>
  <div>A website created by me.</div>
  <div class="right">
	  <a href="login.jsp">로그인</a>&nbsp;
	  <a href="joinForm.jsp">회원가입</a>&nbsp;
	  <a href="myPage.jsp">마이페이지</a>&nbsp;
	  <a href="myOrders.jsp">주문/배송</a>&nbsp;
	  <a href="cs_center.jsp">고객센터</a>&nbsp;
	  <a href="cart.jsp">장바구니</a>&nbsp;
  </div>
  
</div>   
<div class="navbar">
  <a href="#" id="menu"><img src="images/menu.png" width="24px"/></a>
  <a href="#">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
  <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="#">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a>
  <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="#">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a>
  <a href="#" id="market">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a>
</div>

<div class="pageform">
	<h3>&nbsp;&nbsp;주문/배송 조회</h3>
	<hr color="#4CAF50" size="5">
	<form action="#" method="post">
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
	</form>
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