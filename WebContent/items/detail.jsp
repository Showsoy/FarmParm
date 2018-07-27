<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}
#detail_board tr:nth-child(even) {background-color: #f2f2f2;}
#idetail{
	margin:0 auto;
	display:inline-block;
}
#id_img{
	float:left;
}
#id_text{
	padding:0 50px 0 50px;
	float:left;
	font-size:12px;
}
#saled{
	color:#4CAF50;
}
dt{
	display:inline-block;
	width:80px;
	text-align:left;
}
dd{
	display:inline-block;
	width:80px;
	text-align:center;
}
</style>
<script>
function goto_url(act) {
	 document.itemform.action = act;
	 document.itemform.submit();
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<c:if test="${todayImageList!=null }">
<div class="recent_view">
		<h4>&nbsp;&nbsp;최근 본 상품</h4>
		<table>
		<tr>
			<c:forEach var="todayImage" items="${todayImageList }" varStatus="status" begin="0" end="5" step="1">
				<td><img src="../images/${todayImage }" id="todayImage"/></td>
			</c:forEach>
		</tr>
		</table>
</div>
</c:if>
<c:set var="price" value="${item.price }"/>
<c:set var="sale" value="${item.sale }"/>
<%
int price = (int)pageContext.getAttribute("price");
int sale = (int)pageContext.getAttribute("sale");
double saled = 1-(double)sale/100;
int uprice = (int)(price*saled);
pageContext.setAttribute("uprice", uprice);
%>
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form method="post" name="itemform">
	<div id="idetail">
		<div id="id_img">
			<img src="../images/apple.jpg" width="400px">
		</div>
		<div id="id_text">
			<dl>
				<dt>상품이름</dt>
				<dd><b>${item.item_name }</b></dd>
			</dl>
			<dl>
				<dt>가격</dt>
				<dd>${item.price }원</dd>
			</dl>
			<c:if test="${item.sale>0 }">
				<dl>
					<dt>할인가</dt>
					<dd><b id="saled">${uprice }</b>원</dd>
				</dl>
			</c:if>
			<dl>
				<dt>원산지</dt>
				<dd>${item.origin }</dd>
			</dl>
			<hr color="#4CAF50" size="5">
			<dl>
				<dt>수량</dt>
				<dd><input type="text" id="count" name="count" size="1"/></dd>
			</dl>
			<hr color="#4CAF50" size="5">
			<button type="button" onclick="goto_url('cartAdd.ct');">장바구니</button>
			<button type="button" onclick="goto_url('itemOrder.od');">바로구매</button>
		</div>
	</div>
	</form>
<br><br>
</div>
<div class="goods_detail">
	<h3>상품 소개</h3>
	<h4>${item.item_name }</h4>
	<img src="../images/${item.img_path }">
	<br><br>
	<p>
		${item.content }		
	</p>
</div>
<br><br><br>
<div class="review">
<h3>&nbsp;&nbsp;상품후기</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" id="detail_board">
			<tr id="top_menu" height="20px">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				맛있다</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				맛없다</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				보통이다</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				맛있따</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
		</table>
	</div>
	<br><br>
	<div class="qna">
	<h3>&nbsp;&nbsp;상품문의</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" id="detail_board">
			<tr id="top_menu">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				언제옹냐</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				환불</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				교환</td>
				<td>나래</td>
				<td>2018-07-07</td>
			</tr>
			<tr height="30px">
				<td>1</td>
				<td colspan="2">
				궁금</td>
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
