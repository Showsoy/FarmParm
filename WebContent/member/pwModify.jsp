<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
</style>
</head>
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
var chkId = false;
function chkForm(f){
	if(f.userPass.value.trim()==""){
		alert("비밀번호는 필수항목입니다.");
		f.userPass.focus();
		return false;
	}
	if(f.userPass.value.trim()!=""){
		if(f.userPass.value!=f.userPassre.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.userPassre.value="";
			f.userPassre.focus();
			return false;
		}
	}
	if(f.userPass.value.length<6) {
	    alert("비밀번호는 6자리 이상 입력해주세요.");
	    f.userPass.focus();
	    return false;
	  }
	if(doubleSubmitCheck()) return;
	document.joinform.submit();
}
</script>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;개인정보수정</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="/FarmParm/pwModify.us" method="post" onsubmit="return chkForm(this)">
	<table class="mytable" cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left200"><label for="userID">기존 비밀번호</label> </td>
		<td><input type="password" id="old_pswd" name="old_pswd"></td>
	</tr>
	<tr>
		<td id="td_left200"><label for="userID">변경할 비밀번호</label></td>
		<td><input type="password" id="userPass" name="userPass"><p style="color:gray;font-size:12px;display:inline;"> 6자리 이상</p></td>
	</tr>
	<tr>
		<td id="td_left200"><label for="userID">비밀번호 확인</label> </td>
		<td><input type="password" id="userPassre" name="userPassre"></td>
	</tr>
</table>
<br><br>
			<button id="bbutton" onclick="location.href='pwModify.jsp'">확인</button> 
			<button id="bbutton" type="button" onclick="history.back();">돌아가기</button> 
		</form>
	</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>