<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="qna">
<h3>&nbsp;&nbsp;상품문의</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" id="detail_board">
			<tr id="top_menu" height="20px">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:choose>
				<c:when test="${qnaList!=null&&pageInfo.listCount>0 }">	
				<c:forEach var="qna" items="${qnaList }">
					<tr height="30px">
						<td>${qna.rgroup }</td>
						<td colspan="2">${qna.subject }</td>
						<td>${qna.user_id }</td>
						<td>${qna.rdate }</td>
					</tr>
				</c:forEach>
			</c:when>
				<c:otherwise>
					<td colspan="5">
						조회 가능한 상품문의가 없습니다.
					</td>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" id="qna_page">
					<c:if test="${q_pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${q_pageInfo.page>1 }">
						<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page}&q_page=${q_page }">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${q_pageInfo.startPage }" end="${q_pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==q_pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page }&q_page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${q_pageInfo.page>=q_pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page }&q_page=${q_pageInfo.page+1 }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>