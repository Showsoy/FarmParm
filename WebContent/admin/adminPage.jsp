<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	if(id==null) {
		out.println("<script>");
		out.println("alert('로그인이 필요한 서비스입니다.');");
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
#bbutton{
	margin:2px;
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
		<button id="bbutton" onclick="location.href='../memberList.us'">회원관리</button>
		<button id="bbutton" onclick="location.href='./itemSearch.im'">입출고관리</button><br>
		<button id="bbutton" onclick="location.href='./itemRegistForm.im'">상품등록</button>
		<button id="bbutton" onclick="location.href='./itemList.im'">상품목록</button><br>
		<button id="bbutton" onclick="location.href='./odList.od'">주문목록</button>
		<button id="bbutton" onclick="location.href='./salesList.od'">매출관리</button><br>
		<button id="bbutton" onclick="location.href='./qnaList.bo'">상품문의</button>
		<button id="bbutton" onclick="location.href='#'">주문취소</button>
	</div>
</div>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
