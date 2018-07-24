<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.mypage table{
	width:700px;
	margin:0 auto;
	text-align:left;
	padding : 15px;
	border-radius:10px;
	border-collapse: collapse;
}
.mypage tr{
	padding-top: 12px;
    padding-bottom: 12px;
}
.mypage td{
	padding:5px 5px 5px 10px;
}
.mypage table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
}
td, tr{
	border: 1px solid #ddd;
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
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;상품등록</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="boardWritePro.bo" method="post" enctype="multipart/form-data" name="boardform">
			<table>
				<tr>
					<td id="td_left">
						<label for="BOARD_NAME">이름</label>
					</td>
					<td id="td_right" colspan="3">
						<input type="text" name="BOARD_NAME" id="BOARD_NAME" required="required" size="40"/>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="BOARD_PASS">가격</label>
					</td>
					<td id="td_right">
						<input type="password" name="BOARD_PASS" id="BOARD_PASS" required="required" size="10"/>원
					</td>
					<td id="td_left">
						<label for="BOARD_SUBJECT">분류</label>
					</td>
					<td id="td_right">
						<select name="category" id="category">
							<option value="vegetable" selected>채소</option>
							<option value="fruit">과일</option>
							<option value="grains">곡류</option>
							<option value="tea">차</option>
							<option value="mf">가공</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="BOARD_SUBJECT">원산지</label>
					</td>
					<td id="td_right">
						<input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT" required="required"/>
					</td>
					<td id="td_left">
						<label for="BOARD_SUBJECT">할인율</label>
					</td>
					<td id="td_right">
						<input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT" required="required" value="0" size="10"/>%
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="BOARD_CONTENT">내용</label>
					</td>	
					<td colspan="3">
						<textarea name="BOARD_CONTENT" id="BOARD_CONTENT" cols="60" rows="15" required="required"></textarea>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="BOARD_FILE">파일 첨부</label>
					</td>
					<td id="td_right" colspan="3">
						<input type="file" name="BOARD_FILE" id="BOARD_FILE"/>
					</td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<button type="submit">등록</button>
				<button onclick="location.href='adminPage.jsp'">목록</button> 
			</section>
		</form>
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
