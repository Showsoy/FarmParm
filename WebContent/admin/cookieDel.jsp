<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
for(int i=0; i < cookies.length; i++) {
    cookies[i].setMaxAge(0);         //쿠키 날짜를 삭제(쿠키 지속시간을 0으로 설정)
    response.addCookie(cookies[i]);  //기존 쿠키를 덮어 쓴다. ==> 꼭 이렇게 해줘야 쿠키가 삭제된다.
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>