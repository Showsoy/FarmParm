<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}
</script>
</head>
<body>
<div class="header">
   <a href="<%=request.getContextPath()%>/main.im"><img src="<%=request.getContextPath()%>/images/farm_logo.png" width="150px"></a>
  <div>A website created by me.</div>
  <jsp:include page="/common/inner_menu.jsp" flush="false"/>
</div>
<div class="navbar">
	<ul>
   <li class="dropdown">
    <a href="#" id="menu"><img src="<%=request.getContextPath()%>/images/menu.png" width="24px" height="27px"/></a>
    <div class="maindown-content">
	     <div class="list">
	      <a href="<%=request.getContextPath()%>/common/introduction.jsp">
	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>농원소개</b></a>
	      <a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('채소')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>채소</b></a>
	      <a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('과일')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<b>과일</b></a>
	      <a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('곡류')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<b>쌀/잡곡</b></a>
	      <a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('차')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<b>차</b></a>
	      <a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('가공')">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<b>가공류</b></a>
	    </div>
      <a href="<%=request.getContextPath()%>/common/location.jsp"><b>오시는 길</b></a>
      <a href="<%=request.getContextPath()%>/common/noList.bo"> <b>안내사항</b></a>
    </div>
  </li>
 </ul>
 <ul>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
    <div class="dropdown-content">
      <a href="<%=request.getContextPath()%>/common/introduction.jsp">농원소개</a>
      <a href="<%=request.getContextPath()%>/common/location.jsp">오시는 길</a>
      <a href="<%=request.getContextPath()%>/common/noList.bo">안내사항</a>
    </div>
  </li>
  <li><a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('채소')" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('과일')" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('곡류')" class="dropbtn">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a></li>
  <li><a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('차')" class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="javascript:void(0);" onclick="location.href='<%=request.getContextPath()%>/uitemList.im?category='+encodeURI('가공')" class="dropbtn">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="<%=request.getContextPath()%>/market.jsp" id="market" target="_blank">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a></li>
</ul>
</div>
</body>
</html>