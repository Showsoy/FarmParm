<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<section class="w3-container w3-center" style="max-width:500px">
  <h2 class="w3-wide">BEST</h2>
  <p class="w3-opacity"><i>가장 사랑받은 제품들</i></p>
</section>

	<div id="container">
		<ul class="prod-list" align="center">
		<c:forEach var="best" items="${bestList }">
			<li><img src="images/${best.img_path }" alt="${best.item_name }">
			<p>${best.item_name }</p>
				<div class="caption">
					<h1>${best.item_name }</h1>
					<p>
						<br><a href="uitemView.im?item_code=${best.item_code }"><img src="images/zoom-in.png" style="width:24px;height:24px;border:0;"></a>
						<a href="addCart.ct?item_code=${best.item_code }"><img src="images/shopping-cart.png" style="width:24px;height:24px;border:0;"></a>
					</p>
				</div> 
			</li>
		</c:forEach>
		</ul>
	</div>


	<!-- 신메뉴 리스트 -->
<section class="w3-container w3-center" style="max-width:500px">
  <h2 class="w3-wide">NEW</h2>
  <p class="w3-opacity"><i>야심찬 새 상품</i></p>
</section>
<div id="container">
		<ul class="prod-list" align="center">
			<c:forEach var="newList" items="${newList }">
			<li><img src="images/${newList.img_path }" alt="${newList.item_name }">
			<p>${newList.item_name }</p>
				<div class="caption">
					<h1>${newList.item_name }</h1>
					<p>
						<br><a href="uitemView.im?item_code=${newList.item_code }"><img src="images/zoom-in.png" style="width:24px;height:24px;border:0;"></a>
						<a href="addCart.ct?item_code=${newList.item_code }"><img src="images/shopping-cart.png" style="width:24px;height:24px;border:0;"></a>
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
    <p>Paul</p>
    <img src="images/common1.jpg" alt="Random Name">
    <p>조이농부</p>
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