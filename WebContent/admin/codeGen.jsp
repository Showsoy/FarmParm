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
	if((String)request.getAttribute("item_code")!=null){
		isGen = "true";
		item_code = (String)request.getAttribute("item_code");
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table {
	margin: auto;
	width: 300px;
	text-align: center;
}

input {
	outline: 0;
	background: #fff;
	border: 0;
	padding: 10px;
	box-sizing: border-box;
	font-size: 16px;
	font-weight: 700;
	text-align: center;
}
</style>
</head>
<script>
var flag = opener.document.getElementById("category").value;
if(<%=isGen%>){
	opener.document.getElementById("item_code").value = "<%=item_code%>";
	opener.chkCode = true;
	window.close();
}
function init(){
	if(<%=openInit%>){
		if(flag){
		document.getElementById("category").value = opener.document.getElementById("category").value;}
		else{
			alert("분류선택필수");
			window.close();
		}

	}
}
function fclose(f){
	window.close();
}
</script>
<body onload='init()'>
<form action="itemCodeGen.im" method="post" name="codeGen">
<table id="addRow">
	<tr>
		<td><h3>상품코드 생성</h3></td>
	</tr>
	<tr>
		<td>분류 : <input type="text" id="category" name="category" size="2" readonly>가 맞습니까?</td>
	</tr>
	<tr>
		<td>
		<button id="gbutton" style="width:100%;padding:10px;" type="submit">확인</button>
		</td>
	</tr>
	<tr>
		<td>
		<button id="gbutton" style="width:100%;padding:10px;" type="button" onclick="fclose(this)">다시선택</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>