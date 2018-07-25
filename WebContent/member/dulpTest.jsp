<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String openInit="false";
	if(request.getParameter("openInit")!=null){
		openInit = "true";
	}
	String id = request.getParameter("userID");

	if(id == null){
		id = "";
	}
	String result = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

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
</script>
<body onload='init()'>
<%	

%>
<!-- action dulpTest.me -->
<form name="id_check" action="dulpTest.jsp" method="post">
<table id="addRow">
	<tr>
		<td><h3>아이디 중복검사</h3></td>
	</tr>
	<tr>
		<td><input type="text" name="id" id="id" placeholder="아이디"/></td>
	</tr>
	<tr>
		<td>
		<button type="submit">중복체크</button>
		</td>
	</tr>
</table>
</form>

<%
try{
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
	conn = ds.getConnection();
	String id2 = request.getParameter(id);
	
	//수정합시다
	pstmt = conn.prepareStatement("SELECT user_id FROM users WHERE user_id = ?");
	pstmt.setString(1, id2);
	rs = pstmt.executeQuery();
	
	boolean flag = true;
	
	if(rs.next()){
		result = "이미 사용중인 아이디 입니다.";
	}else if(flag && !id.equals("")){
		result = "사용 가능한 아이디 입니다. <br> <a href='#' onclick=\"ok('"+id+"')\">사용하기</a>";
	}else{
		result = "아이디를 입력하세요.";
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
<h4><%=result %></h4>
</body>
</html>