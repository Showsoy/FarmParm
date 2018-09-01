<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
var doubleSubmitFlag = false;
function doubleSubmitCheck(){
    if(doubleSubmitFlag){
        return doubleSubmitFlag;
    }else{
        doubleSubmitFlag = true;
        return false;
    }
}
function chkForm(f){

	if(f.subject.value.trim()==""){
		alert("제목을 입력해주세요.");
		f.subject.focus();
		return false;
	}
	if(doubleSubmitCheck()) return;
	document.qnaform.submit();
}
function fclose(f){
	opener.location.reload();
	window.close();
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<body class="popup_body">
	<div id="grade"><b id="grade_deco">|</b> 개명 신청 <br>
	<c:if test="${act == null}">
		<p style="font-size:14px;"><br>개명하신 고객님의 이름 변경은<br>
		고객센터를 통해서만 변경이 가능합니다.<br>
		변경 신청할 때 이름이 잘 보이도록 촬영된<br>
		<b>신분증 사진</b>을 첨부해주세요.</p>
	</c:if>
	</div>
<form action="../common/csWrite.bo?nameMod=nameMod" name="qnaform" method="post" enctype="multipart/form-data" onsubmit="return chkForm(this)">
<c:choose>
	<c:when test="${act != null && act eq 'ok' }">
		<img src="../images/speech-bubble.png">
		<p>문의가 정상적으로 등록되었습니다.</p>
		<button type="button" onclick="fclose(this)" id="wbutton">닫기</button>
	</c:when>
	<c:when test="${id == null }">
		<script>
			alert('로그인이 필요합니다.');
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
			<input type="text" id="subject" name="subject" size="25" value="개명 신청" readonly>
		</td>
		<td id="hide_check">
			<input type="radio" id="hide" name="hide" value="가나다" checked="checked">&nbsp;숨김
		</td>
	</tr>
	<tr>
		<td id="td_left">
			<label for="content">내용</label>
		</td>
		<td colspan="2">
			<textarea name="content" id="content" cols="40" rows="10" onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();" placeholder="200자까지 입력하실 수 있습니다."></textarea>
		</td>
	</tr>
	<tr>
		<td id="td_left">
			<label for="image">사진</label>
		</td>
		<td colspan="2">
			<input type="file" name="img_path" id="img_path">
		</td>
	</tr>
</table>
<br>
<section>
	<button type="submit" id="wbutton">등록</button>
	<button type="button" onclick="fclose(this)" id="wbutton">닫기</button>
</section>
</c:otherwise>
</c:choose>
</form>
</body>
</html>