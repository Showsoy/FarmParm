<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	if(id==null) {
		out.println("<script>");
		out.println("alert('로그인 한 회원만 쓸 수 있습니다.');");
		out.println("location.href='../member/memberLogin.us?turn=ok';");
		out.println("</script>");
	}else if(!id.equals("admin")){
		out.println("<script>");
		out.println("alert('권한이 없습니다.');");
		out.println("location.href='../common/main.im';");
		out.println("</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#admin_menu{
	margin:0 auto;
	text-align:center;
	background-color:#f6f6f6;
	width:400px;
	height:230px;
	border:1px solid #ccc;
	border-radius:5px;
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
	margin:2px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
.mypage button:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<jsp:include page="/common/adminbar.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;관리자 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<div id="admin_menu">
	<br><br>
		<button onclick="location.href='../memberList.us'">회원관리</button>

		<button onclick="location.href='./itemSearch.jsp'">입출고등록</button><br>
		<button onclick="location.href='./itemRegistForm.im'">상품등록</button>

		<button onclick="location.href='./itemList.im'">상품목록</button><br>
		<button onclick="location.href='./odList.od'">주문목록</button>
		<button onclick="location.href='#'">매출관리</button>
	</div>
</div>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
