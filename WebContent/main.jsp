<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}
.header {
    padding: 10px; /* some padding */
    text-align:center;
    background: #fff;
}
.right{
	text-align:right;
}
.right a{
	text-decoration:none;
	font-size:12px;
}
.header h1 {
    font-size: 40px;
}
.navbar {
    overflow: hidden; /* Hide overflow */
    background-color: #333; /* Dark background color */
     display: flex;
    justify-content: center;
}
/* Style the navigation bar links */
#market{
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: #4CAF50; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#market:hover {
    background-color: #4CAF50;
    color: white;
}
#menu{
	background-color:#4CAF50;
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: black; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#menu:hover {
    background-color:#4CAF50;
    color: black;
}
.navbar a {
    /* Make sure that the links stay side-by-side */
    display: block; /* Change the display to block, for responsive reasons (see below) */
    color: white; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}

/* Right-aligned link */
.navbar a.right {
    float: right; /* Float a link to the right */
}

/* Change color on hover/mouse-over */
.navbar a:hover {
    background-color: #ddd;
    color:black;
}
	#container{
				display:flex;
				flex-wrap:wrap;
				margin:0 auto;
				padding:20px 0px 0px 150px;
				width:1200px;
			}
			#container ul{
				 list-style:none;
			}
			#container ul li{
				 position: relative;
				float:left;
				 overflow: hidden;
			}
			#container img{
				width:200px;
				height:150px;
				margin:5px 15px 0 15px;
				border:1px solid #ccc;
				z-index:5;
			}
			#container .caption {
				position: absolute;
				  top:200px;
				  width:200px;
				  height:150px;
				  margin:5px 17px 17px 15px;
				  padding-top:20px;
				  background:rgba(76,175,80,0.6);
				  opacity:0;
				  -moz-transition: all 0.2s ease-in-out;
				  -o-transition: all 0.2s ease-in-out;
				  -webkit-transition: all 0.2s ease-in-out;
				  transition: all 0.2s ease-in-out;
				  z-index:10;
			}
			#container li:hover .caption {
			  opacity: 1;
			  -moz-transform: translateY(-200px);
			  -ms-transform: translateY(-200px);
			  -o-transform: translateY(-200px);
			  -webkit-transform: translateY(-200px);
			  transform: translateY(-200px);
			}     
			#container .caption h1, .prod-list .caption p {
			  color: #fff;
			  font-size:1em;
			  text-align: center;
			}  

footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 5px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #ddd;
    color: black;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 121px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 5px;
    text-decoration: none;
    padding:10px;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script type="text/javascript" src="path/to/jQuery.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<body>
<div class="header">
   <a href="main.jsp"><img src="images/farm_logo.png" width="150px"></a>
  <div>A website created by me.</div>
  <div class="right">
	  <a href="login.jsp">로그인</a>&nbsp;
	  <div class="dropdown-content">
    	<p>Hello World!</p>
 	 </div>
	  <a href="joinForm.jsp">회원가입</a>&nbsp;
	  <a href="myPage.jsp">마이페이지</a>&nbsp;
	  <a href="myOrders.jsp">주문/배송</a>&nbsp;
	  <a href="cs_center.jsp">고객센터</a>&nbsp;
	  <a href="cart.jsp">장바구니</a>&nbsp;
  </div>
  
</div>   
<div class="navbar">
	<ul>
  <li><a href="#" id="menu"><img src="images/menu.png" width="24px" height="27px"/></a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">&nbsp;&nbsp;팜팜소개&nbsp;&nbsp;</a>
    <div class="dropdown-content">
      <a href="introduction.jsp">농원소개</a>
      <a href="location.jsp">오시는 길</a>
      <a href="notice.jsp">안내사항</a>
    </div>
  </li>
  <li><a href="vegetable.jsp">&nbsp;&nbsp;&nbsp;&nbsp;채소&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="fruit.jsp">&nbsp;&nbsp;&nbsp;&nbsp;과일&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="grains.jsp">&nbsp;&nbsp;쌀/잡곡&nbsp;&nbsp;</a></li>
  <li><a href="tea.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="mf.jsp">&nbsp;&nbsp;&nbsp;가공류&nbsp;&nbsp;&nbsp;</a></li>
  <li><a href="market.jsp" id="market" target="_blank">&nbsp;&nbsp;팜팜마켓&nbsp;&nbsp;</a></li>
  
</ul>
  
