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
td, tr{
	border: 1px solid #ddd;
}
#seldel{
	width:600px;
	float:right;
}
</style>
<script>
function goto_url(act) {
	document.orderview.action = act;
	document.orderview.submit();
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<jsp:include page="/common/adminbar.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;주문조회</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form name="orderview" method="post">
		<span id="seldel">
		<select name="od_state" id="od_state">
			<c:if test="${order.state eq '주문완료'}">
				<option value="주문완료" selected>주문완료</option>
				<option value="결제완료">결제완료</option>
				<option value="상품출고">상품출고</option>
				<option value="배송완료">배송완료</option>
				<option value="취소">취소</option>
			</c:if>
			<c:if test="${order.state eq '결제완료'}">
				<option value="주문완료">주문완료</option>
				<option value="결제완료" selected>결제완료</option>
				<option value="상품출고">상품출고</option>
				<option value="배송완료">배송완료</option>
				<option value="취소">취소</option>
			</c:if>
				<c:if test="${order.state eq '상품출고'}">
				<option value="주문완료">주문완료</option>	
				<option value="결제완료">결제완료</option>
				<option value="상품출고" selected>상품출고</option>
				<option value="배송완료">배송완료</option>
				<option value="취소">취소</option>
			</c:if>
				<c:if test="${order.state eq '배송완료'}">
				<option value="주문완료">주문완료</option>
				<option value="결제완료">결제완료</option>
				<option value="상품출고">상품출고</option>
				<option value="배송완료" selected>배송완료</option>
				<option value="취소">취소</option>
			</c:if>
				<c:if test="${order.state eq '취소'}">
				<option value="주문완료">주문완료</option>
				<option value="결제완료">결제완료</option>
				<option value="상품출고">상품출고</option>
				<option value="배송완료">배송완료</option>
				<option value="취소" selected>취소</option>
			</c:if>
		</select>
		<button type="button" id="wbutton" style="width:100px;" onclick="goto_url('odChgState.od?order_id=${order.order_id}&page=${page }');">주문상태변경</button>
		</span><br>
	<div id="order_info">
		<div id="grade"><b id="grade_deco">|</b>결제상품</div>
	<table cellspacing="0" cellpadding="0" id="order_sheet">
	<tr id="order_top_menu">
		<td id="leftalign">상품명</td>
		<td>단가</td>
		<td>수량</td>
		<td>총 가격</td>
		<td>적립</td>
	</tr>
	<c:forEach var="odtemList" items="${odtemList }" varStatus="status">
	<tr>
		<td id="leftalign">${odtemList.item_name }</td>
		<td>${odtemList.price }원</td>
		<td>${odtemList.amount }개</td>
		<td>${odtemList.price*odtemList.amount }</td>
		<fmt:parseNumber var="point" value="${(odtemList.price*odtemList.amount) div 100 }" integerOnly="true"/>
		<td>${point }점</td>
	</tr>
	</c:forEach>
	<c:if test="${order.parcel>0 }">
	<tr>
		<td id="leftalign">배송비</td>
		<td>3000원</td>
		<td>1개</td>
		<td>3000원</td>
		<td>-</td>
	</tr>
	</c:if>
	</table>
	<br>
	</div>
	<br>
	<div id="grade"><b id="grade_deco">|</b>배송지 정보</div>
	<table class="mytable" cellspacing="0" cellpadding="0">
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
		<label for="payment">결제방법</label> | ${order.payment }&nbsp;&nbsp;&nbsp;
		<label for="state">주문상태</label> | ${order.state }
		<hr color="#4CAF50">
		<p class="right"><font size="3em">총 &nbsp;${order.pay+order.depoint }원</font><br> 
	<font size="2em">포인트 사용 <font color="red" id="usepoint">${order.depoint }</font>원</font><br><br>
	<font size="4em"><b>총 결제금액 <b id="grade_deco"><span id="allprice">${order.pay }</span></b>원</b></font></p>
		</div>
<br><br>
		<button id="bbutton" type="button" onclick="history.back()">뒤로가기</button>
		<button id="bbutton" type="button" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button> 
</form>	
	</div>
	</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
