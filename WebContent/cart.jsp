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
	height:100px;
}
td{
    border-bottom: 1px solid #ddd;
}
td p{
	text-height:100%;
	float:left;
}
img{
	border: 1px solid #ddd;
	padding : 0 0 0 2px;
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
#tr_total{
	background-color:#F6F6F6;
	height:180px;
}
#td_check{
	width:20px;
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
	<h3>&nbsp;&nbsp;장바구니</h3>
	<hr color="#4CAF50" size="5">
	<form action="#" method="post">
	<div class="mypage">
		<table cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox"/></td>
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/apple.jpg" width="100px" align="center">
				&nbsp;&nbsp;&nbsp;청송사과 1kg</p></td>
				
				<td>20000</td>
				<td>1</td>
				<td><button onclick="location.href='#'">삭제</button></td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/apple.jpg" width="100px" align="center">
				&nbsp;&nbsp;&nbsp;청송사과 1kg</p></td>
				<td>20000</td>
				<td>1</td>
				<td><button onclick="location.href='#'">삭제</button></td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/apple.jpg" width="100px" align="center">
				&nbsp;&nbsp;&nbsp;청송사과 1kg</p></td>
				<td>20000</td>
				<td>1</td>
				<td><button onclick="location.href='#'">삭제</button></td>
			</tr>
			<tr>
				<td><input type="checkbox"/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="images/apple.jpg" width="100px" align="center">
				&nbsp;&nbsp;&nbsp;청송사과 1kg</p></td>
				<td>20000</td>
				<td>1</td>
				<td><button onclick="location.href='#'">삭제</button></td>
			</tr>
			<tr id="tr_total">
				<td colspan="6">
					<div>
						<h5>총 주문 금액 <b>000000원</b></h5>
						배송비 +3000원
						<br><br>
						<input type="submit" value="주문하기"/>
					</div>
				<td>
			</tr>
			<tr>
				<td colspan="6" id="td_info">
					<a href="#">둘러보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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