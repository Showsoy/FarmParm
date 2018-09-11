<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::관리자 페이지:::</title>
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
	width:30%;
	padding : 10px 0px 0 0;
	text-align:left;
}
.search{
	font-family:"Nanum Gothic";
	float:right;
}
#orderby{
	padding : 10px 0px 0 0;
	width:20%;
}
#searchbar{
	padding : 10px 0 0 0;
	width:50%;
	text-align:right;
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
		var flag = confirm('한 번 삭제한 회원은 복구할 수 없습니다.\n그래도 삭제하시겠습니까?');
		if(flag){
			document.listForm.action = act;
			document.listForm.submit();
		}
	}else{
		document.listForm.action = act;
		document.listForm.submit();
	}	
}
function listrefresh(){
	var grade = document.getElementById("keywords").options[document.getElementById("keywords").selectedIndex].value;
	var std = document.getElementById("stds").options[document.getElementById("stds").selectedIndex].value;
	var uri = "memberList.us?std="+std+"&keyword="+grade;
	location.href=encodeURI(uri);
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
	<form name="listForm" method="post">
	<input type="hidden" id="page" name="page" value="${pageInfo.page }">
	<input type="hidden" id="dstd" name="dstd" value="${std }">
	<input type="hidden" id="dkeyword" name="dkeyword" value="${keyword }">
	<div id="listmenu">
	<span id ="seldel">
	<button type="button" id="wbutton" onclick="goto_url('memberSelectDelete.us')">선택삭제</button>
	</span>
	<span id="orderby">
		<select id="keywords" name="keywords" onchange="listrefresh()">
				<option value="all" <c:out value="${keyword eq 'all' ? 'selected' : '' }"/>>전체</option>
				<option value="일반회원" <c:out value="${keyword eq '일반회원' ? 'selected' : '' }"/>>일반회원</option>
				<option value="우수회원" <c:out value="${keyword eq '우수회원' ? 'selected' : '' }"/>>우수회원</option>
				<option value="일반셀러" <c:out value="${keyword eq '일반셀러' ? 'selected' : '' }"/>>일반셀러</option>
				<option value="우수셀러" <c:out value="${keyword eq '우수셀러' ? 'selected' : '' }"/>>우수셀러</option>
			</select>
			<select id="stds" name="stds" onchange="listrefresh()">
				<option value="edate" <c:out value="${std eq 'edate' ? 'selected' : '' }"/>>가입일순</option>
				<option value="userpay" <c:out value="${std eq 'userpay' ? 'selected' : '' }"/>>주문금액순</option>
		</select>
	</span>
	<span id="searchbar">
		<input type="hidden" name="std" id="std" value="user_id"/>
		<input type="text" name="keyword" id="keyword" placeholder="아이디" size="10"/>
		<button type="button" name="searchbt" id="wbutton" onclick="goto_url('memberList.us')">검색</button>
	</span>
	</div>
		<table class="listtable" cellspacing="0" cellpadding="0">
			<tr id="top_menu">
				<td id="td_check">
				<input type="checkbox" id="allCheck" name="allCheck" onClick="checkAll(this.form)"/></td>
				<td>가입일</td>
				<td>아이디</td>
				<td>등급</td>
				<td>주문금액</td>
				<td>수정/삭제</td>
			</tr>
			<c:forEach var="userList" items="${userList }">
 			<tr>
				<td>
				<input type="checkbox" id="ckb" name="ckb" value="${userList.user_id }"/>
				</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${userList.edate }" /></td>
				<td>${userList.user_id }</td>
				<td>${userList.grade }</td>
				<td><c:if test="${userList.tot_price != null }">
				<fmt:formatNumber value="${userList.tot_price }" type="number"/>원
				</c:if>
				<c:if test="${userList.tot_price == null }">
				0원
				</c:if>
				</td>
				<td>
				<button type="button" onclick="location.href=encodeURI('userView.us?page=${pageInfo.page }&user_id=${userList.user_id}<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')" id="gbutton">조회</button>
				</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="6" id="td_info">
	<section id="pageList">
		<c:if test="${pageInfo.page<=1 }">
			
		</c:if>
		<c:if test="${pageInfo.page>1 }">
			<a href="memberList.us?page=${pageInfo.page-1}<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')"><span id="pagebn"><</span></a>&nbsp;
		</c:if>
					
		<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
			<c:choose>
				<c:when test="${a==pageInfo.page }">
					<span id="nowpage">${a }</span>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" onclick="location.href=encodeURI('memberList.us?page=${a }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')">&nbsp;${a }&nbsp;</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" onclick="location.href=encodeURI('memberList.us?page=${pageInfo.page+1 }<c:out value="${std !=null ? '&std=' : '' }"/>${std}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}')"><span id="pagebn">></span></a>
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