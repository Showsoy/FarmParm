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
footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
table{
	border:0;
}
th, td {
    border-bottom: 1px solid #ddd;
    height:50px;
}
.page{
	margin:0 auto;
	text-align:center;
}
#orderby{
	text-align:right;
	font-size:12px;
	padding:5px 5px 5px 720px;
}
#orderby img{
	width:11px;
	heigh:11px;
	padding:0px 0px 3px 0px;
}
#or_price{
	text-decoration:line-through;
	font-size:12px;
}
#new_price{
	line-height:24px;
}
#sale_icon{
	width:15px;
	border:0;
}
#prod_image{
	width:300px;
	height:200px;
	margin:5px 15px 0 15px;
	border:1px solid #ccc;
}
#selcategory{
	font-weight:700;
	color:#43A047;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>

<c:if test="${todayImageMap!=null }">
<div class="recent_view">
		<h4>&nbsp;&nbsp;최근 본 상품</h4>
		<table>
		<tr>
			<c:forEach var="todayImage" items="${todayImageMap }" varStatus="status" begin="0" end="5" step="1">
				<td><a href="uitemView.im?item_code=${todayImage.key }"><img src="images/${todayImage.value }" id="todayImage"/></a></td>
			</c:forEach>
		</tr>
		</table>
</div>
</c:if>
<div class="pageform">
	<h3>&nbsp;&nbsp;${category }</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<c:choose>
		<c:when test="${pageInfo.listCount>0 }">
		<span id="orderby">
			<img src="./images/checked.png"/>
			<a href="uitemList.im?category=${category }&std=new">
			<c:choose><c:when test="${std eq 'vdate' }"><span id="selcategory">신상품순</span></c:when>
			<c:otherwise>신상품순</c:otherwise></c:choose></a>
			<img src="./images/checked.png"/>
			<a href="uitemList.im?category=${category }&std=high">
			<c:choose><c:when test="${std eq 'price' }"><span id="selcategory">가격높은순</span></c:when>
			<c:otherwise>가격높은순</c:otherwise></c:choose></a>
			<img src="./images/checked.png"/>
			<a href="uitemList.im?category=${category }&std=low">
			<c:choose><c:when test="${std eq 'low' }"><span id="selcategory">가격낮은순</span></c:when>
			<c:otherwise>가격낮은순</c:otherwise></c:choose></a>
			<img src="./images/checked.png"/>
			<a href="uitemList.im?category=${category }&std=pc">
			<c:choose><c:when test="${std eq 'purchase' }"><span id="selcategory">판매량순</span></c:when>
			<c:otherwise>판매량순</c:otherwise></c:choose></a>
			<img src="./images/checked.png"/>
			<a href="uitemList.im?category=${category }&std=rc">
			<c:choose><c:when test="${std eq 'readcount' }"><span id="selcategory">인기순</span></c:when>
			<c:otherwise>인기순</c:otherwise></c:choose></a>

		</span>
	<div id="goods_container">
		<ul class="prod-list" align="center">
		<c:forEach var="itemList" items="${itemList }">
		<c:set var="price" value="${itemList.price }"/>
		<c:set var="sale" value="${itemList.sale }"/>
		<%
		int price = (int)pageContext.getAttribute("price");
		int sale = (int)pageContext.getAttribute("sale");
		double saled = 1-(double)sale/100;
		int uprice = (int)(price*saled);
		pageContext.setAttribute("uprice", uprice);
		%>
			<li>
				<a href="uitemView.im?item_code=${itemList.item_code }&page=${pageInfo.page}">
				<img id="prod_image" src="images/${itemList.img_path }"/></a>
				<div class="caption">
				<a href="uitemView.im?item_code=${itemList.item_code }&page=${pageInfo.page}">
					<b>${itemList.item_name }</b></a><br>
				<c:choose>
					<c:when test="${itemList.sale==0 }">
						<fmt:formatNumber value="${itemList.price }" type="number"/>원<br>
					</c:when>
					<c:otherwise>
						<span id="or_price"><fmt:formatNumber value="${itemList.price }" type="number"/>원</span><br>
						<img src="images/sale.png" style="width:24px;height:15px;border:none;padding:0;margin:0;">
						<span id="new_price" style="line-height:5px;margin:0 auto;font-size:14px;">
						<fmt:formatNumber value="${uprice }" type="number"/>원(-${itemList.sale }%)</span><br>
					</c:otherwise>
				</c:choose>	
				<c:choose>
				<c:when test="${itemList.stock<=0 }">
					<font style="font-size:14px;color:red;">매진</font>
				</c:when>
				<c:otherwise>
					<a href="./item/addCart.ct?item_code=${itemList.item_code }" style="color:black;paddin:0;font-size:13px;"><img src="images/cart.png"/> 장바구니</a>
				</c:otherwise>
				</c:choose>
				</div>
			</li>
		</c:forEach>
		</ul>
	
	</div>
	<div class="page">
		<c:if test="${pageInfo.page<=1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${pageInfo.page>1 }">
				<a href="itemList.im?page=${pageInfo.page-1}">[이전]</a>&nbsp;
			</c:if>
					
			<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${a==pageInfo.page }">
						[${a }]
					</c:when>
					<c:otherwise>
						<a href="itemList.im?page=${a }">[${a }]</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="itemList.im?page=${pageInfo.page+1 }">[다음]</a>
					</c:otherwise>
				</c:choose>
	</div>
		</c:when>
		<c:otherwise>
			상품이 존재하지 않습니다.
		</c:otherwise>
	</c:choose>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
