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
.goodsform{
	margin: 0 auto;
	width:1200px;
	padding:10px 30px 30px 30px;
}
.recent_view{
	width:1000px;
	margin:0 auto;
	padding:10px;
}
.recent_view table{
	margin:0 auto;
	border-collapse: collapse;
	padding:0;
}
.recent_view hr{
	padding:0;
}
.recent_view table tr{
	padding:5px;
}
.recent_view table tr td{
	border-bottom: 1px solid #ddd;
	border-top: 1px solid #ddd;
	padding:10px;
}
.recent_view table tr td img{
	width:180px;
}
.detail_table{
	width:700px;
	margin:0 auto;
	text-align:left;
	padding : 15px;
	border-radius:10px;
	border-collapse: collapse;
}
.detail_table tr{
	padding-top: 12px;
    padding-bottom: 12px;
    border: 1px solid #ddd;
}
.detail_table td{
	padding:5px 10px 5px 10px;
	border: 1px solid #ddd;
}
.detail_table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
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
footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
#td_info{
	text-align:right;
}
.goods_detail{
	text-align:center;
	width:700px;
	margin:0 auto;
}
.qna, .review{
	width:800px;
	margin:0 auto;
}
.detail_board{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
    height:100px;
	background-color:white;
	text-align:center;
}
#td_check{
	width:50px;
}
.detail_board tr td{
	height:30px;
	padding:0;
	border:0;
	margin:0;
	font-size:14px;
	border-bottom: 1px solid #ddd;
}
#top_menu{
	background-color:#333;
	color:white;
	height:20px;
}
#top_menu td{
	background-color:#333;
	color:white;
	height:20px;
}
.detail_board tr:nth-child(even) {background-color: #f2f2f2;}
.detail_board td p{
	float:left;
	padding:1px;
	border:1px;
	margin:1px;
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
  <a href="introduction.jsp">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
  <a href="vegetable.jsp">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="fruit.jsp">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="grains.jsp">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a>
  <a href="tea.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  <a href="mf.jsp">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a>
  <a href="market.jsp" id="market" target="_blank">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a>
</div>
<div class="recent_view">
		<h4>&nbsp;&nbsp;최근 본 상품</h4>
		<table>
		<tr>
			<td><img src="images/apple.jpg"/></td>
			<td><img src="images/apple.jpg"/></td>
			<td><img src="images/apple.jpg"/></td>
			<td><img src="images/apple.jpg"/></td>
			<td><img src="images/apple.jpg"/></td>
		</tr>
		</table>
	</div>
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<th rowspan="5"><img src="images/apple.jpg"/ width="300px"></th>
		<td id="td_left">상품명</td>
		<td><h2>청송사과 1kg</h2></td>
	</tr>
	<tr>
		<td id="td_left">가격</td>
		<td>1111</td>
	</tr>
	<tr>
		<td id="td_left">원산지</td>
		<td>청송 읍읍리</td>
	</tr>
	<tr>
		<td id="td_left">수량</td>
		<td>2</td>
	</tr>
	<tr>
		<td id="td_left">옵션</td>
		<td>/</td>
	</tr>
	<tr>
		<td colspan="3" id="td_info">총 2222원</td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button onclick="location.href='cart.jsp'">장바구니</button> 
	
			<button onclick="location.href='main.jsp'">바로구매</button></td>
	</tr>
</table>
<br><br>
</div>
<div class="goods_detail">
	<h2>짱 맛있음</h2>
	<h3>상품 소개</h3>
	<img src="images/applefarm.jpg">
	<p>
		2018년 6월, 유시민이 신간으로 찾아왔다. 경제학도, 정치가, '지식소매상'에서 최근에는 방송인으로도 종횡무진 활동하는 작가 유시민이 오랜 독서와 글쓰기의 원점인 역사 속으로 돌아왔다. 2017년 정의로운 국가의 모습과 시민의 역할을 모색한 국가란 무엇인가로 독자들의 뜨거운 반응을 얻은 이후, 유시민은 공부의 화두를 옮겨 동서양의 역사서들을 탐독하며 '역사란 무엇인가' 질문하고 답을 찾았다. 그 지적 탐구를 담은 역사의 역사는 유시민이 공개하는 역사 공부 노트이자 독자들과 함께 역사를 읽는 초대장이다.
		촌철살인의 화법으로 사안을 정리하고 결론을 맺어주던 '공공 지성' 유시민은 이 책에서는 한마디로 역사를 정의한다거나 자신의 의견을 높이는 일을 삼간다. 대신 역사가들의 이야기를 전하고 그 아래 스민 메시지와 감정에 공감하는 데 집중한다. '위대한 역사가들이 우리에게 전하려고 했던 생각과 감정을 듣고 느껴봄으로써 역사가 무엇인지 밝히는 데 도움될 실마리'를 찾는 '역사 여행 가이드'로서 충실하다.
	</p>
</div>
<br><br><br>
<div class="review">
<h3>&nbsp;&nbsp;상품후기</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" class="detail_board">
			<tr id="top_menu">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>맛있다</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>맛없다</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>보통이다</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>맛있따</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div class="qna">
	<h3>&nbsp;&nbsp;상품문의</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" class="detail_board">
			<tr id="top_menu">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>언제옹냐</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>환불</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>교환</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>궁금</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
		</table>
	</div>
</div>
<br><br><br><br>
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
