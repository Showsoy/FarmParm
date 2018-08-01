<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
#listmenu{
	display:flex;
	flex-wrap:wrap;
	width:850px;
	padding:0 0 5px 0;
	margin:0 auto;
}
#seldel{
	float:left;
}
#orderby{
	float:left;
	text-align:right;
	padding : 13px 0 0 400px;
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
		 document.itemList.action = act;
		 document.itemList.submit();
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;상품관리</h3>
	<hr color="#4CAF50" size="5">
	<form method="post" name="itemList">
	<div class="mypage">
	<div id="listmenu">
		<span id="seldel">
		<button type="button" id="wbutton" style="width:70px;" onclick="goto_url('itemDelete.im');">선택삭제</button>
		<button type="button" id="wbutton" style="width:70px;" onclick="goto_url('itemHide.im');">선택숨김</button>
		<button type="button" id="wbutton" style="width:70px;" onclick="goto_url('itemUnhide.im');">숨김취소</button>
		</span>
		<span id="orderby">
			<a href="itemList.im">전체</a>
			<a href="itemList.im?category=채소">채소</a>
			<a href="itemList.im?category=과일">과일</a>
			<a href="itemList.im?category=곡류">곡류</a>
			<a href="itemList.im?category=차">차</a>
			<a href="itemList.im?category=가공">가공</a>
		</span>
	</div>
		<table cellspacing="0" cellpadding="0">
			<c:choose>
				<c:when test="${pageInfo.listCount>0 }">	
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>상품코드</td>
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>주문량</td>
				<td>재고</td>
				<td>조회</td>
			</tr>

			<c:forEach var="itemList" items="${itemList }">
				<c:choose>
					<c:when test="${itemList.ihide>0 }">
						<tr style="background-color:#EAEAEA;text-decoration: line-through;">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td><input type="checkbox" id="icheck" name="icheck" value="${itemList.item_code }"/></td>
				<td>${itemList.category }</td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../images/${itemList.img_path }" width="100px" height="70px" align="center">
				&nbsp;&nbsp;&nbsp;${itemList.item_name }</p></td>
				
				<td>${itemList.price }</td>
				<td>${itemList.purchase }</td>
				<td>${itemList.stock }</td>
				<td><button type="button" onclick="location.href='itemView.im?item_code=${itemList.item_code}&page=${pageInfo.page }'" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="itemList.im?page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="itemList.im?page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="itemList.im?page=${pageInfo.page+1 }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="8">등록된 상품이 없습니다.</td></tr>
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