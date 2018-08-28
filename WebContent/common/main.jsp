<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::팜팜농원:::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
</style>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script type="text/javascript" src="path/to/jQuery.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<section>
  <img class="mySlides" src="images/slide1.jpg" style="width:100%">
  <img class="mySlides" src="images/slide2.jpg" style="width:100%">
</section>
<script>
// Automatic Slideshow - change image every 3 seconds
var myIndex = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000);
}
</script>
<br><br>
<!-- 베스트 상품 리스트 -->
<section class="w3-container w3-center" id ="mainicon" style="max-width:500px;">
	<h2 class="w3-wide">BEST</h2>
  	<p class="w3-opacity"><i>가장 사랑받은 제품들</i></p>
  	<a href="./bnlist.im?type=best"><img src="./images/mainicon3.png"></a>
</section>

	<div id="container">
		<ul class="mprod-list" align="center">
		<c:forEach var="best" items="${bestList }">
		<c:set var="price" value="${best.price }"/>
		<c:set var="sale" value="${best.sale }"/>
		<%
		int price = (int)pageContext.getAttribute("price");
		int sale = (int)pageContext.getAttribute("sale");
		double saled = 1-(double)sale/100;
		int uprice = (int)(price*saled);
		pageContext.setAttribute("uprice", uprice);
		%>
			<li><img src="images/${best.img_path }" alt="${best.item_name }">
			<p>${best.item_name }</p>
				<div class="mcaption">
					<h4><fmt:formatNumber value="${uprice }" type="currency"/></h4>
					<p>
						<a href="./uitemView.im?item_code=${best.item_code }"><img src="./images/zoom-in.png" style="width:24px;height:24px;border:0;"></a>
						<c:choose>
						<c:when test="${best.stock>0 }">
						<a href="./item/addCart.ct?item_code=${best.item_code }"><img src="./images/shopping-cart.png" style="width:24px;height:24px;border:0;"></a>
						</c:when>
						<c:otherwise>
							매진!
						</c:otherwise>
						</c:choose>
					</p>
				</div> 
			</li>
		</c:forEach>
		</ul>
	</div>


	<!-- 신메뉴 리스트 -->
<section class="w3-container w3-center" id ="mainicon" style="max-width:500px;">
 	<h2 class="w3-wide">NEW</h2>
  	<p class="w3-opacity"><i>야심찬 새 상품</i></p>
  	<a href="./bnlist.im?type=new"><img src="./images/mainicon3.png"></a>
</section>
<div id="container">
		<ul class="mprod-list" align="center">
			<c:forEach var="newList" items="${newList }">
			<c:set var="price" value="${newList.price }"/>
			<c:set var="sale" value="${newList.sale }"/>
			<%
			int price = (int)pageContext.getAttribute("price");
			int sale = (int)pageContext.getAttribute("sale");
			double saled = 1-(double)sale/100;
			int uprice = (int)(price*saled);
			pageContext.setAttribute("uprice", uprice);
			%>
			<li><img src="images/${newList.img_path }" alt="${newList.item_name }">
			<p>${newList.item_name }</p>
				<div class="mcaption">

					<h4><fmt:formatNumber value="${uprice }" type="currency"/></h4>
					<p>
						<a href="./uitemView.im?item_code=${newList.item_code }"><img src="./images/zoom-in.png" style="width:24px;height:24px;border:0;"></a>
						<c:choose><c:when test="${newList.stock>0 }">
							<a href="./item/addCart.ct?item_code=${newList.item_code }"><img src="./images/shopping-cart.png" style="width:24px;height:24px;border:0;"></a>
						</c:when>
						<c:otherwise>
							매진!
						</c:otherwise>
						</c:choose>
					</p>
				</div> 
			</li>
		</c:forEach>
		</ul>
	</div>

<br><br><br>
<!-- 농부 소개 -->
<section class="w3-row-padding w3-center w3-light-grey">
  <article class="w3-third">
    <p>슬기농부</p>
    <img src="images/common.jpg" alt="Random Name">
    <p>슰기슬기</p>
  </article>
  <article class="w3-third">
    <p>조이농부</p>
    <img src="images/common1.jpg" alt="Random Name">
    <p>조이조이</p>
  </article>
  <article class="w3-third">
    <p>윤아농부</p>
    <img src="images/common2.jpg" alt="Random Name">
    <p>유나우나</p>
  </article>
</section>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>