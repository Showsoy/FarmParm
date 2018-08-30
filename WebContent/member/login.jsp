<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String findId = request.getParameter("findId")==null ? "" : request.getParameter("findId");
%>
<c:set var="findId" scope="request" value="<%=findId%>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::로그인 | 팜팜농원:::</title>
<style>
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style2.css">
<script type="text/javascript">

window.onload = function() {
	 
    if (getCookie("id")) {
        document.loginform.userID.value = getCookie("id");
        document.loginform.id_rem.checked = true;
    }

}

function setCookie(name, value, expiredays)
{
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + "=" + escape(value) + "; path=/; expires="
            + todayDate.toGMTString() + ";"
}

function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search);
        if (offset != -1) {
            offset += search.length;
            end = document.cookie.indexOf(";", offset);
            if (end == -1)
                end = document.cookie.length;
            return unescape(document.cookie.substring(offset, end));
        }
    }
}

function chkForm(f){
	if(f.userID.value.trim()==""){
		alert("아이디는 필수항목입니다.");
		f.userID.focus();
		return false;
	}
	if(f.userPass.value.trim()==""){
		alert("비밀번호는 필수항목입니다.");
		f.userPass.focus();
		return false;
	}
	if (document.loginform.id_rem.checked == true) {
        setCookie("id", document.loginform.userID.value, 7);
    } else {
        setCookie("id", document.loginform.userID.value, 0);
    }
	
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.loginform.submit();
}


</script>
<body>
	<div class="login-page">
		<div class="form">
			<form class="login-form" id="loginform" name="loginform" action="./memberLoginAction.us" method="post" onsubmit="return chkForm(this)">
				<a href="<%=request.getContextPath()%>/main.im" id="logo"><img src="../images/farm_logo.png" width="150px"></a><br><br>
				<c:choose>
				<c:when test="${type eq 'nullID' }">
					<div id="login-error">존재하지 않는 아이디</div>	
				</c:when>
				<c:when test="${type eq 'passError' }">
					<div id="login-error">잘못된 비밀번호</div>	
				</c:when>
				<c:when test="${type eq 'join' }">
					<div id="login-join">회원가입 완료!<br>1000포인트가 지급되었습니다.</div>	
				</c:when>
				</c:choose>
				<c:if test="${turn eq 'ok' }">
					<input type="hidden" id="turn" name="turn" value="ok">
				</c:if>
				<c:if test="${returnURI!=null }">
					<input type="hidden" id="returnURI" name="returnURI" value="${returnURI }">
				</c:if>

				<input type="text" id="userID" name="userID" placeholder="아이디" maxlength="20" class="input100" value="${findId }"/> 
				<input type="password" name="userPass" id="userPass" placeholder="비밀번호" class="input100"/>
				<div style="float:right;">
				<input type="checkbox" name="id_rem"/><p style="display:inline;font-size:12px;">&nbsp;아이디 기억하기</p><br>
				</div>
				<button type="submit" class="input100">로그인</button> 
				<br><br>
				<div id="footer">
				<a href="idFind.jsp">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="pwFind.jsp">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="joinForm.jsp">회원가입</a>&nbsp;&nbsp;
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</form>
		</div>
	</div>
</body>
</html>