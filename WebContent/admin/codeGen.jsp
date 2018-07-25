<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String openInit="false";
	String isGen = "false";
	String item_code = null;
	if(request.getParameter("openInit")!=null){
		openInit = "true";
	}
	if(request.getParameter("item_code")!=null){
		isGen = "true";
		item_code = request.getParameter("item_code");
		System.out.println(item_code);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin : auto;
		width : 300px;
		text-align : center;
	}
	input {
	outline: 0;
	background: #f2f2f2;
	width:100%;
	border: 0;
	padding: 10px;
	box-sizing: border-box;
	font-size: 12px;
}

	button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width:100%;
	border: 0;
	padding: 10px;
	color: #FFFFFF;
	font-size: 12px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

button:hover, .form button:active, .form button:focus {
	background: #43A047;
}
</style>
</head>
<script>
if(<%=isGen%>){
	opener.document.getElementById("item_code").value = <%=item_code%>;
	opener.chkCode = true;
	window.close();
}
function init(){
	if(<%=openInit%>){
		document.getElementById("category").value = opener.document.getElementById("category").value;

	}
}
</script>
<body onload='init()'>
<form action="itemCodeGen.im" method="post" name="codeGen">
<table id="addRow">
	<tr>
		<td><h3>상품코드 생성</h3></td>
	</tr>
	<tr>
		<td><input type="text" id="category" name="category">가 맞습니까?</td>
	</tr>
	<tr>
		<td>
		<button type="submit">확인</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>