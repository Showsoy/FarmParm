<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
   <a href="main.jsp"><img src="images/farm_logo.png" width="150px"></a>
  <div>A website created by me.</div>
  <div class="right">
	  <a href="login.jsp">로그인</a>&nbsp;
	  <a href="joinForm.jsp">회원가입</a>&nbsp;
	  <a href="myPage.jsp">마이페이지</a>&nbsp;
	  <a href="myOrders.jsp">주문/배송</a>&nbsp;
	   <a href="cs_center.jsp">고객센터</a>&nbsp;
	  <a href="cart.jsp">장바구니</a>&nbsp;
  </div>
</div>
<div class="navbar">
	<ul>
   <li class="dropdown">
    <a href="#" id="menu"><img src="images/menu.png" width="24px" height="27px"/></a>
    <div class="maindown-content">
	     <div class="list">
	      <a href="introduction.jsp">
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  농원소개</a>
	      <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			채소</a>
	      <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	과일</a>
	      <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	쌀/잡곡</a>
	      <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	차</a>
	      <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	가공류</a>
	    </div>
      <a href="location.jsp">오시는 길</a>
      <a href="notice.jsp"> 안내사항</a>
    </div>
  </li>
 </ul>
 <ul>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
    <div class="dropdown-content">
      <a href="introduction.jsp">농원소개</a>
      <a href="location.jsp">오시는 길</a>
      <a href="notice.jsp">안내사항</a>
    </div>
  </li>
  <li><a href="vegetable.jsp" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="fruit.jsp" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="grains.jsp" class="dropbtn">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a></li>
  <li><a href="tea.jsp" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="mf.jsp" class="dropbtn">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="market.jsp" id="market" target="_blank">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a></li>
</ul>
</div>
</body>
</html>