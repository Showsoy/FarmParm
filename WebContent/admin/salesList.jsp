<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
<<<<<<< HEAD
tr{
=======
.listtable tr{
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
	height:50px;
}
td{
    border-bottom: 1px solid #ddd;
}
td p{
	text-height:100%;
	float:left;
}
img{
	border: 1px solid #ddd;
	padding : 0 0 0 2px;
}
<<<<<<< HEAD
dt{
	display:inline-block;
	width:150px;
	text-align:left;
}
dd{
	display:inline-block;
	width:150px;
	text-align:right;
}
=======
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
#orderby{
	padding : 13px 0 0 380px;
}
#orderby2{
	font-size:13px;
}
<<<<<<< HEAD
#datesel{
	display:inline-block;
}
#datesel select{
	height:30px;
}
#datesel button{
	float:left;
}
#monthseldel1, #monthseldel2, #monthseldel3{
	float:left;
}
#monthseldel3{
	padding:0 0 0 5px;
}
=======
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
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
function monthSelDel(){
	if(document.getElementById("monthseldel2").style.display=="none"){
		document.getElementById("monthseldel2").style.display = "block";
		document.getElementById("sDay").disabled = false;
		return;
	}else if(document.getElementById("monthseldel2").style.display=="block"){
		document.getElementById("monthseldel2").style.display = "none";
		document.getElementById("sDay").disabled = true;
		return;
	}
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
	<h3>&nbsp;&nbsp;매출관리</h3>
	<hr color="#4CAF50" size="5">
	<form action="salesList.od" method="post" name="salesList">
	<div class="mypage">
<<<<<<< HEAD
		<c:if test="${salesMap !=null }">
			<div id="search_info">
			<dl>
				<dt><b>해당 기간 매출 A</b></dt>
				<dd><fmt:formatNumber value="${salesMap['this_pay'] }" type="number"/>원</dd>
			</dl>
			<dl>
				<dt><b>포인트 결제 B</b></dt>
				<dd><fmt:formatNumber value="${salesMap['this_depoint'] }" type="number"/>원</dd>
			</dl>
			<dl>
				<dt><b>순 이익(A-B-배송비)</b></dt>
				<dd><fmt:formatNumber value="${salesMap['this_profit'] }" type="number"/>원</dd>
			</dl>
			<dl>
				<dt><b>해당 기간 판매량</b></dt>
				<dd><fmt:formatNumber value="${salesMap['this_sales'] }" type="number"/>개</dd>
			</dl>
			<c:if test="${salesMap['profit_ration']!=null }">
				<dl>
					<dt><b>전월 대비 순이익</b></dt>
					<dd>${salesMap['profit_ration'] }%</dd>
				</dl>
				<dl>
					<dt><b>전월 대비 판매량</b></dt>
					<dd>${salesMap['sales_ration'] }%</dd>
				</dl>
			</c:if>
			</div>
		</c:if>
=======
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
		<br><br>
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
<<<<<<< HEAD
		<input type="checkbox" name = "monthsel" value="check" onchange="monthSelDel()"><b>월 매출 검색</b><br>
		<div id="datesel">
=======
		<input type="checkbox" name = "monthsel" id="monthsel" value="check" onchange="monthSelDel()"><label for="monthsel"><b>월 매출 검색</b></label><br>
        <div id="datesel">
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
		<span id="monthseldel1">
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
		</span>
		<span id="monthseldel2" style="display:block;">
		&nbsp;-
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
		</span>&nbsp;
		<span id="monthseldel3">
		<button type="submit" id="wbutton">&nbsp;검색&nbsp;</button>
		</span>
		</div>
		<br>
		<button type="button" id="wbutton" onclick="location.href='salesList.od?period=week'">일주일</button>
		<button type="button" id="wbutton" onclick="location.href='salesList.od?period=2week'">이주일</button>
		<button type="button" id="wbutton" onclick="location.href='salesList.od?period=month'">한 달</button>
		<br><br>
<<<<<<< HEAD
		<b>${start } - ${end }</b> 검색결과
		</div>
		<br>
=======
		<b>${start } - ${end }</b> 기간 검색
		</div>
		<br>
		<c:if test="${salesMap !=null }">
			<table class="sales-table" cellpadding="0" cellspacing="0">
			<tr>
			<td id="float-top"><b>해당 기간 매출 A</b></td>
			<td id="float-top"><b>포인트 결제 B</b></td>
			<td id="float-top"><b>순 이익(A-B-배송비)</b></td>
			<td id="float-top"><b>해당 기간 판매량</b></td>
			<c:if test="${salesMap['profit_ration']!=null }">
				<td id="float-top"><b>전월 대비 순이익</b></td>
				<td id="float-top"><b>전월 대비 판매량</b></td>
			</c:if>
			</tr>
			<tr>
			<td><fmt:formatNumber value="${salesMap['this_pay'] }" type="number"/>원</td>
			<td><fmt:formatNumber value="${salesMap['this_depoint'] }" type="number"/>원</td>
			<td><fmt:formatNumber value="${salesMap['this_profit'] }" type="number"/>원</td>
			<td><fmt:formatNumber value="${salesMap['this_sales'] }" type="number"/>개</td>
			<c:if test="${salesMap['profit_ration']!=null }">
				<td>${salesMap['profit_ration'] }%</td>
				<td>${salesMap['sales_ration'] }%</td>
			</c:if>
			</table>
		</c:if><br>
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
	<button type="button" id="categorybl" style="background-color:<c:out value="${orderby==null ? '#F6F6F6' : '#fff'}"/>;" onclick="location.href='salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&start=${start}&end=${end}'">주문별</button><button type="button" id="categorybr" style="background-color:<c:out value="${orderby!=null ? '#F6F6F6' : '#fff'}"/>;" onclick="location.href='salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&start=${start}&end=${end}&orderby=profit'">상품별</button>
	<br>
	<c:choose>
	<c:when test="${orderby==null }">
<<<<<<< HEAD
=======
		<br>
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
		<table class="listtable" cellspacing="0" cellpadding="0">	
			<tr id="top_menu">
				<td>주문번호</td>
				<td>회원ID</td>
				<td>주문일시</td>
				<td>상태</td>
				<td>총 금액</td>
				<td>결제방법</td>
				<td>조회</td>
			</tr>
			<c:choose>
				<c:when test="${salesList1!=null && pageInfo.listCount>0 }">
			<c:forEach var="salesList1" items="${salesList1 }">
			<tr>
				<td>${salesList1.order_id }</td>
				<td>${salesList1.user_id }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${salesList1.dati }" /></td>
				<td><fmt:formatNumber value="${salesList1.pay }" type="number"/>원</td>
				<td>${salesList1.payment }</td>
				<td>${salesList1.state }</td>
				<td><button type="button" onclick="location.href='odView.od?order_id=${salesList1.order_id}'" id="gbutton">조회</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pageInfo.page>1 }">
