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
.navbar>ul>li>a:hover {
	background-color: #ddd;
    color:black;
}
.navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}
li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 5px;
    text-decoration: none;
}
.dropdown-content>a:hover{
    background-color: #ddd;
    color: black;
}
.dropdown:hover .dropbtn {
    background-color: #ddd;
    color: black;
}
li.dropdown {
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 121px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.maindown-content {
    display: none;
    position: absolute;
    background-color:#4CAF50;
    opacity:0.8;
    min-width: 880px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    padding-top:10px;
}
.dropdown-content a {
    color: black;
    padding: 5px;
    text-decoration: none;
    padding:10px;
    padding-left:26px;
    display: block;
    text-align: left;
}
.maindown-content a {
    color: black;
    text-decoration: none;
    padding:10px;
    padding-left:90px;
    display: block;
    text-align: left;
}
.dropdown:hover .dropdown-content {
    display: block;
}
.dropdown:hover .maindown-content {
    display: block;
}
.list a{
	display: inline;
	color: black;
    text-decoration: none;
    text-align: left;
    padding-left:0;
}
.list{
	padding-bottom:10px;
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
footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
table{
	border:0;
}
th, td {
    border-bottom: 1px solid #ddd;
    height:50px;
}
td img{
	height:100%;
	border:0;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
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
	<ul>
  <li><a href="#" id="menu"><img src="images/menu.png" width="24px" height="27px"/></a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
    <div class="dropdown-content">
      <a href="introduction.jsp">농원소개</a>
      <a href="location.jsp">오시는 길</a>
      <a href="notice.jsp">안내사항</a>
    </div>
  </li>
  <li><a href="vegetable.jsp">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="fruit.jsp">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="grains.jsp">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a></li>
  <li><a href="tea.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="mf.jsp">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="market.jsp" id="market" target="_blank">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a></li>
  
</ul>
</div>
<div class="pageform">
	<h3>&nbsp;&nbsp;고객센터</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	
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
