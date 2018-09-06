<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::주문완료 | 팜팜농원:::</title>
<style>
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;주문완료</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<img src="../images/receipt.png" style="width:150px;display:block;margin:0 auto;"><br>
	<p style="font-size:17px;">주문이 완료되었습니다.
	 감사합니다.</p>
	<br><br>
	<button id="bbutton" onclick="location.href='./myodList.od'" style="width:110px;height:43px;">주문내역보기</button>
	<button id="sbutton" onclick="location.href='../main.im'" style="width:110px;">홈으로</button>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>