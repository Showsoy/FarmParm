<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::관리자 페이지:::</title>
<style>
tr{
	height:50px;
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
#seldel{
	width:40%;
	text-align:right;
}
#orderby{
	width:60%;
	text-align:left;
	padding : 13px 0 0 0px;
}
</style>
<script>
	function checkAll(theForm){
		if(theForm.icheck.length==undefined){
			theForm.icheck.checked = theForm.allCheck.checked;
		}else{
			for(var i=0;i<theForm.icheck.length;i++){
				theForm.icheck[i].checked = theForm.allCheck.checked;
			}
		}
	}
	function goto_url(act) {
		var od_state = document.getElementById("od_state").options[document.getElementById("od_state").selectedIndex].value
		if(od_state=='취소완료'){
			var flag = confirm('주문을 취소하시겠습니까?');
			if(flag){
				document.odList.action = "odCancel.od";
				document.odList.submit();
			}
		}else{
			document.odList.action = encodeURI(act);
			document.odList.submit();
		}
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
	<h3>&nbsp;&nbsp;주문관리</h3>
	<hr color="#4CAF50" size="5">
	<form method="post" name="odList">
	<div class="mypage">
	<div id="listmenu">
		<span id="orderby">
			<a href="odList.od"><img src="../images/checked.png"/><c:choose><c:when test="${state eq 'all' }">
			<span id="selcategory">전체</span></c:when><c:otherwise> 전체</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=주문완료')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '주문완료' }">
			<span id="selcategory">주문완료</span></c:when><c:otherwise> 주문완료</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=결제완료')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '결제완료' }">
			<span id="selcategory">결제완료</span></c:when><c:otherwise> 결제완료</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=상품출고')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '상품출고' }">
			<span id="selcategory">상품출고</span></c:when><c:otherwise> 상품출고</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=배송완료')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '배송완료' }">
			<span id="selcategory">배송완료</span></c:when><c:otherwise> 배송완료</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=취소신청')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '취소신청' }">
			<span id="selcategory">취소신청</span></c:when><c:otherwise> 취소신청</c:otherwise></c:choose></a>
			<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?state=취소완료')"><img src="../images/checked.png"/><c:choose><c:when test="${state eq '취소완료' }">
			<span id="selcategory">취소완료</span></c:when><c:otherwise> 취소완료</c:otherwise></c:choose></a>
		</span>
		<span id="seldel">
		<select name="od_state" id="od_state">
			<option value="결제완료">결제완료</option>
			<option value="상품출고">상품출고</option>
			<option value="배송완료">배송완료</option>
			<option value="취소완료">취소완료</option>
		</select>
		<button type="button" id="wbutton" style="width:100px;" onclick="goto_url('odChgState.od');">주문상태변경</button>
		</span>
	</div>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>주문번호</td>
				<td>주문일시</td>
				<td>아이디</td>
				<td>결제금액</td>
				<td>주문현황</td>
				<td>조회</td>
			</tr>
			<c:choose>
				<c:when test="${pageInfo.listCount>0 }">	
			<c:forEach var="orderList" items="${orderList }">
				<tr>
				<td><input type="checkbox" id="icheck" name="icheck" value="${orderList.order_id }"/></td>
				<td>${orderList.order_id }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderList.dati }" /></td>
				<td><c:if test="${orderList.user_id eq null }">탈퇴회원</c:if>
				${orderList.user_id }</td>
				<td><fmt:formatNumber value="${orderList.pay }" type="number"/>원</td>
				<td>${orderList.state }</td>
				<td><button type="button" onclick="location.href=encodeURI('odView.od?order_id=${orderList.order_id}&page=${pageInfo.page }<c:out value="${state !=null ? '&state=' : '' }"/>${state }')" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?<c:out value="${state !=null ? 'state=' : '' }"/>${state }&page=${pageInfo.page-1}')"><span id="pagebn"><</span></a>
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								<span id="nowpage">${a }</span>
							</c:when>
							<c:otherwise>
								<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?<c:out value="${state !=null ? 'state=' : '' }"/>${state }&page=${a }')">&nbsp;${a }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" onclick="location.href=encodeURI('odList.od?<c:out value="${state !=null ? 'state=' : '' }"/>${state }&page=${pageInfo.page+1 }')"><span id="pagebn">></span></a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="8">조회 가능한 주문이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
		</table>
	<br><br><br>
	<button id="bbutton" type="button" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>