<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::관리자 페이지:::</title>
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
#orderby{
	width:50%;
	text-align:right;
}
#seldel{
	width:50%;
	text-align:left;
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
		if(act=='itemDelete.im'){
			var flag = confirm('삭제한 상품은 복구 및 조회가 불가능합니다.\n그래도 삭제하시겠습니까?');
			if(flag){
				document.itemList.action = act;
				document.itemList.submit();
			}
		}else{
			document.itemList.action = act;
			document.itemList.submit();
		}	
	}
	function listrefresh(){
		var category = document.getElementById("category").options[document.getElementById("category").selectedIndex].value;
		var std = document.getElementById("std").options[document.getElementById("std").selectedIndex].value;
		
		document.itemList.action = "itemList.im?category="+category+"&std="+std;
		document.itemList.submit();
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
			<select id="category" name="category" onchange="listrefresh()">
				<option value="all" <c:out value="${category eq 'all' ? 'selected' : '' }"/>>전체</option>
				<option value="채소" <c:out value="${category eq '채소' ? 'selected' : '' }"/>>채소</option>
				<option value="과일" <c:out value="${category eq '과일' ? 'selected' : '' }"/>>과일</option>
				<option value="곡류" <c:out value="${category eq '곡류' ? 'selected' : '' }"/>>곡류</option>
				<option value="차" <c:out value="${category eq '차' ? 'selected' : '' }"/>>차</option>
				<option value="가공" <c:out value="${category eq '가공' ? 'selected' : '' }"/>>가공</option>
			</select>
			<select id="std" name="std" onchange="listrefresh()">
				<option value="vdate" <c:out value="${std eq 'vdate' ? 'selected' : '' }"/>>등록순</option>
				<option value="stock" <c:out value="${std eq 'stock' ? 'selected' : '' }"/>>재고순</option>
				<option value="purchase" <c:out value="${std eq 'purchase' ? 'selected' : '' }"/>>주문순</option>
			</select>
		</span>
	</div>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check"><input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>상품코드</td>
				<td colspan="2">상품명</td>
				<td>가격</td>
				<td>주문량</td>
				<td>재고</td>
				<td>조회</td>
			</tr>
			<c:choose>
				<c:when test="${pageInfo.listCount>0 }">	
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
				<!-- 재고량 30 이하면 빨간색-->
				<c:if test="${itemList.stock <= 30}">
				<td style="color:red;">${itemList.stock }</td>
				</c:if>
				<c:if test="${itemList.stock > 30}">
				<td>${itemList.stock }</td>
				</c:if>
				<td><button type="button" onclick="location.href='itemView.im?item_code=${itemList.item_code}&page=${pageInfo.page }'" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="itemList.im?category=${category }&std=${std }&page=${pageInfo.page-1}"><span id="pagebn"><</span></a>
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								<span id="nowpage">${a }</span>
							</c:when>
							<c:otherwise>
								<a href="itemList.im?category=${category }&std=${std }&page=${a }">&nbsp;${a }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							
						</c:when>
						<c:otherwise>
							<a href="itemList.im?category=${category }&std=${std }&page=${pageInfo.page+1 }"><span id="pagebn">></span></a>
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
	<button type="button" id="sbutton" onclick="location.href='itemNew.jsp'">상품등록</button>
	<button type="button" id="bbutton" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>