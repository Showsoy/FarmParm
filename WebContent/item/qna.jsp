<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#parent{
		display:flex;
		flex-wrap:wrap;
		width:700px;
		position:relative;
	}
	#parent_img{
		display:flex;
		flex-wrap:wrap;
		float:left;
		position:relative;
		padding:10px;
	}
	#zoom{
		position:absolute;
		top:10;
		left:10;
	}
	#parent_cont{
		float:left;
	}
	#parent_command{
		float:left;
		position:absolute;
		right:0;
	}
</style>
<script>
var count2 = 0;
	
	function show_content2(v){
		var name = "qna_content"+v;
		var name2 = "qnare_content"+v
		if(document.getElementById(name).style.display=="none"){
			document.getElementById(name).style.display = "table-row";
			if(document.getElementById(name2)!=null) document.getElementById(name2).style.display = "table-row";
			count2++;
			return;
		}else if(document.getElementById(name).style.display=="table-row"){
			document.getElementById(name).style.display = "none";
			if(document.getElementById(name2)!=null) document.getElementById(name2).style.display = "none";
			count2--;
			return;
		}
		
	}
</script>
</head>
<body>
<div class="qna" id="qnaboard">
<h3>&nbsp;&nbsp;상품문의</h3>
	<hr color="#4CAF50" size="5">
	<button type="button" id="wbutton" onclick="window.open('./item/qnaForm.bo?item_code=${item.item_code}','','width=500, height=400')">문의하기</button>
		<table cellspacing="0" cellpadding="0" id="detail_board">
			<tr id="top_menu" height="20px">
				<td id="td_check">번호</td>
				<td colspan="2" width="200px" id="leftalign">제목</td>
				<td width="100px">작성자</td>
				<td width="100px">작성일</td>
			</tr>
			<c:choose>
				<c:when test="${qnaList!=null&&q_pageInfo.listCount>0 }">	
				<c:forEach var="qna" items="${qnaList }">
					<c:if test="${qna.rstep==1 }">
					<tr height="30px">
						<td>${qna.rgroup }</td>
						<td id="leftalign" colspan="2" onclick="show_content2(${qna.rgroup})" style="cursor:pointer;">${qna.subject }<c:if test="${qna.has_re==1 }"> [1]</c:if></td>
						<td>${qna.user_id }</td>
						<td>${qna.date }</td>
					</tr>
					</c:if>
					<tr id="qna_content${qna.rgroup }" style="display:none;">
						<td colspan="5" id="parent_content">
						<div id="parent">
						<c:if test="${qna.rstep==1 }">
						<c:choose>
							<c:when test="${qna.img_path != null }">
							<div id="parent_img">
								<img src="./images/${qna.img_path }" style="width:80px;height:100px;">
								<div id="zoom">
								<a onclick="doImgPop('./images/${qna.img_path}')" style="cursor:pointer;" title="클릭하시면 원본크기로 보실 수 있습니다."><img src="./images/zoom-inb.png"></a>
								</div>
							</div>
							<div id="parent_cont" style="width:500px;padding:10px;text-align:left">
							${qna.content }
							</div>
							</c:when>
							<c:otherwise>
							<div id="parent_cont" style="width:600px;padding:10px 10px 10px 50px;text-align:left">
							${qna.content }
							</div>
							</c:otherwise>
							</c:choose>
							<div id="parent_command" style="width:80px;">
							<c:if test="${qna.has_re==0 && id eq 'admin'}">
								<a onclick="window.open('./item/qnareForm.bo?item_code=${qna.code}&bnum=${qna.board_num}','','width=500, height=400')" style="cursor:pointer;">답글</a>
							</c:if>
							<c:if test="${id eq qna.user_id || id eq 'admin' }">
								<a href="./qnaRemove.bo?item_code=${qna.code}&bnum=${qna.board_num}&page=${page }&r_page=${r_page}&q_page=${q_page }">삭제</a>
							</c:if>
							</div>
						</c:if>
						</div>
						</td>
						</tr>
						<c:if test="${qna.rstep==2 }">
						<tr id="qnare_content${qna.rgroup }" style="display:none;">
							<td colspan="5" id="child_content">
								<div style="width:600px;padding:10px 10px 10px 50px;text-align:left">
								<p><b>팜팜농원</b></p>
								${qna.content }
								</div>
							</td>
						</tr>
						</c:if>
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
						<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page}&q_page=${q_page }#qnaboard">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${q_pageInfo.startPage }" end="${q_pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==q_pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page }&q_page=${a }#qnaboard">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${q_pageInfo.page>=q_pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="uitemView.im?item_code=${item.item_code }&page=${page }&r_page=${r_page }&q_page=${q_pageInfo.page+1 }#qnaboard">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>