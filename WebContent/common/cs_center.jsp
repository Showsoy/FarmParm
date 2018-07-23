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
	padding: 0 0 0 10px;
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
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;고객센터</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<table cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>청송사과 1kg</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
				<td>1</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>청송사과 1kg</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
				<td>1</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>청송사과 1kg</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
				<td>1</td>
			</tr>
			<tr>
				<td>1</td>
				<td colspan="2">
				<p>청송사과 1kg</p></td>
				<td>나래</td>
				<td>2018-07-07</td>
				<td>1</td>
			</tr>
			<tr>
				<td colspan="6" id="td_info"><!-- 페이지 수 넣을 것임 -->
					<a href="#">둘러보기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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