</div>
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
			<li><img src="images/apple.jpg" alt="1">
			<p>dd</p>
				<div class="caption">
					<h1>사과</h1>
					<p>
						<br><a href="detail.jsp">상품보러가기</a><br><a href="#">장바구니</a>
					</p>
				</div>
			</li>
			<li><img src="images/apple.jpg" alt="2">
			<p>dd</p>
			<div class="caption">
					<h1>ㅎㅎ</h1>
					<p>
						<br>견종 : 포메라니안<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						20만원<br>기타 사항 : 슬개골이 약함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="3">
			<p>dd</p>
			<div class="caption">
					<h1>3번</h1>
					<p>
						<br>견종 : 말티즈<br>성별 : 여아<br>나이 : 2개월<br>분양가 :
						5만원<br>기타 사항 : 난폭함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="4">
			<p>dd</p>
			<div class="caption">
					<h1>4번</h1>
					<p>
						<br>견종 : 믹스<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						5만원<br>기타 사항 : 말티즈+푸들 믹스
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="5">
			<div class="caption">
					<h1>5번</h1>
					<p>
						<br>견종 : 푸들<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						10만원<br>기타 사항 : 블랙 푸들
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="6">
			<div class="caption">
					<h1>6번</h1>
					<p>
						<br>견종 : 비숑프리제<br>성별 : 여아<br>나이 : 3개월<br>분양가 :
						25만원<br>기타 사항 : 활발함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="7">
			<div class="caption">
					<h1>7번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						30만원<br>기타 사항 : 없음
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="8">
			<div class="caption">
					<h1>8번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 여아<br>나이 : 1개월<br>분양가 :
						30만원<br>기타 사항 : 없음
					</p>
				</div></li>
		</ul>
	</div>


	<!-- 신메뉴 리스트 -->
<section class="w3-container w3-center" style="max-width:500px">
  <h2 class="w3-wide">NEW</h2>
  <p class="w3-opacity"><i>야심찬 새 상품</i></p>
</section>
<div id="container">
		<ul class="prod-list" align="center">
			<li><img src="images/apple.jpg" alt="1">
				<div class="caption">
					<h1>1번</h1>
					<p>
						<br>견종 : 푸들<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						10만원<br>기타 사항 : 브라운 푸들
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="2">
			<div class="caption">
					<h1>2번</h1>
					<p>
						<br>견종 : 포메라니안<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						20만원<br>기타 사항 : 슬개골이 약함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="3">
			<div class="caption">
					<h1>3번</h1>
					<p>
						<br>견종 : 말티즈<br>성별 : 여아<br>나이 : 2개월<br>분양가 :
						5만원<br>기타 사항 : 난폭함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="4">
			<div class="caption">
					<h1>4번</h1>
					<p>
						<br>견종 : 믹스<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						5만원<br>기타 사항 : 말티즈+푸들 믹스
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="5">
			<div class="caption">
					<h1>5번</h1>
					<p>
						<br>견종 : 푸들<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						10만원<br>기타 사항 : 블랙 푸들
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="6">
			<div class="caption">
					<h1>6번</h1>
					<p>
						<br>견종 : 비숑프리제<br>성별 : 여아<br>나이 : 3개월<br>분양가 :
						25만원<br>기타 사항 : 활발함
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="7">
			<div class="caption">
					<h1>7번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 남아<br>나이 : 2개월<br>분양가 :
						30만원<br>기타 사항 : 없음
					</p>
				</div></li>
			<li><img src="images/apple.jpg" alt="8">
			<div class="caption">
					<h1>8번</h1>
					<p>
						<br>견종 : 크림 푸들<br>성별 : 여아<br>나이 : 1개월<br>분양가 :
						30만원<br>기타 사항 : 없음
					</p>
				</div></li>
		</ul>
	</div>

<br><br><br>
<!-- 농부 소개 -->
<section class="w3-row-padding w3-center w3-light-grey">
  <article class="w3-third">
    <p>John</p>
    <img src="images/common.jpg" alt="Random Name">
    <p>슰기슬기</p>
  </article>
  <article class="w3-third">
    <p>Paul</p>
    <img src="images/common1.jpg" alt="Random Name">
    <p>조이조이</p>
  </article>
  <article class="w3-third">
    <p>Ringo</p>
    <img src="images/common2.jpg" alt="Random Name">
    <p>유나우나</p>
  </article>
</section>
<footer>
  <a href="#"><i class="fa fa-facebook-official"></i></a>
  <a href="#"><i class="fa fa-pinterest-p"></i></a>
  <a href="#"><i class="fa fa-twitter"></i></a>
  <a href="#"><i class="fa fa-flickr"></i></a>
  <a href="#"><i class="fa fa-linkedin"></i></a>
  <p class="w3-medium">
    Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a>
  </p>
</footer>
</body>
</html>