<<<<<<< HEAD
						<a href="salesList.od?page=${pageInfo.page-1}&start=${start}&end=${end}">[이전]</a>&nbsp;
=======
						<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${pageInfo.page-1}&start=${start}&end=${end}">[이전]</a>&nbsp;
>>>>>>> 5166f2568e8c6acb26007983da939408557e6f88
					</c:if>

					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${a }&start=${start}&end=${end}">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${pageInfo.page+1 }&start=${start}&end=${end}">[다음]</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="8">등록된 정보가 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
		</table>
		</c:when>
		<c:otherwise>
		<div style="width:80%;margin:0 auto;text-align:right;">
			<span id="orderby2">
			<a href="salesList.od?&start=${start}&end=${end}&orderby=profit"><img src="../images/checked.png"/><c:choose><c:when test="${orderby eq 'profit' }">
			<span id="selcategory">기준 매출</span></c:when><c:otherwise> 기준 매출</c:otherwise></c:choose></a>
			<a href="salesList.od?start=${start}&end=${end}&orderby=sales">
			<img src="../images/checked.png"/><c:choose><c:when test="${orderby eq 'sales' }">
			<span id="selcategory">기준 주문량</span></c:when><c:otherwise> 기준 주문량</c:otherwise></c:choose></a>
			</span>
			&nbsp;&nbsp;
		</div>
		<table class="listtable" cellspacing="0" cellpadding="0">	
			<tr id="top_menu">
				<td>주문번호</td>
				<td>상품코드</td>
				<td>상품명</td>
				<td>가격</td>
				<td>주문량</td>
				<td>주문일시</td>
				<td>기준 매출</td>
				<td>기준 주문</td>
			</tr>
			<c:choose>
				<c:when test="${salesList2!=null && pageInfo.listCount>0 }">
			<c:forEach var="salesList2" items="${salesList2 }">
			<tr>
				<td>${salesList2.order_id }</td>
				<td>${salesList2.item_code }</td>
				<td>${salesList2.item_name }</td>
				<td><fmt:formatNumber value="${salesList2.price }" type="number"/>원</td>
				<td>${salesList2.amount }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${salesList2.dati }" /></td>
				<td><fmt:formatNumber value="${salesList2.profit }" type="number"/>원</td>
				<td>${salesList2.sales }</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8" id="td_info">
					<c:if test="${pageInfo.page<=1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pageInfo.page>1 }">
						<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${pageInfo.page-1}&start=${start}&end=${end}&orderby=${orderby }">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${a }&start=${start}&end=${end}&orderby=${orderby }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="salesList.od?<c:out value="${monthsel !=null ? 'monthsel=check' : '' }"/>&page=${pageInfo.page+1 }&start=${start}&end=${end}&orderby=${orderby }">[다음]</a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="8">등록된 정보가 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
		</table>
		</c:otherwise>
		</c:choose>
	<br><br><br>
	<button type="button" id="bbutton" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>