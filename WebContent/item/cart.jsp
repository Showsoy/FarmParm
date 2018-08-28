<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
#tr_total{
	text-align:right;
}
#seldel{
	width:300px;
}
</style>
<script>
selPrice = "<%=(int)request.getAttribute("totalMoney")%>";


	function checkAll(theForm) {
		if (theForm.icheck.length == undefined) {
			theForm.icheck.checked = theForm.allCheck.checked;
		} else {
			for (var i = 0; i < theForm.icheck.length; i++) {
				theForm.icheck[i].checked = theForm.allCheck.checked;
			}
		}
	}
	
	//체크하면 + 체크풀면 -
	function checkItem(v, f){
		
		if(f.checked == true){
			selPrice = parseInt(selPrice)+parseInt(v);
			document.getElementById("selArea").innerHTML = "선택 상품 가격 <b>"+selPrice+"</b> 원";
		}else{
			selPrice = parseInt(selPrice)-parseInt(v);
			document.getElementById("selArea").innerHTML = "선택 상품 가격 <b>"+selPrice+"</b> 원";
		}
		if(selPrice<30000){
			document.getElementById("parcel").innerHTML = "배송비 3000원<br><font id='parcel_info'>3만 원 이상 구매 시 배송비 무료</font><br>";
			document.getElementById("total").innerHTML = parseInt(selPrice)+parseInt(3000);
		}else{
			document.getElementById("parcel").innerHTML = "";
			document.getElementById("total").innerHTML = parseInt(selPrice);
		}
	}
	
	function goto_url(act) {
		document.cartform.action = act;
		var qty = document.getElementById("qty").value;
		var reg_qty = /^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$/;
		if (!reg_qty.test(qty)) {
			alert("1~50의 숫자만 가능합니다.");
			document.qty.focus();
			return false;
		}
		document.cartform.submit();
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
	<form method="post" name="cartform">
	<div class="mypage">
		<p id="seldel"><button type="button" onclick="goto_url('removeCart.ct');" id="wbutton" style="width:70px;">선택삭제</button></p>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)" checked/></td>
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>삭제</td>
			</tr> 
			<c:forEach var="cart" items="${cartList }" varStatus="status">
			<tr>
				<td><input type="checkbox" id="icheck" name="icheck" value="${cart.item_code }" onClick="checkItem('${cart.sprice*cart.qty }',this)" checked/></td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../uitemView.im?item_code=${cart.item_code}&page=1" style=text-decoration:none;>
				<img src="../images/${cart.image }" width="100px" height="70px" align="center">
				&nbsp;&nbsp;&nbsp;${cart.item_name }</a></p></td>
				
				<td>
				<c:choose>
					<c:when test="${cart.sprice==cart.price }">
						<font>${cart.price }원</font>
					</c:when>
					<c:otherwise>
						<font size="2px"><s>${cart.price }원</s><br>
						${cart.sprice }원
						</font>
					</c:otherwise>
				</c:choose>
				</td>
				<td><input type="text" id="qty" name="${cart.item_code}_qty" value="${cart.qty }" size="1">
				<button type="button" onclick="goto_url('changeCart.ct?item_code=${cart.item_code}');" id="wbutton" style="width:50px;">변경</button>
				</td>
				<td><button type="button" onclick="location.href='removeCart.ct?item_code=${cart.item_code }'" id="gbutton">삭제</button></td>
			</tr>
			</c:forEach>
			<tr id="tr_total">
				<td colspan="6">
					<div style="padding:5px 20px 5px 5px;">
						전체 상품 가격 ${totalMoney }원<br>
						<span id="selArea">선택 상품 가격 <b>${totalMoney }</b>원</span><br>
						<span id="parcel">
							<c:if test="${totalMoney<30000 }">
								배송비 3000원<br><font id="parcel_info">3만 원 이상 구매 시 배송비 무료</font><br>
							</c:if>
						</span>
						<h5>결제 예상 금액<b>
							<span id="total">
								<c:choose>
									<c:when test="${totalMoney>30000 }">
										${totalMoney }
									</c:when>
									<c:otherwise>
										${totalMoney+3000 }
									</c:otherwise>
								</c:choose>
							</span></b>원
						</h5>
						<br>
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
					<button id="bbutton" onclick="goto_url('../order/odForm.od?type=all');">전체주문</button>
					<button id="bbutton" onclick="goto_url('../order/odForm.od?type=sel');">선택주문</button>
					<button id="sbutton" type="button" onclick="history.back();" style="width:110px;">쇼핑계속하기</button>

				</td>
			</tr>
		</table>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>