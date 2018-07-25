<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo" %>
<%@ page import="vo.ItemViewBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<ItemViewBean> itemList = (ArrayList<ItemViewBean>)request.getAttribute("itemList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();	
%>
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
#seldel{
	width:300px;
}
</style>
<script>
	function checkAll(theForm){
		if(theForm.remove.length==undefined){
			theForm.remove.checked = theForm.allCheck.checked;
		}else{
			for(var i=0;i<theForm.remove.length;i++){
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
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
	<h3>&nbsp;&nbsp;상품관리</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<p id="seldel"><button onclick="location.href='#'" id="wbutton" style="width:70px;">선택삭제</button>
		<a href="itemList.im?category=야채">야채</a>
		<a href="itemList.im?category=과일">과일</a>
		<a href="itemList.im?category=곡류">곡류</a>
		<a href="itemList.im?category=차">차</a>
		<a href="itemList.im?category=가공">가공</a>
		</p>
		<table cellspacing="0" cellpadding="0">
			<%
				if(itemList!=null&&listCount>0){
			%>
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
			<tr>
				<td><input type="checkbox" id="remove" name="remove"/></td>
				<td>${itemList.category }</td>
				<td colspan="2">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;
				<img src="../images/${itemList.img_path }" width="100px" align="center">
				&nbsp;&nbsp;&nbsp;${itemList.item_name }</p></td>
				
				<td>${itemList.price }</td>
				<td>${itemList.purchase }</td>
				<td>${itemList.stock }</td>
				<td><button onclick="location.href='itemView.im?item_code=${itemList.item_code}'" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" id="td_info">
					<section id="pageList">
		<%if(nowPage<=1){ %>
			[이전]&nbsp;
		<%}else{ %>
			<a href="itemList.im?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>
		
		<%for(int a=startPage;a<=endPage;a++){
			if(a==nowPage){%>
				[<%=a %>]
			<%}else{ %>
				<a href="itemList.im?page=<%=a%>">[<%=a %>]</a>&nbsp;
			<%} %>
		<%} 
		if(nowPage>=maxPage){%>
			[다음]
		<%}else{ %>
			<a href="itemList.im?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
	</section>
	<%}else{
	%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	<%} %>
				</td>
			</tr>
		</table>
	</div>
</div>
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