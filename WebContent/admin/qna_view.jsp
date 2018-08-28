<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::관리자 페이지:::</title>
<style>
.mypage td{
    border-bottom: 3px solid #fff;
}
#top_td{
	font-size:12px;
}
img{
	max-width:50%;
}
</style>
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
function chkForm(f){

	if(f.subject.value.trim()==""){
		alert("제목을 입력해주세요.");
		f.subject.focus();
		return false;
	}
	if(f.content.value.trim()==""){
		alert("내용을 입력해주세요.");
		f.subject.focus();
		return false;
	}
	if(doubleSubmitCheck()) return;
	document.qna.submit();
}
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
function goto_url(act) {
	document.qna.action = act;
	document.qna.submit();
}
function doImgPop(img){ 
	 img1= new Image(); 
	 img1.src=(img); 
	 imgControll(img); 
	} 
	  
	function imgControll(img){ 
	 if((img1.width!=0)&&(img1.height!=0)){ 
	    viewImage(img); 
	  } 
	  else{ 
	     controller="imgControll('"+img+"')"; 
	     intervalID=setTimeout(controller,20); 
	  } 
	}
	function viewImage(img){ 
	 W=img1.width; 
	 H=img1.height; 
	 O="width="+W+",height="+H+",scrollbars=yes"; 
	 imgWin=window.open("","",O); 
	 imgWin.document.write("<html><head><title>::::: 이미지상세보기 :::::</title></head>");
	 imgWin.document.write("<body topmargin=0 leftmargin=0>");
	 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	 imgWin.document.close();
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;상품문의</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form method="post" name="qna">
			<table class="board_table" cellspacing="0" cellpadding="0">
				<tr>
					<td id="td_left" colspan="2" style="text-align:right;">
						<label>작성일</label> <span id="top_td">${board.date }</span>
						&nbsp;&nbsp;<label>주문번호</label>
						<span id="top_td">${board.readcount }</span>&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td id="td_parent" style="width:100px;">
						<label for="subject">제목</label>
					</td>
					<td id="td_parent">
						${board.subject }
					</td>
				</tr>
				<tr>
					<td id="td_parent">
						<label for="content">내용</label>
					</td>	
					<td id="td_parent">
					<span id="idnamespan">[구매상품 | ${item_name}]</span><br><br>
						<c:if test="${board.img_path!=null }">
						<img src="../images/${board.img_path }" onclick="doImgPop('../images/${board.img_path}')" style="cursor:pointer;" title="클릭하시면 원본크기로 보실 수 있습니다."/>
						</c:if>
						<p>${board.content }</p>
					</td>
				</tr>
				<!-- id eq 'admin' 추가 -->
			<c:if test="${board.has_re == 1}">
					<tr>
						<td id="td_child">
							<label for="subject">제목</label>
						</td>	
						<td id="td_child">
							${rboard.subject }
						</td>
					</tr>
					<tr>
						<td id="td_child">
							<label for="content">답변</label>
						</td>	
						<td id="td_child">
							${rboard.content }
						</td>
					</tr>
			</c:if>
			</table>
			<br>
			<section id="commandCell">
			<c:if test="${board.user_id eq id || id eq 'admin'}">
				<button type="button" id="wbutton" onclick="goto_url('qnaRemove.bo?item_code=${board.code}&bnum=${board.board_num}&page=${page }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')">삭제</button>
			</c:if>
				<button type="button" id="wbutton" onclick="location.href='qnaList.bo?page=${page}<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">목록</button>
			</section>
			<br>
			<c:if test="${board.has_re == 0 && id eq 'admin'}">
				<table class="board_table" cellspacing="0" cellpadding="0">
					<tr>
						<td id="td_left" colspan="2" style="text-align:center;">
							<label for="subject">답변 글쓰기</label>
						</td>
					</tr>
					<tr>
						<td id="td_left">
							<label for="subject">제목</label>
						</td>	
						<td>
							<input type="text" id="subject" name="subject" size="40">
						</td>
					</tr>
					<tr>
						<td id="td_left">
							<label for="content">답변</label>
						</td>	
						<td>
							<textarea name="content" id="content" cols="60" rows="7" onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<button type="button" id="wbutton" onclick="goto_url('qnaReply.bo?item_code=${board.code}&rgroup=${board.board_num }&page=${page }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')" style="width:80px;">답변하기</button>
						</td>
					</tr>
				</table>
			</c:if>
			<br>
		</form>
	</div>	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
