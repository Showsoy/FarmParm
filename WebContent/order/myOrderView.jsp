<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.OrderViewBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#order_info{
	margin:0 auto;
	width:700px;
}
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
#gbutton {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	border: 0;
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
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	width:50px;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton:active{
	background: #F6F6F6;
}
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
#order_top_menu{
	background-color:#F6F6F6;
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
}
#order_sheet{
	text-align:right;
}
#td_name{
	text-align:left;
}
#seldel{
	float:left;
}
#paymentform{
	width:700px;
	margin:0 auto;
}
#paymentform label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:15px;
}
</style>
<script>

</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;주문조회</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="odChgState.od" name="orderview" method="post">
	<div id="order_info">
		<div id="grade"><b id="grade_deco">|</b>결제상품</div>
	<table cellspacing="0" cellpadding="0" id="order_sheet">
	<tr id="order_top_menu">
		<td id="td_name">상품명</td>
		<td>단가</td>
		<td>수량</td>
		<td>총 가격</td>
		<td>적립</td>
	</tr>
	<c:forEach var="odtemList" items="${odtemList }" varStatus="status">
	<tr>
		<td id="td_name">${odtemList.item_name }</td>
		<td>${odtemList.price }원</td>
		<td>${odtemList.amount }개</td>
		<td>${odtemList.price*odtemList.amount }</td>
		<fmt:parseNumber var="point" value="${(odtemList.price*odtemList.amount) div 100 }" integerOnly="true"/>
		<td>${point }점</td>
	</tr>
	</c:forEach>
	</table>
	<br>
	</div>
	<br>
	<div id="grade"><b id="grade_deco">|</b>배송지 정보</div>
	<table cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left"><label for="receiver">받는 사람</label></td>
		<td>${order.receiver }</td>
	</tr>
	<tr>
		<td id="td_left"><label for="del_phone">연락처</label></td>
		<td>${order.del_phone }</td>
	</tr>
	<tr>
		<td id="td_left"><label for="del_mail">이메일</label></td>
		<td>${order.del_mail }</td>
	</tr>
	<tr>
		<td rowspan="3" id="td_left"><label for="del_postcode">주소</label></td>
		<td>${order.del_postcode }</td>
	</tr>
	<tr>
		<td>${order.del_addr }</td>
	</tr>
</table>
<br>
<div id="grade"><b id="grade_deco">|</b>결제</div>
<div id="paymentform">
		<label for="payment">결제방법</label> | ${order.payment }
		<label for="state">주문상태</label> | ${order.state }
		<hr color="#4CAF50">
		<p class="right"><font size="3em">총 &nbsp;${order.pay+order.depoint }원</font><br> 
	<font size="2em">포인트 사용 <font color="red" id="usepoint">${order.depoint }</font>원</font><br><br>
	<font size="4em"><b>총 결제금액 <b id="grade_deco"><span id="allprice">${order.pay }</span></b>원</b></font></p>
		</div>
<br><br>
		<button type="button" onclick="location.href='myodList.od?page=${page}'">목록</button> 
</form>	
	</div>
	</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
