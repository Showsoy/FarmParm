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
	height:20px;
	color:white;
	padding:0;
}
#detail_board{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
    height:100px;
    font-size:10px;
	background-color:white;
	text-align:center;
}
#detail_board tr td{
	font-size:12px;
	border-bottom: 1px solid #ddd;
}
#detail_board tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="top_menu.jsp" flush="false"/>
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 정보</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<th rowspan="5"><img src="images/apple.jpg" width="300px"></th>
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
<br><br><br>
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
