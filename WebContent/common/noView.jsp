<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::팜팜농원:::</title>
<style>
td, tr{
	border: 1px solid #ddd;
}
#td_left{
	width:100%;
}
#top_td{
	font-size:12px;
	color:#747474;
}
#top_right{
	padding:0 0 0 440px;
}
#content{
	text-align:center;
}
</style>
<script>

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
						<span id="top_td">안내사항
						<span id="top_right">작성일 ${board.date } | 조회수 ${board.readcount }</span></span><br>
						<b>${board.subject }</b>
					</td>
				<tr>
					<td><p id="content">
						<c:if test="${board.img_path!=null }">
							<img src="../images/${board.img_path }" style="max-width:100%" onclick="doImgPop('../images/${board.img_path}')" style="cursor:pointer;" title="클릭하시면 원본크기로 보실 수 있습니다."/><br><br>
						</c:if>
						${board.content }</p>
					</td>
				</tr>
			</table>
			<br>
			<section id="commandCell">
				<button type="button" id="wbutton" onclick="location.href='noList.bo?page=${page }<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">목록</button>
				<c:if test="${id eq 'admin' }">
					<button type="button" id="wbutton" onclick="location.href='noModForm.bo?bnum=${board.board_num}&page=${page }<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">수정</button>
					<button type="button" id="wbutton" onclick="location.href='noRemove.bo?bnum=${board.board_num}&page=${page }<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">삭제</button>
					<button type="button" style="width:70px;" onclick="location.href='noWrite.jsp'" id="wbutton">글쓰기</button>
				</c:if>
			</section>
		</form>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
