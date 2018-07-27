<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo" %>
<%@ page import="vo.ItemStockBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<ItemStockBean> itemStockList = (ArrayList<ItemStockBean>)request.getAttribute("itemStockList");
	PageInfo i_pageInfo = (PageInfo)request.getAttribute("i_pageInfo");
	int listCount = i_pageInfo.getListCount();
	int i_nowPage = i_pageInfo.getPage();
	int i_maxPage = i_pageInfo.getMaxPage();
	int i_startPage = i_pageInfo.getStartPage();
	int i_endPage = i_pageInfo.getEndPage();	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
#td_left{
	background-color:#F6F6F6;
}
#td_info{
	text-align:right;
}
#td_check{
	width:50px;
}
#detail_board{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
    height:100px;
    font-size:10px;
	background-color:white;
	text-align:center;
}
#detail_board tr td{
	font-size:12px;
	border-bottom: 1px solid #ddd;
}
#detail_board tr:nth-child(even) {background-color: #f2f2f2;}
#state_table{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
	background-color:white;
}
#state_table tr{
	height:30px;
}
#state_table tr:nth-child(even) {background-color: #f2f2f2;}
#state_table td{
    border-bottom: 1px solid #ddd;
}
#state_table td p{
	text-height:100%;
	float:left;
	padding: 0 0 0 10px;
}
#top_menu{
	background-color:#333;
	color:white;
	height:40px;
}
#state_info{
	color:#5D5D5D;
	font-size:14px;
}
#gbutton {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	border: 0;
	width:60px;
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
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 정보</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	
	<table cellspacing="0" cellpadding="0" class="detail_table">
	<tr>
		<th rowspan="7"><img src="../images/${item.img_path }" width="300px"></th>
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
		<td colspan="3" id="td_info"><button onclick="location.href='itemEnterForm.im?item_code=${item.item_code}'">입고등록</button></td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button onclick="location.href='itemModForm.im?item_code=${item.item_code}'">수정하기</button> 
	
			<button onclick="location.href='itemDelete.im?item_code=${item.item_code}'">삭제하기</button></td>
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
			<%
				if(itemStockList!=null&&listCount>0){
			%>
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
				<td colspan="6" id="state_info"><!-- 페이지 수 넣을 것임 -->
					<c:if test="${i_pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${i_pageInfo.page>1 }">
						<a href="itemList.im?page=${i_pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${i_pageInfo.startPage }" end="${i_pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==i_pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="itemList.im?page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${i_pageInfo.page>=i_pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="itemList.im?page=${i_pageInfo.page+1 }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<%}else{
			%>
				<tr><td colspan="5">등록된 상품이 없습니다.</td></tr>
			<%} %>
		</table>
</div>
</div>
<br><br><br>
</div>
<br><br><br><br>
<footer>
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  <p class="w3-medium">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a>
  </p>
</footer>

</body>
</html>
