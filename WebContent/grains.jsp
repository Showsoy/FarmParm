<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
.page{
	margin:0 auto;
	text-align:center;
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
	<h3>&nbsp;&nbsp;쌀/잡곡</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">

<div id="goods_container">
		<ul class="prod-list" align="center">
			<li><img src="images/apple.jpg" alt="1">
			<p>dd</p>
				<div class="caption">
					<h1>사과</h1>
					<p>
						<br><a href="detail.jsp">상품보러가기</a><br><a href="#">장바구니</a>
					</p>
				</div>
			</li>
			<li><img src="images/apple.jpg" alt="2">
			<p>dd</p>
			<div class="caption">
					<h1>ㅎㅎ</h1>
					<p>
						<br>견종 : 포메라니안<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="3">
			<p>dd</p>
			<div class="caption">
					<h1>3번</h1>
					<p>
						<br>견종 : 말티즈<br>성별 : 여아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="4">
			<div class="caption">
					<h1>4번</h1>
					<p>
						<br>견종 : 믹스<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="5">
			<div class="caption">
					<h1>5번</h1>
					<p>
						<br>견종 : 푸들<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="6">
			<div class="caption">
					<h1>6번</h1>
					<p>
						<br>견종 : 비숑프리제<br>성별 : 여아<br>나이 : 3개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="7">
			<div class="caption">
					<h1>7번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="8">
			<div class="caption">
					<h1>8번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 여아<br>나이 : 1개월
					</p>
				</div></li>
				<li><img src="images/apple.jpg" alt="6">
		<div class="caption">
					<h1>9번</h1>
					<p>
						<br>견종 : 푸들<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="6">
			<div class="caption">
					<h1>10번</h1>
					<p>
						<br>견종 : 비숑프리제<br>성별 : 여아<br>나이 : 3개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="7">
			<div class="caption">
					<h1>11번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 남아<br>나이 : 2개월
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="8">
			<div class="caption">
					<h1>12번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 여아<br>나이 : 1개월
					</p>
				</div></li>
		</ul>
	</div>
</div>
<div class="page">1 2 3 4 5</div>
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
