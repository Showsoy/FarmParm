<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@page import="vo.BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
 String today = formatter.format(new java.util.Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
#td_info{
	text-align:right;
}
#td_check{
	width:50px;
}
#top_menu{
	background-color:#333;
	height:20px;
	color:white;
	padding:0;
}
#detail_board{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
    height:100px;
    font-size:10px;
	background-color:white;
	text-align:center;
}
#detail_board tr td{
	font-size:12px;
}
#detail_board tr:nth-child(even) {background-color: #f2f2f2;}
#idetail{
	margin:0 auto;
	display:inline-block;
}
#id_img{
	float:left;
}
#id_text{
	padding:0 50px 0 50px;
	float:left;
	font-size:12px;
}
#saled{
	color:#4CAF50;
}
dt{
	display:inline-block;
	width:80px;
	text-align:left;
}
dd{
	display:inline-block;
	width:80px;
	text-align:center;
}
#gbutton{
	float:right;
	margin-right:50px;
	margin-top:20px;
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
}
#td_right_s{
	width:100px;
}
#commandCell{
	margin-left:500px;
}
#qna_regist{
	margin-left:47px;
	font-family:"Nanum Gothic";
	font-weight: 500;
}
#pageList{
	text-align:center;
}
</style>
<script>
	function goto_url(act) {
		document.itemform.action = act;
		var qty = document.getElementById("qty").value;
		var reg_qty = /^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$/;
		
		if (!reg_qty.test(qty)) {
			alert("1~50의 숫자만 가능합니다.");
			document.qty.focus();
			return false;
		}
		document.itemform.submit();
	}
	
	function layer_toggle(obj) {
		if (obj.style.display == 'none') obj.style.display = 'block';
		else if (obj.style.display == 'block') obj.style.display = 'none';
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>

		<form action="qnaReply.bo?page=${re_page }&item_code=${re_item_code}&re_bnum=${re_bnum}" method="post" enctype="multipart/form-data" name="itemnew" onsubmit="return chkForm(this)">
			<table>
			
				<tr>
					<td id="td_left">
						<label for="item_name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</label>
					</td>
					<td id="td_right_s">
						<textarea name="qna_subject" id="qna_subject" cols="50" rows="1"></textarea>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</label>
					</td>	
					<td colspan="3">
						<textarea name="qna_content" id="qna_content" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="img_path">&nbsp;&nbsp;&nbsp;파일 첨부</label>
					</td>
					<td id="td_right" colspan="3">
						<input type="file" name="img_path" id="img_path"/>
					</td>
				</tr>
			</table>
				<section id="commandCell">
				<button type="submit">등록</button>
				</section>
			<br>
		</form>

</body>
</html>