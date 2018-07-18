<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::회원가입 페이지:::|팜팜농원</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
.login-page {
	width: 550px;
	padding: 8% 0 0;
	margin: auto;
}
#header{
text-align:center;
	margin:0 auto;
}
.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 10px 45px 45px 45px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	outline: 0;
	background: #f2f2f2;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}

.input100{
	width:100%;
}

.form button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	border: 0;
	padding: 13px;
	color: #FFFFFF;
	font-size: 16px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form a {
	margin: 15px 0 0;
	font-size: 12px;
	color: #4CAF50;
	text-decoration: none;
}

#genCheck{
	text-align:center;
}

#footer{
	text-align:center;
	font-size: 12px;
	color: #4CAF50;
}

select {
    width: 200px;
    height: 42px;
    padding-left: 10px;
    font-size: 20px;
    border: 2px solid #4CAF50;
}

body {
	background: #76b852; /* fallback for old browsers */
	background: -webkit-linear-gradient(right, #76b852, #8DC26F);
	background: -moz-linear-gradient(right, #76b852, #8DC26F);
	background: -o-linear-gradient(right, #76b852, #8DC26F);
	background: linear-gradient(to left, #76b852, #8DC26F);
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<script>
var chkId = false;
function chkForm(f){
	
	var age = f.userAge.value;
	var mail1 = f.userEmailId.value;
	var mail2 = f.userEmailAd.value;
	var phone = f.userPhone.value;
	
	var reg_age = /^\d{8}$/
	var reg_email1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/i;
	var reg_email2 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var reg_phone = /^\d{10-11}$/
	
	
	if(!chkId){
		alert("아이디 중복 확인이 필요합니다!");
		return false;
	}
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
	if (!reg_age.test(age)) {
		alert("올바른 형식이 아닙니다.");
		f.userAge.focus();
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
}
</script>
<body>
<div class="login-page">
		<div class="form">
			<form class="login-form" name="joinform" action="./memberJoinAction.me" method="post" onsubmit="return chkForm(this)">
				<div id="header">
				<a href="main.jsp"><img src="images/farm_logo.png" width="150px"></a>
				<hr color="#4CAF50">
				<h3>회원가입</h3><br>
				</div>
		<label for="userID">아이디</label>
		<input type="text" name="userID" id="userID" class="input100">
		<button class="input100" name="check" id="check" type="button"
		onclick="window.open('./dulpTest.jsp?openInit=true','','width=370, height=200')">중복검사</button>
		<br><br>
	
		<label for="userPass">비밀번호</label>
		<input type="password" name="userPass" id="userPass" class="input100"/>
	
	
		<label for="userPassre">비밀번호확인</label>
		<input type="password" name="userPassre" id="userPassre" class="input100"/>
	
	
		<label for="userName">이름</label>
		<input type="text" name="userName" id="userName" class="input100"/>
		
		<label for="userPhone">연락처</label>
		<input type="text" name="userPhone" id="userPhone" class="input100"/>
	
		<label for="userAge">생년월일</label>
		<input type="text" name="userAge" id="userAge" 
		placeholder="ex) 19990303" class="input100"/>
		
		<label for="userGen">성별</label><br><br>
		<div id="genCheck">
		<input type="radio" name="userGen" value="남" checked="checked" id="userGen"/>&nbsp;남자&nbsp;
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="userGen" value="여">&nbsp;여자
		<hr color="#4CAF50">
		</div>
		<br>
		<label for="userEmail">이메일</label><br>
		<input type="text" name="userEmailId" id="userEmailId"size="10" />&nbsp;@
		<span id="emailform">
			<select name="userEmailAd" id="userEmailAd" onchange="selectEmail(this)">
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="naver.com">daum.net</option>
						<option value="naver.com">hotmail.co.kr</option>
						<option value="null">직접입력</option>
			</select>
		</span>
		<label for="userAddr">주소</label><br>
		<input type="text" name="userAddr1" id="userAddr1"size="7" />
		<button type="button" onclick="sample6_execDaumPostcode()">주소검색</button> 
		<br>
		<input type="text" name="userAddr2" id="userAddr2" class="input100"/ placeholder="주소">
		<input type="text" name="userAddr3" id="userAddr3" class="input100"/ placeholder="상세주소">
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
		<br><br><br>
				<button class="input100" type="submit">회원가입</button>
				<br><br><br><br>
			<div id="footer">
				&nbsp;&nbsp;<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">개인정보처리방침</a>
				&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">고객센터</a>&nbsp;&nbsp;
			</div>
			</form>
		</div>
	</div>
</body>
</html>