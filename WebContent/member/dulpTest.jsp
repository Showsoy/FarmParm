<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String openInit="false";
	if(request.getParameter("openInit")!=null){
		openInit = "true";
	}
	String id = request.getParameter("id");

	if(id == null){
		id = "";
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	background: #f2f2f2;
	width: 100%;
	border: 0;
	padding: 10px;
	box-sizing: border-box;
	font-size: 12px;
}

#testform {
	width: 300px;
	text-align: center;
	margin: 0 auto;
}

a img {
	height: 16px;
}

a, a:hover, a:active {
	text-decoration: none;
	color: black;
}
</style>
</head>
<script>
	function init(){
		if(<%=openInit%>){
			document.getElementById("id").value = opener.document.getElementById("userID").value;
		}
	}
	function ok(v){
		opener.document.getElementById("userID").value = v;
		opener.chkId = true;
		window.close();
	}
	function chkForm(f){

		if(f.id.value.trim()==""){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return false;
		}
		document.id_check.submit();
	}
</script>

<body onload='init()'>
<%	

%>
<!-- action dulpTest.me -->
<form name="id_check" action="idTest.us" method="post" onsubmit="return chkForm(this)">
<table id="addRow">
	<tr>
		<td><h3>아이디 중복검사</h3></td>
	</tr>
	<tr>
		<td><input type="text" name="id" id="id" placeholder="아이디"/></td>
	</tr>
	<tr>
		<td>
		<button id="gbutton" style="width:100%;" type="submit">중복체크</button>
		</td>
	</tr>
</table>
</form>
<br>
<div id="testform">
<c:if test="${result!=null }">
	<c:choose>
		<c:when test="${result eq 'true' }">
			사용 가능한 아이디입니다. <br>
			<a href="#" onclick="ok('${id }')"><img src="../images/ok-cloud.png">사용하기</a>
		</c:when>
		<c:otherwise>
			중복 아이디입니다.
		</c:otherwise>
	</c:choose>
</c:if>
</div>
</body>
</html>