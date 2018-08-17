<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width:100px;
}
</style>
<script>
function fc_chk_byte(memo) { 
	var ari_max=600;
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
		alert("300글자 초과. \n 초과된 내용은 삭제 됩니다."); 
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
    if(doubleSubmitCheck()) return;
    
	alert("등록되었습니다.");
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
	<form action="noModify.bo?bnum=${board.board_num }" method="post" enctype="multipart/form-data" name="notice" onsubmit="return chkForm(this)">
			<table>
				<tr>
					<td id="td_left">
						<label for="item_name">제목</label>
					</td>
					<td id="td_right">
						<input type="text" name="subject" id="subject" size="40" value="${board.subject }"/>
					</td>
				<tr>
					<td id="td_left">
						<label for="content">내용</label>
					</td>	
					<td>
						<textarea name="content" id="content" cols="60" rows="15" onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();">${board.content }</textarea>
					</td>
				</tr>
				<tr>
					<td id="td_left">
						<label for="img_path">파일 첨부</label>
					</td>
					<td id="td_right">
						<input type="file" name="img_path" id="img_path"/>
						<input type="hidden" id="oldImage" name="oldImage" value="${board.img_path}"/>
						<input type="hidden" id="page" name="page" value="${page}"/>
						<input type="hidden" id="keyword" name="keyword" value="${keyword}"/>
					</td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<button type="submit">등록</button>
				<button type="button" onclick="location.href='noList.bo'">목록</button>
			</section>
		</form>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
