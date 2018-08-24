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
.mypage td{
	padding:5px;
}
td, tr{
	border: 1px solid #ddd;
}
</style>
<script>
function orderCancel(){
	var flag = confirm('주문을 취소하시겠습니까?');
	if(flag){
		location.href='myodChg.od?order_id=${order.order_id}&page=${page }&od_state=취소신청'
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
	<h3>&nbsp;&nbsp;주문조회</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<div id="statebox">
		<span id="state">${order.state }</span><br>
		<c:choose>
			<c:when test="${order.state eq '주문완료' }">
				<img src="../images/invoice.png"><span id="message">고객님의 주문을 접수했습니다.</span>
			</c:when>
			<c:when test="${order.state eq '결제완료' }">
				<img src="../images/credit-card.png"><span id="message">고객님의 주문 결제가 완료되었습니다.</span>
			</c:when>
			<c:when test="${order.state eq '상품출고' }">
				<img src="../images/sealed-parcel.png"><span id="message">고객님의 주문 배송을 시작했습니다.
				</span>
			</c:when>
			<c:when test="${order.state eq '배송완료' }">
				<img src="../images/shipped.png"><span id="message">고객님의 주문 배송을 완료했습니다.</span>
			</c:when>
			<c:when test="${order.state eq '취소신청' }">
				<img src="../images/cancel.png"><span id="message">취소 신청을 접수했습니다.</span>
			</c:when>
			<c:otherwise>
				<img src="../images/cancel.png"><span id="message">주문이 취소되었습니다.</span>
			</c:otherwise>
		</c:choose>
	</div>
	<section id="commandCell">
		<c:if test="${order.state eq '상품출고' }">
		<button type="button" id="obutton" style="width:70px;" onclick="location.href='myodChg.od?order_id=${order.order_id}&page=${page }&od_state=배송완료'">수취완료</button>
		</c:if>
		<c:if test="${order.state != '취소' && order.state != '취소신청'}">
		<button type="button" id="obutton" style="width:70px;" onclick="orderCancel();">주문취소</button>
		</c:if>
	</section>
	<form action="odChgState.od" name="orderview" method="post">
	<div id="order_info">
		<div id="grade"><b id="grade_deco">|</b>결제상품</div>
	<table cellspacing="0" cellpadding="0" id="order_sheet">
	<tr id="order_top_menu">
		<td id="leftalign">상품명</td>
		<td>단가</td>
		<td style="width:70px;">수량</td>
		<td>총 가격</td>
		<td style="width:70px;">적립</td>
		<td style="width:150px;">기타</td>
	</tr>
	<c:forEach var="odtemList" items="${odtemList }" varStatus="status">
	<tr>
		<td id="leftalign">${odtemList.item_name }</td>
		<td>${odtemList.price }원</td>
		<td>${odtemList.amount }개</td>
		<td>${odtemList.price*odtemList.amount }원</td>
		<fmt:parseNumber var="point" value="${(odtemList.price*odtemList.amount) div 100 }" integerOnly="true"/>
		<td>${point }점</td>
		<td>
			<c:if test="${order.state eq '배송완료' || order.state eq '상품출고'}">
				<button type="button" id="gbutton" onclick="window.open('../item/reForm.bo?order_id=${order.order_id }&item_code=${odtemList.item_code}','','width=500, height=400')">리뷰</button>
			</c:if>
			
				<button type="button" id="gbutton" onclick="window.open('../item/qnaForm.bo?order_id=${order.order_id }&item_code=${odtemList.item_code}','','width=500, height=400')">문의</button>
		</td>
	</tr>
	</c:forEach>
	<c:if test="${order.parcel>0 }">
	<tr>
		<td id="leftalign">배송비</td>
		<td>3000원</td>
		<td>1개</td>
		<td>3000원</td>
		<td>-</td>
		<td>-</td>
	</tr>
	</c:if>
	</table>
	<br>
	</div>
	<br>
	<div id="grade"><b id="grade_deco">|</b>배송지 정보</div>
	<table cellspacing="0" cellpadding="0" class="mytable">
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
		<button type="button" id="bbutton" onclick="location.href='myodList.od?page=${page}'">목록</button> 
</form>	
	</div>
	</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
