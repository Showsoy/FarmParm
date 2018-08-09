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
<div class="review">
<h3>&nbsp;&nbsp;상품후기</h3>
	<hr color="#4CAF50" size="5">
		<table cellspacing="0" cellpadding="0" id="detail_board">
			<tr id="top_menu" height="20px">
				<td id="td_check">번호</td>
				<td colspan="2">제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:choose>
				<c:when test="${reviewList!=null&&pageInfo.listCount>0 }">	
				<c:forEach var="review" items="${reviewList }">
					<tr height="30px">
						<td>${review.rgroup }</td>
						<td colspan="2">${review.subject }</td>
						<td>${review.user_id }</td>
						<td>${review.rdate }</td>
					</tr>
				</c:forEach>
			</c:when>
				<c:otherwise>
					<td colspan="5">
						조회 가능한 상품후기가 없습니다.
					</td>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" id="review_page">
					<c:if test="${r_pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${r_pageInfo.page>1 }">
						<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_pageInfo.page-1}&q_page=${q_page }">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${r_pageInfo.startPage }" end="${r_pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==r_pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${a }&q_page=${q_page }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${r_pageInfo.page>=r_pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_pageInfo.page+1 }&q_page=${q_page }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>