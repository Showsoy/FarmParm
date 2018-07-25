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
	width:100px;
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
		<th rowspan="6"><img src="../images/${item.img_path }" width="300px"></th>
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
		<td colspan="3" id="td_info"><button onclick="location.href='itemEnterForm.im'">수정하기</button></td>
	</tr>
	<tr>
		<td colspan="3" id="td_info"><button onclick="location.href='itemModForm.im'">수정하기</button> 
	
			<button onclick="location.href='itemDelete.im'">삭제하기</button></td>
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
			<%}else{
			%>
				<section id="emptyArea">등록된 글이 없습니다.</section>
			<%} %>
			<tr>
				<td colspan="6" id="state_info"><!-- 페이지 수 넣을 것임 -->
					<%if(i_nowPage<=1){ %>
			[이전]&nbsp;
		<%}else{ %>
			<a href="itemView.im?i_page=<%=i_nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int a=i_startPage;a<=i_endPage;a++){
			if(a==i_nowPage){%>
				[<%=a %>]
			<%}else{ %>
				<a href="itemView.im?i_page=<%=a%>">[<%=a %>]</a>&nbsp;
			<%} %>
		<%} 
		if(i_nowPage>=i_maxPage){%>
			[다음]
		<%}else{ %>
			<a href="itemView.im?i_page=<%=i_nowPage+1 %>">[다음]</a>
		<%} %>
				</td>
			</tr>
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
