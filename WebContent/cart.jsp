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
	background-color: #EAEAEA;
	margin:0 auto;
	text-align:center;
	padding : 25px;
}

table{
	margin:0 auto;
	border-collapse: collapse;
    width: 100%;
	text-align:center;
	background-color:white;
}
td tr{
	padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}
.mypage table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
}
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 100px;
	border: 0;
	padding: 13px;
	color: #FFFFFF;
	font-size: 12px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#top_menu{
	background-color:#CEFBC9;
	margin:0;
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
	  <a href="#">주문/배송</a>&nbsp;
	  <a href="#">고객센터</a>&nbsp;
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
	<h3>&nbsp;&nbsp;장바구니</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<table>
			<tr id="top_menu">
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
			<tr>
				<td></td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>