<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::팜팜농원:::</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
</style>
<script>

	function getCon() {
		var len = 0, j;
		var str = document.notice.content.value;
		for (i = 0, j = str.length; i < j; i++, len++) {
			if ((str.charCodeAt(i) < 0) || (str.charCodeAt(i) > 127)) {
				len = len + 1;
			}
			if (len >= 600) {
				alert('300글자 초과. \n 초과된 내용은 삭제 됩니다.');
				document.notice.content.value = str.substring(0, i);
				document.notice.content.focus();
				return;
			}
		}
	}
	function chkForm(f) {
		if (doubleSubmitCheck()) {
			alert('중복접근!');
			return;
		}
		document.notice.submit();
	}
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
			<table class="mytable">
				<tr>
					<td id="td_left">
						<label for="item_name">제목</label>
					</td>
					<td id="td_right">
						<input type="text" name="subject" id="subject" size="40"/>
					</td>
				<tr>
					<td id="td_left">
						<label for="content">내용</label>
					</td>	
					<td>
						<textarea name="content" id="content" cols="60" rows="15" onclick="getCon()" onkeyup="getCon()"></textarea>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="img_path">파일 첨부</label>
					</td>
					<td id="td_right">
						<input type="file" name="img_path" id="img_path"/>
					</td>
				</tr>
			</table>
			<br>
			<section>
				<button id="bbutton" type="submit">등록</button>
				<button id="bbutton" type="button" onclick="location.href='noList.bo'">목록</button>
			</section>
		</form>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
