<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo" %>
<%@ page import="vo.ItemStockBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#td_info{
	text-align:right;
}
th{
	text-align:center;
}
</style>
<script>
	function deleteCheck(v){
		var flag = confirm('한 번 삭제한 상품은 복구할 수 없습니다.\n그래도 삭제하시겠습니까?');
		if(flag){
			location.href=("itemDelete.im?item_code="+v);
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
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 정보</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<th rowspan="9"><img src="../images/${item.img_path }" width="300px"></th>
		<td id="td_left">분류</td>
		<td>${item.category }</td>
	</tr>
		<tr>
		<td id="td_left">상품코드</td>
		<td>${item.item_code }</td>
	</tr>
	<tr>
		<td id="td_left">상품명</td>
		<td>${item.item_name }</td>
	</tr>
	<tr>
		<td id="td_left">재고</td>
		<td>${stock }</td>
	</tr>
	<tr>
		<td id="td_left">원산지</td>
		<td>${item.origin }</td>
	</tr>
	<tr>
		<td id="td_left">가격</td>
		<td>${item.price }</td>
	</tr>
	<tr>
		<td id="td_left">할인</td>
		<td>${item.sale }</td>
	</tr>
	<tr>
		<td id="td_left">상태</td>
		<td>
			<c:choose>
				<c:when test="${item.ihide eq 0 }">
					노출&nbsp;&nbsp;<button type="button" id="gbutton" onclick="location.href='itemHide.im?item_code=${item.item_code}'">숨기기</button>
				</c:when>
				<c:otherwise>
					숨김&nbsp;&nbsp;<button type="button" id="gbutton" onclick="location.href='itemUnhide.im?item_code=${item.item_code}'">보이기</button>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button id="bbutton" onclick="location.href='itemEnterForm.im?item_code=${item.item_code}'">입출고등록</button></td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button id="bbutton" onclick="location.href='itemModForm.im?item_code=${item.item_code}'">수정하기</button> 
	
			<button id="bbutton" onclick="deleteCheck('${item.item_code}');">삭제하기</button></td>
	</tr>
</table>
<br><br>
<div>
	<table cellspacing="0" cellpadding="0" id="state_table">
			<tr id="top_menu">
				<td style="width:100px;">코드</td>
				<td style="width:150px;">날짜</td>
				<td style="width:100px;">상태</td>
				<td style="width:100px;">갯수</td>
				<td style="width:100px;">재고</td>
			</tr>
			<c:choose>
			<c:when test="${itemStockList!=null && i_pageInfo.listCount>0 }">
			<c:forEach var="stock" items="${itemStockList }">
			<tr>
				<td>${stock.item_code }</td>
				<td>${stock.idate }</td>
				<td>${stock.state }</td>
				<td>${stock.amount }</td>
				<td>${stock.stock }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" id="state_info">
					<c:if test="${i_pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${i_pageInfo.page>1 }">
						<a href="itemView.im?item_code=${item.item_code }&page=${page }&i_page=${i_pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${i_pageInfo.startPage }" end="${i_pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==i_pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="itemView.im?item_code=${item.item_code }&page=${page }&i_page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${i_pageInfo.page>=i_pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="itemView.im?item_code=${item.item_code }&page=${page }&i_page=${i_pageInfo.page+1 }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="5">등록된 데이터가 없습니다.</td></tr>
			</c:otherwise>
			</c:choose>
		</table>
</div>
<br><br><br><br>
<button id="bbutton" type="button" onclick="location.href='itemList.im?page=${page}'">목록</button>
<button id="bbutton" type="button" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
</div>
</div>
<br><br><br><br>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
