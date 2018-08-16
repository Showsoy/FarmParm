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
	text-weight:700;
}
#order_sheet{
	text-align:right;
}
#td_name{
	text-align:left;
}

</style>
<script>
	function depointf(f,v,t){
		var depoint = f.depoint.value;
		if(isNaN(depoint)){
			alert('잘못 입력하셨습니다.');
			f.depoint.value="";
			f.depoint.focus();
		}else if(parseInt(depoint)>parseInt(v)){
			alert('사용 가능 포인트 초과');
			f.depoint.value="";
			f.depoint.focus();
		}else{
			document.getElementById("usepoint").innerHTML = depoint;
			document.getElementById("allprice").innerHTML = parseInt(f.totalMoney.value)-parseInt(depoint);
		}
	}
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
	    if(doubleSubmitFlag){
	        return doubleSubmitFlag;
	    }else{
	        doubleSubmitFlag = true;
	        return false;
	    }
	}

	function chkForm(f){
	    if(!doubleSubmitCheck()){
	    	alert("주문완료");
	    }

	    document.orderform.submit();
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;결제</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="order.od" name="orderform" method="post" onsubmit="return chkForm(this)">
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
	<c:forEach var="order" items="${orderList }" varStatus="status">
	<tr>
		<td id="td_name">${order.item_name }</td>
		<td>${order.price }원</td>
		<td>${order.amount }개</td>
		<td>${order.price*order.amount }</td>
		<fmt:parseNumber var="point" value="${(order.price*order.amount) div 100 }" integerOnly="true"/>
		<td>${point }점
		<input type="hidden" id="od_item_code" name="od_item_code" value="${order.item_code }">
		<input type="hidden" id="od_item_name" name="od_item_name" value="${order.item_name }">
		<input type="hidden" id="od_price" name="od_price" value="${order.price }">
		<input type="hidden" id="od_amount" name="od_amount" value="${order.amount }">
		</td>
	</tr>
	</c:forEach>
	<c:if test="${parcel eq '3000' }">
	<tr>
		<td id="td_name">택배비</td>
		<td>3000원</td>
		<td>-</td>
		<td>3000원</td>
		<td>-</td>
	</tr>
	</c:if>
	</table>
	<input type="hidden" id="parcel" name="parcel" value="${parcel }"/>
	<br>
	<div id="grade"><b id="grade_deco">|</b>포인트 사용</div>
	<div id="point" style="background-color:#F6FFCC;padding:10px;">
		사용 가능 포인트 <b>${user.point }</b> 점 중 <input type="text" id="depoint" name="depoint" size="5"/>
		<button type="button" onClick="depointf(this.form,${user.point})" id="wbutton">사용</button>
	</div>
	<p class="right"><font size="3em">총 &nbsp;${totalMoney }원</font><br>
	<input type="hidden" id="totalMoney" name="totalMoney" value="${totalMoney }"> 
	<font size="2em">포인트 사용 <font color="red" id="usepoint"></font>원</font><br><br>
	<font size="4em"><b>총 결제금액 <b id="grade_deco"><span id="allprice">${totalMoney }</span></b>원</b></font></p>
	</div>
	<br>
	<div id="grade"><b id="grade_deco">|</b>배송지 정보</div>
	<table cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left"><label for="userName">주문인</label></td>
		<td>${user.name }</td>
	</tr>
	<tr>
		<td id="td_left"><label for="receiver">받는 사람</label></td>
		<td><input type="text" id="receiver" name="receiver" value="${user.name }"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">연락처</label></td>
		<td><input type="text" id="phone" name="phone" value="${user.phone }"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">이메일</label></td>
		<td><input type="text" id="email" name="email" value="${user.email }"></td>
	</tr>
	<tr>
		<td rowspan="3" id="td_left"><label for="userID">주소</label></td>
		<td><input type="text" name="userAddr1" id="userAddr1"size="7" value="${user.postcode }"/>
		<button type="button" onclick="sample6_execDaumPostcode()" id="gbutton">주소검색</button></td>
	</tr>
	<tr>
		<td>
		<input type="text" name="userAddr2" id="userAddr2" value="${user.address }" size="40">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="userAddr3" id="userAddr3" value="${user.address_second }" size="40">
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수
			
			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;
			
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
			                document.getElementById('userAddr2').value = fullAddr;
			
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById('userAddr3').focus();
			            }
			        }).open();
			    }
			</script>
		</td>
	</tr>
</table>
<br>
<div id="grade"><b id="grade_deco">|</b>결제방법</div>
<div id="paymentform">
		<input type="radio" name="payment" value="계좌이체" checked="checked" id="payment"/>&nbsp;계좌이체&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="payment" value="무통장입금">&nbsp;무통장입금&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="payment" value="신용카드">&nbsp;신용카드&nbsp;
		<hr color="#4CAF50">
		</div>
<br><br>
			<button type="submit">결제</button> 
	
			<button type="button" onclick="location.href='main.im'">돌아가기</button> 
</form>	
	</div>
	</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
