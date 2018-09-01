<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::팜팜농원:::</title>
<style>
table{
	border:0;
}
th, td {
    border-bottom: 1px solid #ddd;
    height:50px;
}
td img{
	height:100%;
	border:0;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<p style="float:right;font-size:12px;margin-right:80px;">홈>오시는 길</p>
	<h3>&nbsp;&nbsp;오시는 길</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
			<section class="w3-container w3-center">
  			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.681123137723!2d126.97307239890748!3d37.58612583998708!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2b7ef94a16b%3A0xb16d5f135eaaddc!2z7LKt7JmA64yA!5e0!3m2!1sko!2skr!4v1535836068404" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		</section>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
