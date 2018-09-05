<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::문의글보기 | 팜팜농원:::</title>
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

function fc_chk2() { 
	if(event.keyCode == 13) 
	event.returnValue=false; 
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
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
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
				<button type="button" id="wbutton" onclick="location.href='qnaRemove.bo?bnum=${board.board_num}&item_code=${board.code }&turn=my'">삭제</button>
			</c:if>
				<button type="button" id="wbutton" onclick="location.href='myQna.bo?page=${page }'">목록</button>
			</section>
			<br>
			<br>
		</form>
	</div>	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
