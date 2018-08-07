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
#listmenu{
	display:flex;
	flex-wrap:wrap;
	width:850px;
	padding:0 0 5px 0;
	margin:0 auto;
}
#seldel{
	float:left;
	padding:0 0 0 330px;
}
#orderby{
	float:left;
	text-align:right;
	padding : 13px 0 0 0px;
	font-size:13px;
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
		document.odList.action = act;
		document.odList.submit();
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;주문관리</h3>
	<hr color="#4CAF50" size="5">
	<form method="post" name="odList">
	<div class="mypage">
	<div id="listmenu">
		<span id="orderby">
			<a href="odList.od">전체</a>
			<a href="odList.od?state=주문완료">주문완료</a>
			<a href="odList.od?state=결제완료">결제완료</a>
			<a href="odList.od?state=상품출고">상품출고</a>
			<a href="odList.od?state=배송완료">배송완료</a>
			<a href="odList.od?state=취소">취소</a>
		</span>
		<span id="seldel">
		<select name="od_state" id="od_state">
			<option value="결제완료">결제완료</option>
			<option value="상품출고">상품출고</option>
			<option value="배송완료">배송완료</option>
			<option value="취소">취소</option>
		</select>
		<button type="button" id="wbutton" style="width:100px;" onclick="goto_url('odChgState.od');">주문상태변경</button>
		</span>
	</div>
		<table cellspacing="0" cellpadding="0">
			<c:choose>
				<c:when test="${pageInfo.listCount>0 }">	
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>주문번호</td>
				<td>주문일시</td>
				<td>아이디</td>
				<td>결제금액</td>
				<td>주문현황</td>
				<td>조회</td>
			</tr>

			<c:forEach var="orderList" items="${orderList }">
				<tr>
				<td><input type="checkbox" id="icheck" name="icheck" value="${orderList.order_id }"/></td>
				<td>${orderList.order_id }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${orderList.dati }" /></td>
				<td>${orderList.user_id }</td>
				<td>${orderList.pay }</td>
				<td>${orderList.state }</td>
				<td><button type="button" onclick="location.href='odView.od?order_id=${orderList.order_id}&page=${pageInfo.page }'" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="odList.od?page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="odList.od?page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="odList.od?page=${pageInfo.page+1 }">[다음]</a>
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
	<button type="button" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>