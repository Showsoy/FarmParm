<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
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
#gbutton {
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
#gbutton:hover, #gbutton:active, #gbutton:focus {
	background: #43A047;
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
	width:50px;
	text-align:center;
}
#td_info{
	color:#5D5D5D;
	font-size:14px;
}
#seldel{
	width:300px;
}
</style>
<script>
	function checkAll(theForm) {
		if (theForm.icheck.length == undefined) {
			theForm.icheck.checked = theForm.allCheck.checked;
		} else {
			for (var i = 0; i < theForm.icheck.length; i++) {
				theForm.icheck[i].checked = theForm.allCheck.checked;
			}
		}
	}
	var selPrice = 0;
	//체크하면 + 체크풀면 - value 수정
	function checkItem(f){
		if(f.icheck.checked == true){
			selPrice += icheck.value;
		}else{
			selPrice -= icheck.value;
		}
	}
	
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;장바구니</h3>
	<hr color="#4CAF50" size="5">
	<form action="#" method="post">
	<div class="mypage">
		<p id="seldel"><button onclick="location.href='#'" id="wbutton" style="width:70px;">선택삭제</button></p>
		<table cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="cart" items="${cartList }" varStatus="status">
			<tr>
				<td><input type="checkbox" id="icheck" name="icheck" value="${cart.kind }"/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../images/${cart.image }" width="100px" height="70px" align="center">
				&nbsp;&nbsp;&nbsp;청송사과 1kg</p></td>
				
				<td>${cart.price }</td>
				<td><input type="text" id="qty" name="qty" value="${cart.qty }" size="1">
				<button onclick="location.href='changeCart.im&item_code=${cart.kind }'" id="wbutton" style="width:50px;">변경</button>
				</td>
				<td><button onclick="location.href='removeCart.im&item_code=${cart.kind }'" id="gbutton">삭제</button></td>
			</tr>
			</c:forEach>
			<tr id="tr_total">
				<td colspan="6">
					<div>
						<h5>총 주문 금액 <b>${totalMoney }</b></h5>
						선택금액!!!!<br>
						배송비 +3000원
						<br><br>
						<button onclick="location.href='#'">주문하기</button>
					</div>
				<td>
			</tr>
			<c:if test="${cartList==null }">
				<tr>
					<td colspan="6">정보가 없습니다.</td>
				</tr>
			</c:if>
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
 <jsp:include page="/common/inner_menu.jsp" flush="false"/>
</body>
</html>