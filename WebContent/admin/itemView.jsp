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
#state_table{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
	background-color:white;
}
#state_table tr{
	height:30px;
}
#state_table tr:nth-child(even) {background-color: #f2f2f2;}
#state_table td{
    border-bottom: 1px solid #ddd;
}
#state_table td p{
	text-height:100%;
	float:left;
	padding: 0 0 0 10px;
}
#top_menu{
	background-color:#333;
	color:white;
	height:40px;
}
#state_info{
	color:#5D5D5D;
	font-size:14px;
}
#gbutton {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	border: 0;
	width:60px;
	padding: 3px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#gbutton:hover, #gbutton:active, #gbutton:focus {
	background: #43A047;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 정보</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<td id="td_left">상품코드</td>
	</tr>
	<tr>
		<th rowspan="6"><img src="../images/apple.jpg" width="300px"></th>
		<td id="td_left">분류</td>
		<td>과일</td>
	</tr>
	<tr>
		
		<td id="td_left">상품명</td>
		<td>청송사과 1kg</td>
	</tr>
	<tr>
		<td id="td_left">원산지</td>
		<td>청송 읍읍리</td>
	</tr>
	<tr>
		<td id="td_left">재고</td>
		<td>2</td>
	</tr>
	<tr>
		<td id="td_left">가격</td>
		<td>1111</td>
	</tr>
	<tr>
		<td id="td_left">할인</td>
		<td>10%</td>
	</tr>
	<tr>
		<td colspan="3" id="td_info">총 2222원</td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button onclick="location.href='cart.jsp'">수정하기</button> 
	
			<button onclick="location.href='order.jsp'">삭제하기</button></td>
	</tr>
</table>
<br><br>
<div>
	<table cellspacing="0" cellpadding="0" id="state_table">
			<tr id="top_menu">
				<td style="width:150px;">날짜</td>
				<td style="width:150px;">제품명</td>
				<td style="width:100px;">분류</td>
				<td style="width:100px;">갯수</td>
				<td style="width:100px;">재고</td>
				<td style="width:100px;">비고</td>
			</tr>
			<tr>
				<td>2018-07-01</td>
				<td>청송사과 1kg</td>
				<td>입고</td>
				<td>123</td>
				<td>123</td>
				<td><button type="button" onclick="location.href='#'" id="gbutton">보기</button></td>
			</tr>
			<tr>
				<td>2018-07-01</td>
				<td>청송사과 1kg</td>
				<td>입고</td>
				<td>123</td>
				<td>123</td>
				<td><button type="button" onclick="location.href='#'" id="gbutton">보기</button></td>
			</tr>
			<tr>
				<td>2018-07-01</td>
				<td>청송사과 1kg</td>
				<td>입고</td>
				<td>123</td>
				<td>123</td>
				<td><button type="button" onclick="location.href='#'" id="gbutton">보기</button></td>
			</tr>
			<tr>
				<td>2018-07-01</td>
				<td>청송사과 1kg</td>
				<td>입고</td>
				<td>123</td>
				<td>123</td>
				<td><button type="button" onclick="location.href='#'" id="gbutton">보기</button></td>
			</tr>
			<tr>
				<td colspan="6" id="state_info"><!-- 페이지 수 넣을 것임 -->
					<a href="#">둘러보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">배송비정책</a>
				</td>
			</tr>
		</table>
</div>
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
