<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	String id = (String)session.getAttribute("id");
	session.setAttribute("id", id);
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="right">
	<c:choose>
		<c:when test="${id == null}">
			<a href="<%=request.getContextPath()%>/memberLogin.us">로그인</a>&nbsp;
			<a href="<%=request.getContextPath()%>/memberJoinForm.us">회원가입</a>&nbsp;
			<a href="<%=request.getContextPath()%>/memberLogin.us">마이페이지</a>&nbsp;
			<a href="<%=request.getContextPath()%>/memberLogin.us">주문/배송</a>&nbsp;
			<a href="<%=request.getContextPath()%>/common/csList.bo">고객센터</a>&nbsp;
			<a href="<%=request.getContextPath()%>/memberLogin.us">장바구니</a>&nbsp;
		</c:when>
		<c:otherwise>
			<a href="<%=request.getContextPath()%>/memberLogout.us">로그아웃</a>&nbsp;
		    <a href="<%=request.getContextPath()%>/mypage.us">마이페이지</a>&nbsp;
			<a href="<%=request.getContextPath()%>/order/myOrders.jsp">주문/배송</a>&nbsp;
			<a href="<%=request.getContextPath()%>/common/cs_center.jsp">고객센터</a>&nbsp;
			<a href="<%=request.getContextPath()%>/order/cart.jsp">장바구니</a>&nbsp;
			<c:if test="${id == 'admin'}">
			<a href="<%=request.getContextPath()%>/admin/adminPage.jsp">관리자페이지</a>&nbsp;
			</c:if>
		</c:otherwise>
	</c:choose>  
</div>
</body>
</html>