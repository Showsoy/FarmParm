<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="vo.UserBean"%>
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

#gbutton {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	border: 0;
	padding: 3px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#gbutton:hover, #gbutton:active, #gbutton:focus {
	background: #43A047;
}
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
</style>
</head>
<script>
var chkId = false;
function chkForm(f){
	
	var birth = f.userBirth.value;
	var mail1 = f.userEmailId.value;
	var mail2 = f.userEmailAd.value;
	var phone = f.userPhone.value;
	
	var reg_birth = /^\d{8}$/
	var reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/i;
	var reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var reg_phone = /^\d{10-11}$/

	/* if (!reg_birth.test(birth)) {
		alert("올바른 형식이 아닙니다.");
		f.userBirth.focus();
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
	if (!reg_phone.test(phone)) {
		alert("올바른 번호가 아닙니다.");
		f.userPhone.focus();
		return false;
	}
	//if(f.pass.value.trim()!=f.passChk.value.trim()){f.pass.value="";}
	document.joinform.submit();
}
function selectEmail(sel) {
	var choiceText = sel.options[sel.selectedIndex].text;

	if (choiceText == '직접입력') {
		document.getElementById("emailform").innerHTML = "<td><input type='text' name='email1' id='email1'/></td>";
	}
} */
</script>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;회원정보수정</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="/FarmParm/memberModAd.us?uid=${user.user_id}" method="post" onsubmit="return chkForm(this)">
	<table cellspacing="0" cellpadding="0">
	<tr>
		<td id="td_left"><label for="userID">아이디</label></td>
		<td>${user.user_id}</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userPass">비밀번호</label> </td>
		<td><input type="text" id="userPass" name="userPass" value="${user.passwd}"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userName">이름</label></td>
		<td><input type="text" id="userName" name="userName" value="${user.name}"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userGrade">등급</label></td>
		<td>
		<select name="userGrade" id="userGrade">
			<c:if test="${user.grade == '일반'}">
				<option value="일반" selected>일반개인</option>
				<option value="일반">일반사업</option>
				<option value="우수">우수개인</option>
				<option value="우수">우수사업</option>
			</c:if>
			<c:if test="${user.grade == '우수'}">
				<option value="일반">일반개인</option>
				<option value="일반">일반사업</option>
				<option value="우수" selected>우수개인</option>
				<option value="우수">우수사업</option>
			</c:if>
			
		</select>
		</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userPhone">연락처</label></td>
		<td><input type="text" id="userPhone" name="userPhone" value="${user.phone}"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userBirth">생년월일</label></td>
		<td><input type="text" id="userBirth" name="userBirth" value="${user.birth}"></td>
	</tr>
	<tr>
		<td id="td_left"><label for="userGen">성별</label></td>
		<c:if test="${user.gender == '남'}">
		<td><input type="radio" name="userGen" value="남" checked="checked" id="userGen"/>&nbsp;남자&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="userGen" value="여">&nbsp;여자</td>
		</c:if>
		<c:if test="${user.gender == '여'}">
		<td><input type="radio" name="userGen" value="남" id="userGen"/>&nbsp;남자&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="userGen" value="여" checked="checked">&nbsp;여자</td>
		</c:if>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">이메일</label></td>
		<td>
		<input type="text" name="userEmailId" id="userEmailId"size="10" value="${user.email}"/>&nbsp;@
		<span id="emailform">
			<select name="userEmailAd" id="userEmailAd" onchange="selectEmail(this)">
		<c:choose>
		<c:when test="${user.email_ad != 'gmail.com' or 'naver.com' or 'daum.net' or 'hotmail.co.kr'}">
			<option value="${user.email_ad}" selected="selected">${user.email_ad}</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="naver.com">daum.net</option>	
			<option value="naver.com">hotmail.co.kr</option>
			<option value="null">직접입력</option>
		</c:when>
		<c:otherwise>
			<c:if test="${user.email_ad == 'gmail.com'}">
				<option value="gmail.com" selected="selected">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="naver.com">daum.net</option>	
				<option value="naver.com">hotmail.co.kr</option>
				<option value="null">직접입력</option>
			</c:if>
			<c:if test="${user.email_ad == 'naver.com'}">
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com" selected="selected">naver.com</option>
				<option value="naver.com">daum.net</option>	
				<option value="naver.com">hotmail.co.kr</option>
				<option value="null">직접입력</option>
			</c:if>
			<c:if test="${user.email_ad == 'daum.net'}">
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="naver.com" selected="selected">daum.net</option>	
				<option value="naver.com">hotmail.co.kr</option>
				<option value="null">직접입력</option>
			</c:if>
			<c:if test="${user.email_ad == 'hotmail.co.kr'}">
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
				<option value="naver.com">daum.net</option>	
				<option value="naver.com" selected="selected">hotmail.co.kr</option>
				<option value="null">직접입력</option>
			</c:if>
		</c:otherwise>
		</c:choose>
			</select>
		</span>
		</td>
	</tr>
	<tr>
		<td id="td_left"><label for="userID">주소</label></td>
		<td rowspan="3">
		<input type="text" name="userAddr1" id="userAddr1"size="7" value="${user.postcode}" />
		<button type="button" onclick="sample6_execDaumPostcode()" id="gbutton">주소검색</button> <br>
		<input type="text" name="userAddr2" id="userAddr2" placeholder="주소" size="30" value="${user.address}"/><br>
		<input type="text" name="userAddr3" id="userAddr3" placeholder="상세주소" size="30" value="${user.address_second}"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('userAddr2').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('userAddr3').focus();
		            }
		        }).open();
		    }
		</script>
	</tr>
</table>
<br><br>
			<button type="submit">수정</button> 
	
			<button onclick="location.href='userList.jsp'">삭제</button>
			<button onclick="location.href='userList.jsp'">목록</button> 
		</form>
	</div>
</div>
<footer>
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  <p class="w3-medium">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a>
  </p>
</footer>
</body>
</html>