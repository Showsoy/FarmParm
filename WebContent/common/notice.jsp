<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
tr{
	height:40px;
}
tr:nth-child(even) {background-color: #f2f2f2;}
td{
    border-bottom: 1px solid #ddd;
}
td p{
	text-height:100%;
	float:left;
	padding: 0 0 0 10px;
	border:0;
	margin:0;
}
a{
	text-decoration:none;
}
a:hover{
	text-decoration:underline;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;고객센터</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
		<c:if test="${keyword !=null }">
			<div id="search_info">
				"${keyword }" 검색결과... <a href="noList.bo">전체보기</a>
			</div>
		</c:if>
		<br>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu35">
				<td id="td_check">번호</td>
				<td colspan="2" style="width:200px;">제목</td>
				<td style="width:150px;">작성자</td>
				<td style="width:150px;">작성일</td>
				<td style="width:100px;">조회수</td>
			</tr>
			<c:choose>
				<c:when test="${pageInfo.listCount>0 }">	
					<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.board_num }</td>
						<td colspan="2">
						<p><a href="noView.bo?bnum=${board.board_num }&page=${pageInfo.page}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}">${board.subject }</a></p></td>
						<td>관리자</td>
						<td>${board.date }</td>
						<td>${board.readcount }</td>
					</tr>
					</c:forEach>
			<tr>
				<td colspan="6" id="td_info"><!-- 페이지 수 넣을 것임 -->
					<c:if test="${pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="noList.bo?page=${pageInfo.page-1}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="noList.bo?page=${a }<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="noList.bo?page=${pageInfo.page+1 }<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="6">등록된 글이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<section id="commandCell">
			<form action="noList.bo" name="nsearch" method="post">
				<input type="text" id="keyword" name="keyword" size="20"/>
				<button type="submit" id="wbutton">검색</button>
				<c:if test="${id eq 'admin' }">
					<button type="button" onclick="location.href='noWrite.jsp'" id="wbutton">글쓰기</button>
				</c:if>
			</form>
			
		</section>
	</div>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>