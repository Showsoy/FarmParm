<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vo.UserViewBean"%>
<%@page import="vo.PageInfo"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	ArrayList<UserViewBean> articleList=(ArrayList<UserViewBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
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
input{
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 5px;
	color: #FFFFFF;
	font-size: 18px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
input:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
#seldel{
	width:320px;
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
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	width: 70px;
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
#top_menu{
	background-color:#333;
	color:white;
	height:40px;
}
#td_check{
	width:20px;
}
#td_info{
	color:#5D5D5D;
	font-size:14px;
}
</style>
<script>
	function checkAll(theForm){
		if(theForm.ckb.length==undefined){
			theForm.ckb.checked = theForm.allCheck.checked;
		}else{
			for(var i=0;i<theForm.ckb.length;i++){
				theForm.ckb[i].checked = theForm.allCheck.checked;
			}
		}
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<form>
<jsp:include page="/common/top_menu.jsp" flush="false"/>

<div class="pageform">
	<h3>&nbsp;&nbsp;회원관리</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<table cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check">
				<input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>번호</td>
				<td>아이디</td>
				<td>등급</td>
				<td>주문금액</td>
				<td>수정/삭제</td>
			</tr>
			<% 
			for(int i=0;i<articleList.size();i++){
			String grade = articleList.get(i).getGrade();
			if(grade.equals("관리")){
			%>
			
	<p id="seldel">
	<button onclick="location.href='memberDelete.us?uid=<%=articleList.get(i).getUser_id()%>'" id="wbutton">선택삭제</button>
	</p> 
	<!-- 여기 삭제 되도록 하기 -->
	
			<tr>
				<td><input type="checkbox" id="ckb" name="ckb" /></td>
				<td><%=i+1%></td>
				<td><%=articleList.get(i).getUser_id()%></td>
				<td><%=articleList.get(i).getGrade()%></td>
				<td><%=articleList.get(i).getTot_price()%></td>
				<td></td>
			</tr>
		<%}else{ %>
			<tr>
				<td><input type="checkbox" id="ckb" name="remove" /></td>
				<td><%=i+1%></td>
				<td><%=articleList.get(i).getUser_id()%></td>
				<td><%=articleList.get(i).getGrade() %></td>
				<td><%=articleList.get(i).getTot_price() %></td>
				<td>
					<button type="button" onclick="location.href='./memberModAdForm.us?uid=<%=articleList.get(i).getUser_id()%>'" id="gbutton">수정</button>
					<button type="button" onclick="location.href='memberDelete.us?uid=<%=articleList.get(i).getUser_id()%>'" id="gbutton">삭제</button>
				</td>
			</tr>
		<%} }%>
			<tr>
			<td colspan="6" id="td_info">
	<section id="pageList">
		<%if(nowPage<=1){ %>
		이전&nbsp;
		<%}else{ %>
		<a href="memberList.us?page=<%=nowPage-1 %>">이전</a>&nbsp;
		<%} %>
		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		<%=a %>
		<%}else{ %>
		<a href="memberList.us?page=<%=a%>"><%=a %>
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		&nbsp;다음
		<%}else{ %>
		<a href="memberList.us?page=<%=nowPage+1 %>">다음</a>
		<%} %>
	</section>
			</td>
			</tr>
		</table>
		<br><br><br>
		<!-- <button type="button" onclick="location.href='/admin/adminPage.jsp'" style="width:150px;" id="wbutton">관리자페이지</button> -->
	</div>
</div>

 <jsp:include page="/common/footer.jsp" flush="false"/>
</form>
</body>
</html>