<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.mypage table{
	width:700px;
	margin:0 auto;
	text-align:left;
	padding : 15px;
	border-radius:10px;
	border-collapse: collapse;
}
.mypage tr{
	padding-top: 12px;
    padding-bottom: 12px;
}
.mypage td{
	padding:5px 5px 5px 10px;
}
.mypage table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
}
td, tr{
	border: 1px solid #ddd;
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
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
.mypage button:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
#td_left{
	background-color:#F6F6F6;
}
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	width:50px;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	padding: 4px;
	border : 1px solid #ccc;
	border-radius : 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton:active{
	background: #F6F6F6;
}
#top_td{
	font-size:12px;
	color:#747474;
}
#top_right{
	padding:0 0 0 440px;
}
#content{
	text-align:center;
}
</style>
<script>

</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;안내사항</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="noWrite.bo" method="post" enctype="multipart/form-data" name="notice" onsubmit="return chkForm(this)">
			<table>
				<tr>
					<td id="td_left">
						<span id="top_td">안내사항
						<span id="top_right">작성일 ${board.date } | 조회수 ${board.readcount }</span></span><br>
						<b>${board.subject }</b>
					</td>
				<tr>
					<td><p id="content">
						<c:if test="${board.img_path!=null }">
							<img src="../images/${board.img_path }"/><br><br>
						</c:if>
						${board.content }</p>
					</td>
				</tr>
			</table>
			<span style="padding:0 0 0 650px;"><button type="button" id="wbutton" onclick="location.href='noRemove.bo?bnum=${board.board_num}'">삭제</button></span>
			<br>
			<section id="commandCell">
				<button type="button" onclick="location.href='noList.bo'">목록</button>
			</section>
		</form>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
