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
table{
	margin:0 auto;
	border-collapse: collapse;
    width: 80%;
	background-color:white;
}
tr{
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
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 10px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton:active{
	background: #F6F6F6;
}
#gbutton {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 60px;
	border: 0;
	padding: 5px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#gbutton:hover, #gbutton:active, #gbutton:focus {
	background: #43A047;
}
#top_menu{
	background-color:#333;
	color:white;
	height:40px;
}
#tr_total{
	background-color:#F6F6F6;
	height:180px;
}
#td_check{
	width:50px;
	text-align:center;
}
#td_info{
	color:#5D5D5D;
	font-size:14px;
}
#listmenu{
	display:flex;
	flex-wrap:wrap;
	width:850px;
	padding:0 0 5px 0;
	margin:0 auto;
}
#seldel{
	float:left;
}
#orderby{
	float:left;
	text-align:right;
	padding : 13px 0 0 380px;
	font-size:13px;
}
#orderby img{
	width:11px;
	heigh:11px;
	padding:0px 0px 5px 0px;
}
#orderby2{
	font-size:13px;
}
#orderby2 img{
	width:11px;
	heigh:11px;
	padding:0px 0px 5px 0px;
}
#selcategory{
	font-weight:700;
	color:#43A047;
}
#search_info{
	padding:20px;
	margin:0 auto;
	width:80%;
	background-color:#F6F6F6;
}
#categorybl{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 5px 0px 0px 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#categorybl:active, #categorybl:hover{
	background: #F6F6F6;
}
#categorybr{
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	border: 0;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 0px 5px 5px 0px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#categorybr:active, #categorybr:hover{
	background: #F6F6F6;
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
<jsp:include page="/common/adminbar.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;매출관리</h3>
	<hr color="#4CAF50" size="5">
	<form action="salesList.od?datesel=ok" method="post" name="salesList">
	<div class="mypage">
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
		<br><br>
	<div id="listmenu">
		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy" var="nowYear" /> 
		<fmt:formatDate value="${now}" pattern="MM" var="nowMon" />
		<%
		Calendar cal = Calendar.getInstance();
		String date1 = ""+cal.get(Calendar.YEAR);
		int temp = cal.get(Calendar.MONTH)+1;
		String date2 = temp>=10 ? ""+temp : "0"+temp;
		if(request.getAttribute("date")!=null){
			String allDate = (String)request.getAttribute("date");
			date1 = allDate.substring(0, 4);
			date2 = allDate.substring(5, 7);
		}
		pageContext.setAttribute("date1", date1);
		pageContext.setAttribute("date2", date2);
		%>
		<select id="orderYear" name="orderYear">
		  <c:forEach var="year" begin="${nowYear - 2}" end="${nowYear}">
		   <option value="${year}" <c:out value="${date1 eq year ? 'selected=\"selected\"' : '' }"/>>${year}년 </option>
		  </c:forEach>
		</select>
		<select id="orderMonth" name="orderMonth">
		 <c:forEach var="month" begin="1" end="12">
		 <fmt:formatNumber var="datePattern" value="${month}" pattern="00"/>
		   <option value="${datePattern}" <c:out value="${date2 eq datePattern ? 'selected=\"selected\"' : '' }"/>> ${datePattern}월 </option>
		 </c:forEach>
		</select>
		<button type="submit" id="wbutton" style="width:70px;">조회</button>
		<span id="orderby">
			<a href="salesList.od?period=week<c:out value="${orderby !=null ? '&orderby=' : '' }"/>${orderby }"><img src="../images/checked.png"/><c:choose><c:when test="${period eq 'week' }">
			<span id="selcategory">일주일</span></c:when><c:otherwise> 일주일</c:otherwise></c:choose></a>
			<a href="salesList.od?period=1month<c:out value="${orderby !=null ? '&orderby=' : '' }"/>${orderby }"><img src="../images/checked.png"/><c:choose><c:when test="${period eq '1month' }">
			<span id="selcategory">한 달</span></c:when><c:otherwise> 한 달</c:otherwise></c:choose></a>
			<a href="salesList.od?period=3month<c:out value="${orderby !=null ? '&orderby=' : '' }"/>${orderby }"><img src="../images/checked.png"/><c:choose><c:when test="${period eq '3month' }">
			<span id="selcategory">3개월</span></c:when><c:otherwise> 3개월</c:otherwise></c:choose></a>
			<a href="salesList.od?period=6month<c:out value="${orderby !=null ? '&orderby=' : '' }"/>${orderby }"><img src="../images/checked.png"/><c:choose><c:when test="${period eq '6month' }">
			<span id="selcategory">6개월</span></c:when><c:otherwise> 6개월</c:otherwise></c:choose></a>
			<a href="salesList.od?period=year<c:out value="${orderby !=null ? '&orderby=' : '' }"/>${orderby }"><img src="../images/checked.png"/><c:choose><c:when test="${period eq 'year' }">
			<span id="selcategory">1년</span></c:when><c:otherwise> 1년</c:otherwise></c:choose></a>
		</span>
	</div>
	<button type="button" id="categorybl" style="background-color:<c:out value="${orderby==null ? '#F6F6F6' : '#fff'}"/>;" onclick="location.href='salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&date=${date }'">주문별</button><button type="button" id="categorybr" style="background-color:<c:out value="${orderby!=null ? '#F6F6F6' : '#fff'}"/>;" onclick="location.href='salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&date=${date }&orderby=profit'">상품별</button>
	<br><br>
	<c:choose>
	<c:when test="${orderby==null }">
		<table cellspacing="0" cellpadding="0">
			<c:choose>
				<c:when test="${salesList1!=null && pageInfo.listCount>0 }">	
			<tr id="top_menu">
				<td>주문번호</td>
				<td>회원ID</td>
				<td>주문일시</td>
				<td>상태</td>
				<td>총 금액</td>
				<td>결제방법</td>
				<td>조회</td>
			</tr>

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
						<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&date=${date }&page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>

					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&date=${date }&page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&date=${date }&page=${pageInfo.page+1 }">[다음]</a>&nbsp;
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
			<a href="salesList.od?period=${period }&orderby=profit"><img src="../images/checked.png"/><c:choose><c:when test="${orderby eq 'profit' }">
			<span id="selcategory">기준 매출</span></c:when><c:otherwise> 기준 매출</c:otherwise></c:choose></a>
			<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&orderby=sales&date=${date }">
			<img src="../images/checked.png"/><c:choose><c:when test="${orderby eq 'sales' }">
			<span id="selcategory">기준 주문량</span></c:when><c:otherwise> 기준 주문량</c:otherwise></c:choose></a>
			</span>
			&nbsp;&nbsp;
		</div>
		<table cellspacing="0" cellpadding="0">
			<c:choose>
				<c:when test="${salesList2!=null && pageInfo.listCount>0 }">	
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
						<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&orderby=${orderby }&date=${date }&page=${pageInfo.page-1}">[이전]</a>&nbsp;
					</c:if>
					
					<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
						<c:choose>
							<c:when test="${a==pageInfo.page }">
								[${a }]
							</c:when>
							<c:otherwise>
								<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&orderby=${orderby }&date=${date }&page=${a }">[${a }]</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							[다음]
						</c:when>
						<c:otherwise>
							<a href="salesList.od?<c:out value="${date !=null ? 'datesel=ok&' : '' }"/>period=${period }&orderby=${orderby }&date=${date }&page=${pageInfo.page+1 }">[다음]</a>
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
	<button type="button" onclick="location.href='adminPage.jsp'" style="width:150px;">관리자페이지</button>
	</div>
	</form>
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>