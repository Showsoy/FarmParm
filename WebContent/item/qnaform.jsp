<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
	width:400px;
	text-align:center;
}
table{
	width:400px;
	text-align:left;
	padding : 15px;
	border-radius:10px;
	border-collapse: collapse;
}
tr{
	padding-top: 12px;
    padding-bottom: 12px;
}
td{
	padding:5px 5px 5px 10px;
}
table td label{
	font-weight:700;
	font-family:"Nanum Gothic";
	color : #43A047;
	font-size:14px;
}
td, tr{
	border: 1px solid #ddd;
}

#td_left{
	background-color:#F6F6F6;
	width:50px;
	text-align:center;
}
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton:active, #wbutton:hover{
	background: #F6F6F6;
}
</style>
<script>
function fc_chk_byte(memo) { 
	var ari_max=400;
	var ls_str = memo.value;
	var li_str_len = ls_str.length;
	
	var li_max = ari_max;
	var i = 0;
	var li_byte = 0;
	var li_len = 0;
	var ls_one_char = "";
	var ls_str2 = "";
	
	for(i=0; i< li_str_len; i++) { 
		ls_one_char = ls_str.charAt(i); 
		
		if (escape(ls_one_char).length > 4) { 
		   li_byte += 2; 
		}else{
		   li_byte++; 
		} 
		if(li_byte <= li_max){ 
		   li_len = i + 1; 
		} 
	} 
	
	if(li_byte > li_max){ 
		alert("200글자 초과. \n 초과된 내용은 삭제 됩니다."); 
		ls_str2 = ls_str.substr(0, li_len); 
		memo.value = ls_str2; 
	} 
	memo.focus(); 
}

function fc_chk2() { 
	if(event.keyCode == 13) 
	event.returnValue=false; 
}
function chkForm(f){

	if(f.subject.value.trim()==""){
		alert("제목을 입력해주세요.");
		f.subject.focus();
		return false;
	}
	document.reviewform.submit();
}
function fclose(f){
	opener.location.reload();
	window.close();
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<body>
<div id="grade"><b id="grade_deco">|</b> 상품문의</div>
<form action="qnaWrite.bo" name="qnaform" method="post" enctype="multipart/form-data" onsubmit="return chkForm(this)">
<c:choose>
	<c:when test="${act != null && act eq 'ok' }">
		<img src="../images/speech-bubble.png">
		<p>문의가 정상적으로 등록되었습니다.</p>
		<button type="button" onclick="fclose(this)" id="wbutton">닫기</button>
	</c:when>
	<c:when test="${act != null && act eq 'login' }">
		<script>
			opener.location.reload();
			window.close();
		</script>
	</c:when>
	<c:otherwise>
<input type="hidden" name="item_code" id="item_code" value="${item_code }">
<table>
	<tr>
		<td id="td_left">
			<label for="subject">제목</label>
		</td>
		<td>
			<input type="text" id="subject" name="subject" size="39">
		</td>
	</tr>
	<tr>
		<td id="td_left">
			<label for="content">내용</label>
		</td>
		<td>
			<textarea name="content" id="content" cols="40" rows="10" onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();" placeholder="200자까지 입력하실 수 있습니다."></textarea>
		</td>
	</tr>
	<tr>
		<td id="td_left">
			<label for="image">사진</label>
		</td>
		<td>
			<input type="file" name="image" id="image">
		</td>
	</tr>
</table>
<br>
<section id="commandCell">
	<button type="submit" id="wbutton">등록</button>
	<button type="button" onclick="fclose(this)" id="wbutton">닫기</button>
</section>
</c:otherwise>
</c:choose>
</form>
</body>
</html>