<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
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
#td_info{
	text-align:center;
}
</style>
<script>
function selectSDay(sel) {
	var year = document.getElementById("sYear").options[document.getElementById("sYear").selectedIndex].value;
	var month = sel.options[sel.selectedIndex].value;
	
	var lastDay = (new Date(year,month,0)).getDate();
	var string = "";
	for(var i=1; i<=lastDay; i++){
		if(i<10) string += "<option value = '0"+i+"'>"+i+"일</option>";
		else string += "<option value = '"+i+"'>"+i+"일</option>";
	}
	document.getElementById("sDay").innerHTML = string;
}
function selectEDay(sel) {
	var year = document.getElementById("eYear").options[document.getElementById("eYear").selectedIndex].value;
	var month = sel.options[sel.selectedIndex].value;
	
	var lastDay = (new Date(year,month,0)).getDate();
	var string = "";
	for(var i=1; i<=lastDay; i++){
		if(i<10) string += "<option value = '0"+i+"'>"+i+"일</option>";
		else string += "<option value = '"+i+"'>"+i+"일</option>";
	}
	document.getElementById("eDay").innerHTML = string;
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<jsp:include page="/common/adminbar.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;입출고관리</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form action="./itemSearch.im" method="post">
		<c:if test="${isearch!=null && isearch != '' }">
		<input type="hidden" name="isearch" value="${isearch }">
		</c:if>
		<c:if test="${keyword!=null && keyword != '' }">
		<input type="hidden" name="keyword" value="${keyword }">
		</c:if>
		<div id="sales-keyword">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy" var="nowYear" />
		<%
		String start = (String)request.getAttribute("start");
		String end = (String)request.getAttribute("end");
		HashMap<String, String> dayMap = new HashMap<String, String>();
		dayMap.put("syear", start.substring(0, 4));
		dayMap.put("smonth", start.substring(5, 7));
		dayMap.put("sday", start.substring(8, 10));
		
		dayMap.put("eyear", end.substring(0, 4));
		dayMap.put("emonth", end.substring(5, 7));
		dayMap.put("eday", end.substring(8, 10));

		pageContext.setAttribute("dayMap", dayMap);
		%>
		<select id="sYear" name="sYear">
		  <c:forEach var="year" begin="${nowYear - 2}" end="${nowYear}">
		   <option value="${year}" <c:out value="${dayMap['syear'] eq year ? 'selected=\"selected\"' : '' }"/>>${year}년 </option>
		  </c:forEach>
		</select><select id="sMonth" name="sMonth" onchange="selectSDay(this)">
		 <c:forEach var="month" begin="1" end="12">
		 <fmt:formatNumber var="datePattern" value="${month}" pattern="00"/>
		   <option value="${datePattern}" <c:out value="${dayMap['smonth'] eq datePattern ? 'selected=\"selected\"' : '' }"/>> ${month}월 </option>
		 </c:forEach>
		</select><select id="sDay" name="sDay">
		 <c:forEach var="day" begin="1" end="31">
		 <fmt:formatNumber var="datePattern" value="${day}" pattern="00"/>
		   <option value="${datePattern}" <c:out value="${dayMap['sday'] eq datePattern ? 'selected=\"selected\"' : '' }"/>> ${day}일 </option>
		 </c:forEach>
		</select>
		&nbsp;-&nbsp;
		<select id="eYear" name="eYear">
		  <c:forEach var="year" begin="${nowYear - 2}" end="${nowYear}">
		   <option value="${year}" <c:out value="${dayMap['eyear'] eq year ? 'selected=\"selected\"' : '' }"/>>${year}년 </option>
		  </c:forEach>
		</select><select id="eMonth" name="eMonth" onchange="selectEDay(this)">
		 <c:forEach var="month" begin="1" end="12">
		 <fmt:formatNumber var="datePattern" value="${month}" pattern="00"/>
		   <option value="${datePattern}" <c:out value="${dayMap['emonth'] eq datePattern ? 'selected=\"selected\"' : '' }"/>> ${month}월 </option>
		 </c:forEach>
		</select><select id="eDay" name="eDay">
		 <c:forEach var="day" begin="1" end="31">
		 <fmt:formatNumber var="datePattern" value="${day}" pattern="00"/>
		   <option value="${datePattern}" <c:out value="${dayMap['eday'] eq datePattern ? 'selected=\"selected\"' : '' }"/>> ${day}일 </option>
		 </c:forEach>
		</select>
		<button type="submit" id="wbutton">&nbsp;검색&nbsp;</button>
		<br>
		<button type="button" id="wbutton" onclick="location.href='itemSearch.im?period=week<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">일주일</button>
		<button type="button" id="wbutton" onclick="location.href='itemSearch.im?period=2week<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">이주일</button>
		<button type="button" id="wbutton" onclick="location.href='itemSearch.im?period=month<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}'">한 달</button>
		<br><br>
		<b>${start } - ${end }</b> 기간 검색
		<c:if test="${keyword!=null&& keyword!='' }"><br>중 <b>"${keyword }"</b> 검색결과... <a href="itemSearch.im">전체보기</a></c:if> 
		</div>
	</form>
	<br>
	<form action="./itemSearch.im" method="post">
	<c:if test="${start!=null&& start != '' }">
		<input type="hidden" name="start" value="${start }">
	</c:if>
	<c:if test="${end!=null&& end != '' }">
		<input type="hidden" name="end" value="${end }">
	</c:if>
	<section id="commandCellp">
	<select name="isearch" id="isearch" style="height:30px;">
		<option value="category" <c:out value="${isearch==null || isearch eq 'category' ? 'selected=\"selected\"' : '' }"/>>분류</option>
		<option value="item_code" <c:out value="${isearch eq 'item_code' ? 'selected=\"selected\"' : '' }"/>>코드</option>
		<option value="item_name" <c:out value="${isearch==null || isearch eq 'item_name' ? 'selected=\"selected\"' : '' }"/>>이름</option>
	</select>
	<input type="text" id="keyword" name="keyword"/>
	<button id="wbutton" type="submit">검색</button>
	</section>
	</form>
	<br>
	<table cellspacing="0" cellpadding="0" class="listtable">
	<tr id="top_menu35">
		<td>분류</td>
		<td>코드</td>
		<td>이름</td>
		<td>상태</td>
		<td>수량</td>
		<td>일자</td>
		<td>재고</td>
		<td>입출고</td>
	</tr>
	<c:choose>
		<c:when test="${pageInfo.listCount>0 }">	
		<c:forEach var="isearch" items="${iSearchList }">
		<tr>
			<td>${isearch.category }</td>
			<td>${isearch.item_code }</td>
			<td>${isearch.item_name }</td>
			<td>${isearch.img_path }</td>
			<td>${isearch.readcount }</td>
			<td>${isearch.vdate }</td>
			<td>${isearch.stock }</td>
			<td><button type="button" id="gbutton" onclick="location.href='./itemEnterForm.im?item_code=${isearch.item_code}'">선택</button></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="8" id="td_info">
				<c:if test="${pageInfo.page<=1 }">
					
				</c:if>
				<c:if test="${pageInfo.page>1 }">
					<a href="itemSearch.im?page=${pageInfo.page-1}&start=${start}&end=${end}<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}"><span id="pagebn"><</span></a>
				</c:if>
					
				<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
					<c:choose>
						<c:when test="${a==pageInfo.page }">
							<span id="nowpage">${a }</span>
						</c:when>
						<c:otherwise>
							<a href="itemSearch.im?page=${a }&start=${start}&end=${end}<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}">&nbsp;${a }&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						
					</c:when>
					<c:otherwise>
						<a href="itemSearch.im?page=${pageInfo.page+1 }&start=${start}&end=${end}<c:out value="${isearch !=null ? '&isearch=' : '' }"/>${isearch}<c:out value="${keyword !=null ? '&keyword=' : '' }"/>${keyword}"><span id="pagebn">></span></a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		</c:when>
		<c:otherwise>
			<tr><td colspan="8">등록된 상품이 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
	</table>
	<br><br><br>
	<button type="button" id="bbutton" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>