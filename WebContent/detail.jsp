<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
#td_info{
	text-align:right;
}
#td_check{
	width:50px;
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
	
			<button onclick="location.href='order.jsp'">바로구매</button></td>
	</tr>
</table>
<br><br>
</div>
<div class="goods_detail">
	<h2>짱 맛있음</h2>
	<h3>상품 소개</h3>
	<img src="images/applefarm.jpg">
	<br><br>
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
