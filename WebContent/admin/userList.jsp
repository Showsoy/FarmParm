<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
tr{
	height:50px;
}
td{
    border-bottom: 1px solid #ddd;
}
td p{
	text-height: 100%;
	float:left;
}
img{
	border: 1px solid #ddd;
	padding : 0 0 0 2px;
}
#seldel{
	width:320px;
}
.search{
	font-family:"Nanum Gothic";
	float:right;
	margin-right: 150px;
	margin-bottom: 5px;
	padding: 5px;
}
#orderby{
	padding : 10px 70px 0 90px;
}
#searchbar{
	padding : 10px 0 0 0;
}

</style>
<script>
function checkAll(theForm){
	if(theForm.ckb.length==undefined){
		theForm.ckb.checked = theForm.allCheck.checked;
	}else{
		for(var i=0;i<theForm.ckb.length;i++){
			theForm.ckb[i].checked = theForm.allCheck.checked;
		}
	}
}
function goto_url(act) {
	if(act=='memberSelectDelete.us'){
		var flag = confirm('한 번 삭제한 아이디는 복구할 수 없습니다.\n그래도 삭제하시겠습니까?');
		if(flag){
			document.listForm.action = act;
			document.listForm.submit();
		}
	}else{
		document.listForm.action = act;
		document.listForm.submit();
	}	
}

</script>
</head>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<jsp:include page="/common/adminbar.jsp" flush="false"/>

<div class="pageform">
	<h3>&nbsp;&nbsp;회원관리</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form name="listForm" id="listForm">
	<div id="listmenu">
	<span>
	<button type="button" id="wbutton" onclick="goto_url('memberSelectDelete.us')">선택삭제</button>
	</span>
	<span id="orderby">
		<a href="memberList.us"><img src="./images/checked.png"/><c:choose><c:when test="${category eq 'all' }">
		<span id="selcategory">전체</span></c:when><c:otherwise> 전체</c:otherwise></c:choose></a>
		<a href="memberList.us?std=grade&grade=일반회원"><img src="./images/checked.png"/><c:choose><c:when test="${category eq '일반회원' }">
		<span id="selcategory">일반회원</span></c:when><c:otherwise> 일반회원</c:otherwise></c:choose></a>
		<a href="memberList.us?std=grade&grade=우수회원"><img src="./images/checked.png"/><c:choose><c:when test="${category eq '우수회원' }">
		<span id="selcategory">우수회원</span></c:when><c:otherwise> 우수회원</c:otherwise></c:choose></a>
		<a href="memberList.us?std=grade&grade=일반셀러"><img src="./images/checked.png"/><c:choose><c:when test="${category eq '일반셀러' }">
		<span id="selcategory">일반셀러</span></c:when><c:otherwise> 일반셀러</c:otherwise></c:choose></a>
		<a href="memberList.us?std=grade&grade=우수셀러"><img src="./images/checked.png"/><c:choose><c:when test="${category eq '우수셀러' }">
		<span id="selcategory">우수셀러</span></c:when><c:otherwise> 우수셀러</c:otherwise></c:choose></a>
		<a href="memberList.us?std=purchase"><img src="./images/checked.png"/><c:choose><c:when test="${category eq '구매금액' }">
		<span id="selcategory">주문금액순</span></c:when><c:otherwise> 주문금액순</c:otherwise></c:choose></a>
	</span>
	<span id="searchbar">
		<input type="text" name="search" id="search" placeholder="아이디"/>
		<button type="button" name="searchbt" id="wbutton" onclick="goto_url('memberList.us')">검색</button>
	</span>
	</div>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check">
				<input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>번호</td>
				<td>아이디</td>
				<td>등급</td>
				<td>주문금액</td>
				<td>수정/삭제</td>
			</tr>
			<c:set var="num" value="${pageInfo.listCount-(pageInfo.page-1)*10 }"/>
			<c:forEach var="userList" items="${userList }">
			<tr>
				<td><c:if test="${userList.grade != '관리자' }">
						<input type="checkbox" id="ckb" name="ckb" value="${userList.user_id }"/>
				</c:if></td>
				<td>${num }</td><c:set var="num" value="${num-1}"/>
				<td>${userList.user_id }</td>
				<td>${userList.grade }</td>
				<td><fmt:formatNumber value="${userList.tot_price }" type="number"/>원</td>
				<td><c:if test="${userList.grade != '관리자' }">
					<button type="button" onclick="location.href='userView.us?user_id=${userList.user_id}'" id="gbutton">조회</button>
				</c:if></td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="6" id="td_info">
	<section id="pageList">
		<c:if test="${pageInfo.page<=1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pageInfo.page>1 }">
			<a href="memberList.us?page=${pageInfo.page-1}">[이전]</a>&nbsp;
		</c:if>
					
		<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
			<c:choose>
				<c:when test="${a==pageInfo.page }">
					[${a }]
				</c:when>
				<c:otherwise>
					<a href="memberList.us?page=${a }">[${a }]</a>&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="memberList.us?page=${pageInfo.page+1 }">[다음]</a>
				</c:otherwise>
			</c:choose>
	</section>
			</td>
			</tr>
		</table>
		<br><br><br>
		<button type="button" id="bbutton" onclick="location.href='/FarmParm/admin/adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</form>
	</div>
</div>

 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>