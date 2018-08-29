<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::비밀번호찾기 | 팜팜농원:::</title>
<style type="text/css">
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style2.css">
<script>
function chkForm(f){
	var mail1 = f.userEmailId.value;
	var mail2 = f.userEmailAd.value;
	
	var reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/i;
	var reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	if(f.userID.value.trim()==""){
		alert("아이디는 필수사항입니다.");
		f.userID.focus();
		return false;
	}
	if (!reg_email1.test(mail1)) {
		alert("올바른 이메일 주소가 아닙니다.");
		f.userEmailId.focus();
		return false;
	}
	if (!reg_email2.test(mail2)) {
		alert("올바른 이메일 주소가 아닙니다.");
		f.userEmailAd.focus();
		return false;
	}

	document.pwfindform.submit();
}
function selectEmail(sel) {
	var choiceText = sel.options[sel.selectedIndex].text;

	if (choiceText == '직접입력') {
		document.getElementById("emailform").innerHTML = "<td><input type='text' name='userEmailAd' id='userEmailAd' size='15'/></td>";
	}
}
</script>
</head>
<body>
<div class="pwfind-page">
		<div class="form">
			<form class="login-form" name="pwfindform" action="findPwAction.us" method="post" onsubmit="return chkForm(this)">
				<h3>비밀번호 찾기</h3>
				<input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" class="input100"/>
				<input type="text" name="userEmailId" id="userEmailId" size="8" placeholder="이메일"/>&nbsp;@
				<span id="emailform">
				<select name="userEmailAd" id="userEmailAd" onchange="selectEmail(this)">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hotmail.co.kr">hotmail.co.kr</option>
						<option value="null">직접입력</option>
				</select>
				</span>
				<button type="submit" class="input100">찾기</button> 
				<br><br>
				<div id="footer">
				<a href="login.jsp">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">문제발생</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="idFind.jsp">아이디 찾기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>